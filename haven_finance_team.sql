USE ROLE useradmin;

--CREATE ROLE _haven_finance__haven_store__caravans__reader;
CREATE ROLE _haven_finance__haven_store__common__reader;

USE ROLE securityadmin;

GRANT ROLE _haven_store__financial_cube__reader to role haven_finance;
GRANT ROLE _haven_base__erpx__reader to role haven_finance;
GRANT ROLE _haven_store__haven_accountants__reader to role haven_finance;
GRANT ROLE _bourne_store__finance_shared_services__reader to role haven_finance;
GRANT ROLE _haven_base__dream__reader to role haven_finance;
GRANT ROLE _haven_base__dream_evergreen__reader to role haven_finance;

GRANT SELECT ON TABLE haven_store.caravans.fct_signup to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_event to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_pitch_history to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_van_history to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_status to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_type_scd1 to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_owner_account_history to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_finance_company to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_holiday_home_advisor_scd1 to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_source_scd1 to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.caravan_sale_completion to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.common.dim_park to role _haven_finance__haven_store__common__reader;
GRANT SELECT ON TABLE haven_store.common.dim_calendar to role _haven_finance__haven_store__common__reader;

 grant role _haven_finance__haven_store__caravans__reader to role haven_finance;
 grant role _haven_finance__haven_store__common__reader  to role haven_finance;;
 
USE ROLE haven_finance;

USE ROLE useradmin;

create user haven_finance_sigma_service_account
LOGIN_NAME = 'haven.finance.sigma.service.account'
default_warehouse = haven_finance_warehouse_xsmall
default_role = haven_finance
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtsXHSZf9P7Xop3lLf8rH
75zttqeTgRTStjY+mI+wPCywIcLAkvcHNPsfkZDa/Eg8qdTz6jILN66z07AsgNtU
MqclJuJ1jE9LfMOksAVJrarU9tdFzwcFkLZ14S9v1iNqJT0/MhdhGR6tnyfDmpzP
J5QBUyV4ZVYOU20M3xd/H+I3quQ4r0NqMwPeglTvMtcURZvsPh8vCpbNf1DaO0Lu
tx02QkWdKCrTww0uUVdkYPTLAeRbKSrwvjxexxhbPrc+2kgDUdTKa/Ek9E8D89yf
WJuxB1z+x79osiwMdm0eJ1oR40V3cN4KmOF5sWnsLXIrGP3yfr3MdyY1Y4YLjI0b
vwIDAQAB';


ALTER USER haven_finance_sigma_service_account
SET login_name = 'haven.finance.sigma.service.account';

USE ROLE securityadmin;

GRANT ROLE haven_finance TO USER haven_finance_sigma_service_account;


-- 07/11/2024

USE ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.caravans.fct_signup to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_event to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_pitch_history to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_van_history to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_status to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_type_scd1 to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_owner_account_history to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_finance_company to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_holiday_home_advisor_scd1 to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_source_scd1 to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.caravan_sale_completion to role _haven_finance__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.owner_detail to role _haven_finance__haven_store__caravans__reader;

GRANT ROLE _haven_base__dig_ownerS_arrivals__reader TO ROLE haven_FINANCE;

GRANT ROLE haven_FINANCE TO USER DONOVANRANSOME;

-- 11/11/2024

use ROLE useradmin;

CREATE ROLE _haven_finance__haven_store__holiday__reader;

use ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_bookings TO ROLE _haven_finance__haven_store__holiday__reader; 
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_status TO ROLE _haven_finance__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_source_channel TO ROLE _haven_finance__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_referral_source TO ROLE _haven_finance__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_package_type TO ROLE _haven_finance__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_grade TO ROLE _haven_finance__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_payment_plan TO ROLE _haven_finance__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_addons TO ROLE _haven_finance__haven_store__holiday__reader;

GRANT ROLE _haven_finance__haven_store__holiday__reader TO ROLE haven_finance;

GRANT ROLE _haven_store__holiday__usage TO ROLE _haven_finance__haven_store__holiday__reader;

-- 15/11/2024

USE ROLE useradmin;

CREATE ROLE _haven_finance__haven_store__availability__reader;
CREATE ROLE _haven_finance__haven_store_uat__availability__reader;

USE ROLE securityadmin;

