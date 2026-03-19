use ROLE dba;

use SCHEMA haven_data_engineering.rms_caravan_pricer_app_dev;

CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.ACTIVE_SUBMISSIONS clone haven_revenue_management.caravan_pricing.ACTIVE_SUBMISSIONS;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.AUDIT_LOGS clone haven_revenue_management.caravan_pricing.AUDIT_LOGS;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.BASE_PRICING clone haven_revenue_management.caravan_pricing.BASE_PRICING;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.BASE_PRICING_2 clone haven_revenue_management.caravan_pricing.BASE_PRICING_2;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.BASE_PRICING_3 clone haven_revenue_management.caravan_pricing.BASE_PRICING_3;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.BEDS_DIFFS clone haven_revenue_management.caravan_pricing.BEDS_DIFFS;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.CSPA_OUTPUT_REVIEW_3ST clone haven_revenue_management.caravan_pricing.CSPA_OUTPUT_REVIEW_3ST;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.CSPA_OUTPUT_REVIEW_3_BK clone haven_revenue_management.caravan_pricing.CSPA_OUTPUT_REVIEW_3_BK;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.GBB clone haven_revenue_management.caravan_pricing.GBB;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.LENGTH_DIFFS clone haven_revenue_management.caravan_pricing.LENGTH_DIFFS;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.PARK_TIERS clone haven_revenue_management.caravan_pricing.PARK_TIERS;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.USED_DIFFS clone haven_revenue_management.caravan_pricing.USED_DIFFS;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.USER_ACCOUNTS clone haven_revenue_management.caravan_pricing.USER_ACCOUNTS;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.WIDTH_DIFFS clone haven_revenue_management.caravan_pricing.WIDTH_DIFFS;
CREATE TABLE haven_data_engineering.rms_caravan_pricer_app_dev.YEAR_DIFFS clone haven_revenue_management.caravan_pricing.YEAR_DIFFS;

use ROLE sysadmin;

CREATE WAREHOUSE haven_streamlit_dev_warehouse_xsmall WITH WAREHOUSE_SIZE = 'xsmall' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE useradmin;

create role _haven_streamlit_dev_warehouse_xsmall__operator;
create role _haven_streamlit_dev_warehouse_xsmall__usage;

CREATE ROLE haven_streamlit_dev;

CREATE ROLE _haven_streamlit_dev__haven_base__plot__reader;

create OR replace user haven_streamlit_dev_service_account
LOGIN_NAME = 'haven.streamlit.dev.service.account'
default_warehouse = haven_streamlit_dev_warehouse_xsmall
default_role = haven_streamlit_dev
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsQqCNiWx/fKlnveLz+FQ
TX6RQkKhDrFofu5sxqc7EbLXXesVt8GpFN/7+tHg2Si4QrK+31GZ8mmnJ0wp5rJQ
tt5th+Y2/TJqNAcEqQPnRiX5uLNxwbjigV9BHzqnSIE0bQGN6KwjguuGIyqkmg0c
wYR/qwdEN85nIct/cicOHFrFrYxFBMOoKo1jWJgOCU2yZiNg20OCoV1GCwtve7yJ
mBRl675KXZf+JyRbNsYAkjPIewXX1YeuYT0a1IYNfV6TJSF7S9V40DcTUyIzHV4E
LR/f0yEvLdFGRzdj3R2J5Cb8VaBeMCyy4LvrjtQ2HKdg23hrKVI3P4SCvTpIuelq
GQIDAQAB';

use ROLE securityadmin;

grant usage, monitor on warehouse haven_streamlit_dev_warehouse_xsmall to role _haven_streamlit_dev_warehouse_xsmall__usage;
grant role _haven_streamlit_dev_warehouse_xsmall__usage to role _haven_streamlit_dev_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_streamlit_dev_warehouse_xsmall to role _haven_streamlit_dev_warehouse_xsmall__operator;

GRANT ROLE _haven_streamlit_dev_warehouse_xsmall__usage TO ROLE haven_streamlit_dev;

GRANT ROLE _haven_data_engineering__rms_caravan_pricer_app_dev__creator TO ROLE haven_streamlit_dev;
GRANT CREATE streamlit ON SCHEMA haven_data_engineering.rms_caravan_pricer_app_dev TO ROLE _haven_data_engineering__rms_caravan_pricer_app_dev__creator;

GRANT ROLE _haven_base__plot__usage TO ROLE _haven_streamlit_dev__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.vans TO ROLE _haven_streamlit_dev__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.van_types TO ROLE _haven_streamlit_dev__haven_base__plot__reader;
--GRANT SELECT ON VIEW haven_base.plot.van_type_enum TO ROLE _haven_streamlit_dev__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.van_grades TO ROLE _haven_streamlit_dev__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.parks TO ROLE _haven_streamlit_dev__haven_base__plot__reader;

GRANT ROLE _haven_streamlit_dev__haven_base__plot__reader TO ROLE haven_streamlit_dev;

GRANT ROLE haven_streamlit_dev TO USER haven_streamlit_dev_service_account;
GRANT ROLE haven_streamlit_dev TO ROLE dba;

use ROLE haven_streamlit_dev;

--20/05/2025 

create or replace view haven_data_engineering.rms_caravan_pricer_app_dev.CSPA_OUTPUT_REVIEW_3(
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
        left outer join haven_data_engineering.rms_caravan_pricer_app_dev.park_tiers pt on pk.park_code = pt.park
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
    left join haven_data_engineering.rms_caravan_pricer_app_dev.gbb gbb on
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
    left join haven_data_engineering.rms_caravan_pricer_app_dev.base_pricing_3 bp on
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
