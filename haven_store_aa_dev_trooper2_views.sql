use ROLE dba;

use SCHEMA haven_store_aa_dev.trooper2;

create or replace   view HAVEN_STORE_AA_DEV.trooper2.booking_addon_audit
(
    "START_DATE" COMMENT $$$$, 
    "END_DATE" COMMENT $$$$, 
    "BOOKING_ID" COMMENT $$$$, 
    "ADDON_CODE" COMMENT $$$$, 
    "ADDON" COMMENT $$$$, 
    "ADDON_VALUE" COMMENT $$$$, 
    "GROUP_BOOKING_ID" COMMENT $$$$, 
    "CURRENT_BOOKING_STATUS" COMMENT $$$$
)
  copy grants as (
/*
    description:
    addons audit for holiday bookings
    granularity:
    start date, end date, booking id and addon_code
    date range:
    5 years
*/
with 
    c_addons_list as (
        select 
            ac.amenity_code as addon_code,
            ac.amenity_name as addon,
            'INVOICE_' || ac.amenity_code as invoice_addon_code
        from
            haven_base.seaware.am_code ac
    ),
    c_addon_hist as (
        select 
            hv.trans_id,
            try_to_number(regexp_replace(hv.field_value_old, ',', ''), 12, 2) as old_value,
            try_to_number(regexp_replace(hv.field_value_new, ',', ''), 12, 2) as new_value,
            al.addon_code,
            al.addon
        from             haven_base.seaware.res_hist_value hv
        join
            c_addons_list al
            on al.invoice_addon_code = hv.field_id
        qualify
            row_number() 
                over(partition by hv.trans_id, hv.field_id, 
                hv.field_value_old, hv.field_value_new 
                order by trans_id desc
            ) = 1
    ),
    c_trans_hist as (
        select 
            ht.trans_id,
            ht.res_id as booking_id,
            ht.trans_date
        from             haven_base.seaware.res_hist_trans ht
        where
            ht.trans_date >= dateadd(year, -5, date_trunc(year, current_date))
    ),
    c_res_addon_hist as (
        select 
            th.trans_date::date as trans_date,
            th.booking_id,
            ah.addon_code,
            ah.addon,
            ah.old_value,
            ah.new_value
        from
            c_trans_hist th
        join
            c_addon_hist ah
            on ah.trans_id = th.trans_id
        qualify
            row_number() over(
                partition by th.booking_id, ah.addon, th.trans_date::date 
                order by th.trans_date desc, ah.trans_id desc
            ) = 1
    ),
    c_results as (
        select
            ah.booking_id,
            ah.addon_code,
            ah.addon,
            ah.new_value,
            ah.trans_date as start_date,
            nvl(lead(dateadd(day, -1, ah.trans_date)) 
                over(partition by ah.booking_id, ah.addon order by ah.trans_date),
                '9999-12-31'
            )::date as end_date
        from
            c_res_addon_hist ah
        qualify
            ah.new_value is not null
    )
select
    re.start_date,
    re.end_date,
    re.booking_id,
    re.addon_code,
    re.addon,
    re.new_value as addon_value,
    rh.group_id as group_booking_id,
    rh.res_status as current_booking_status
from 
    c_results re
join
    haven_base.seaware.res_header rh
    on rh.res_id = re.booking_id
  );

-- view HAVEN_STORE_AA_DEV.trooper2.booking_detail will not create until view HAVEN_STORE_AA_DEV.TROOPER2.BOOKING_FINANCIALS is created 
  
