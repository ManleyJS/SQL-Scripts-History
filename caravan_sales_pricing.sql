use role dba;

use schema haven_data_engineering.rms_caravan_pricer_app_dev;

show tables;

select * from active_submissions;

select * from audit_logs;

select * from gbb limit 50;

select * from CSPA_OUTPUT_REVIEW_3ST limit 50;

select * from base_pricing;

SELECT * FROM AUDIT_LOGS WHERE RECORD_IDENTIFIER = 'XA5738' ORDER BY REFERENCE_LOG_ID nulls first; 

use role dba;

select * from haven_base.caravan_sales_pricing_application.cspa_user_accounts;

use schema haven_store.caravan_sales_pricing_application;

select get_ddl('view', 'haven_base.caravan_sales_pricing_application.cspa_user_accounts');

drop view cspa_user_accounts;

create table cspa_user_accounts (
	REG_TIMESTAMP,
	ROLE,
	USERNAME,
	PASSWORD_HASH,
	PASSWORD_SALT,
	UID,
	APPROVED,
	FILE_NAME,
	LOADED_TIMESTAMP
) as
select
    to_timestamp(value:c1::string, 'DD/MM/YYYY HH24:MI') REG_TIMESTAMP,
    value:c2::string ROLE,
    value:c3::string USERNAME,
    value:c4::string PASSWORD_HASH,
    value:c5::string PASSWORD_SALT,
    value:c6::string UID,
    value:c7::string APPROVED,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    haven_raw.caravan_sales_pricing_application.RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_user_accounts%';

select * from cspa_user_accounts;

CREATE or replace TABLE haven_store.caravan_sales_pricing_application.USER_ACCOUNTS 
AS SELECT REG_TIMESTAMP, ROLE, USERNAME, PASSWORD_HASH, PASSWORD_SALT, UID, APPROVED, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_STORE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_USER_ACCOUNTS
GROUP BY REG_TIMESTAMP, "ROLE", USERNAME, PASSWORD_HASH, PASSWORD_SALT, UID, APPROVED, FILE_NAME, LOADED_TIMESTAMP;


-- 30/05/2025

use role haven_dbt_transform_dev;


create view haven_store_dev.caravan_sales_pricing_application.cspa_OUTPUT_REVIEW(
	PARK,
	PITCH_STATUS,
	CSN_NUMBER,
	MAKE,
	MODEL,
	LENGTH,
	WIDTH,
	BEDROOMS,
	NEW_OR_USED,
	MODEL_LONG_DESC,
	YEAR_MADE,
	VAN_GRADE_DESC,
	"park_tier (replacing pricing pot)",
	VAN_PRICE,
	SPECIAL_DISCOUNT,
	TOTAL_ADDONS_CHARGE,
	WEB_PRICE,
	ESTIMATED_MARGIN,
	VAT_IN_SALE,
	PRICING_OVERRIDE,
	GBB,
	UPDATE_VAN_PRICE
) as
with base_data as (
    select distinct 
        pk.park_code as park,
        ps.pitch_status_code as pitch_status,
        pv.van_stock_no as csn_number,
        pv.make,
        pv.model,
        pv.length,
        pv.width,
        pv.no_of_bed_codes as bedrooms,
        case when pv.new_yn = 1 then 'New' else 'Used' end as new_or_used,
        pv.model_long_desc,
        pv.year_made,
        vg.van_grade_desc,
        pt.price_tier as "park_tier (replacing pricing pot)",
        coalesce(max(case when pp.price_type_enum = 1 then pp.gross_price end), 0) as van_price,
        coalesce(max(case when pp.price_type_enum = 22 then -pp.gross_price end), 0) as special_discount,
        coalesce(sum(case when pp.price_type_enum not in (1,2,6,28,29,20,26,27,7,32,42,43,9,30,22,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70) 
            then pp.gross_price else 0 end), 0) as total_addons_charge,
        coalesce(sum(case when pp.price_type_enum not in (6,28,29,20,26,27,7,32,42,43,9,30,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70)
            then pp.gross_price else 0 end), 0) as web_price,
        pv.estimated_margin,
        pv.vat_value as vat_in_sale,
        case when pv.value_overridden_yn = 1 then 'Yes' else 'No' end as pricing_override
    from haven_base.plot.pitches ppt
        inner join haven_base.plot.pitch_statuses ps on ppt.pitch_status_enum = ps.pitch_status_enum
        inner join haven_base.plot.parks pk on ppt.park_id = pk.park_id
        inner join haven_base.plot.vans pv on ppt.van_id = pv.van_id
        left outer join haven_base.plot.prices pp on pp.van_id = pv.van_id
        left outer join haven_base.plot.van_grades vg on vg.van_grade_id = pv.van_grade_id
        left outer join haven_store_dev.caravan_sales_pricing_application.cspa_park_tiers pt on pk.park_code = pt.park
    where ps.pitch_status_code in ('HF', 'SA', 'ST')
        and pk.deleted_yn = 0
        and pv.deleted_yn = 0
        and pv.delivery_confirmed_yn = 1
    group by 
        pk.park_code,
        ps.pitch_status_code,
        pv.van_stock_no,
        pv.make,
        pv.model,
        pv.length,
        pv.width,
        pv.no_of_bed_codes,
        pv.new_yn,
        pv.model_long_desc,
        pv.year_made,
        vg.van_grade_desc,
        pt.price_tier,
        pv.estimated_margin,
        pv.vat_value,
        pv.value_overridden_yn
),

