USE ROLE sysadmin;

CREATE WAREHOUSE haven_On_Park_Revenue_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_On_Park_Revenue_warehouse_xsmall__operator;
create role _haven_On_Park_Revenue_warehouse_xsmall__usage;

CREATE ROLE haven_On_Park_Revenue;

create user haven_On_Park_Revenue_sigma_service_account
LOGIN_NAME = 'haven.on.park.revenue.sigma.service.account'
default_warehouse = haven_On_Park_Revenue_warehouse_xsmall
default_role = haven_On_Park_Revenue
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxk+AwoDg+OEZlyWF65Mt
s8Ex+y6ySa3xAxLVO/uWDCPKKI25BbkL1tsktk6aLhITfwGCql/TMFqTdxSRiFg8
tHFq5rr1gY0waRTabVxXBXqCVKTlADQen2PGUIWi5Ka4cx5TJ1PcwgutcjG4AWfC
Ych4lrhDpFyt+l9jpYZofV+dUtgz0jAX0b02wGdBYiIR871p/7mdNhUYNPbjSDdJ
XkxqNGrBUnFwP5zwME+0Zzyvf0PJNDaOAoHXHSQMtFJWfrU2EuAKJpQ7BSAjpZfG
hIZmvqA2ht8GlPiPgBlGlaucqO867OAVZpnELFWjXHkBW810G42hd84ZlnKnebqS
2wIDAQAB';

CREATE ROLE _haven_On_Park_Revenue__haven_store__retail__reader;
CREATE ROLE _haven_On_Park_Revenue__haven_store__common__reader;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_On_Park_Revenue_warehouse_xsmall to role _haven_On_Park_Revenue_warehouse_xsmall__usage;
grant role _haven_On_Park_Revenue_warehouse_xsmall__usage to role _haven_On_Park_Revenue_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_On_Park_Revenue_warehouse_xsmall to role _haven_holidays_warehouse_xsmall__operator;

GRANT ROLE _haven_store__retail__usage TO ROLE _haven_On_Park_Revenue__haven_store__retail__reader;
GRANT ROLE _haven_store__common__usage TO ROLE _haven_On_Park_Revenue__haven_store__common__reader;

grant select on table haven_store.retail.fct_retail_sales to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.retail.fct_retail_promotions to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.retail.fct_retail_sales_payment_method to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.retail.dim_epos_venue to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.retail.dim_epos_product to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.retail.dim_epos_account to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.retail.dim_epos_order_type to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.retail.dim_epos_payment_method to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.retail.dim_epos_sales_area_division_mapping to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.retail.dim_epos_promotion to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.retail.dim_owner_pass to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.retail.dim_team_card to role _haven_On_Park_Revenue__haven_store__retail__reader;
grant select on table haven_store.common.dim_reporting_calendar to role _haven_On_Park_Revenue__haven_store__common__reader;

GRANT ROLE _haven_On_Park_Revenue__haven_store__retail__reader TO ROLE haven_On_Park_Revenue;
GRANT ROLE _haven_On_Park_Revenue__haven_store__common__reader TO ROLE haven_On_Park_Revenue;
GRANT ROLE _haven_On_Park_Revenue_warehouse_xsmall__usage TO ROLE haven_On_Park_Revenue;

GRANT ROLE haven_On_Park_Revenue TO ROLE bourne_governance;
GRANT ROLE haven_On_Park_Revenue TO ROLE dba;

GRANT ROLE haven_On_Park_Revenue TO USER haven_On_Park_Revenue_sigma_service_account;

-- 22/01/2025

USE ROLE haven_On_Park_Revenue;

SHOW WAREHOUSES;

-- HAVEN_ON_PARK_REVENUE_WAREHOUSE_XSMALL

USE ROLE sysadmin;

ALTER WAREHOUSE HAVEN_ON_PARK_REVENUE_WAREHOUSE_XSMALL
SET warehouse_size = SMALL,
max_cluster_count = 4
min_cluster_count = 1
scaling_policy = standard;

-- 22/05/2024

use ROLE useradmin;

CREATE ROLE _haven_On_Park_Revenue__haven_store__budget_data__reader;

use ROLE securityadmin;

GRANT ROLE _haven_store__budget_data__usage TO ROLE _haven_On_Park_Revenue__haven_store__budget_data__reader;  