create or replace view HAVEN_STORE_AA_DEV.trooper2.booking_detail
    (
    "BOOKING_KEY" COMMENT $$Candidate key containing booking type and booking ID to facilitate a single column join to the booking_detail table$$, 
    "BOOKING_TYPE" COMMENT $$$$, 
    "BOOKING_ID" COMMENT $$$$, 
    "DELEGATE_RES_ID" COMMENT $$$$, 
    "BOOKING_STATUS_CATEGORY" COMMENT $$$$, 
    "UNIT_WEEKS" COMMENT $$$$, 
    "TOTAL_UNITS" COMMENT $$$$, 
    "PAID_GRADE" COMMENT $$$$, 
    "PAID_GRADE_DESCRIPTION" COMMENT $$$$, 
    "REQUESTED_GRADE" COMMENT $$$$, 
    "REQUESTED_GRADE_DESCRIPTION" COMMENT $$$$, 
    "ALLOCATED_GRADE" COMMENT $$$$, 
    "ALLOCATED_GRADE_DESCRIPTION" COMMENT $$$$, 
    "PITCH_CODE" COMMENT $$$$, 
    "CONTRACT_TYPE" COMMENT $$$$, 
    "TOTAL_GUESTS" COMMENT $$$$, 
    "ADULTS" COMMENT $$$$, 
    "CHILDREN" COMMENT $$$$, 
    "INFANTS" COMMENT $$$$, 
    "GROSS_BILLINGS" COMMENT $$$$, 
    "AGENCY_COMMISSION" COMMENT $$$$, 
    "NETT_BILLINGS" COMMENT $$$$
)
  copy grants as (
    with 
    c_header as (
        -- Force lineage in DBT
        select 1 from HAVEN_STORE_AA_DEV.trooper2.booking_header where 1=2
    ) ,
    c_grade_desc as (
        select            letting_cat_code as grade ,
            letting_cat_desc as grade_desc
        from
            haven_base.plot.letting_cat
    ) ,
    c_groups_with_no_delegates as (
        select
            gb.group_id
        from
            HAVEN_STORE_AA_DEV.haven_staging.trooper2__group_detail gb 
        left join             HAVEN_STORE_AA_DEV.haven_staging.trooper2__res_detail rd
            on  rd.group_id = gb.group_id
        where             rd.res_id is null
    ) ,
    c_unallocated_groups as (
        select
            gb.group_id, 
            gb.duration , 
            gb.group_status_category ,
            sum(iff(ia.dlgt_res_id is not null, 1, 0)) as allocated_units
        from
            HAVEN_STORE_AA_DEV.haven_staging.trooper2__group_detail gb
        join
            c_groups_with_no_delegates nd
            on  nd.group_id = gb.group_id
        join
            haven_base.seaware.ship_inventory_alloc ia
            on  ia.allocation_owner_id = gb.group_id and
                ia.allocation_owner_type = 'GROUP'
        where
            gb.group_status_category = 'FIRM'
        group by 
            gb.group_id ,
            gb.duration ,
            gb.group_status_category
        having 
            sum(iff(ia.dlgt_res_id is not null, 1, 0)) = 0     ) ,
    c_requests as (
        select            sr.group_id , 
            sr.cabin_category ,
            sr.quantity ,
            sr.occupancy ,
            ug.duration ,
            ug.group_status_category
        from
            haven_base.seaware.group_ship_request sr
        join
            c_unallocated_groups ug
            on  ug.group_id = sr.group_id
    ) ,
    c_unallocated_group_units as (
        select 
            'GROUP' as booking_type ,
            cr.group_id as booking_id ,
            'UNALLOCATED ' || cr.cabin_category as delegate_res_id,
            cr.group_status_category as booking_status_category ,
            sum((cr.duration * cr.quantity) / 7) as unit_weeks ,
            sum(cr.quantity) as total_units ,
            cr.cabin_category as paid_grade ,
            gd.grade_desc as paid_grade_description ,
            cr.cabin_category as requested_grade ,
            gd.grade_desc as requested_grade_description ,
            null as allocated_grade ,
            null as allocated_grade_description ,
            null pitch_code ,
            null contract_type ,
            sum(cr.occupancy * cr.quantity) as total_guests ,
            sum(cr.occupancy * cr.quantity) as adults ,
            0 as children , 
            0 as infants ,
            0 as gross_billings ,
            0 as agency_commission ,
            0 as nett_billings 
        from 
            c_requests cr
        join
            c_grade_desc gd
            on  gd.grade = cr.cabin_category
        group by              cr.group_id ,
            cr.group_status_category ,
            cr.cabin_category ,
            gd.grade_desc 
    ) ,
    c_all_detail as (
        select
            * ,
            row_number() over (partition by booking_id order by null) as v_row_number 
        from
            c_unallocated_group_units

        union all
              select
            iff(rd.group_id is null, 'RES', 'GROUP') as booking_type ,
            iff(rd.group_id is null, rd.res_id, rd.group_id) as booking_id ,
            iff(rd.group_id is null, null, rd.res_id)::string as delegate_res_id ,
            rd.res_status_category as booking_status_category ,
            rd.unit_weeks ,
            1 as total_units ,
            paid_grade ,
            paid_grade_description ,
            requested_grade ,
            requested_grade_description ,
            allocated_grade ,
            allocated_grade_description ,
            pitch_code ,
            contract_type ,
            total_guests ,
            adults ,
            children , 
            infants ,
            gross_billings ,
            agency_commission ,
            nett_billings ,
            row_number() over (partition by booking_id order by null) as v_row_number 
        from
            HAVEN_STORE_AA_DEV.haven_staging.trooper2__res_detail rd
    ) ,
    c_unallocated_group_billings as (
        select
            gf.booking_id as group_id , 
            gf.gross_billing_value as gross_billings ,
            gf.total_commission_value as agency_commission ,
            gf.nett_billing_value as nett_billings
        from
            HAVEN_STORE_AA_DEV.trooper2.booking_financials gf
        where
            gf.booking_type = 'GROUP' and
            gf.nett_billing_value >= 0 
    ) ,
    c_all_detail_unit_counts as (
        select
            * ,
            count(*) over (partition by booking_type, booking_id) as v_ua_unit_count
        from
            c_all_detail
    ) ,
    c_group_level_billings_allocation as (
        select 
            uc.* exclude (v_ua_unit_count) ,
            nvl((gb.gross_billings / uc.v_ua_unit_count)::numeric(10, 2) +
                case
                    when uc.v_row_number > 1 or gb.group_id is null
                    then 0
                    else max(gb.gross_billings) over (partition by uc.booking_id) - sum((gb.gross_billings / uc.v_ua_unit_count)::numeric(10, 2)) over (partition by uc.booking_id)
                end 
            , 0) as gross_billings_uplift ,
            nvl((gb.agency_commission / v_ua_unit_count)::numeric(10, 2) +
                case
                    when uc.v_row_number > 1 or gb.group_id is null
                    then 0
                    else max(gb.agency_commission) over (partition by uc.booking_id) - sum((gb.agency_commission / uc.v_ua_unit_count)::numeric(10, 2)) over (partition by uc.booking_id)
                end 
            , 0) as agency_commission_uplift ,
            nvl((gb.nett_billings / v_ua_unit_count)::numeric(10, 2) +
                case
                    when uc.v_row_number > 1 or gb.group_id is null
                    then 0
                    else max(gb.nett_billings) over (partition by uc.booking_id) - sum((gb.nett_billings / uc.v_ua_unit_count)::numeric(10, 2)) over (partition by uc.booking_id)
                end 
            , 0) as nett_billings_uplift               from
            c_all_detail_unit_counts uc
        left join
            c_unallocated_group_billings gb
            on  gb.group_id = uc.booking_id and
                uc.booking_type = 'GROUP'
    ) 
select
    booking_type || ':' || booking_id as booking_key ,
    booking_type ,
    booking_id ,
    delegate_res_id ,
    booking_status_category ,
    unit_weeks ,
    total_units ,
    paid_grade ,
    paid_grade_description ,
    requested_grade ,
    requested_grade_description ,
    allocated_grade ,
    allocated_grade_description ,
    pitch_code ,
    contract_type ,
    total_guests ,
    adults ,
    children , 
    infants ,
    gross_billings + gross_billings_uplift as gross_billings,
    agency_commission + agency_commission_uplift as agency_commission,
    nett_billings + nett_billings_uplift as nett_billings
from
    c_group_level_billings_allocation
  );
  

  