matching_gbb as (
    select distinct
        b.*,
        first_value(gbb.tiering) over(
            partition by b.csn_number 
            order by gbb.year_made desc
            rows between unbounded preceding and unbounded following
        ) as gbb
    from base_data b
    left join haven_store_dev.caravan_sales_pricing_application.cspa_gbb gbb on
        b.make = gbb.make
        and b.model = gbb.model
        and b.length >= gbb.length
        and b.width >= gbb.width
        and b.bedrooms = gbb.beds
        and b.van_grade_desc = gbb.van_grade
),

new_van_prices as (
    select distinct
        b.*,
        first_value(bp.value) over(
            partition by b.csn_number
            order by bp.year desc
            rows between unbounded preceding and unbounded following
        ) as new_price
    from matching_gbb b
    left join haven_store_dev.caravan_sales_pricing_application.cspa_base_pricing bp on
        b.year_made = bp.year
        and b.new_or_used = bp.new_used
        and b."park_tier (replacing pricing pot)" = bp.tier
        and b.van_grade_desc = upper(bp.grade || 'V')
        and b.gbb = bp.gbb
        and b.width >= bp.min_width
        and b.length >= bp.min_length
        and b.bedrooms = bp.beds
    where b.new_or_used = 'New'
),

used_van_base_prices as (
    select 
        b.csn_number,
        min(bp.value) as reference_price,
        min(bp.year) as reference_year,
        b.van_grade_desc
    from matching_gbb b
    inner join haven_store_dev.caravan_sales_pricing_application.cspa_base_pricing bp on
        bp.new_used = 'New'
        and b."park_tier (replacing pricing pot)" = bp.tier
        and b.van_grade_desc = upper(bp.grade || 'V')
        and b.gbb = bp.gbb
        and b.width >= bp.min_width
        and b.length >= bp.min_length
        and b.bedrooms = bp.beds
        and bp.year >= b.year_made
    where b.new_or_used = 'Used'
    group by 
        b.csn_number,
        b.van_grade_desc
),

used_van_prices as (
    select distinct
        b.*,
        u.reference_price as base_price,
        case 
            when u.reference_year >= b.year_made then
                u.reference_price - (yd.gbp_diff * (u.reference_year - b.year_made))
        end as used_price,
        u.reference_year
    from matching_gbb b
    left join used_van_base_prices u on b.csn_number = u.csn_number
    left join haven_store_dev.caravan_sales_pricing_application.cspa_year_diffs yd on
        yd.stt_from = 'New' 
        and yd.stt_to = 'Used'
        and yd.grade = u.van_grade_desc
    where b.new_or_used = 'Used'
)

select distinct
    b.*,
    case 
        when b.new_or_used = 'New' and n.new_price >= 15000 then n.new_price
        when b.new_or_used = 'Used' and u.used_price >= 15000 then u.used_price
        else null
    end as update_van_price