GRANT ROLE _haven_store__availability__usage TO ROLE _haven_finance__haven_store__availability__reader;	
GRANT SELECT ON haven_store.availability.fct_pitch_availability TO ROLE _haven_finance__haven_store__availability__reader;
GRANT SELECT ON haven_store.availability.dim_product_type TO ROLE _haven_finance__haven_store__availability__reader;
GRANT SELECT ON haven_store.availability.dim_contract_type TO ROLE _haven_finance__haven_store__availability__reader;

REVOKE ROLE _haven_store_uat__availability__usage FROM ROLE _haven_finance__haven_store__availability__reader;	
GRANT ROLE _haven_store_uat__availability__usage TO ROLE _haven_finance__haven_store_uat__availability__reader;
REVOKE ROLE _haven_store_uat__availability__usage  FROM ROLE _haven_finance__haven_store_uat__availability__reader;

revoke USAGE ON DATABASE haven_store_uat from ROLE _haven_finance__haven_store_uat__availability__reader;
revoke USAGE ON SCHEMA haven_store_uat.AVAILABILITY FROM ROLE _haven_finance__haven_store_uat__availability__reader;
GRANT SELECT ON haven_store_uat.availability.fct_cabin_allocations TO ROLE _haven_finance__haven_store_uat__availability__reader;

GRANT ROLE _haven_store__finance_uat__reader TO ROLE haven_finance;

GRANT ROLE _haven_finance__haven_store_uat__availability__reader TO ROLE haven_finance;

USE ROLE dba;

USE SCHEMA haven_store.finance_uat;

CREATE VIEW haven_store.finance_uat.FCT_CABIN_ALLOCATIONS 
( SNAPSHOT_DATE, CALENDAR_DATE_XID, PARK_XID, PITCH_NUMBER, CABIN_STATUS, CABIN_GRADE_XID, CONTRACT_TYPE )
AS SELECT SNAPSHOT_DATE, CALENDAR_DATE_XID, PARK_XID, PITCH_NUMBER, CABIN_STATUS, CABIN_GRADE_XID, CONTRACT_TYPE
FROM HAVEN_STORE_UAT.AVAILABILITY.FCT_CABIN_ALLOCATIONS;

-- 19/11/2024

USE ROLE DBA;

CREATE VIEW haven_store.finance_uat.DIM_BRAND
( BRAND_XID, BRAND_REF, BRAND_TITLE, ERPX_COMPANY_ID ) 
AS SELECT BRAND_XID, BRAND_REF, BRAND_TITLE, ERPX_COMPANY_ID
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_BRAND;

CREATE VIEW haven_store.finance_uat.DIM_CASHFLOW
( CASHFLOW_XID, CASHFLOW_REF, CASHFLOW, CASHFLOW_TITLE )
AS SELECT CASHFLOW_XID, CASHFLOW_REF, CASHFLOW, CASHFLOW_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_CASHFLOW;

CREATE VIEW haven_store.finance_uat.DIM_CPARKPL
( CPARKPL_XID, CPARKPL_REF, CPARKPL, CPARKPL_TITLE )
AS SELECT CPARKPL_XID, CPARKPL_REF, CPARKPL, CPARKPL_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_CPARKPL;

CREATE VIEW haven_store.finance_uat.DIM_DEPARTMENT
( DEPARTMENT_XID, BRAND_XID, DEPARTMENT_REF, DEPARTMENT, DEPARTMENT_TITLE ) 
AS SELECT DEPARTMENT_XID, BRAND_XID, DEPARTMENT_REF, DEPARTMENT, DEPARTMENT_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_DEPARTMENT;

CREATE VIEW haven_store.finance_uat.DIM_FINANCE_SYSTEM
( FINANCE_SYSTEM_XID, FINANCE_SYSTEM )
AS SELECT FINANCE_SYSTEM_XID, FINANCE_SYSTEM
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_FINANCE_SYSTEM;

CREATE VIEW haven_store.finance_uat.DIM_LEDGER
( LEDGER_XID, BRAND_XID, LEDGER_REF, BRAND_REF, LEDGER, LEDGER_TITLE ) 
AS SELECT LEDGER_XID, BRAND_XID, LEDGER_REF, BRAND_REF, LEDGER, LEDGER_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_LEDGER;

CREATE VIEW haven_store.finance_uat.DIM_LEDGER_ACCOUNT
( LEDGER_ACCOUNT_XID, LEDGER_XID, LEDGER_ACCOUNT_REF, LEDGER_REF, LEDGER_ACCOUNT, LEDGER_ACCOUNT_TITLE )
AS SELECT LEDGER_ACCOUNT_XID, LEDGER_XID, LEDGER_ACCOUNT_REF, LEDGER_REF, LEDGER_ACCOUNT, LEDGER_ACCOUNT_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_LEDGER_ACCOUNT;