create or replace view HAVEN_STORE_AA_DEV.trooper2.booking_financials
    (
    "BOOKING_KEY" COMMENT $$$$, 
    "BOOKING_TYPE" COMMENT $$$$, 
    "BOOKING_ID" COMMENT $$$$, 
    "BROCHURE_PRICE" COMMENT $$$$, 
    "TOTAL_ACCOMMODATION_VALUE" COMMENT $$$$, 
    "TOTAL_DEPOSIT_VALUE" COMMENT $$$$, 
    "TOTAL_DISCOUNT_VALUE" COMMENT $$$$, 
    "TOTAL_ADDON_VALUE" COMMENT $$$$, 
    "TOTAL_CHARGE_VALUE" COMMENT $$$$, 
    "TOTAL_PAID_VALUE" COMMENT $$$$, 
    "GROSS_BILLING_VALUE" COMMENT $$$$, 
    "TOTAL_COMMISSION_VALUE" COMMENT $$$$, 
    "NETT_BILLING_VALUE" COMMENT $$$$, 
    "PRE_CANCELLATION_NETT_BILLING_VALUE" COMMENT $$$$
)
copy grants as (
    with 
    c_base as (
        select
            'RES' as booking_type , 
            rf.res_id as booking_id ,
            rf.brochure_price,
            rf.total_accommodation_value,
            rf.total_deposit_value ,
            rf.total_discount_value,
            rf.total_addon_value ,
            rf.total_charge_value,
            rf.total_paid_value ,
            rf.gross_billing_value,
            rf.total_commission_value ,
            rf.nett_billing_value ,
            nvl(rfx.nett_billing_value, rf.nett_billing_value) as pre_cancellation_nett_billing_value          from 
            HAVEN_STORE_AA_DEV.haven_staging.trooper2__res_financials rf
        left join
           HAVEN_STORE_AA_DEV.haven_staging.trooper2__res_financials_pre_cancellation rfx
           on rf.res_id = rfx.res_id
        union all 
        select
            'GROUP' as booking_type , 
            gf.group_id as booking_id ,
            0 as brochure_price,
            gf.total_accommodation_value,
            gf.total_deposit_value ,
            gf.total_discount_value,
            gf.total_addon_value ,
            gf.total_charge_value,
            gf.total_paid_value ,
            gf.gross_billing_value,
            gf.total_commission_value ,
            gf.nett_billing_value ,
            nvl(gfx.nett_billing_value, gf.nett_billing_value) as pre_cancellation_nett_billing_value        from 
            HAVEN_STORE_AA_DEV.haven_staging.trooper2__group_financials gf
        left join
           HAVEN_STORE_AA_DEV.haven_staging.trooper2__group_financials_pre_cancellation gfx
           on gf.group_id = gfx.group_id
    )
select 
    booking_type || ':' || booking_id as booking_key ,
    booking_type ,
    booking_id ,
    brochure_price ,
    total_accommodation_value ,
    total_deposit_value ,
    total_discount_value ,
    total_addon_value ,
    total_charge_value ,
    total_paid_value ,
    gross_billing_value ,
    total_commission_value ,
    nett_billing_value ,
    pre_cancellation_nett_billing_value
from      c_base
  );