from matching_gbb b
left join new_van_prices n on b.csn_number = n.csn_number
left join used_van_prices u on b.csn_number = u.csn_number
order by b.park, b.csn_number;

select get_ddl('view', 'CSPA_OUTPUT_REVIEW2'); 

create  view haven_store_dev.caravan_sales_pricing_application.cspa_OUTPUT_REVIEW2(
	PARK,
	PITCH_STATUS,
	CSN_NUMBER,
	MAKE,
	MODEL,
	LENGTH,
	WIDTH,
	BEDROOMS,
	NEW_OR_USED,
	MODEL_LONG_DESC,
	YEAR_MADE,
	VAN_GRADE_DESC,
	"park_tier (replacing pricing pot)",
	VAN_PRICE,
	SPECIAL_DISCOUNT,
	TOTAL_ADDONS_CHARGE,
	WEB_PRICE,
	ESTIMATED_MARGIN,
	VAT_IN_SALE,
	PRICING_OVERRIDE,
	GBB,
	UPDATE_VAN_PRICE
) as
with base_data as (
    select distinct 
        pk.park_code as park,
        ps.pitch_status_code as pitch_status,
        pv.van_stock_no as csn_number,
        pv.make,
        pv.model,
        pv.length,
        pv.width,
        pv.no_of_bed_codes as bedrooms,
        case when pv.new_yn = 1 then 'New' else 'Used' end as new_or_used,
        pv.model_long_desc,
        pv.year_made,
        vg.van_grade_desc,
        pt.price_tier as "park_tier (replacing pricing pot)",
        coalesce(max(case when pp.price_type_enum = 1 then pp.gross_price end), 0) as van_price,
        coalesce(max(case when pp.price_type_enum = 22 then -pp.gross_price end), 0) as special_discount,
        coalesce(sum(case when pp.price_type_enum not in (1,2,6,28,29,20,26,27,7,32,42,43,9,30,22,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70) 
            then pp.gross_price else 0 end), 0) as total_addons_charge,
        coalesce(sum(case when pp.price_type_enum not in (6,28,29,20,26,27,7,32,42,43,9,30,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70)
            then pp.gross_price else 0 end), 0) as web_price,
        pv.estimated_margin,
        pv.vat_value as vat_in_sale,
        case when pv.value_overridden_yn = 1 then 'Yes' else 'No' end as pricing_override
    from haven_base.plot.pitches ppt
        inner join haven_base.plot.pitch_statuses ps on ppt.pitch_status_enum = ps.pitch_status_enum
        inner join haven_base.plot.parks pk on ppt.park_id = pk.park_id
        inner join haven_base.plot.vans pv on ppt.van_id = pv.van_id
        left outer join haven_base.plot.prices pp on pp.van_id = pv.van_id
        left outer join haven_base.plot.van_grades vg on vg.van_grade_id = pv.van_grade_id
        left outer join haven_store_dev.caravan_sales_pricing_application.cspa_park_tiers pt on pk.park_code = pt.park
    where ps.pitch_status_code not in ('OB', 'OL', 'VA', 'TO', 'C8', 'ER')
        and pk.deleted_yn = 0
        and pv.deleted_yn = 0
        and pv.delivery_confirmed_yn = 1
    group by 
        pk.park_code,
        ps.pitch_status_code,
        pv.van_stock_no,
        pv.make,
        pv.model,
        pv.length,
        pv.width,
        pv.no_of_bed_codes,
        pv.new_yn,
        pv.model_long_desc,
        pv.year_made,
        vg.van_grade_desc,
        pt.price_tier,
        pv.estimated_margin,
        pv.vat_value,
        pv.value_overridden_yn
),

matching_gbb as (
    select distinct
        b.*,
        first_value(gbb.tiering) over(
            partition by b.csn_number 
            order by gbb.year_made desc
            rows between unbounded preceding and unbounded following
        ) as gbb
    from base_data b
    left join haven_store_dev.caravan_sales_pricing_application.cspa_gbb gbb on
        b.make = gbb.make
        and b.model = gbb.model
        and b.length >= gbb.length
        and b.width >= gbb.width
        and b.bedrooms = gbb.beds
        and b.van_grade_desc = gbb.van_grade
),