CREATE VIEW haven_store.finance_uat.DIM_NOMINAL
( NOMINAL_XID, BRAND_XID, SITE_XID, DEPARTMENT_XID, SUB_DEPARTMENT_XID, LEDGER_XID, LEDGER3_XID, STATSSUM_XID, CASHFLOW_XID, WAGES_ANALYSIS_XID, WAGES_SUMMARY_XID, TRADITIONAL_P_AND_L_XID, CPARKPL_XID, NOMINAL_REF, BRAND_REF, SITE_REF, DEPARTMENT_REF, SUB_DEPARTMENT_REF, LEDGER_REF, LEDGER3_REF, STATSSUM_REF, CASHFLOW_REF, WAGES_ANALYSIS_REF, WAGES_SUMMARY_REF, TRADITIONAL_P_AND_L_REF, CPARKPL_REF, NOMINAL, NOMINAL_CODE, NOMINAL_TITLE, "DISABLE", IS_ACTIVE, IS_IN_ERPX, IS_IN_DREAM )
AS SELECT NOMINAL_XID, BRAND_XID, SITE_XID, DEPARTMENT_XID, SUB_DEPARTMENT_XID, LEDGER_XID, LEDGER3_XID, STATSSUM_XID, CASHFLOW_XID, WAGES_ANALYSIS_XID, WAGES_SUMMARY_XID, TRADITIONAL_P_AND_L_XID, CPARKPL_XID, NOMINAL_REF, BRAND_REF, SITE_REF, DEPARTMENT_REF, SUB_DEPARTMENT_REF, LEDGER_REF, LEDGER3_REF, STATSSUM_REF, CASHFLOW_REF, WAGES_ANALYSIS_REF, WAGES_SUMMARY_REF, TRADITIONAL_P_AND_L_REF, CPARKPL_REF, NOMINAL, NOMINAL_CODE, NOMINAL_TITLE, "DISABLE", IS_ACTIVE, IS_IN_ERPX, IS_IN_DREAM
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_NOMINAL;

CREATE VIEW haven_store.finance_uat.DIM_PERIOD
( PERIOD_XID, DATE_XID, STATYEAR, STATMONTH, STATPERIOD, STATPERIODLY, WEEK_END_DATE, ERPX_PERIOD_REF, PERIOD_REF )
AS SELECT PERIOD_XID, DATE_XID, STATYEAR, STATMONTH, STATPERIOD, STATPERIODLY, WEEK_END_DATE, ERPX_PERIOD_REF, PERIOD_REF
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_PERIOD;

CREATE VIEW haven_store.finance_uat.DIM_SITE
( SITE_XID, PARK_XID, BRAND_XID, BRAND_REF, SITE_CODE, SITE_TROOPER_CODE, SITE_NAME, SITE_REGION_REF, SITE_OPS_DIRECTOR, SITE_GENERAL_MANAGER, SITE_SALES_MANAGER, SITE_COMPLEX_MANAGER, SITE_SHOP_MANAGER, SITE_SPORTS_MANAGER, SITE_ENTS_MANAGER, SITE_HOLIDAY_SALES_MANAGER, SITE_CATERING_MANAGER, SITE_STATUS_REF, SITE_ACCOMODATION_MANAGER, STATUTORY_CO_1, STATUTORY_CO_2, STATUTORY_CO_3, STATUTORY_CO_4, STATUTORY_CO_5, STATUTORY_CO_6, COMPANY_CODE, SITE_REF )
AS SELECT SITE_XID, PARK_XID, BRAND_XID, BRAND_REF, SITE_CODE, SITE_TROOPER_CODE, SITE_NAME, SITE_REGION_REF, SITE_OPS_DIRECTOR, SITE_GENERAL_MANAGER, SITE_SALES_MANAGER, SITE_COMPLEX_MANAGER, SITE_SHOP_MANAGER, SITE_SPORTS_MANAGER, SITE_ENTS_MANAGER, SITE_HOLIDAY_SALES_MANAGER, SITE_CATERING_MANAGER, SITE_STATUS_REF, SITE_ACCOMODATION_MANAGER, STATUTORY_CO_1, STATUTORY_CO_2, STATUTORY_CO_3, STATUTORY_CO_4, STATUTORY_CO_5, STATUTORY_CO_6, COMPANY_CODE, SITE_REF
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_SITE;