GRANT select ON TABLE haven_store.budget_data.BUDGETS_ACTIVITIES TO ROLE _haven_On_Park_Revenue__haven_store__budget_data__reader;
GRANT select ON TABLE haven_store.budget_data.BUDGETS_BINGO TO ROLE _haven_On_Park_Revenue__haven_store__budget_data__reader;
GRANT select ON TABLE haven_store.budget_data.BUDGETS_POOL_RETAIL TO ROLE _haven_On_Park_Revenue__haven_store__budget_data__reader;
GRANT select ON TABLE haven_store.budget_data.BUDGETS_RETAIL TO ROLE _haven_On_Park_Revenue__haven_store__budget_data__reader;

GRANT ROLE _haven_On_Park_Revenue__haven_store__budget_data__reader TO ROLE haven_On_Park_Revenue;

GRANT SELECT ON TABLE HAVEN_STORE.COMMON.DIM_CALENDAR TO ROLE _haven_On_Park_Revenue__haven_store__common__reader;

use ROLE haven_On_Park_Revenue;

show databases; 

use DATABASE haven_store;

show schemas;

use SCHEMA budget_data;

show tables;

use SCHEMA common;

show tables;

-- 30/05/2025

use ROLE useradmin;

CREATE ROLE _haven_On_Park_Revenue__haven_store__activities__reader;
CREATE ROLE _haven_On_Park_Revenue__haven_store__caravans__reader;

use ROLE securityadmin;

GRANT ROLE _haven_store__activities__usage TO ROLE _haven_On_Park_Revenue__haven_store__activities__reader;
GRANT ROLE _haven_store__caravans__usage TO ROLE _haven_On_Park_Revenue__haven_store__caravans__reader;

GRANT SELECT ON table HAVEN_STORE.COMMON.DIM_PARK TO ROLE _haven_On_Park_Revenue__haven_store__common__reader; 
GRANT SELECT ON table HAVEN_STORE.RETAIL.DIM_EPOS_DISCOUNT to role _haven_On_Park_Revenue__haven_store__retail__reader;
GRANT SELECT ON table HAVEN_STORE.RETAIL.BUDGET_RETAIL_CURRENT to role _haven_On_Park_Revenue__haven_store__retail__reader;
GRANT SELECT ON table HAVEN_STORE.RETAIL.BUDGET_POOL_RETAIL_CURRENT to role _haven_On_Park_Revenue__haven_store__retail__reader;
GRANT SELECT ON table HAVEN_STORE.ACTIVITIES.FCT_SESSION_CAPACITIES TO ROLE _haven_On_Park_Revenue__haven_store__activities__reader;
GRANT SELECT ON table HAVEN_STORE.ACTIVITIES.DIM_ACTIVITY_TIMESLOT TO ROLE _haven_On_Park_Revenue__haven_store__activities__reader;
GRANT SELECT ON table HAVEN_STORE.ACTIVITIES.FCT_ACTIVITY_BOOKINGS TO ROLE _haven_On_Park_Revenue__haven_store__activities__reader;
GRANT SELECT ON table HAVEN_STORE.ACTIVITIES.DIM_ACTIVITY_LOCATION TO ROLE _haven_On_Park_Revenue__haven_store__activities__reader;
GRANT SELECT ON table HAVEN_STORE.ACTIVITIES.DIM_ACTIVITY TO ROLE _haven_On_Park_Revenue__haven_store__activities__reader;
GRANT SELECT ON table HAVEN_STORE.ACTIVITIES.BUDGET_ACTIVITIES_CURRENT TO ROLE _haven_On_Park_Revenue__haven_store__activities__reader;
GRANT SELECT ON TABLE HAVEN_STORE.CARAVANS.CARAVAN_SALES_BUDGET_DAILY_CURRENT TO ROLE _haven_On_Park_Revenue__haven_store__caravans__reader;
GRANT SELECT ON TABLE HAVEN_STORE.CARAVANS.CARAVAN_SALES_BUDGET_WEEKLY_CURRENT TO ROLE _haven_On_Park_Revenue__haven_store__caravans__reader;


GRANT ROLE _haven_On_Park_Revenue__haven_store__activities__reader TO ROLE haven_On_Park_Revenue;
GRANT ROLE _haven_On_Park_Revenue__haven_store__caravans__reader TO ROLE haven_On_Park_Revenue;

-- 11/06/2025

use ROLE securityadmin;