van_prices as (
    select distinct
        b.*,
        first_value(bp.value) over(
            partition by b.csn_number
            order by bp.year desc
            rows between unbounded preceding and unbounded following
        ) as new_price
    from matching_gbb b
    left join haven_store_dev.caravan_sales_pricing_application.cspa_base_pricing_2 bp on
        b.year_made = bp.year
        and b.new_or_used = bp.new_used
        and b."park_tier (replacing pricing pot)" = bp.tier
        and b.van_grade_desc = upper(bp.grade || 'V')
        and b.gbb = bp.gbb
        and b.width >= bp.min_width
        and b.length >= bp.min_length
        and b.bedrooms = bp.beds
)

select distinct
    b.*,
    case 
        when v.new_price >= 15000 then v.new_price
        else null
    end as update_van_price
from matching_gbb b
left join van_prices v on b.csn_number = v.csn_number
order by b.park, b.csn_number;


select get_ddl('view', 'PITCH_CODES_MIRROR');

create view haven_store_dev.caravan_sales_pricing_application.cspa_PITCH_CODES_MIRROR(
	PITCH_STATUS_ENUM,
	PITCH_STATUS_CODE,
	PITCH_STATUS_DESC,
	CORE_STATUS,
	PITCH_STATUS_CATEGORY_ENUM
) as select * from haven_base.plot.pitch_statuses;

select get_ddl('view', 'PLOT_UPLOAD_CURRENT');
create  view haven_store_dev.caravan_sales_pricing_application.cspa_PLOT_UPLOAD_CURRENT(
	PARK,
	PITCH_STATUS,
	CSN_NUMBER,
	MAKE,
	MODEL,
	LENGTH,
	WIDTH,
	BEDROOMS,
	NEW_OR_USED,
	MODEL_LONG_DESC,
	YEAR_MADE,
	VAN_GRADE_DESC,
	"Park_Tier (replacing Pricing Pot)",
	VAN_PRICE,
	SPECIAL_DISCOUNT,
	TOTAL_ADDONS_CHARGE,
	WEB_PRICE,
	ESTIMATED_MARGIN,
	VAT_IN_SALE,
	PRICING_OVERRIDE
) as
select
    pk.park_code as Park,
    ps.pitch_status_code as Pitch_Status,
    pv.van_stock_no as CSN_Number,
    pv.make as Make,
    pv.model as Model,
    pv.length as Length,
    pv.width as Width,
    pv.no_of_bed_codes as Bedrooms,
    case when
        pv.new_yn = 1 then 'New' else 'Used' end as New_or_Used,
    pv.model_long_desc,
    pv.year_made,
    vg.van_grade_desc,
    pt.price_tier as "Park_Tier (replacing Pricing Pot)",
    coalesce(sum(case when pp.price_type_enum = 1 then pp.gross_price else 0 end), 0) as van_price,
    coalesce(sum(case when pp.price_type_enum = 22 then -pp.gross_price else 0 end), 0) as special_discount,
    coalesce(sum(case 
        when pp.price_type_enum not in (1,2,6,28,29,20,26,27,7,32,42,43,9,30,22,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70) 
        then pp.gross_price else 0 end), 0) as total_addons_charge,
    coalesce(sum(case 
        when pp.price_type_enum not in (6,28,29,20,26,27,7,32,42,43,9,30,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70)
        then pp.gross_price else 0 end), 0) as web_price,
    pv.estimated_margin as Estimated_Margin,
    pv.vat_value as VAT_in_Sale,
    case when pv.value_overridden_yn = 1 then 'Yes' else 'No' end as Pricing_Override
from haven_base.plot.pitches ppt
    inner join haven_base.plot.pitch_statuses ps on ppt.pitch_status_enum = ps.pitch_status_enum
    inner join haven_base.plot.parks pk on ppt.park_id = pk.park_id
    inner join haven_base.plot.vans pv on ppt.van_id = pv.van_id
    left outer join haven_base.plot.prices pp on pp.van_id = pv.van_id
    left outer join haven_base.plot.van_grades vg on vg.van_grade_id = pv.van_grade_id
    left outer join haven_store_dev.caravan_sales_pricing_application.cspa_park_tiers pt on pk.park_code = pt.park