CREATE VIEW haven_store.finance_uat.DIM_STATSSUM
( STATSSUM_XID, STATSSUM_REF, STATSSUM_PAGE, STATSSUM_SUBSECTION, STATSSUM_TITLE, STATSSUM, STATSSUM_ORDERBY )
AS SELECT STATSSUM_XID, STATSSUM_REF, STATSSUM_PAGE, STATSSUM_SUBSECTION, STATSSUM_TITLE, STATSSUM, STATSSUM_ORDERBY
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_STATSSUM;

CREATE VIEW haven_store.finance_uat.DIM_SUB_DEPARTMENT
( SUB_DEPARTMENT_XID, BRAND_XID, SUB_DEPARTMENT_REF, SUB_DEPARTMENT, SUB_DEPARTMENT_TITLE ) 
AS SELECT SUB_DEPARTMENT_XID, BRAND_XID, SUB_DEPARTMENT_REF, SUB_DEPARTMENT, SUB_DEPARTMENT_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_SUB_DEPARTMENT;

CREATE VIEW haven_store.finance_uat.DIM_TRADITIONAL_P_AND_L
( TRADITIONAL_P_AND_L_XID, TRADITIONAL_P_AND_L_REF, TRADITIONAL_P_AND_L, TRADITIONAL_P_AND_L_TITLE )
AS SELECT TRADITIONAL_P_AND_L_XID, TRADITIONAL_P_AND_L_REF, TRADITIONAL_P_AND_L, TRADITIONAL_P_AND_L_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_TRADITIONAL_P_AND_L;

CREATE VIEW haven_store.finance_uat.DIM_VERSION 
( VERSION_XID, VERSION_REF, VERSION_TITLE )
AS SELECT VERSION_XID, VERSION_REF, VERSION_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_VERSION;

CREATE VIEW haven_store.finance_uat.DIM_WAGES_ANALYSIS
( WAGES_ANALYSIS_XID, WAGES_ANALYSIS_REF, WAGES_ANALYSIS, WAGES_ANALYSIS_TITLE )
AS SELECT WAGES_ANALYSIS_XID, WAGES_ANALYSIS_REF, WAGES_ANALYSIS, WAGES_ANALYSIS_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_WAGES_ANALYSIS;

CREATE VIEW haven_store.finance_uat.DIM_WAGES_SUMMARY
( WAGES_SUMMARY_XID, WAGES_SUMMARY_REF, WAGES_SUMMARY, WAGES_SUMMARY_TITLE )
AS SELECT WAGES_SUMMARY_XID, WAGES_SUMMARY_REF, WAGES_SUMMARY, WAGES_SUMMARY_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_WAGES_SUMMARY;

CREATE VIEW haven_store.finance_uat.FCT_TRIAL_BALANCE
( NOMINAL_REF, BRAND_REF, PERIOD_REF, SITE_REF, DEPARTMENT_REF, SUB_DEPARTMENT_REF, LEDGER_REF, LEDGER_ACCOUNT_REF, LEDGER3_REF, LEDGER3_ACCOUNT_REF, STATSSUM_REF, CASHFLOW_REF, WAGES_ANALYSIS_REF, WAGES_SUMMARY_REF, TRADITIONAL_P_AND_L_REF, VERSION_REF, CPARKPL_REF, NOMINAL_XID, BRAND_XID, PERIOD_XID, SITE_XID, DEPARTMENT_XID, SUB_DEPARTMENT_XID, LEDGER_XID, LEDGER_ACCOUNT_XID, L3_LEDGER_XID, STATSSUM_XID, CASHFLOW_XID, WAGES_ANALYSIS_XID, WAGES_SUMMARY_XID, TRADITIONAL_P_AND_L_XID, VERSION_XID, CPARKPL_XID, WEEK_VALUE, WEEK_USERVALUE, WEEK_USERVALUEFIELD1, WEEK_USERVALUEFIELD2, WEEK_USERVALUEFIELD3, WEEK_USERVALUEFIELD4, YTD_VALUE, YTD_USERVALUE, YTD_USERVALUEFIELD1, YTD_USERVALUEFIELD2, YTD_USERVALUEFIELD3, YTD_USERVALUEFIELD4 )
AS SELECT NOMINAL_REF, BRAND_REF, PERIOD_REF, SITE_REF, DEPARTMENT_REF, SUB_DEPARTMENT_REF, LEDGER_REF, LEDGER_ACCOUNT_REF, LEDGER3_REF, LEDGER3_ACCOUNT_REF, STATSSUM_REF, CASHFLOW_REF, WAGES_ANALYSIS_REF, WAGES_SUMMARY_REF, TRADITIONAL_P_AND_L_REF, VERSION_REF, CPARKPL_REF, NOMINAL_XID, BRAND_XID, PERIOD_XID, SITE_XID, DEPARTMENT_XID, SUB_DEPARTMENT_XID, LEDGER_XID, LEDGER_ACCOUNT_XID, L3_LEDGER_XID, STATSSUM_XID, CASHFLOW_XID, WAGES_ANALYSIS_XID, WAGES_SUMMARY_XID, TRADITIONAL_P_AND_L_XID, VERSION_XID, CPARKPL_XID, WEEK_VALUE, WEEK_USERVALUE, WEEK_USERVALUEFIELD1, WEEK_USERVALUEFIELD2, WEEK_USERVALUEFIELD3, WEEK_USERVALUEFIELD4, YTD_VALUE, YTD_USERVALUE, YTD_USERVALUEFIELD1, YTD_USERVALUEFIELD2, YTD_USERVALUEFIELD3, YTD_USERVALUEFIELD4
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.FCT_TRIAL_BALANCE;