GRANT SELECT ON table HAVEN_STORE.ACTIVITIES.FCT_ACTIVITY_BOOKINGS TO ROLE _haven_On_Park_Revenue__haven_store__activities__reader;

use ROLE haven_On_Park_Revenue;

use SCHEMA haven_store.activities;

show views;

-- 01/10/2025

use ROLE securityadmin;

SHOW GRANTS TO ROLE haven_On_Park_Revenue;

use ROLE useradmin;

CREATE ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

use ROLE securityadmin;

GRANT ROLE _haven_store__performance_marketing__usage TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_CONSENT TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_CAMPAIGN TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_ACTION TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_EMAILS TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_SMS TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_TEMPLATE TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_CUSTOMER TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_DASHBOARD TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_MOBILE_NOTIFICATIONS TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_SESSION TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_BOOKINGS TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_PRODUCTS TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_PAGE TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_CHANNEL TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_DEVICE TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_SESSIONS TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_SEARCHES_HOLIDAYS TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_LANDING_PAGE TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_ACTIVITY_BOOKINGS TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_HOLIDAY_BOOKING_REFS TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_CARAVAN_SALES_FORM_COMPLETE TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_BOOKINGS_AND_EXTRAS TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_SEARCHES_CARAVAN_SALES TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

GRANT ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER TO ROLE haven_On_Park_Revenue;

GRANT ROLE _haven_store__retail_franchise__reader TO ROLE haven_On_Park_Revenue;

use ROLE useradmin;

create ROLE _haven_On_Park_Revenue__HAVEN_STORE__holiday__READER;

use ROLE securityadmin;

GRANT ROLE _haven_store__holiday__usage TO ROLE haven_on_park_revenue;
REVOKE ROLE _haven_store__holiday__usage from ROLE haven_on_park_revenue;
GRANT ROLE _haven_store__holiday__usage TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__holiday__READER;

GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_bookings TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__holiday__READER;
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_status TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__holiday__READER;
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_source_channel TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__holiday__READER;
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_referral_source TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__holiday__READER;
GRANT SELECT ON TABLE haven_store.holiday.dim_package_type TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__holiday__READER;
GRANT SELECT ON TABLE haven_store.holiday.dim_grade TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__holiday__READER;
GRANT SELECT ON TABLE haven_store.holiday.dim_payment_plan TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__holiday__READER;
GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_addons TO ROLE _haven_On_Park_Revenue__HAVEN_STORE__holiday__READER;

GRANT ROLE _haven_On_Park_Revenue__HAVEN_STORE__holiday__READER TO ROLE haven_on_park_revenue; 

_HAVEN_ON_PARK_REVENUE__HAVEN_STORE__ACTIVITIES__READER
_HAVEN_ON_PARK_REVENUE__HAVEN_STORE__BUDGET_DATA__READER
_HAVEN_ON_PARK_REVENUE__HAVEN_STORE__CARAVANS__READER
_HAVEN_ON_PARK_REVENUE__HAVEN_STORE__COMMON__READER
_HAVEN_ON_PARK_REVENUE__HAVEN_STORE__RETAIL__READER

-- 03/12/2025

USE ROLE SECURITYADMIN;

GRANT ROLE _HAVEN_STORE__WORKFORCE__READER TO ROLE haven_on_park_revenue;

REVOKE ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER FROM ROLE haven_on_park_revenue;

-- 09/12/2025

use ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.caravans.DIM_PITCH_HISTORY TO ROLE _haven_On_Park_Revenue__haven_store__caravans__reader;

use ROLE USERadmin;

CREATE ROLE _haven_On_Park_Revenue__haven_store__trooper2__reader;

use ROLE securityadmin;

GRANT ROLE _haven_store__trooper2__usage TO ROLE _haven_On_Park_Revenue__haven_store__trooper2__reader;

GRANT SELECT ON TABLE HAVEN_STORE.TROOPER2.BOOKING_HAVEN_ID  TO ROLE _haven_On_Park_Revenue__haven_store__trooper2__reader;

GRANT ROLE _haven_On_Park_Revenue__haven_store__trooper2__reader TO ROLE haven_on_park_revenue;

use ROLE securityadmin;

REVOKE ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER from ROLE haven_On_Park_Revenue;

DROP ROLE _haven_On_Park_Revenue__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

-- 21/01/2026

use ROLE securityadmin;

GRANT ROLE _haven_store__arcades__reader TO ROLE haven_On_Park_Revenue;