where ps.pitch_status_code in ('HF', 'SA', 'ST')
    and pk.deleted_yn = 0
    and pv.deleted_yn = 0
    and pv.delivery_confirmed_yn = 1
group by 
    pk.park_code,
    ps.pitch_status_code,
    pv.van_stock_no,
    pv.make,
    pv.model,
    pv.length,
    pv.width,
    pv.no_of_bed_codes,
    pv.new_yn,
    pv.model_long_desc,
    pv.year_made,
    vg.van_grade_desc,
    pt.price_tier,
    pv.estimated_margin,
    pv.vat_value,
    pv.value_overridden_yn
order by
    pk.park_code, pv.van_stock_no;



select get_ddl('view', 'CSPA_OUTPUT_REVIEW_3');

create or replace view haven_store_dev.caravan_sales_pricing_application.cspa_OUTPUT_REVIEW_3(
	PARK,
	PITCH_STATUS,
	CSN_NUMBER,
	MAKE,
	MODEL,
	IS_LODGE,
	LENGTH,
	WIDTH,
	BEDROOMS,
	NEW_OR_USED,
	MODEL_LONG_DESC,
	YEAR_MADE,
	VAN_GRADE_DESC,
	PARK_TIER,
	VAN_PRICE,
	SPECIAL_DISCOUNT,
	TOTAL_ADDONS_CHARGE,
	WEB_PRICE,
	ESTIMATED_MARGIN,
	VAT_IN_SALE,
	PRICING_OVERRIDE,
	GBB,
	UPDATE_VAN_PRICE
) as
with base_data as (
    select distinct 
        pk.park_code as park,
        ps.pitch_status_code as pitch_status,
        pv.van_stock_no as csn_number,
        pv.make,
        pv.model,
        pv.twin_yn as is_lodge,
        pv.length,
        pv.width,
        pv.no_of_bed_codes as bedrooms,
        case when pv.new_yn = 1 then 'New' else 'Used' end as new_or_used,
        pv.model_long_desc,
        pv.year_made,
        vg.van_grade_desc,
        pt.price_tier as park_tier,
        coalesce(max(case when pp.price_type_enum = 1 then pp.gross_price end), 0) as van_price,
        coalesce(max(case when pp.price_type_enum = 22 then -pp.gross_price end), 0) as special_discount,
        coalesce(sum(case when pp.price_type_enum not in (1,2,6,28,29,20,26,27,7,32,42,43,9,30,22,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70) 
            then pp.gross_price else 0 end), 0) as total_addons_charge,
        coalesce(sum(case when pp.price_type_enum not in (6,28,29,20,26,27,7,32,42,43,9,30,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70)
            then pp.gross_price else 0 end), 0) as web_price,
        pv.estimated_margin,
        pv.vat_value as vat_in_sale,
        case when pv.value_overridden_yn = 1 then 'Yes' else 'No' end as pricing_override
    from haven_base.plot.pitches ppt
        inner join haven_base.plot.pitch_statuses ps on ppt.pitch_status_enum = ps.pitch_status_enum
        inner join haven_base.plot.parks pk on ppt.park_id = pk.park_id
        inner join haven_base.plot.vans pv on ppt.van_id = pv.van_id
        left outer join haven_base.plot.prices pp on pp.van_id = pv.van_id
        left outer join haven_base.plot.van_grades vg on vg.van_grade_id = pv.van_grade_id
        left outer join haven_store_dev.caravan_sales_pricing_application.cspa_park_tiers pt on pk.park_code = pt.park
    where ps.pitch_status_code not in ('OB', 'OL', 'VA', 'TO', 'C8', 'ER')
        and pk.deleted_yn = 0
        and pv.deleted_yn = 0
        and pv.delivery_confirmed_yn = 1
    group by 
        pk.park_code,
        ps.pitch_status_code,
        pv.van_stock_no,
        pv.make,
        pv.model,
        pv.twin_yn,
        pv.length,
        pv.width,
        pv.no_of_bed_codes,
        pv.new_yn,
        pv.model_long_desc,
        pv.year_made,
        vg.van_grade_desc,
        pt.price_tier,
        pv.estimated_margin,
        pv.vat_value,
        pv.value_overridden_yn
),

