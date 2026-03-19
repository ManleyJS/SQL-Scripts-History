use ROLE sysadmin;


CREATE WAREHOUSE caravan_sales_pricing_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _caravan_sales_pricing_warehouse_xsmall__warehouse__operator;
create role _caravan_sales_pricing_warehouse_xsmall__warehouse__usage;

CREATE ROLE caravan_sales_pricing_application;

CREATE ROLE _caravan_sales_pricing_application__haven_base__plot__reader;
CREATE ROLE _caravan_sales_pricing_application__haven_revenue_management__caravan_pricing__writer;

CREATE ROLE _haven_revenue_management__caravan_pricing__usage;

use ROLE securityadmin;

grant usage, monitor on warehouse caravan_sales_pricing_warehouse_xsmall to role _caravan_sales_pricing_warehouse_xsmall__warehouse__usage;
grant role _caravan_sales_pricing_warehouse_xsmall__warehouse__usage to role _caravan_sales_pricing_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse caravan_sales_pricing_warehouse_xsmall to role _caravan_sales_pricing_warehouse_xsmall__warehouse__operator;

GRANT ROLE _haven_base__plot__usage TO ROLE _caravan_sales_pricing_application__haven_base__plot__reader;

GRANT SELECT ON VIEW haven_base.plot.pitches TO ROLE _caravan_sales_pricing_application__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.vans TO ROLE _caravan_sales_pricing_application__haven_base__plot__reader; 
GRANT SELECT ON VIEW haven_base.plot.pitch_statuses TO ROLE _caravan_sales_pricing_application__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.parks TO ROLE _caravan_sales_pricing_application__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.vans TO ROLE _caravan_sales_pricing_application__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.prices TO ROLE _caravan_sales_pricing_application__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.van_grades TO ROLE _caravan_sales_pricing_application__haven_base__plot__reader;

GRANT USAGE ON DATABASE haven_revenue_management TO ROLE _haven_revenue_management__caravan_pricing__usage;
GRANT USAGE ON SCHEMA haven_revenue_management.caravan_pricing TO ROLE _haven_revenue_management__caravan_pricing__usage;

GRANT ROLE _haven_revenue_management__caravan_pricing__usage TO ROLE _caravan_sales_pricing_application__haven_revenue_management__caravan_pricing__writer;

GRANT CREATE table ON SCHEMA haven_revenue_management.caravan_pricing TO ROLE _caravan_sales_pricing_application__haven_revenue_management__caravan_pricing__writer;
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA haven_revenue_management.caravan_pricing TO ROLE _caravan_sales_pricing_application__haven_revenue_management__caravan_pricing__writer;

GRANT ROLE _caravan_sales_pricing_warehouse_xsmall__warehouse__usage  TO ROLE caravan_sales_pricing_application;
GRANT ROLE _haven_revenue_management__caravan_pricing__usage  TO ROLE caravan_sales_pricing_application;
GRANT ROLE _caravan_sales_pricing_application__haven_revenue_management__caravan_pricing__writer TO ROLE caravan_sales_pricing_application;

GRANT ROLE caravan_sales_pricing_application TO ROLE dba;

show users LIKE 'abb%';
GRANT ROLE caravan_sales_pricing_application TO USER dariustinca;

GRANT ROLE caravan_sales_pricing_application TO USER dillonsim;
GRANT ROLE caravan_sales_pricing_application TO USER ABBIEJOHNSON;

REVOKE ROLE _caravan_sales_pricing_application__haven_base__plot__reader FROM ROLE caravan_sales_pricing_application;
revoke ROLE _caravan_sales_pricing_application__haven_revenue_management__caravan_pricing__writer FROM ROLE  caravan_sales_pricing_application;
GRANT ROLE _haven_revenue_management__caravan_pricing__usage TO ROLE caravan_sales_pricing_application;

REVOKE ROLE _caravan_sales_pricing_warehouse_xsmall__warehouse__usage from ROLE caravan_sales_pricing_application;

show grants TO ROLE caravan_sales_pricing_application;


-- 30/09/2025

use ROLE useradmin;

CREATE ROLE CARAVAN_SALES_PRICING_APPLICATION;

use ROLE securityadmin;

GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION TO USER sarunasjatautis;
GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION TO USER dillonsim;
GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION TO USER abbiejohnson;

GRANT ROLE _haven_master__streamlits__usage TO ROLE CARAVAN_SALES_PRICING_APPLICATION;
GRANT USAGE ON streamlit haven_master.streamlits.CARAVAN_SALES_PRICING_APP TO ROLE CARAVAN_SALES_PRICING_APPLICATION;

use ROLE dba;

TRUNCATE TABLE HAVEN_STORE.CARAVAN_SALES_PRICING_APPLICATION.USER_ACCOUNTS;

create or replace view HAVEN_STORE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_OUTPUT_REVIEW(
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
    left join haven_store.caravan_sales_pricing_application.cspa_base_pricing bp on
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



create TABLE HAVEN_STORE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_APP_SUBMISSIONS (
 LOG_ID NUMBER(38,0),
 TIMESTAMP VARCHAR(16777216),
 OPERATION_ID VARCHAR(16777216),
 USERNAME VARCHAR(16777216),
 USER_ROLE VARCHAR(16777216),
 RECORD_IDENTIFIER VARCHAR(16777216),
 FIELD_NAME VARCHAR(16777216),
 OLD_VALUE VARCHAR(16777216),
 PROPOSED_PRICE VARCHAR(16777216),
 NEW_VALUE VARCHAR(16777216),
 CHANGE_TYPE VARCHAR(16777216),
 STATUS VARCHAR(16777216)
);


SELECT current_role();

create or replace TABLE HAVEN_STORE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_PARK_TIERS_EDITABLE 
as
select park as park_code, price_tier 
from haven_store.caravan_sales_pricing_application.cspa_park_tiers
where loaded_timestamp = (select max(loaded_timestamp) from  haven_store.caravan_sales_pricing_application.cspa_park_tiers);

