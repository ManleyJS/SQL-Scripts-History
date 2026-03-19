create or replace secure view HAVEN_STORE.ALIGN_ALYTICS.BOOKING_FINANCIALS(
	BOOKING_KEY,
	BOOKING_TYPE,
	BOOKING_ID,
	BROCHURE_PRICE,
	TOTAL_ACCOMMODATION_VALUE,
	TOTAL_DEPOSIT_VALUE,
	TOTAL_DISCOUNT_VALUE,
	TOTAL_ADDON_VALUE,
	TOTAL_CHARGE_VALUE,
	TOTAL_PAID_VALUE,
	GROSS_BILLING_VALUE,
	TOTAL_COMMISSION_VALUE,
	NETT_BILLING_VALUE,
	PRE_CANCELLATION_NETT_BILLING_VALUE
) as (
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
            nvl(rfx.nett_billing_value, rf.nett_billing_value) as pre_cancellation_nett_billing_value    
        from 
            HAVEN_STORE.haven_staging.trooper2__res_financials rf
        left join
           HAVEN_STORE.haven_staging.trooper2__res_financials_pre_cancellation rfx
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
            nvl(gfx.nett_billing_value, gf.nett_billing_value) as pre_cancellation_nett_billing_value  
        from 
            HAVEN_STORE.haven_staging.trooper2__group_financials gf
        left join
           HAVEN_STORE.haven_staging.trooper2__group_financials_pre_cancellation gfx
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
from    
    c_base
  );


-- HAVEN_STORE.ALIGN_ALYTICS.BOOKING_FINANCIALS_PRE_CANCELLATION source

create or replace secure view HAVEN_STORE.ALIGN_ALYTICS.BOOKING_FINANCIALS_PRE_CANCELLATION(
	BOOKING_KEY,
	BOOKING_TYPE,
	BOOKING_ID,
	BROCHURE_PRICE,
	TOTAL_ACCOMMODATION_VALUE,
	TOTAL_DEPOSIT_VALUE,
	TOTAL_DISCOUNT_VALUE,
	TOTAL_ADDON_VALUE,
	TOTAL_CHARGE_VALUE,
	TOTAL_PAID_VALUE,
	GROSS_BILLING_VALUE,
	TOTAL_COMMISSION_VALUE,
	NETT_BILLING_VALUE
) as (
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
            rf.nett_billing_value    
        from 
            HAVEN_STORE.haven_staging.trooper2__res_financials_pre_cancellation rf

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
            gf.nett_billing_value    
        from 
            HAVEN_STORE.haven_staging.trooper2__group_financials_pre_cancellation gf
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
    nett_billing_value
from    
    c_base
  );

 -- HAVEN_STORE.ALIGN_ALYTICS.PRORATED_BOOKING_REVENUE source

create or replace secure view HAVEN_STORE.ALIGN_ALYTICS.PRORATED_BOOKING_REVENUE(
	BOOKING_KEY,
	BOOKING_TYPE,
	BOOKING_ID,
	DELEGATE_RES_ID,
	STAY_DATE,
	BOOKING_STATUS,
	BOOKING_STATUS_CATEGORY,
	BOOKING_DATE,
	BOOKING_DATE_PY,
	FIRM_DATE,
	CANCELLATION_DATE,
	ARRIVAL_DATE,
	DEPARTURE_DATE,
	DURATION,
	ARRIVAL_PERIOD_NUMBER,
	ARRIVAL_DATE_PY,
	ARRIVAL_PERIOD_NUMBER_PY,
	PARK_CODE,
	PARK_REGION,
	PAID_GRADE,
	REQUESTED_GRADE,
	ALLOCATED_GRADE,
	ADULTS,
	CHILDREN,
	INFANTS,
	PRODUCT,
	SUB_PRODUCT,
	SOURCE,
	SEASON,
	PRORATED_NETT_BILLING_VALUE,
	PERIOD,
	DAY_RATIO,
	WEEK_RATIO,
	BREAK_RATIO,
	PITCH_CODE,
	CONTRACT_TYPE
) as (
    with 
    c_dates as (
        select
            dc.day_date as stay_date ,
            rw.period_number ,
            (1 / dc.break_duration)::numeric(8, 4) as break_portion
        from
            haven_store.common.break_day_calendar dc
        join
            haven_store.common.season_periods rw
            on  dc.day_date between rw.week_start_date and rw.week_end_date        
        where
            year_number >= year(current_date) - 4
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
            bd.contract_type
        from
            HAVEN_STORE.trooper2.booking_header bh
        join
            HAVEN_STORE.trooper2.booking_detail bd
            on  bd.booking_type = bh.booking_type and
                bd.booking_id = bh.booking_id
        left join
            haven_store.common.parks pk
            on  pk.park_code = bh.park_code
        where
            bh.booking_status_category in ('FIRM', 'CANCELLED') and
            bh.season >= year(current_date) - 4                      
    ) 
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
    bb.contract_type
from    
    c_booking_base bb
join
    c_dates cd
    on  cd.stay_date between bb.arrival_date and bb.departure_date - 1
  );