CREATE VIEW haven_store.finance_uat.FACT_TB
( NOMINAL_REF, BRAND_REF, PERIOD_REF, SITE_REF, DEPARTMENT_REF, SUB_DEPARTMENT_REF, LEDGER_REF, LEDGER_ACCOUNT_REF, LEDGER3_REF, LEDGER3_ACCOUNT_REF, STATSSUM_REF, CASHFLOW_REF, WAGES_ANALYSIS_REF, WAGES_SUMMARY_REF, TRADITIONAL_P_AND_L_REF, VERSION_REF, CPARKPL_REF, NOMINAL_XID, BRAND_XID, PERIOD_XID, SITE_XID, DEPARTMENT_XID, SUB_DEPARTMENT_XID, LEDGER_XID, LEDGER_ACCOUNT_XID, L3_LEDGER_XID, STATSSUM_XID, CASHFLOW_XID, WAGES_ANALYSIS_XID, WAGES_SUMMARY_XID, TRADITIONAL_P_AND_L_XID, VERSION_XID, CPARKPL_XID, FINANCE_SYSTEM_XID, WEEK_VALUE, WEEK_USERVALUE, WEEK_USERVALUEFIELD1, WEEK_USERVALUEFIELD2, WEEK_USERVALUEFIELD3, WEEK_USERVALUEFIELD4, YTD_VALUE, YTD_USERVALUE, YTD_USERVALUEFIELD1, YTD_USERVALUEFIELD2, YTD_USERVALUEFIELD3, YTD_USERVALUEFIELD4 )
AS SELECT NOMINAL_REF, BRAND_REF, PERIOD_REF, SITE_REF, DEPARTMENT_REF, SUB_DEPARTMENT_REF, LEDGER_REF, LEDGER_ACCOUNT_REF, LEDGER3_REF, LEDGER3_ACCOUNT_REF, STATSSUM_REF, CASHFLOW_REF, WAGES_ANALYSIS_REF, WAGES_SUMMARY_REF, TRADITIONAL_P_AND_L_REF, VERSION_REF, CPARKPL_REF, NOMINAL_XID, BRAND_XID, PERIOD_XID, SITE_XID, DEPARTMENT_XID, SUB_DEPARTMENT_XID, LEDGER_XID, LEDGER_ACCOUNT_XID, L3_LEDGER_XID, STATSSUM_XID, CASHFLOW_XID, WAGES_ANALYSIS_XID, WAGES_SUMMARY_XID, TRADITIONAL_P_AND_L_XID, VERSION_XID, CPARKPL_XID, FINANCE_SYSTEM_XID, WEEK_VALUE, WEEK_USERVALUE, WEEK_USERVALUEFIELD1, WEEK_USERVALUEFIELD2, WEEK_USERVALUEFIELD3, WEEK_USERVALUEFIELD4, YTD_VALUE, YTD_USERVALUE, YTD_USERVALUEFIELD1, YTD_USERVALUEFIELD2, YTD_USERVALUEFIELD3, YTD_USERVALUEFIELD4
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.FACT_TB;

USE ROLE securityadmin;

REVOKE ROLE _haven_base__dig_ownerS_arrivals__reader from ROLE haven_FINANCE;

-- 20/12/2024

USE ROLE securityadmin;

