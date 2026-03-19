USE ROLE sysadmin;

CREATE WAREHOUSE haven_holidays_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_holidays_warehouse_xsmall__operator;
create role _haven_holidays_warehouse_xsmall__usage;

CREATE ROLE haven_holidays;

create user haven_holidays_sigma_service_account
LOGIN_NAME = 'haven.holidays.sigma.service.account'
default_warehouse = haven_holidays_warehouse_xsmall
default_role = haven_holidays
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlGIykqzhPgZ+mxFHLSTC
Y2lTHMQpvubJ7kmh7OEThqcf1WNRIRC7YZ3DE1iWXPQicZ8XOVc5QOcHn1G/uATP
M8bknWd8y8R9g82P2Vre/NmrVPx8Ht2w7aXVI7Ah/ixmCX8vuCqC0wum2Jnj0HcW
CVqnO7sSjwuFEsRK4yTCdyHJSVbvBAt5NOvGaDCwHlH+qRHedWl69he5WfAD2si7
ahnIQ2htkQPp/uixOzMC/4cZkxyt4Ae49vgoF7RU+VPHY+qP+ZCXJz6TRgWE7jLr
fxrK/rb1Vu6p8jDJpMi9VrL5DQ4LF/3K6aRVeLArJo19jd5wf2biPAEGzJEnW3M7
XQIDAQAB';

CREATE ROLE _haven_holidays__haven_store__holiday__reader;
CREATE ROLE _haven_holidays__haven_store__common__reader;
CREATE ROLE _haven_base__haven_store__identity__reader;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_holidays_warehouse_xsmall to role _haven_holidays_warehouse_xsmall__usage;
grant role _haven_holidays_warehouse_xsmall__usage to role _haven_holidays_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_holidays_warehouse_xsmall to role _haven_holidays_warehouse_xsmall__operator;


GRANT ROLE _haven_holidays_warehouse_xsmall__usage TO ROLE haven_holidays;

GRANT ROLE _haven_store__holiday__usage TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT ROLE _haven_store__common__usage TO ROLE _haven_holidays__haven_store__common__reader;
GRANT ROLE _haven_base__identity__usage TO ROLE _haven_base__haven_store__identity__reader;

GRANT ROLE _haven_holidays__haven_store__holiday__reader TO ROLE haven_holidays;
GRANT ROLE _haven_holidays__haven_store__common__reader TO ROLE haven_holidays;
GRANT ROLE _haven_base__haven_store__identity__reader TO ROLE haven_holidays;


GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_bookings TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_bookings_prorated TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_budget TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_touring_budget TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_status TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_source_channel TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_booking_referral_source TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_package_type TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_grade TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.dim_payment_plan TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_addons TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.holidaymaker_segmentation TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.holiday.cyhh_pitch_history TO ROLE _haven_holidays__haven_store__holiday__reader;
GRANT SELECT ON TABLE haven_store.common.dim_park TO ROLE _haven_holidays__haven_store__common__reader;
GRANT SELECT ON TABLE haven_store.common.dim_calendar TO ROLE _haven_holidays__haven_store__common__reader;
GRANT SELECT ON TABLE haven_base.identity.hid_to_seaware_client TO ROLE _haven_base__haven_store__identity__reader;

GRANT ROLE haven_holidays TO USER haven_holidays_sigma_service_account;
GRANT ROLE haven_holidays TO ROLE dba;

-- 20/12/2024 - Corrections

USE ROLE securityadmin;

revoke SELECT ON TABLE haven_base.identity.hid_to_seaware_client from ROLE _haven_base__haven_store__identity__reader;
REVOKE ROLE _haven_base__haven_store__identity__reader from ROLE haven_holidays;
REVOKE ROLE _haven_base__identity__usage from ROLE _haven_base__haven_store__identity__reader;

USE ROLE useradmin;

DROP ROLE _haven_base__haven_store__identity__reader;
CREATE ROLE _haven_HOLIDAYS__haven_base__identity__reader;


USE ROLE securityadmin;