matching_gbb as (
    select distinct
        b.*,
        gbb.tiering as gbb
    from base_data b
    left join haven_store_dev.caravan_sales_pricing_application.cspa_gbb gbb on
        b.make = gbb.make
        and b.model = gbb.model
        and b.length = gbb.length
        and b.width = gbb.width
        and b.bedrooms = gbb.beds
        and b.van_grade_desc = gbb.van_grade
        and b.year_made = gbb.year_made
    order by b.csn_number
),
van_prices as (
    select distinct
        b.*,
        bp.value as new_price
    from matching_gbb b
    left join haven_store_dev.caravan_sales_pricing_application.cspa_base_pricing_3 bp on
        b.year_made = bp.year
        and b.new_or_used = bp.new_used
        and b.park_tier = bp.tier
        and b.van_grade_desc = upper(bp.grade || 'V')
        and b.gbb = bp.gbb
        and b.width >= bp.min_width
        and b.length >= bp.min_length
        and b.bedrooms = bp.beds
        and b.year_made = bp.year
)

select distinct
    b.*,
    case 
        when v.new_price >= 15000 then v.new_price
        else null
    end as update_van_price
from matching_gbb b
left join van_prices v on b.csn_number = v.csn_number
order by b.park, b.csn_number;

use schema haven_store_dev.caravan_sales_pricing_application;

show views;


drop view CSPA_PLOT_UPLOAD_CURRENT;
drop view CSPA_PITCH_CODES_MIRROR;
drop view CSPA_OUTPUT_REVIEW;

use role dba;

select get_ddl('view', 'HAVEN_REVENUE_MANAGEMENT.CARAVAN_PRICING.CSPA_OUTPUT_REVIEW_3');

use role haven_dbt_transform_dev;

create or replace view CSPA_OUTPUT_REVIEW_3(
	PARK,
	PITCH_STATUS,
	CSN_NUMBER,
	MAKE,
	MODEL,
	IS_LODGE,
	LENGTH,
	WIDTH,
	BEDROOMS,
	NEW_OR_USED,
	MODEL_LONG_DESC,
	YEAR_MADE,
	VAN_GRADE_DESC,
	PARK_TIER,
	VAN_PRICE,
	SPECIAL_DISCOUNT,
	TOTAL_ADDONS_CHARGE,
	WEB_PRICE,
	ESTIMATED_MARGIN,
	VAT_IN_SALE,
	PRICING_OVERRIDE,
	GBB,
	UPDATE_VAN_PRICE
) as
with base_data as (
    select distinct 
        pk.park_code as park,
        ps.pitch_status_code as pitch_status,
        pv.van_stock_no as csn_number,
        pv.make,
        pv.model,
        pv.twin_yn as is_lodge,
        pv.length,
        pv.width,
        pv.no_of_bed_codes as bedrooms,
        case when pv.new_yn = 1 then 'New' else 'Used' end as new_or_used,
        pv.model_long_desc,
        pv.year_made,
        vg.van_grade_desc,
        pt.price_tier as park_tier,
        coalesce(max(case when pp.price_type_enum = 1 then pp.gross_price end), 0) as van_price,
        coalesce(max(case when pp.price_type_enum = 22 then -pp.gross_price end), 0) as special_discount,
        coalesce(sum(case when pp.price_type_enum not in (1,2,6,28,29,20,26,27,7,32,42,43,9,30,22,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70) 
            then pp.gross_price else 0 end), 0) as total_addons_charge,
        coalesce(sum(case when pp.price_type_enum not in (6,28,29,20,26,27,7,32,42,43,9,30,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70)
            then pp.gross_price else 0 end), 0) as web_price,
        pv.estimated_margin,
        pv.vat_value as vat_in_sale,
        case when pv.value_overridden_yn = 1 then 'Yes' else 'No' end as pricing_override
    from haven_base.plot.pitches ppt
        inner join haven_base.plot.pitch_statuses ps on ppt.pitch_status_enum = ps.pitch_status_enum
        inner join haven_base.plot.parks pk on ppt.park_id = pk.park_id
        inner join haven_base.plot.vans pv on ppt.van_id = pv.van_id
        left outer join haven_base.plot.prices pp on pp.van_id = pv.van_id
        left outer join haven_base.plot.van_grades vg on vg.van_grade_id = pv.van_grade_id
        left outer join haven_store_dev.caravan_sales_pricing_application.cspa_park_tiers pt on pk.park_code = pt.park
    where ps.pitch_status_code not in ('OB', 'OL', 'VA', 'TO', 'C8', 'ER')
        and pk.deleted_yn = 0
        and pv.deleted_yn = 0
        and pv.delivery_confirmed_yn = 1
    group by 
        pk.park_code,
        ps.pitch_status_code,
        pv.van_stock_no,
        pv.make,
        pv.model,
        pv.twin_yn,
        pv.length,
        pv.width,
        pv.no_of_bed_codes,
        pv.new_yn,
        pv.model_long_desc,
        pv.year_made,
        vg.van_grade_desc,
        pt.price_tier,
        pv.estimated_margin,
        pv.vat_value,
        pv.value_overridden_yn
),

