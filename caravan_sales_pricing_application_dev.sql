use ROLE dba;

use SCHEMA haven_store_dev.caravan_sales_pricing_application;

SELECT get_ddl('schema', 'caravan_sales_pricing_application');

create or replace TABLE haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.USER_ACCOUNTS (
	REG_TIMESTAMP TIMESTAMP_NTZ(9),
	ROLE VARCHAR(16777216),
	USERNAME VARCHAR(16777216),
	PASSWORD_HASH VARCHAR(16777216),
	PASSWORD_SALT VARCHAR(16777216),
	UID VARCHAR(16777216),
	APPROVED VARCHAR(16777216)
);

INSERT INTO haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.USER_ACCOUNTS 
SELECT REG_TIMESTAMP, ROLE, USERNAME, PASSWORD_HASH, PASSWORD_SALT, UID, APPROVED
FROM haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.CSPA_USER_ACCOUNTS
GROUP BY REG_TIMESTAMP, "ROLE", USERNAME, PASSWORD_HASH, PASSWORD_SALT, UID, APPROVED;

create or replace view haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.CSPA_BASE_PRICING(
	YEAR,
	NEW_USED,
	TIER,
	GRADE,
	GBB,
	MIN_WIDTH,
	MIN_LENGTH,
	BEDS,
	VALUE
) as SELECT "YEAR", NEW_USED, TIER, GRADE, GBB, MIN_WIDTH, MIN_LENGTH, BEDS, VALUE
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_BASE_PRICING
where
    (
        loaded_timestamp = (
            select max(loaded_timestamp)
            from HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_BASE_PRICING
        )
    )
 ;

create or replace view haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.CSPA_BEDS_DIFFS(
	BEDS_DIFF,
	GBP_DIFF
) as SELECT BEDS_DIFF, GBP_DIFF
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_BEDS_DIFFS
where
    (
        loaded_timestamp = (
            select max(loaded_timestamp)
            from HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_BEDS_DIFFS
        )
    )
  ;


create or replace view haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.CSPA_GBB(
	MAKE,
	MODEL,
	YEAR_MADE,
	LENGTH,
	WIDTH,
	BEDS,
	VAN_GRADE,
	PRICING_GRADE,
	TIERING
) as SELECT MAKE, MODEL, YEAR_MADE, "LENGTH", WIDTH, BEDS, VAN_GRADE, PRICING_GRADE, TIERING
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_GBB
where
    (
        loaded_timestamp = (
            select max(loaded_timestamp)
            from HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_GBB
        )
    )
  ;


create or replace view haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.CSPA_LENGTH_DIFFS(
	LEN_DIFF,
	GBP_DIFF
) as SELECT LEN_DIFF, GBP_DIFF
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_LENGTH_DIFFS
where
    (
        loaded_timestamp = (
            select max(loaded_timestamp)
            from HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_LENGTH_DIFFS
        )
    )
  ;


create or replace view haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.CSPA_PARK_TIERS(
	PARK,
	PRICE_TIER
) as SELECT PARK, PRICE_TIER
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_PARK_TIERS
where
    (
        loaded_timestamp = (
            select max(loaded_timestamp)
            from HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_PARK_TIERS
        )
    )
  ;


create or replace view haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.CSPA_USED_DIFFS(
	VAN_VERSION,
	GRADE,
	STT_FROM,
	STT_TO,
	YEAR_DIFF,
	GBP_DIFF,
	PCT_DIFF
) as SELECT VAN_VERSION, GRADE, STT_FROM, STT_TO, YEAR_DIFF, GBP_DIFF, PCT_DIFF
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_USED_DIFFS
where
    (
        loaded_timestamp = (
            select max(loaded_timestamp)
            from HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_USED_DIFFS
        )
    )
  ;


create or replace view haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.CSPA_WIDTH_DIFFS(
	WIDTH_DIFF,
	GBP_DIFF
) as SELECT WIDTH_DIFF, GBP_DIFF
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_WIDTH_DIFFS
where
    (
        loaded_timestamp = (
            select max(loaded_timestamp)
            from HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_WIDTH_DIFFS
        )
    )
  ;


create or replace view haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.CSPA_YEAR_DIFFS(
	VAN_VERSION,
	GRADE,
	STT_FROM,
	STT_TO,
	YEAR_DIFF,
	GBP_DIFF,
	PCT_DIFF
) as SELECT VAN_VERSION, GRADE, STT_FROM, STT_TO, YEAR_DIFF, GBP_DIFF, PCT_DIFF
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_YEAR_DIFFS
where
    (
        loaded_timestamp = (
            select max(loaded_timestamp)
            from HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_YEAR_DIFFS
        )
    )
  ;

create or replace view haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.CSPA_PARK_TIERS(
	PARK,
	PRICE_TIER
) as SELECT PARK, PRICE_TIER
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_PARK_TIERS
where
    (
        loaded_timestamp = (
            select max(loaded_timestamp)
            from HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_PARK_TIERS
        )
    )
  ;


create or replace view haven_store_dev.CARAVAN_SALES_PRICING_APPLICATION.CSPA_OUTPUT_REVIEW_3(
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

