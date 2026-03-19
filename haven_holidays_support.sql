USE ROLE sysadmin;

DROP WAREHOUSE haven_holidays_support_warehouse_mall ;

CREATE WAREHOUSE haven_holidays_support_warehouse_small WITH WAREHOUSE_SIZE = 'SMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 2 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_holidays_support_warehouse_small__operator;
create role _haven_holidays_support_warehouse_small__usage;

CREATE ROLE haven_holidays_support;

create user haven_holidays_support_sigma_service_account
LOGIN_NAME = 'haven.holidays.support.sigma.service.account'
default_warehouse = haven_holidays_support_warehouse_small
default_role = haven_holidays_support
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw7nM8oHan+0QUjfMvREa
ihMM4ltZQUp6TFgZ8Q2TC1+yDZ60gumResbYho8QPpDTxbm2UVFbg6Y5MTQiZqId
ELjlS04So7PsBicAcraYkviCbk2ecMohwpBeNqZ3EAcJCSCfjLHPEl5hbdF5/f6M
uVmfIXiDUQG9HTrgDD6eyXHNILJotqfJx3kCYLyUJ/zt51ySjlQLMlhYI4MX8jD6
3ucVWTGZt7tp/jXQY9Hp4+75XuAOujrodseXCUcAGI27vCvUQUKYiqk8z4AZZfCa
OXyb198EHGqUBvuJM2spG+uQPX5SjDF9fgwT4aIYaGUaBPC9mfQOkEScPYP+xtb1
DQIDAQAB';

CREATE ROLE _haven_holidays_support__haven_store__sales_support__reader;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_holidays_support_warehouse_small to role _haven_holidays_support_warehouse_small__usage;
grant role _haven_holidays_support_warehouse_small__usage to role _haven_holidays_support_warehouse_small__operator;
grant operate, modify on warehouse haven_holidays_support_warehouse_small to role _haven_holidays_support_warehouse_small__operator;


GRANT ROLE _haven_holidays_support_warehouse_small__usage TO ROLE haven_holidays_support;


use ROLE dba;

CREATE VIEW HAVEN_STORE.SALES_SUPPORT.HOLIDAY_AGENCY_TRANSACTION
( BOOKING_ID, GROUP_ID, AGENCY_ID, AGENCY_NAME, LEAD_GUEST_NAME, ARRIVAL_DATE, BOOKING_STATUS_CODE, BOOKING_STATUS_DESCRIPTION, PARK_CODE, PARK_NAME, GRADE_CODE, GRADE_DESCRIPTION, TOTAL_CHARGE_VALUE, GROSS_BILLING_VALUE, TOTAL_COMMISSION_VALUE, NETT_BILLING_VALUE, TOTAL_PAID_VALUE, AMOUNT_OUTSTANDING )
AS SELECT BOOKING_ID, GROUP_ID, AGENCY_ID, AGENCY_NAME, LEAD_GUEST_NAME, ARRIVAL_DATE, BOOKING_STATUS_CODE, BOOKING_STATUS_DESCRIPTION, PARK_CODE, PARK_NAME, GRADE_CODE, GRADE_DESCRIPTION, TOTAL_CHARGE_VALUE, GROSS_BILLING_VALUE, TOTAL_COMMISSION_VALUE, NETT_BILLING_VALUE, TOTAL_PAID_VALUE, AMOUNT_OUTSTANDING
FROM HAVEN_STORE_QAT.SALES_SUPPORT_RESTRICTED.HOLIDAY_AGENCY_TRANSACTION;

use ROLE securityadmin;

GRANT ROLE _haven_store__sales_support__usage TO ROLE _haven_holidays_support__haven_store__sales_support__reader;
GRANT SELECT ON VIEW HAVEN_STORE.SALES_SUPPORT.HOLIDAY_AGENCY_TRANSACTION TO ROLE _haven_holidays_support__haven_store__sales_support__reader;
GRANT ROLE _haven_holidays_support__haven_store__sales_support__reader TO ROLE haven_holidays_support;

GRANT ROLE haven_holidays_support TO USER haven_holidays_support_sigma_service_account;

GRANT ROLE haven_holidays_support TO USER donovanransome;
GRANT ROLE haven_holidays_support TO ROLE dba;
use ROLE haven_holidays_support;

show warehouses;

-- 01/10/2025

use ROLE securityadmin;

show GRANTS TO ROLE haven_holidays_support;

REVOKE ROLE _HAVEN_HOLIDAYS_SUPPORT__HAVEN_STORE__SALES_SUPPORT__READER FROM ROLE haven_holidays_support; 

GRANT ROLE _HAVEN_STORE__SALES_SUPPORT__READER TO ROLE haven_holidays_support; 

GRANT ROLE _HAVEN_STORE__SALES_SUPPORT_RESTRICTED__READER TO ROLE haven_holidays_support; 

use ROLE useradmin;

DROP ROLE _HAVEN_HOLIDAYS_SUPPORT__HAVEN_STORE__SALES_SUPPORT__READER;

-- 17/10/2025

use ROLE haven_holidays_support;

use SCHEMA haven_store.sales_support_restricted;

SHOW views;

SHOW tables;

-- 12/11/2025

SHOW GRANTS TO ROLE haven_holidays_support;

use ROLE haven_holidays_support;

use SCHEMA haven_store.sales_support_restricted;

SHOW views;

-- 09/12/2025

use ROLE dba;

use SCHEMA haven_store.holiday;

SHOW views;
SHOW tables;

use ROLE useradmin;

CREATE ROLE _haven_holidays_support__haven_store__holiday__reader;
CREATE ROLE _haven_holidays_support__haven_store__common__reader;

use ROLE securityadmin;

GRANT ROLE _haven_store__holiday__usage TO ROLE _haven_holidays_support__haven_store__holiday__reader;

GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_bookings TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_bookings_prorated TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_budget TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_touring_budget TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_status TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_source_channel TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_referral_source TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_package_type TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_grade TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_payment_plan TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_addons TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.holidaymaker_segmentation TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.holidaymaker_segmentation_history TO ROLE _haven_holidays_support__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.cyhh_pitch_history TO ROLE _haven_holidays_support__haven_store__holiday__reader;

GRANT ROLE _haven_store__common__usage TO ROLE _haven_holidays_support__haven_store__common__reader;

GRANT SELECT ON TABLE haven_store.common.dim_park TO ROLE _haven_holidays_support__haven_store__common__reader;
GRANT SELECT ON TABLE haven_store.common.dim_calendar TO ROLE _haven_holidays_support__haven_store__common__reader;


GRANT ROLE _haven_holidays_support__haven_store__holiday__reader TO ROLE haven_holidays_support;
GRANT ROLE _haven_holidays_support__haven_store__common__reader TO ROLE haven_holidays_support;