matching_gbb as (
    select distinct
        b.*,
        gbb.tiering as gbb
    from base_data b
    left join haven_store_dev.caravan_sales_pricing_application.cspa_gbb gbb on
        b.make = gbb.make
        and b.model = gbb.model
        and b.length = gbb.length
        and b.width = gbb.width
        and b.bedrooms = gbb.beds
        and b.van_grade_desc = gbb.van_grade
        and b.year_made = gbb.year_made
    order by b.csn_number
),
van_prices as (
    select distinct
        b.*,
        bp.value as new_price
    from matching_gbb b
    left join haven_store_dev.caravan_sales_pricing_application.cspa_base_pricing_3 bp on
        b.year_made = bp.year
        and b.new_or_used = bp.new_used
        and b.park_tier = bp.tier
        and b.van_grade_desc = upper(bp.grade || 'V')
        and b.gbb = bp.gbb
        and b.width >= bp.min_width
        and b.length >= bp.min_length
        and b.bedrooms = bp.beds
        and b.year_made = bp.year
)

select distinct
    b.*,
    case 
        when v.new_price >= 15000 then v.new_price
        else null
    end as update_van_price
from matching_gbb b
left join van_prices v on b.csn_number = v.csn_number
order by b.park, b.csn_number;


-- production version

use role dba;

use schema haven_store.caravan_sales_pricing_application;