create or replace   view HAVEN_STORE_AA_DEV.trooper2.booking_financials_pre_cancellation
    (
    "BOOKING_KEY" COMMENT $$$$, 
    "BOOKING_TYPE" COMMENT $$$$, 
    "BOOKING_ID" COMMENT $$$$, 
    "BROCHURE_PRICE" COMMENT $$$$, 
    "TOTAL_ACCOMMODATION_VALUE" COMMENT $$$$, 
    "TOTAL_DEPOSIT_VALUE" COMMENT $$$$, 
    "TOTAL_DISCOUNT_VALUE" COMMENT $$$$, 
    "TOTAL_ADDON_VALUE" COMMENT $$$$, 
    "TOTAL_CHARGE_VALUE" COMMENT $$$$, 
    "TOTAL_PAID_VALUE" COMMENT $$$$, 
    "GROSS_BILLING_VALUE" COMMENT $$$$, 
    "TOTAL_COMMISSION_VALUE" COMMENT $$$$, 
    "NETT_BILLING_VALUE" COMMENT $$$$, 
    "PRE_CANCELLATION_NETT_BILLING_VALUE" COMMENT $$$$
)
  copy grants as (
    with 
    c_base as (
        select
            'RES' as booking_type , 
            rf.res_id as booking_id ,
            rf.brochure_price,
            rf.total_accommodation_value,
            rf.total_deposit_value ,
            rf.total_discount_value,
            rf.total_addon_value ,
            rf.total_charge_value,
            rf.total_paid_value ,
            rf.gross_billing_value,
            rf.total_commission_value ,
            rf.nett_billing_value,
            rf.nett_billing_value as pre_cancellation_nett_billing_value          from 
            HAVEN_STORE_AA_DEV.haven_staging.trooper2__res_financials_pre_cancellation rf
        union all 
        select
            'GROUP' as booking_type , 
            gf.group_id as booking_id ,
            0 as brochure_price,
            gf.total_accommodation_value,
            gf.total_deposit_value ,
            gf.total_discount_value,
            gf.total_addon_value ,
            gf.total_charge_value,
            gf.total_paid_value ,
            gf.gross_billing_value,
            gf.total_commission_value ,
            gf.nett_billing_value ,
            gf.nett_billing_value as pre_cancellation_nett_billing_value
        from 
            HAVEN_STORE_AA_DEV.haven_staging.trooper2__group_financials_pre_cancellation gf
    )
select 
    booking_type || ':' || booking_id as booking_key ,
    booking_type ,
    booking_id ,
    brochure_price ,
    total_accommodation_value ,
    total_deposit_value ,
    total_discount_value ,
    total_addon_value ,
    total_charge_value ,
    total_paid_value ,
    gross_billing_value ,
    total_commission_value ,
    nett_billing_value ,
    pre_cancellation_nett_billing_value
from      c_base
  );