GRANT ROLE _haven_holidays__haven_base__identity__reader TO ROLE haven_holidays;
grant ROLE _haven_base__identity__usage TO ROLE _haven_holidays__haven_base__identity__reader;
GRANT SELECT ON TABLE haven_base.identity.hid_to_seaware_client TO ROLE _haven_holidays__haven_base__identity__reader;

GRANT ROLE haven_holidays TO ROLE bourne_governance;

-- 10/01/2025

USE ROLE useradmin;
CREATE ROLE _haven_holidays__haven_store__caravans__reader;

USE ROLE securityadmin;

GRANT ROLE _haven_store__caravans__usage TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_pitch_history TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT ROLE  _haven_holidays__haven_store__caravans__reader TO ROLE haven_holidays; 

USE ROLE haven_holidays;


-- below was applied incorrectly so reverted to default.

USE ROLE useradmin;
CREATE ROLE _haven_holidays__haven_store__caravans__reader;
CREATE ROLE _haven_holidays__haven_store__prospects__reader;

USE ROLE securityadmin;

GRANT ROLE _haven_store__caravans__usage TO ROLE _haven_holidays__haven_store__caravans__reader;


GRANT SELECT ON TABLE haven_store.caravans.fct_signup TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.fct_sale_invoice TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.fct_van_history TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.fct_pitch_charges TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.fct_pitch_status TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.fct_pitch_utilities TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.fct_van_attributes TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_event TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_pitch_history TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_van_history TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_status TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_type_scd1 TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_owner_account_history TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_finance_company TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_holiday_home_advisor_scd1 TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.dim_sale_source_scd1 TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.leavers TO ROLE _haven_holidays__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.owners_point_in_time TO ROLE _haven_holidays__haven_store__caravans__reader;

GRANT ROLE  _haven_holidays__haven_store__caravans__reader TO ROLE haven_holidays; 

GRANT SELECT ON TABLE haven_store.common.dim_park TO ROLE _haven_holidays__haven_store__common__reader;
GRANT SELECT ON TABLE haven_store.common.dim_calendar TO ROLE _haven_holidays__haven_store__common__reader;

GRANT SELECT ON TABLE haven_base.IDENTITY.hid_to_plot_owner TO ROLE _haven_holidays__haven_base__identity__reader;

GRANT ROLE _haven_store__prospects__usage TO ROLE _haven_holidays__haven_store__prospects__reader;

GRANT SELECT ON TABLE haven_store.prospects.fct_caravan_sales_deals  TO ROLE _haven_holidays__haven_store__prospects__reader;
GRANT SELECT ON TABLE haven_store.prospects.dim_caravan_sales_contacts TO ROLE _haven_holidays__haven_store__prospects__reader;

-- Fix incorrect role setup

REVOKE ROLE _haven_holidays__haven_store__caravans__reader FROM ROLE haven_holidays;

GRANT SELECT ON TABLE haven_store.common.dim_park TO ROLE _haven_holidays__haven_store__common__reader;
GRANT SELECT ON TABLE haven_store.common.dim_calendar TO ROLE _haven_holidays__haven_store__common__reader;

REVOKE SELECT ON TABLE haven_store.common.dim_park from ROLE _haven_holidays__haven_store__common__reader;
revoke SELECT ON TABLE haven_store.common.dim_calendar from ROLE _haven_holidays__haven_store__common__reader;

revoke SELECT ON TABLE haven_base.IDENTITY.hid_to_plot_owner from ROLE _haven_holidays__haven_base__identity__reader;

GRANT ROLE _haven_store__prospects__usage TO ROLE _haven_holidays__haven_store__prospects__reader;

GRANT SELECT ON TABLE haven_store.prospects.fct_caravan_sales_deals  TO ROLE _haven_holidays__haven_store__prospects__reader;
GRANT SELECT ON TABLE haven_store.prospects.dim_caravan_sales_contacts TO ROLE _haven_holidays__haven_store__prospects__reader;

USE ROLE useradmin;

DROP ROLE _haven_holidays__haven_store__caravans__reader;
DROP ROLE _haven_holidays__haven_store__prospects__reader;

