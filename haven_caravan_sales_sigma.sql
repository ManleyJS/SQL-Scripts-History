USE ROLE sysadmin;

CREATE WAREHOUSE haven_caravan_sales_sigma_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_caravan_sales_sigma_warehouse_xsmall__operator;
create role _haven_caravan_sales_sigma_warehouse_xsmall__usage;

CREATE ROLE haven_caravan_sales_sigma;

create user haven_caravan_sales_sigma_sigma_service_account
LOGIN_NAME = 'haven.caravan.sales.sigma.service.account'
default_warehouse = haven_caravan_sales_sigma_warehouse_xsmall
default_role = haven_caravan_sales_sigma
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx7BbwY5GDX+VWWCTzyHb
tEjCXQzvKzl8Zfh1jYaAmMyR5ZIqCx8qamwLMucj0U0V14zJ5v8CKGF4pXknk7hM
deGGmWO8I+pEIFRiSR5HaMruAS9jguie0QrKhbW929PqtFtFzbPVv3r+0PJqOyLr
cG39TZJB4gYCpLpE9vEH/QEB1kmIhhcxsDEm1EYOx2U7f3enLUCQHB0q4LzTM+Fb
17CVIKMr/hAtlPysQu6brH5P6OP7/WFY7Z8PcvwRDNZa8xHQG9A1yQ4BQgueXXCF
DiOAoO1vUJMMMqMJ0AzXKr/Qfg/HbEqjizmxZVEWkWgCTLViNteez5/KDwlfdyYu
WQIDAQAB';


CREATE ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
CREATE ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;
CREATE ROLE _haven_caravan_sales_sigma__haven_store__common__reader;
CREATE ROLE _haven_caravan_sales_sigma__haven_base__identity__reader;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_caravan_sales_sigma_warehouse_xsmall to role _haven_caravan_sales_sigma_warehouse_xsmall__usage;
grant role _haven_caravan_sales_sigma_warehouse_xsmall__usage to role _haven_caravan_sales_sigma_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_caravan_sales_sigma_warehouse_xsmall to role _haven_caravan_sales_sigma_warehouse_xsmall__operator;


GRANT ROLE _haven_caravan_sales_sigma_warehouse_xsmall__usage TO ROLE haven_caravan_sales_sigma;


REVOKE ROLE _haven_store__prospects__reader from ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;
REVOKE ROLE _haven_store__common__reader from ROLE _haven_caravan_sales_sigma__haven_store__common__reader;

GRANT ROLE _haven_store__caravans__usage TO  ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT ROLE _haven_store__prospects__usage TO ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;
GRANT ROLE _haven_store__common__usage TO ROLE _haven_caravan_sales_sigma__haven_store__common__reader;
GRANT ROLE _HAVEN_BASE__IDENTITY__usage TO ROLE _haven_caravan_sales_sigma__haven_base__identity__reader;


GRANT ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader TO ROLE haven_caravan_sales_sigma;
GRANT ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader TO ROLE haven_caravan_sales_sigma;
GRANT ROLE _haven_caravan_sales_sigma__haven_store__common__reader TO ROLE haven_caravan_sales_sigma;
GRANT ROLE _haven_caravan_sales_sigma__haven_base__identity__reader TO ROLE haven_caravan_sales_sigma;

GRANT SELECT ON TABLE haven_store.caravans.fct_signup TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_event TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_pitch_history TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_van_history TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_status TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_type_scd1 TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_owner_account_history TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_finance_company TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_holiday_home_advisor_scd1 TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_source_scd1 TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.caravan_sale_completion TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.common.dim_park TO ROLE _haven_caravan_sales_sigma__haven_store__common__reader;
GRANT SELECT ON TABLE haven_store.common.dim_calendar TO ROLE _haven_caravan_sales_sigma__haven_store__common__reader;
GRANT SELECT ON TABLE haven_base.identity.hid_to_plot_owner TO ROLE _haven_caravan_sales_sigma__haven_base__identity__reader;
GRANT SELECT ON TABLE haven_store.caravans.leavers TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.owners_point_in_time TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.prospects.fct_caravan_sales_deals TO ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;
GRANT SELECT ON TABLE haven_store.prospects.dim_caravan_sales_contacts TO ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;