REVOKE SELECT ON TABLE haven_store_uat.availability.fct_cabin_allocations FRoM ROLE _haven_finance__haven_store_uat__availability__reader;
GRANT ROLE _haven_store__finance_cube_erpx__reader TO ROLE haven_FINANCE;

GRANT SELECT ON TABLE haven_store.common.finance_cube_erpx_statssum_mapping TO ROLE _haven_finance__haven_store__common__reader;
GRANT SELECT ON TABLE haven_store.common.finance_cube_erpx_nominal_mapping_v2 TO ROLE _haven_finance__haven_store__common__reader;

USE ROLE dba;

DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_BRAND;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_CASHFLOW;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_CPARKPL;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_DEPARTMENT;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_FINANCE_SYSTEM;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_LEDGER;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_LEDGER_ACCOUNT;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_NOMINAL;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_PERIOD;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_SITE;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_STATSSUM;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_SUB_DEPARTMENT;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_TRADITIONAL_P_AND_L;;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_VERSION;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_WAGES_ANALYSIS;
DROP VIEW HAVEN_STORE.FINANCE_UAT.DIM_WAGES_SUMMARY;
DROP VIEW HAVEN_STORE.FINANCE_UAT.FCT_TRIAL_BALANCE;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_BRAND
AS SELECT BRAND_XID, BRAND_REF, BRAND_TITLE, ERPX_COMPANY_ID
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_BRAND;

--SELECT * FROM HAVEN_STORE.FINANCE_UAT.DIM_BRAND;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_CASHFLOW
AS SELECT CASHFLOW_XID, CASHFLOW_REF, CASHFLOW, CASHFLOW_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_CASHFLOW;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_CPARKPL
AS SELECT CPARKPL_XID, CPARKPL_REF, CPARKPL, CPARKPL_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_CPARKPL;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_DEPARTMENT
AS SELECT DEPARTMENT_XID, BRAND_XID, DEPARTMENT_REF, DEPARTMENT, DEPARTMENT_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_DEPARTMENT;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_FINANCE_SYSTEM
AS SELECT FINANCE_SYSTEM_XID, FINANCE_SYSTEM
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_FINANCE_SYSTEM;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_LEDGER
AS SELECT LEDGER_XID, BRAND_XID, LEDGER_REF, BRAND_REF, LEDGER, LEDGER_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_LEDGER;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_LEDGER_ACCOUNT
AS SELECT LEDGER_ACCOUNT_XID, LEDGER_XID, LEDGER_ACCOUNT_REF, LEDGER_REF, LEDGER_ACCOUNT, LEDGER_ACCOUNT_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_LEDGER_ACCOUNT;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_NOMINAL
AS SELECT NOMINAL_XID, BRAND_XID, SITE_XID, DEPARTMENT_XID, SUB_DEPARTMENT_XID, LEDGER_XID, LEDGER3_XID, STATSSUM_XID, CASHFLOW_XID, WAGES_ANALYSIS_XID, WAGES_SUMMARY_XID, TRADITIONAL_P_AND_L_XID, CPARKPL_XID, NOMINAL_REF, BRAND_REF, SITE_REF, DEPARTMENT_REF, SUB_DEPARTMENT_REF, LEDGER_REF, LEDGER3_REF, STATSSUM_REF, CASHFLOW_REF, WAGES_ANALYSIS_REF, WAGES_SUMMARY_REF, TRADITIONAL_P_AND_L_REF, CPARKPL_REF, NOMINAL, NOMINAL_CODE, NOMINAL_TITLE, "DISABLE", IS_ACTIVE, IS_IN_ERPX, IS_IN_DREAM
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_NOMINAL;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_PERIOD
AS SELECT PERIOD_XID, DATE_XID, STATYEAR, STATMONTH, STATPERIOD, STATPERIODLY, WEEK_END_DATE, ERPX_PERIOD_REF, PERIOD_REF
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_PERIOD;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_SITE
AS SELECT SITE_XID, PARK_XID, BRAND_XID, BRAND_REF, SITE_CODE, SITE_TROOPER_CODE, SITE_NAME, SITE_REGION_REF, SITE_OPS_DIRECTOR, SITE_GENERAL_MANAGER, SITE_SALES_MANAGER, SITE_COMPLEX_MANAGER, SITE_SHOP_MANAGER, SITE_SPORTS_MANAGER, SITE_ENTS_MANAGER, SITE_HOLIDAY_SALES_MANAGER, SITE_CATERING_MANAGER, SITE_STATUS_REF, SITE_ACCOMODATION_MANAGER, STATUTORY_CO_1, STATUTORY_CO_2, STATUTORY_CO_3, STATUTORY_CO_4, STATUTORY_CO_5, STATUTORY_CO_6, COMPANY_CODE, SITE_REF
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_SITE;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_STATSSUM
AS SELECT STATSSUM_XID, STATSSUM_REF, STATSSUM_PAGE, STATSSUM_SUBSECTION, STATSSUM_TITLE, STATSSUM, STATSSUM_ORDERBY
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_STATSSUM;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_SUB_DEPARTMENT
AS SELECT SUB_DEPARTMENT_XID, BRAND_XID, SUB_DEPARTMENT_REF, SUB_DEPARTMENT, SUB_DEPARTMENT_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_SUB_DEPARTMENT;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_TRADITIONAL_P_AND_L
AS SELECT TRADITIONAL_P_AND_L_XID, TRADITIONAL_P_AND_L_REF, TRADITIONAL_P_AND_L, TRADITIONAL_P_AND_L_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_TRADITIONAL_P_AND_L;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_VERSION
AS SELECT VERSION_XID, VERSION_REF, VERSION_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_VERSION;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_WAGES_ANALYSIS
AS SELECT WAGES_ANALYSIS_XID, WAGES_ANALYSIS_REF, WAGES_ANALYSIS, WAGES_ANALYSIS_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_WAGES_ANALYSIS;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.DIM_WAGES_SUMMARY
AS SELECT WAGES_SUMMARY_XID, WAGES_SUMMARY_REF, WAGES_SUMMARY, WAGES_SUMMARY_TITLE
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.DIM_WAGES_SUMMARY;