-- 14/01/2025

USE ROLE useradmin;

CREATE ROLE _haven_HOLIDAYS__haven_STORE__TROOPER2__reader;

USE ROLE SECURITYADMIN;

GRANT ROLE _HAVEN_STORE__TROOPER2__USAGE TO ROLE _haven_HOLIDAYS__haven_STORE__TROOPER2__reader;
GRANT SELECT ON TABLE HAVEN_STORE.TROOPER2.BOOKING_HAVEN_ID TO ROLE _haven_HOLIDAYS__haven_STORE__TROOPER2__reader;

GRANT ROLE _haven_HOLIDAYS__haven_STORE__TROOPER2__reader TO ROLE haven_holidays;

USE ROLE haven_holidays;


-- 22/01/2025

USE ROLE haven_holidays;

SHOW WAREHOUSES;

-- HAVEN_HOLIDAYS_WAREHOUSE_XSMALL

USE ROLE sysadmin;

ALTER WAREHOUSE -- 22/01/2025

USE ROLE haven_holidays;

SHOW WAREHOUSES;

-- HAVEN_HOLIDAYS_WAREHOUSE_XSMALL

USE ROLE sysadmin;

ALTER WAREHOUSE HAVEN_HOLIDAYS_WAREHOUSE_XSMALL
SET warehouse_size = SMALL,
max_cluster_count = 4
min_cluster_count = 1
scaling_policy = standard;

SET warehouse_size = SMALL,
max_cluster_count = 4
min_cluster_count = 1
scaling_policy = standard;

-- 23/01/2025

USE ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.holiday.fct_holiday_bookings_prorated TO ROLE _haven_holidays__haven_store__holiday__reader;

-- 30/01/2025

USE ROLE dba;

USE SCHEMA haven_store.availability;

CREATE VIEW haven_store.HOLIDAYS_UAT.DIM_ALLOCATION_STATUS 
( ALLOCATION_STATUS_XID, ALLOCATION_STATUS, ALLOCATION_STATUS_ENUM )
AS SELECT ALLOCATION_STATUS_XID, ALLOCATION_STATUS, ALLOCATION_STATUS_ENUM
FROM HAVEN_STORE_UAT.AVAILABILITY.DIM_ALLOCATION_STATUS;

CREATE VIEW haven_store.HOLIDAYS_UAT.DIM_CONTRACT_TYPE
( CONTRACT_TYPE_XID, CONTRACT_TYPE_CODE, CONTRACT_TYPE_DESCRIPTION )
AS SELECT CONTRACT_TYPE_XID, CONTRACT_TYPE_CODE, CONTRACT_TYPE_DESCRIPTION
FROM HAVEN_STORE_UAT.AVAILABILITY.DIM_CONTRACT_TYPE;

CREATE VIEW haven_store.HOLIDAYS_UAT.FCT_HOLIDAY_PITCH_AVAILABILITY_DETAIL
( SNAPSHOT_DATE, AVAILABILITY_DATE_XID, PITCH_HISTORY_XID, VAN_HISTORY_XID, PARK_XID, ALLOCATION_STATUS_XID, LETTING_CONTRACT_TYPE_XID, BOOKING_ID, AVAILABILITY_STATE_XID )
AS SELECT SNAPSHOT_DATE, AVAILABILITY_DATE_XID, PITCH_HISTORY_XID, VAN_HISTORY_XID, PARK_XID, ALLOCATION_STATUS_XID, LETTING_CONTRACT_TYPE_XID, BOOKING_ID, AVAILABILITY_STATE_XID
FROM HAVEN_STORE_UAT.AVAILABILITY.FCT_HOLIDAY_PITCH_AVAILABILITY_DETAIL;