create or replace view CSPA_OUTPUT_REVIEW_3(
	PARK,
	PITCH_STATUS,
	CSN_NUMBER,
	MAKE,
	MODEL,
	IS_LODGE,
	LENGTH,
	WIDTH,
	BEDROOMS,
	NEW_OR_USED,
	MODEL_LONG_DESC,
	YEAR_MADE,
	VAN_GRADE_DESC,
	PARK_TIER,
	VAN_PRICE,
	SPECIAL_DISCOUNT,
	TOTAL_ADDONS_CHARGE,
	WEB_PRICE,
	ESTIMATED_MARGIN,
	VAT_IN_SALE,
	PRICING_OVERRIDE,
	GBB,
	UPDATE_VAN_PRICE
) as
with base_data as (
    select distinct 
        pk.park_code as park,
        ps.pitch_status_code as pitch_status,
        pv.van_stock_no as csn_number,
        pv.make,
        pv.model,
        pv.twin_yn as is_lodge,
        pv.length,
        pv.width,
        pv.no_of_bed_codes as bedrooms,
        case when pv.new_yn = 1 then 'New' else 'Used' end as new_or_used,
        pv.model_long_desc,
        pv.year_made,
        vg.van_grade_desc,
        pt.price_tier as park_tier,
        coalesce(max(case when pp.price_type_enum = 1 then pp.gross_price end), 0) as van_price,
        coalesce(max(case when pp.price_type_enum = 22 then -pp.gross_price end), 0) as special_discount,
        coalesce(sum(case when pp.price_type_enum not in (1,2,6,28,29,20,26,27,7,32,42,43,9,30,22,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70) 
            then pp.gross_price else 0 end), 0) as total_addons_charge,
        coalesce(sum(case when pp.price_type_enum not in (6,28,29,20,26,27,7,32,42,43,9,30,23,24,25,31,33,34,35,44,45,46,53,58,65,66,69,70)
            then pp.gross_price else 0 end), 0) as web_price,
        pv.estimated_margin,
        pv.vat_value as vat_in_sale,
        case when pv.value_overridden_yn = 1 then 'Yes' else 'No' end as pricing_override
    from haven_base.plot.pitches ppt
        inner join haven_base.plot.pitch_statuses ps on ppt.pitch_status_enum = ps.pitch_status_enum
        inner join haven_base.plot.parks pk on ppt.park_id = pk.park_id
        inner join haven_base.plot.vans pv on ppt.van_id = pv.van_id
        left outer join haven_base.plot.prices pp on pp.van_id = pv.van_id
        left outer join haven_base.plot.van_grades vg on vg.van_grade_id = pv.van_grade_id
        left outer join haven_store.caravan_sales_pricing_application.cspa_park_tiers pt on pk.park_code = pt.park
    where ps.pitch_status_code not in ('OB', 'OL', 'VA', 'TO', 'C8', 'ER')
        and pk.deleted_yn = 0
        and pv.deleted_yn = 0
        and pv.delivery_confirmed_yn = 1
    group by 
        pk.park_code,
        ps.pitch_status_code,
        pv.van_stock_no,
        pv.make,
        pv.model,
        pv.twin_yn,
        pv.length,
        pv.width,
        pv.no_of_bed_codes,
        pv.new_yn,
        pv.model_long_desc,
        pv.year_made,
        vg.van_grade_desc,
        pt.price_tier,
        pv.estimated_margin,
        pv.vat_value,
        pv.value_overridden_yn
),

matching_gbb as (
    select distinct
        b.*,
        gbb.tiering as gbb
    from base_data b
    left join haven_store.caravan_sales_pricing_application.cspa_gbb gbb on
        b.make = gbb.make
        and b.model = gbb.model
        and b.length = gbb.length
        and b.width = gbb.width
        and b.bedrooms = gbb.beds
        and b.van_grade_desc = gbb.van_grade
        and b.year_made = gbb.year_made
    order by b.csn_number
),
van_prices as (
    select distinct
        b.*,
        bp.value as new_price
    from matching_gbb b
    left join haven_store.caravan_sales_pricing_application.cspa_base_pricing_3 bp on
        b.year_made = bp.year
        and b.new_or_used = bp.new_used
        and b.park_tier = bp.tier
        and b.van_grade_desc = upper(bp.grade || 'V')
        and b.gbb = bp.gbb
        and b.width >= bp.min_width
        and b.length >= bp.min_length
        and b.bedrooms = bp.beds
        and b.year_made = bp.year
)

select distinct
    b.*,
    case 
        when v.new_price >= 15000 then v.new_price
        else null
    end as update_van_price
from matching_gbb b
left join van_prices v on b.csn_number = v.csn_number
order by b.park, b.csn_number;

-------

use role dba;

show tables;

use schema haven_store_dev.caravan_sales_pricing_application;

show tables;

create table user_accounts_save like user_accounts;

alter table user_accounts swap with user_accounts_save;


select * from haven_store_dev.caravan_sales_pricing_application.user_accounts;

select * from user_accounts_save;

show tables;

select * from snowflake.account_usage.query_history
where user_name = 'DARIUSTINCA'
and start_time between '2025-06-02 12:15' and '2025-06-02 12:45'
order by start_time;

show tables;select * from user_accounts;

truncate table user_accounts;

-- query ID of truncate
-- 01bcc2e8-0306-a9fa-00aa-99018aa4aa77

desc table user_accounts;

alter table user_accounts 
alter column loaded_timestamp drop;

alter table user_accounts 
alter column file_name drop;


use schema haven_base.caravan_sales_pricing_application;

show views;