CREATE VIEW HAVEN_STORE.FINANCE_UAT.FCT_TRIAL_BALANCE
AS SELECT NOMINAL_REF, BRAND_REF, PERIOD_REF, SITE_REF, DEPARTMENT_REF, SUB_DEPARTMENT_REF, LEDGER_REF, LEDGER_ACCOUNT_REF, LEDGER3_REF, LEDGER3_ACCOUNT_REF, STATSSUM_REF, CASHFLOW_REF, WAGES_ANALYSIS_REF, WAGES_SUMMARY_REF, TRADITIONAL_P_AND_L_REF, VERSION_REF, CPARKPL_REF, NOMINAL_XID, BRAND_XID, PERIOD_XID, SITE_XID, DEPARTMENT_XID, SUB_DEPARTMENT_XID, LEDGER_XID, LEDGER_ACCOUNT_XID, L3_LEDGER_XID, STATSSUM_XID, CASHFLOW_XID, WAGES_ANALYSIS_XID, WAGES_SUMMARY_XID, TRADITIONAL_P_AND_L_XID, VERSION_XID, CPARKPL_XID, WEEK_VALUE, WEEK_USERVALUE, WEEK_USERVALUEFIELD1, WEEK_USERVALUEFIELD2, WEEK_USERVALUEFIELD3, WEEK_USERVALUEFIELD4, YTD_VALUE, YTD_USERVALUE, YTD_USERVALUEFIELD1, YTD_USERVALUEFIELD2, YTD_USERVALUEFIELD3, YTD_USERVALUEFIELD4
FROM HAVEN_STORE_UAT.FINANCE_CUBE_ERPX.FCT_TRIAL_BALANCE;

-- 22/01/2025

USE ROLE dba;

SHOW GRANTS TO ROLE haven_FINANCE;

USE ROLE haven_FINANCE;

SHOW WAREHOUSES;

-- HAVEN_FINANCE_WAREHOUSE_XSMALL

USE ROLE sysadmin;

ALTER WAREHOUSE HAVEN_FINANCE_WAREHOUSE_XSMALL
SET warehouse_size = SMALL,
max_cluster_count = 4
min_cluster_count = 1
scaling_policy = standard;

-- 11/02/2025

USE ROLE dba;
SHOW GRANTS TO ROLE _haven_finance__haven_store__common__reader;

SHOW GRANTS OF ROLE _haven_store__common__usage;

GRANT ROLE _haven_store__common__usage TO ROLE _haven_finance__haven_store__common__reader;

SHOW GRANTS TO ROLE _haven_finance__haven_store__caravans__reader;

SHOW GRANTS TO ROLE _haven_finance__haven_store__holiday__reader;

-- 10/10/2025

use ROLE dba;

