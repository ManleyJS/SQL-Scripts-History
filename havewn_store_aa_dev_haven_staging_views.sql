use ROLE dba;

use SCHEMA haven_store_aa_dev.Haven_staging;


create or replace  view haven_store_aa_dev.haven_staging.trooper2__group_financials_pre_cancellation
(
    "GROUP_ID" COMMENT $$$$, 
    "TOTAL_ACCOMMODATION_VALUE" COMMENT $$$$, 
    "TOTAL_DEPOSIT_VALUE" COMMENT $$$$, 
    "TOTAL_DISCOUNT_VALUE" COMMENT $$$$, 
    "TOTAL_ADDON_VALUE" COMMENT $$$$, 
    "TOTAL_CHARGE_VALUE" COMMENT $$$$, 
    "TOTAL_PAID_VALUE" COMMENT $$$$, 
    "GROSS_BILLING_VALUE" COMMENT $$$$, 
    "TOTAL_COMMISSION_VALUE" COMMENT $$$$, 
    "NETT_BILLING_VALUE" COMMENT $$$$
)
   as (
with
    c_cancellation_dates as (
        select
            cd.source_id as group_id ,
            cd.cancellation_date::date as cancellation_date
        from
            haven_store_aa_dev.haven_staging.trooper2__key_days cd 
        where
            cd.source_type = 'GROUP'     
    ),
    c_acc_base as (
        select 
            iff(td.source_entity_type = 'GROUP', source_entity_id, dest_entity_id) as group_id ,
            td.amount_orig_currency_left * iff(td.source_entity_type = 'GROUP', -1, 1) as amount,
            td.trans_time_stamp
        from    
            haven_base.seaware.acc_trans_detail td
        where
            td.trans_status in ('OK', 'INTERNAL OK') and
            (
                td.source_entity_type = 'GROUP' or
                td.dest_entity_type = 'group'
            )
    ) ,
    c_acc_trans_detail as (
        select
            ab.*
        from    
            c_cancellation_dates cd 
        join    
            c_acc_base ab
            on  cd.group_id = ab.group_id and
                ab.trans_time_stamp < cd.cancellation_date
    ),
    c_invoice_item_type as (
        select  
            ii.*,
            case 
                when ii.invoice_item_type in ('ACCOMMODATION', 'FUN PASS INCL','LINEN INCL','CANCEL PLAN INC','HPP INCLUDED') then 'ACCOMMODATION'
                when ii.invoice_item_type like '%DEPOSIT%' and ii.classification_for_group = 'AMENITY' then 'DEPOSIT'
                else 'OTHER'
            end invoice_item_class
        from
            haven_base.seaware.invoice_item_type ii
    ),
    c_last_firm_group_invoice_history as (
        select 
            ge.group_id ,
            ih.invoice_item_type ,
            ih.price as total_price
        from 
            haven_base.seaware.group_booking gb
        join
            haven_base.seaware.group_event ge
            on  ge.group_id = gb.group_id
        join
            haven_base.seaware.group_history_header hh
            on  hh.group_id = ge.group_id and
                hh.time_stamp < ge.event_timestamp
        join
            haven_base.seaware.group_invoice_history ih
            on  ih.group_update_id = hh.group_update_id
        where 
            gb.group_status in ('CX', 'CT') and
            ge.group_event_type = 'STATUS CHANGE' and
            ge.new_status = 'CX' and
            ge.old_status in ('BK', 'CL')
        qualify
            rank() over (partition by ge.group_id, ih.invoice_item_type order by ih.group_update_id desc) = 1 
    ) ,
    c_invoice_base as (
        select
            ii.group_id,
            case 
                when ii.total_price < 0 and nvl(it.invoice_item_class, 'OTHER') = 'OTHER'
                then 'DISCOUNT'
                else nvl(it.invoice_item_class, 'OTHER') 
            end item_class,
            ii.total_price as line_price,
            ii.total_price as gross_price,
            ii.total_price as nett_price
        from
            c_last_firm_group_invoice_history ii
        left join
            c_invoice_item_type it
            on  it.invoice_item_type = ii.invoice_item_type       
        union all
        -- CHARGES
        select  
            ch.group_id ,
            'CHARGE',
            ch.charge_amount as line_price ,
            ch.charge_amount as gross_price ,
            ch.charge_amount as nett_price
        from
            haven_store_aa_dev.haven_staging.trooper2__charge_history ch
        join
            c_cancellation_dates cd 
            on  cd.group_id = ch.group_id and
                ch.res_id is null and
                ch.record_action_date < cd.cancellation_date
        qualify
            row_number() over (partition by ch.charge_id order by ch.record_action_date desc) = 1    
        union all 
        -- PAYMENTS
        select 
            td.group_id ,
            'PAID',
            amount as line_value,
            null,
            null
        from 
            c_acc_trans_detail td
    )
select
    ib.group_id ,
    nvl(sum(case ib.item_class when 'ACCOMMODATION' then ib.line_price end), 0) as total_accommodation_value ,
    nvl(sum(case ib.item_class when 'DEPOSIT'       then ib.line_price end), 0) as total_deposit_value ,
    nvl(sum(case ib.item_class when 'DISCOUNT'      then ib.line_price end), 0) as total_discount_value ,
    nvl(sum(case ib.item_class when 'OTHER'         then ib.line_price end), 0) as total_addon_value,
    nvl(sum(case ib.item_class when 'CHARGE'        then ib.line_price end), 0) as total_charge_value,
    nvl(sum(case ib.item_class when 'PAID'          then ib.line_price end), 0) as total_paid_value,
    sum(ib.gross_price)                                                         as gross_billing_value,
    nvl(sum(case ib.item_class when 'COMMISSION'    then ib.line_price end), 0) as total_commission_value,
    sum(ib.nett_price)                                                          as nett_billing_value
from
    c_invoice_base ib
group by
    ib.group_id
  );        



create or replace   view haven_store_aa_dev.haven_staging.trooper2__agency_source
(
    "AGENCY_ID" COMMENT $$$$, 
    "AGENCY_NAME" COMMENT $$$$, 
    "V_CONTROL_FLAG__CHANNEL" COMMENT $$$$, 
    "CONTROL_FLAG" COMMENT $$$$, 
    "CHANNEL" COMMENT $$$$
)
   as (
select
    ag.agency_id ,
    ag.agency_name ,
    case
        when ag.agency_id = 133122              then 'O:CALL CENTRE'
        when ag.agency_type = 'DIRECT'          then 'D:PARK SALES'
        when ag.agency_type = 'EXTERNAL LOAD'   then 'O:NEWSPAPER (SUN)'
        when ag.agency_type = 'FULL SERVICE'    then '_:CALL CENTRE'
        when ag.agency_type = 'GROUP'           then 'O:GROUPS'
        when ag.agency_type = 'INTERNET'        then '_:CALL CENTRE'
        when ag.agency_type like 'TOUR OP%'     then 'O:TOUR OPERATORS'
        when ag.agency_type = 'TRAVEL AGENT'    then 'O:TRAVEL AGENTS'
        else 'I:UNKNOWN (' || ag.Agency_Type || ')'
    end as v_control_flag__channel,
    left(v_control_flag__channel,1) control_flag,
    substr(v_control_flag__channel,3) channel
from
    haven_base.seaware.agency ag
  );