create or replace  view HAVEN_STORE_AA_DEV.trooper2.group_detail
  copy grants as (
  with    c_group_booking as (
        select            gb.group_id ,
            gb.group_status ,
            case 
                when gb.group_status in ('BK', 'CL', 'TM') then 'FIRM'
                when gb.group_status in ('CX', 'CT') then 'CANCELLED' 
                else 'OFFER'
            end as group_status_category ,
            gb.ship_code as park_code ,
            year(gb.sail_date_from) as season ,
            gb.sail_date_from::date as arrival_date ,
            gb.sail_date_to::date as departure_date ,
            departure_date - arrival_date as duration ,
            gb.agency_id ,
            gb.sec_agency_id as secondary_agency_id ,
            gb.n_of_guests as guests_total 
        from
            haven_base.seaware.group_booking gb
        where
            year(gb.sail_date_from) >= 2013
    ) ,
    c_agency_source as (
        select * from HAVEN_STORE_AA_DEV.haven_staging.trooper2__agency_source ag
    ) ,
    c_units_by_sub_product as (
        select 
            sr.group_id ,
            sr.product_type as product ,
            substring(sr.package_type, charindex(' ', sr.package_type) + 1) as sub_product , 
            sum(quantity) as number_of_units 
        from 
            haven_base.seaware.group_ship_request sr
        where
            sr.group_id in (select group_id from c_group_booking)
        group by
            sr.group_id ,
            sr.product_type ,
            substring(sr.package_type, charindex(' ', sr.package_type) + 1)
    ) , 
    c_unit_counts_base as (
        select            sp.group_id ,
            sp.product ,
            sum(sp.number_of_units) as total_units ,
            max_by(sp.sub_product, number_of_units) as primary_sub_product ,
            max(number_of_units) as primary_sub_product_units ,
            min_by(sub_product, number_of_units) as secondary_sub_product ,
            min(number_of_units) as secondary_sub_product_units
        from              c_units_by_sub_product sp
        group by 
            sp.group_id ,
            sp.product
    ) , 
    c_unit_counts as (
        select
            cb.group_id ,
            cb.total_units ,
            cb.product ,
            cb.primary_sub_product ,
            cb.primary_sub_product_units ,
            iff(cb.secondary_sub_product != cb.primary_sub_product, cb.secondary_sub_product, null) as secondary_sub_product ,
            iff(cb.secondary_sub_product != cb.primary_sub_product, cb.secondary_sub_product_units, null) as secondary_sub_product_units 
        from
            c_unit_counts_base cb
    ) ,
    c_delegate_detail as (
        select
            rd.group_id ,
            sum(rd.adults) as guests_ad ,
            sum(rd.children) as guests_ch ,
            sum(rd.infants) as guests_in ,
            count(1) as delegated_units ,
            sum(unit_weeks) as delegate_unit_weeks 
        from
            HAVEN_STORE_AA_DEV.trooper2.res_detail rd
        where
            rd.group_id in (select group_id from c_group_booking)
        group by
            rd.group_id
    )
select    gb.group_id ,
    gb.group_status ,
    gb.group_status_category ,
    gb.park_code ,
    gb.season ,
    gb.arrival_date ,
    gb.departure_date ,
    gb.duration ,
    ((gb.duration / 7) * uc.total_units)::numeric(8, 4) as unit_weeks ,
    gb.agency_id ,
    ag.agency_name ,
    ag.channel as source_channel,
    gb.secondary_agency_id ,
    sa.agency_name as secondary_agency_name ,
    uc.product ,
    uc.total_units as total_requested_units ,
    dg.delegated_units ,
    uc.primary_sub_product ,
    uc.primary_sub_product_units ,
    uc.secondary_sub_product ,
    uc.secondary_sub_product_units ,
    kd.booking_date ,
    kd.firm_date ,
    kd.cancellation_date ,
    gb.guests_total as total_guests,
    zeroifnull(dg.guests_ch) as children ,
    zeroifnull(dg.guests_in) as infants ,
    total_guests - children - infants as adults
from      c_group_booking gb
join
    c_agency_source ag
    on  ag.agency_id = gb.agency_id
left join
    c_agency_source sa
    on  sa.agency_id = gb.secondary_agency_id
left join
    c_unit_counts uc
    on  uc.group_id = gb.group_id
join 
    HAVEN_STORE_AA_DEV.haven_staging.trooper2__key_days kd
    on  kd.source_type = 'GROUP' and
        kd.source_id = gb.group_id
left join
    c_delegate_detail dg
    on  dg.group_id = gb.group_id
  );