CREATE VIEW haven_store.HOLIDAYS_UAT.FCT_HOLIDAY_PITCH_AVAILABILITY_SUMMARY
( SNAPSHOT_DATE, STAY_DATE_XID, PARK_XID, PRODUCT_TYPE_XID, GRADE_XID, LETTING_CONTRACT_TYPE_XID, PITCHES_AVAILABLE_COUNT, PITCHES_UNAVAILABLE_COUNT, PITCHES_OFFLINE_COUNT, PITCHES_OWNER_BOOKED_COUNT, PITCHES_SPARE_COUNT, PITCHES_HELD_COUNT, BOOKINGS_FIRM_COUNT, BOOKINGS_ALLOCATED_COUNT, BOOKINGS_NOT_YET_ALLOCATED_COUNT, BOOKINGS_BOOKED_COUNT )
AS SELECT SNAPSHOT_DATE, STAY_DATE_XID, PARK_XID, PRODUCT_TYPE_XID, GRADE_XID, LETTING_CONTRACT_TYPE_XID, PITCHES_AVAILABLE_COUNT, PITCHES_UNAVAILABLE_COUNT, PITCHES_OFFLINE_COUNT, PITCHES_OWNER_BOOKED_COUNT, PITCHES_SPARE_COUNT, PITCHES_HELD_COUNT, BOOKINGS_FIRM_COUNT, BOOKINGS_ALLOCATED_COUNT, BOOKINGS_NOT_YET_ALLOCATED_COUNT, BOOKINGS_BOOKED_COUNT
FROM HAVEN_STORE_UAT.AVAILABILITY.FCT_HOLIDAY_PITCH_AVAILABILITY_SUMMARY;

-- HAVEN_STORE_UAT.AVAILABILITY.DIM_AVAILABILITY_STATE source

create or replace view HAVEN_STORE.HOLIDAYS_UAT.DIM_AVAILABILITY_STATE (
	AVAILABILITY_STATE_XID,
	AVAILABILITY_STATE_ENUM,
	UP_TO_STANDARD_STATE,
	SEND_TO_RES_STATE,
	SUITABLE_TO_LET_STATE,
	IN_LETTING_PERMITTED_ZONE_STATE,
	HAS_LETTING_PERIODS_STATE,
	OWNER_BOOKED_STATE,
	UNDER_REPAIR_STATE,
	IN_SEASON_STATE,
	AVAILABILITY_STATE
) as SELECT AVAILABILITY_STATE_XID,
	AVAILABILITY_STATE_ENUM,
	UP_TO_STANDARD_STATE,
	SEND_TO_RES_STATE,
	SUITABLE_TO_LET_STATE,
	IN_LETTING_PERMITTED_ZONE_STATE,
	HAS_LETTING_PERIODS_STATE,
	OWNER_BOOKED_STATE,
	UNDER_REPAIR_STATE,
	IN_SEASON_STATE,
	AVAILABILITY_STATE
FROM HAVEN_STORE_UAT.AVAILABILITY.DIM_AVAILABILITY_STATE;	

USE ROLE securityadmin;

GRANT ROLE _haven_store__holidays_uat__reader TO ROLE haven_holidays;

GRANT SELECT ON TABLE haven_store.caravans.LETTING_WAITLIST TO ROLE _haven_holidays__haven_store__caravans__reader;

-- 29/05/2025

use ROLE dba;

use SCHEMA haven_store.availability;

show tables;

use ROLE useradmin;

CREATE ROLE CREATE ROLE _haven_holidays__haven_store__availability__reader;

use ROLE securityadmin;

REVOKE ROLE _haven_store__holidays_uat__reader FROM ROLE haven_holidays;

revoke ROLE _haven_store__availability__reader from ROLE _haven_holidays__haven_store__holiday__reader;
revoke ROLE _haven_store__availability__reader from ROLE _haven_holidays__haven_store__availability__reader;
grant ROLE _haven_store__availability__usage to ROLE _haven_holidays__haven_store__availability__reader;