SHOW grants TO ROLE haven_finance; 

use ROLE useradmin;

CREATE ROLE _haven_commercial__haven_store__activities__READER;

use ROLE securityadmin;

REVOKE ROLE  _HAVEN_STORE__FINANCE_UAT__READER FROM ROLE haven_finance;

GRANT ROLE _haven_store__finance_cube_erpx__reader TO ROLE haven_finance;
GRANT ROLE _haven_store__budget_data__reader TO ROLE haven_finance;
GRANT ROLE _haven_store__lettings__reader TO ROLE  haven_finance;
GRANT ROLE _haven_store__retail__reader TO ROLE haven_finance;
GRANT ROLE _haven_store__procurement__reader TO ROLE haven_finance;

use ROLE useradmin;

CREATE ROLE _haven_finance__haven_store__activities__READER;
CREATE ROLE _haven_finance__haven_store__caravans__READER;

use ROLE securityadmin;

GRANT ROLE _haven_store__activities__usage TO ROLE _haven_finance__haven_store__activities__READER;

grant select on table haven_store.activities.dim_activity to role _haven_finance__haven_store__activities__READER;
grant select on table haven_store.activities.dim_activity_location to role _haven_finance__haven_store__activities__READER;
grant select on table haven_store.activities.dim_activity_timeslot to role _haven_finance__haven_store__activities__READER;
grant select on table haven_store.activities.fct_activity_bookings to role _haven_finance__haven_store__activities__READER;
grant select on table haven_store.activities.fct_session_capacities to role _haven_finance__haven_store__activities__READER;
grant select on table haven_store.activities.budget_activities_current to role _haven_finance__haven_store__activities__READER;


-- GRANT ROLE _haven_store__caravans__usage TO ROLE  _haven_finance__haven_store__caravans__READER;;
grant select on table haven_store.caravans.owner_detail to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.dim_account_owner_type to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.dim_charge_type to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.dim_letting_contract_type to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.dim_pitch_grade_scd1 to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.dim_pitch_scd1 to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.dim_pitch_status to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.dim_van_attributes_type to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.dim_van_order_details to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.dim_van_pdi to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.dim_van_pdi_fault to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.dim_van_repair_history to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.fct_account_history to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.fct_pitch_charges to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.fct_pitch_status to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.fct_pitch_utilities to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.fct_sale_invoice to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.fct_van_attributes to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.fct_van_history to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.site_fee_ledger to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.letting_income_detail to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.letting_detail to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.caravan_sales_budget_daily_current to role _haven_finance__haven_store__caravans__READER;
grant select on table haven_store.caravans.caravan_sales_budget_weekly_current to role _haven_finance__haven_store__caravans__READER;

GRANT ROLE _haven_finance__haven_store__activities__READER TO ROLE haven_finance; 

-- 13/11/2025

use ROLE securityadmin;

GRANT ROLE _haven_store_qat__finance_cube_erpx__reader TO ROLE haven_finance;

-- 21/11/2025

use ROLE securityadmin;

GRANT ROLE _haven_store__workforce__reader TO ROLE haven_finance;


-- 24/11/2025

use ROLE securityadmin;

GRANT ROLE _bourne_store_qat__finance_shared_services__reader TO ROLE haven_finance;

-- 03/12/2025

use ROLE securityadmin;

GRANT ROLE _haven_store__workforce__reader TO ROLE haven_finance;

-- 08/10/20245

use ROLE securityadmin;

SHOW roles LIKE '__team_name%';

GRANT ROLE __TEAM_NAME_MASKING_POLICY_ROLE TO ROLE haven_finance;

-- 06/02/2026

use ROLE securityadmin;

REVOKE SELECT ON TABLE haven_store.caravans.caravan_sale_completion FROM ROLE _haven_finance__haven_store__caravans__READER; 
REVOKE SELECT ON TABLE haven_store.caravans.actual_signups FROM ROLE _haven_finance__haven_store__caravans__READER;
REVOKE SELECT ON TABLE haven_store.caravans.leavers FROM ROLE _haven_finance__haven_store__caravans__READER;
REVOKE SELECT ON TABLE haven_store.caravans.owner_detail FROM ROLE _haven_finance__haven_store__caravans__READER;
GRANT SELECT ON TABLE haven_store.caravans.completed_leaver to ROLE _haven_finance__haven_store__caravans__READER;
GRANT SELECT ON TABLE haven_store.caravans.owner_leaver to ROLE _haven_finance__haven_store__caravans__READER;