GRANT ROLE haven_caravan_sales_sigma TO USER haven_caravan_sales_sigma_sigma_service_account;
GRANT ROLE haven_caravan_sales_sigma TO ROLE DBA;

GRANT ROLE haven_caravan_sales_sigma TO ROLE Bourne_governance;

-- 22/01/2025

USE ROLE haven_caravan_sales_sigma;

SHOW WAREHOUSES;

-- HAVEN_CARAVAN_SALES_SIGMA_WAREHOUSE_XSMALL

USE ROLE sysadmin;

ALTER WAREHOUSE HAVEN_CARAVAN_SALES_SIGMA_WAREHOUSE_XSMALL
SET warehouse_size = SMALL,
max_cluster_count = 4
min_cluster_count = 1
scaling_policy = standard;

-- 20/05/2025

use ROLE securityadmin;

GRANT SELECT ON TABLE HAVEN_STORE.CARAVANS.FCT_PITCH_CHARGES TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE HAVEN_STORE.CARAVANS.DIM_CHARGE_TYPE TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE HAVEN_STORE.CARAVANS.FCT_PITCH_STATUS TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE HAVEN_STORE.CARAVANS.DIM_PITCH_STATUS TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE HAVEN_STORE.CARAVANS.FCT_VAN_HISTORY TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE HAVEN_STORE.CARAVANS.DIM_VAN_ORDER_DETAILS  TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;

GRANT ROLE _haven_store__budget_data__reader TO ROLE haven_caravan_sales_sigma;

GRANT SELECT ON TABLE HAVEN_STORE.COMMON.DIM_CALENDAR TO ROLE _haven_caravan_sales_sigma__haven_store__common__reader;

use ROLE haven_caravan_sales_sigma;

show databases;

use database haven_store;

show SCHEMAs;

use SCHEMA common;

show tables;

use SCHEMA caravans;

show tables;

-- 20/05/2025

use role securityadmin;

GRANT SELECT ON TABLE haven_base.identity.hid_to_plot_owner TO ROLE _haven_caravan_sales_sigma__haven_base__identity__reader;

--22/04/2025

use ROLE useradmin;

CREATE ROLE _haven_caravan_sales_sigma__haven_store__budget_data__reader;

use ROLE securityadmin;

revoke ROLE _haven_store__budget_data__reader from ROLE haven_caravan_sales_sigma;

GRANT ROLE _haven_store__budget_data__usage TO ROLE _haven_caravan_sales_sigma__haven_store__budget_data__reader

GRANT select ON TABLE haven_store.budget_data.CARAVAN_SALES_BUDGET_DAILY TO ROLE _haven_caravan_sales_sigma__haven_store__budget_data__reader;
GRANT select ON TABLE haven_store.budget_data.CARAVAN_SALES_BUDGET_WEEKLY TO ROLE _haven_caravan_sales_sigma__haven_store__budget_data__reader;

GRANT ROLE  _haven_caravan_sales_sigma__haven_store__budget_data__reader TO ROLE haven_caravan_sales_sigma;

use ROLE haven_caravan_sales_sigma;

use DATABASE haven_store;

show schemas;

use SCHEMA budget_data;

show tables;

--05/06/2025
use ROLE useradmin;

CREATE ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;

use ROLE securityadmin;

GRANT ROLE _haven_store__prospects__usage TO ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;

GRANT SELECT ON TABLE haven_store.prospects.dim_freshsales_contacts to ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader; 
GRANT SELECT ON TABLE haven_store.prospects.dim_freshsales_deal_stages to ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;
GRANT SELECT ON TABLE haven_store.prospects.dim_freshsales_deal_pipelines to ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;
GRANT SELECT ON TABLE haven_store.prospects.dim_freshsales_lead_sources to ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;
GRANT SELECT ON TABLE haven_store.prospects.fct_freshsales_deals to ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;

GRANT SELECT ON TABLE haven_store.prospects.fct_caravan_sales_deals TO ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;
GRANT SELECT ON TABLE haven_store.prospects.dim_caravan_sales_contacts TO ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;