--revoke select ON TABLE haven_store.availability.fct_holiday_pitch_availability from ROLE  _haven_holidays__haven_store__holiday__reader;
--revoke select ON TABLE haven_store.availability.fct_holiday_pitch_availability_summary from ROLE _haven_holidays__haven_store__holiday__reader;
revoke select ON TABLE haven_store.availability.DIM_ALLOCATION_STATUS  from ROLE _haven_holidays__haven_store__holiday__reader;
revoke select ON TABLE haven_store.availability.DIM_CONTRACT_TYPE from ROLE _haven_holidays__haven_store__holiday__reader;
revoke select ON TABLE haven_store.availability.DIM_AVAILABILITY_STATE from ROLE _haven_holidays__haven_store__holiday__reader;
revoke select ON TABLE haven_store.availability.DIM_LETTING_CAT  from ROLE  _haven_holidays__haven_store__holiday__reader;
revoke select ON TABLE haven_store.availability.DIM_PRODUCT_TYPE from ROLE  _haven_holidays__haven_store__holiday__reader;


--GRANT select ON TABLE haven_store.availability.fct_holiday_pitch_availability TO ROLE  _haven_holidays__haven_store__availability__reader;
--GRANT select ON TABLE haven_store.availability.fct_holiday_pitch_availability_summary TO ROLE _haven_holidays__haven_store__availability__reader;
GRANT select ON TABLE haven_store.availability.DIM_ALLOCATION_STATUS  TO ROLE _haven_holidays__haven_store__availability__reader;
GRANT select ON TABLE haven_store.availability.DIM_CONTRACT_TYPE TO ROLE _haven_holidays__haven_store__availability__reader;
GRANT select ON TABLE haven_store.availability.DIM_AVAILABILITY_STATE TO ROLE _haven_holidays__haven_store__availability__reader;
GRANT select ON TABLE haven_store.availability.DIM_LETTING_CAT  TO ROLE  _haven_holidays__haven_store__availability__reader;
GRANT select ON TABLE haven_store.availability.DIM_PRODUCT_TYPE TO ROLE  _haven_holidays__haven_store__availability__reader;

grant role _haven_holidays__haven_store__availability__reader to role haven_holidays;

-- 01/10/2025

use ROLE useradmin;

CREATE ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

use ROLE securityadmin;

SHOW GRANTS TO ROLE haven_holidays;

REVOKE ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__AVAILABILITY__READER FROM ROLE haven_holidays;
GRANT ROLE _HAVEN_STORE__AVAILABILITY__READER to ROLE haven_holidays;

GRANT ROLE _haven_store__performance_marketing__usage TO ROLE haven_holidays;
revoke ROLE _haven_store__performance_marketing__usage from ROLE haven_holidays;
GRANT ROLE _haven_store__performance_marketing__usage TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_CONSENT TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_CAMPAIGN TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_ACTION TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_EMAILS TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_SMS TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_TEMPLATE TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_BLOOMREACH_CUSTOMER TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_DASHBOARD TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_BLOOMREACH_MOBILE_NOTIFICATIONS TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_SESSION TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_BOOKINGS TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_PRODUCTS TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_PAGE TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_CHANNEL TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_DEVICE TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_SESSIONS TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_SEARCHES_HOLIDAYS TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.DIM_ANALYTICS_LANDING_PAGE TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_ACTIVITY_BOOKINGS TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_HOLIDAY_BOOKING_REFS TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_CARAVAN_SALES_FORM_COMPLETE TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_BOOKINGS_AND_EXTRAS TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
GRANT SELECT ON TABLE haven_store.performance_marketing.FCT_ANALYTICS_SEARCHES_CARAVAN_SALES TO ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

GRANT ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__PERFORMANCE_MARKETING__READER TO ROLE haven_holidays; 

use ROLE useradmin;
DROP ROLE _HAVEN_HOLIDAYS__HAVEN_STORE__AVAILABILITY__READER;





_HAVEN_HOLIDAYS__HAVEN_BASE__IDENTITY__READER
_HAVEN_HOLIDAYS__HAVEN_STORE__AVAILABILITY__READER
_HAVEN_HOLIDAYS__HAVEN_STORE__CARAVANS__READER
_HAVEN_HOLIDAYS__HAVEN_STORE__COMMON__READER
_HAVEN_HOLIDAYS__HAVEN_STORE__HOLIDAY__READER
_HAVEN_HOLIDAYS__HAVEN_STORE__TROOPER2__READER