create or replace  view HAVEN_STORE_AA_DEV.trooper2.group_financials_pre_cancellation
  copy grants as (
with
    c_cancellation_dates as (
        select
            cd.source_id as group_id ,
            cd.cancellation_date::date as cancellation_date
        from
            HAVEN_STORE_AA_DEV.haven_staging.trooper2__key_days cd 
        where
            cd.source_type = 'GROUP'       ),
    c_acc_base as (
        select 
            iff(td.source_entity_type = 'GROUP', source_entity_id, dest_entity_id) as group_id ,
            td.amount_orig_currency_left * iff(td.source_entity_type = 'GROUP', -1, 1) as amount,
            td.trans_time_stamp
        from              haven_base.seaware.acc_trans_detail td
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
        from              c_cancellation_dates cd 
        join              c_acc_base ab
            on  cd.group_id = ab.group_id and
                ab.trans_time_stamp < cd.cancellation_date
    ),
    c_invoice_item_type as (
        select            ii.*,
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
        select            ch.group_id ,
            'CHARGE',
            ch.charge_amount as line_price ,
            ch.charge_amount as gross_price ,
            ch.charge_amount as nett_price
        from
            HAVEN_STORE_AA_DEV.haven_staging.trooper2__charge_history ch
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


create or replace   view HAVEN_STORE_AA_DEV.trooper2.prorated_booking_revenue
    (
    "BOOKING_KEY" COMMENT $$Candidate key containing booking type and booking ID to facilitate a single column join to the booking_detail table$$, 
    "BOOKING_TYPE" COMMENT $$$$, 
    "BOOKING_ID" COMMENT $$$$, 
    "DELEGATE_RES_ID" COMMENT $$$$, 
    "STAY_DATE" COMMENT $$$$, 
    "BOOKING_STATUS" COMMENT $$$$, 
    "BOOKING_STATUS_CATEGORY" COMMENT $$$$, 
    "BOOKING_DATE" COMMENT $$$$, 
    "BOOKING_DATE_PY" COMMENT $$$$, 
    "FIRM_DATE" COMMENT $$$$, 
    "CANCELLATION_DATE" COMMENT $$$$, 
    "ARRIVAL_DATE" COMMENT $$$$, 
    "DEPARTURE_DATE" COMMENT $$$$, 
    "DURATION" COMMENT $$$$, 
    "ARRIVAL_PERIOD_NUMBER" COMMENT $$$$, 
    "ARRIVAL_DATE_PY" COMMENT $$$$, 
    "ARRIVAL_PERIOD_NUMBER_PY" COMMENT $$$$, 
    "PARK_CODE" COMMENT $$$$, 
    "PARK_REGION" COMMENT $$$$, 
    "PAID_GRADE" COMMENT $$$$, 
    "REQUESTED_GRADE" COMMENT $$$$, 
    "ALLOCATED_GRADE" COMMENT $$$$, 
    "ADULTS" COMMENT $$$$, 
    "CHILDREN" COMMENT $$$$, 
    "INFANTS" COMMENT $$$$, 
    "PRODUCT" COMMENT $$$$, 
    "SUB_PRODUCT" COMMENT $$$$, 
    "SOURCE" COMMENT $$$$, 
    "SEASON" COMMENT $$$$, 
    "PRORATED_NETT_BILLING_VALUE" COMMENT $$$$, 
    "PERIOD" COMMENT $$$$, 
    "DAY_RATIO" COMMENT $$$$, 
    "WEEK_RATIO" COMMENT $$$$, 
    "BREAK_RATIO" COMMENT $$$$, 
    "PITCH_CODE" COMMENT $$$$, 
    "CONTRACT_TYPE" COMMENT $$$$, 
    "PRORATED_PRE_CANCELLATION_NETT_BILLING_VALUE" COMMENT $$$$
)
  copy grants as (
    with 
    c_dates as (
        select
            dc.day_date as stay_date ,
            rw.period_number ,
            (1 / dc.break_duration)::numeric(8, 4) as break_portion
        from
              HAVEN_STORE_AA_DEV
.common.break_day_calendar dc
        join
              HAVEN_STORE_AA_DEV
.common.season_periods rw
            on  dc.day_date between rw.week_start_date and rw.week_end_date              where
            year_number >= 2019
    ) ,
    c_booking_base as (
        select
            bh.booking_key ,
            bh.booking_type ,
            bh.booking_id ,
            bd.delegate_res_id ,
            bh.booking_status ,
            bh.booking_status_category ,
            bh.booking_date ,
            bh.booking_date_py ,
            bh.firm_date ,
            bh.cancellation_date ,
            bh.arrival_date ,
            bh.departure_date ,
            bh.duration ,
            bh.arrival_period_number ,
            bh.arrival_date_py ,
            bh.arrival_period_number_py ,
            bh.park_code ,
            pk.park_region ,
            nvl(bd.nett_billings, 0) as nett_billing_value,
            bd.unit_weeks as unit_weeks,
            bd.adults ,
            bd.children ,
            bd.infants ,
            bh.product ,
            bh.primary_sub_product as sub_product,
            bh.source_channel as source ,
            bh.season ,
            bd.total_units as units ,
            bd.paid_grade ,
            bd.requested_grade ,
            bd.allocated_grade,
            bd.pitch_code,
            bd.contract_type, 
            zeroifnull(px.pre_cancellation_nett_billing_value) as pre_cancellation_nett_billing_value
        from
            HAVEN_STORE_AA_DEV.trooper2.booking_header bh
        join
            HAVEN_STORE_AA_DEV.trooper2.booking_detail bd
            on  bd.booking_type = bh.booking_type and
                bd.booking_id = bh.booking_id
        left join
              HAVEN_STORE_AA_DEV
.common.parks pk
            on  pk.park_code = bh.park_code
        left join
            HAVEN_STORE_AA_DEV.trooper2.booking_financials_pre_cancellation px                     on px.booking_id = bd.booking_id and 
               px.booking_type = bd.booking_type
        where
            bh.booking_status_category in ('FIRM', 'CANCELLED') and
            bh.season >= 2019                      ) 
select
    bb.booking_key ,
    bb.booking_type ,
    bb.booking_id ,
    bb.delegate_res_id ,
    cd.stay_date ,
    bb.booking_status ,
    bb.booking_status_category ,
    bb.booking_date ,
    bb.booking_date_py ,
    bb.firm_date ,
    bb.cancellation_date ,
    bb.arrival_date ,
    bb.departure_date ,
    bb.duration ,
    bb.arrival_period_number ,
    bb.arrival_date_py ,
    bb.arrival_period_number_py , 
    bb.park_code ,
    bb.park_region ,
    bb.paid_grade ,
    bb.requested_grade ,
    bb.allocated_grade ,
    bb.adults ,
    bb.children ,
    bb.infants ,
    bb.product ,
    bb.sub_product ,
    bb.source ,
    bb.season ,
    (bb.nett_billing_value / bb.duration)::numeric(10, 2) +
        case 
            when row_number() over (partition by bb.booking_type, bb.booking_id, bb.delegate_res_id order by null) > 1
            then 0
            else max(nett_billing_value) over (partition by bb.booking_type, bb.booking_id, bb.delegate_res_id) - sum((bb.nett_billing_value / bb.duration)::numeric(10, 2)) over (partition by bb.booking_type, bb.booking_id, bb.delegate_res_id)
        end as prorated_nett_billing_value,
    cd.period_number as period,
    1 * bb.units as day_ratio,
    ((1/7) * bb.units)::numeric(8, 4) as week_ratio,
    cd.break_portion * bb.units as break_ratio,
    bb.pitch_code,
    bb.contract_type,      (bb.pre_cancellation_nett_billing_value / bb.duration)::numeric(10, 2) +
        case 
            when row_number() over (partition by bb.booking_type, bb.booking_id, bb.delegate_res_id order by null) > 1
            then 0
            else max(pre_cancellation_nett_billing_value) over (partition by bb.booking_type, bb.booking_id, bb.delegate_res_id) - sum((bb.pre_cancellation_nett_billing_value / bb.duration)::numeric(10, 2)) over (partition by bb.booking_type, bb.booking_id, bb.delegate_res_id)
        end as prorated_pre_cancellation_nett_billing_value from      c_booking_base bb
join
    c_dates cd
    on  cd.stay_date between bb.arrival_date and bb.departure_date - 1
  );