GRANT SELECT ON VIEW haven_store.prospects.dim_freshsales_deal_lost_reason to ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;
GRANT SELECT ON VIEW haven_store.prospects.dim_freshsales_territory to ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;

GRANT ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader TO ROLE haven_caravan_sales_sigma;


use ROLE haven_caravan_sales_sigma;
use SCHEMA haven_store.prospects;

show tables;

-- 09/06/2025

use ROLE securityadmin;

GRANT SELECT ON VIEW haven_store.prospects.dim_freshsales_deal_lost_reason to ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;
GRANT SELECT ON VIEW haven_store.prospects.dim_freshsales_territory to ROLE _haven_caravan_sales_sigma__haven_store__prospects__reader;

-- 09/07/2025

use ROLE securityadmin;

show grants TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;

GRANT SELECT ON TABLE haven_store.caravans.caravan_sales_budget_daily_version TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.caravan_sales_budget_weekly_version TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;

GRANT SELECT ON VIEW haven_store.caravans.caravan_sales_budget_daily_current TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;
GRANT SELECT ON VIEW haven_store.caravans.caravan_sales_budget_weekly_current TO ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;

-- 01/10/2025

use ROLE securityadmin;

REVOKE SELECT ON TABLE haven_store.caravans.owners_point_in_time from ROLE _haven_caravan_sales_sigma__haven_store__caravans__reader;

use ROLE useradmin;

CREATE ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

use ROLE securityadmin;

GRANT ROLE _haven_store__performance_marketing__usage TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_CONSENT TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_CAMPAIGN TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_ACTION TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_EMAILS TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_SMS TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_TEMPLATE TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_CUSTOMER TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_DASHBOARD TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_MOBILE_NOTIFICATIONS TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_SESSION TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_BOOKINGS TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_PRODUCTS TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_PAGE TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_CHANNEL TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_DEVICE TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_SESSIONS TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_SEARCHES_HOLIDAYS TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_LANDING_PAGE TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_ACTIVITY_BOOKINGS TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_HOLIDAY_BOOKING_REFS TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_CARAVAN_SALES_FORM_COMPLETE TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_BOOKINGS_AND_EXTRAS TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_SEARCHES_CARAVAN_SALES TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

GRANT ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER TO ROLE haven_caravan_sales_sigma;
GRANT ROLE _HAVEN_STORE__lettings__READER TO ROLE haven_caravan_sales_sigma;

GRANT SELECT ON TABLE haven_store.caravans.dim_owner_account_type TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_charge_type TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_letting_contract_type TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_pitch_grade_scd1 TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_pitch_scd1 TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_pitch_status TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_van_attributes_type TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_van_order_details TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_van_pdi TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_van_pdi_fault TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_van_repair_history TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_account_history TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_pitch_charges TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_pitch_status TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_pitch_utilities TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_sale_invoice TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_van_attributes TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_van_history TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.site_fee_ledger TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.letting_income_detail TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.letting_detail TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.caravan_sales_budget_daily_current TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.caravan_sales_budget_weekly_current TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;

-- correct name for table

use ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.caravans.dim_account_owner_type TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;


SHOW GRANTS TO ROLE haven_caravan_sales_sigma;

-- 06/10/2025

use ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.PERFORMANCE_MARKETING.FCT_TRADING_CARAVAN_SALES_FUNNEL TO ROLE _haven_caravan_sales_sigma__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

-- 09/12/2025

use ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.caravans.fct_rent_ledger TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_rent_ledger_invoice TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;

-- 17/12/2025

use ROLE securityadmin;

grant select on table haven_store.caravans.fct_caravan_sales_ledger TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
grant select on table haven_store.caravans.dim_caravan_sales_ledger_invoice TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;


-- 06/02/2026

use ROLE securityadmin;

REVOKE SELECT ON TABLE haven_store.caravans.caravan_sale_completion FROM ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
REVOKE SELECT ON TABLE haven_store.caravans.leavers FROM ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
REVOKE SELECT ON TABLE haven_store.caravans.owners_point_in_time FROM ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.completed_leaver TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.owner_leaver TO ROLE _HAVEN_CARAVAN_SALES_SIGMA__HAVEN_STORE__CARAVANS__READER;