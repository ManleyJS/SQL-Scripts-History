use ROLE haven_dbt_transform_dev;

show warehouses;

use warehouse HAVEN_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL;

use SCHEMA haven_store_dev.caravan_sales_pricing_application;

CREATE TABLE haven_store_dev.caravan_sales_pricing_application.ACTIVE_SUBMISSIONS clone haven_store.caravan_sales_pricing_application.ACTIVE_SUBMISSIONS;
CREATE TABLE haven_store_dev.caravan_sales_pricing_application.AUDIT_LOGS clone haven_store.caravan_sales_pricing_application.AUDIT_LOGS;
CREATE TABLE haven_store_dev.caravan_sales_pricing_application.CSPA_USER_ACCOUNTS clone haven_store.caravan_sales_pricing_application.CSPA_USER_ACCOUNTS;

CREATE OR replace TABLE haven_store_dev.caravan_sales_pricing_application.USER_ACCOUNTS 
AS SELECT REG_TIMESTAMP, ROLE, USERNAME, PASSWORD_HASH, PASSWORD_SALT, UID, APPROVED, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_STORE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_USER_ACCOUNTS
GROUP BY REG_TIMESTAMP, "ROLE", USERNAME, PASSWORD_HASH, PASSWORD_SALT, UID, APPROVED, FILE_NAME, LOADED_TIMESTAMP;


use ROLE haven_dbt_transform_dev;

create or replace view haven_store_dev.caravan_sales_pricing_application.CSPA_BASE_PRICING(
	YEAR,
	NEW_USED,
	TIER,
	GRADE,
	GBB,
	MIN_WIDTH,
	MIN_LENGTH,
	BEDS,
	VALUE,
	FILE_NAME,
	LOADED_TIMESTAMP
) as SELECT "YEAR", NEW_USED, TIER, GRADE, GBB, MIN_WIDTH, MIN_LENGTH, BEDS, VALUE, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_BASE_PRICING;

create or replace view haven_store_dev.caravan_sales_pricing_application.CSPA_BEDS_DIFFS(
	BEDS_DIFF,
	GBP_DIFF,
	FILE_NAME,
	LOADED_TIMESTAMP
) as SELECT BEDS_DIFF, GBP_DIFF, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_BEDS_DIFFS;

create or replace view haven_store_dev.caravan_sales_pricing_application.CSPA_GBB(
	MAKE,
	MODEL,
	YEAR_MADE,
	LENGTH,
	WIDTH,
	BEDS,
	VAN_GRADE,
	PRICING_GRADE,
	TIERING,
	FILE_NAME,
	LOADED_TIMESTAMP
) as SELECT MAKE, MODEL, YEAR_MADE, "LENGTH", WIDTH, BEDS, VAN_GRADE, PRICING_GRADE, TIERING, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_GBB;

create or replace view haven_store_dev.caravan_sales_pricing_application.CSPA_LENGTH_DIFFS(
	LEN_DIFF,
	GBP_DIFF,
	FILE_NAME,
	LOADED_TIMESTAMP
) as SELECT LEN_DIFF, GBP_DIFF, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_LENGTH_DIFFS;

create or replace view haven_store_dev.caravan_sales_pricing_application.CSPA_PARK_TIERS(
	PARK,
	PRICE_TIER,
	FILE_NAME,
	LOADED_TIMESTAMP
) as SELECT PARK, PRICE_TIER, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_PARK_TIERS;

create or replace view haven_store_dev.caravan_sales_pricing_application.CSPA_USED_DIFFS(
	VAN_VERSION,
	GRADE,
	STT_FROM,
	STT_TO,
	YEAR_DIFF,
	GBP_DIFF,
	PCT_DIFF,
	FILE_NAME,
	LOADED_TIMESTAMP
) as SELECT VAN_VERSION, GRADE, STT_FROM, STT_TO, YEAR_DIFF, GBP_DIFF, PCT_DIFF, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_USED_DIFFS;

create or replace view haven_store_dev.caravan_sales_pricing_application.CSPA_WIDTH_DIFFS(
	WIDTH_DIFF,
	GBP_DIFF,
	FILE_NAME,
	LOADED_TIMESTAMP
) as SELECT WIDTH_DIFF, GBP_DIFF, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_WIDTH_DIFFS;

create or replace view haven_store_dev.caravan_sales_pricing_application.CSPA_YEAR_DIFFS(
	VAN_VERSION,
	GRADE,
	STT_FROM,
	STT_TO,
	YEAR_DIFF,
	GBP_DIFF,
	PCT_DIFF,
	FILE_NAME,
	LOADED_TIMESTAMP
) as SELECT VAN_VERSION, GRADE, STT_FROM, STT_TO, YEAR_DIFF, GBP_DIFF, PCT_DIFF, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_YEAR_DIFFS;

--CREATE TABLE haven_store_dev.caravan_sales_pricing_application.BASE_PRICING clone haven_store.caravan_sales_pricing_application.BASE_PRICING;

use ROLE dba;
CREATE TABLE haven_store_dev.caravan_sales_pricing_application.BASE_PRICING_2 clone haven_revenue_management.caravan_pricing.BASE_PRICING_2;
DROP TABLE haven_store_dev.caravan_sales_pricing_application.BASE_PRICING_3 ;
CREATE OR REPLACE TABLE haven_store_dev.caravan_sales_pricing_application.CSPA_BASE_PRICING_3 clone haven_revenue_management.caravan_pricing.BASE_PRICING_3;
--CREATE TABLE haven_store_dev.caravan_sales_pricing_application.BEDS_DIFFS clone haven_store.caravan_sales_pricing_application.BEDS_DIFFS;
--CREATE TABLE haven_store_dev.caravan_sales_pricing_application.CSPA_OUTPUT_REVIEW_3ST clone haven_store.caravan_sales_pricing_application.CSPA_OUTPUT_REVIEW_3ST;
--CREATE TABLE haven_store_dev.caravan_sales_pricing_application.CSPA_OUTPUT_REVIEW_3_BK clone haven_store.caravan_sales_pricing_application.CSPA_OUTPUT_REVIEW_3_BK;
--CREATE TABLE haven_store_dev.caravan_sales_pricing_application.GBB clone haven_store.caravan_sales_pricing_application.GBB;
--CREATE TABLE haven_store_dev.caravan_sales_pricing_application.LENGTH_DIFFS clone haven_store.caravan_sales_pricing_application.LENGTH_DIFFS;
--CREATE TABLE haven_store_dev.caravan_sales_pricing_application.PARK_TIERS clone haven_store.caravan_sales_pricing_application.PARK_TIERS;
--CREATE TABLE haven_store_dev.caravan_sales_pricing_application.USED_DIFFS clone haven_store.caravan_sales_pricing_application.USED_DIFFS;
--CREATE TABLE haven_store_dev.caravan_sales_pricing_application.WIDTH_DIFFS clone haven_store.caravan_sales_pricing_application.WIDTH_DIFFS;
--CREATE TABLE haven_store_dev.caravan_sales_pricing_application.YEAR_DIFFS clone haven_store.caravan_sales_pricing_application.YEAR_DIFFS;

show tables;
show views;

use ROLE sysadmin;

CREATE WAREHOUSE haven_streamlit_application_dev_warehouse_xsmall WITH WAREHOUSE_SIZE = 'xsmall' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE useradmin;

create role _haven_streamlit_application_dev_warehouse_xsmall__operator;
create role _haven_streamlit_application_dev_warehouse_xsmall__usage;

CREATE ROLE caravan_sales_pricing_application_deployment_dev;

CREATE ROLE _caravan_sales_pricing_application_deployment_dev__haven_base__plot__reader;

create OR replace user haven_streamlit_application_deployment_account_dev
LOGIN_NAME = 'haven.streamlit.application.deployment.dev.account'
default_warehouse = haven_streamlit_application_dev_warehouse_xsmall
default_role = caravan_sales_pricing_application_deployment_dev
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvtLWj09R1RqsniPEIpMk
W08O05BTXO6dqg5WsQgnM2/+8vQ7OxRy0vFIhgK3z75hn86xbbo3hgeKoHYli+4Y
CcD1qDFbteFobLndOFWm0DM0xXISfrEdw/1nyC4CNVi4Wz/yzP59zoMNzqfBtpjE
kABw5fKcl+XxXHkq1pKSMizd3f5prl/GOn6q/Mv7KZvuKLqcIgPtpv+uwk4H1Pcn
t1gTXfLMw1+lHALEXs+T015B2UxTaHklQxAaeD51jVndLuNb5Sufve0va0eXCuvD
7b4/7pkbyR/tVWp1Iv+kBJMxwME3c0haxSCpm16s+X3Ez2csRLQYyk8Juz66GFAw
4QIDAQAB';

alter user haven_streamlit_application_deployment_account_dev
SET LOGIN_NAME = 'haven.streamlit.application.deployment.dev.account'

use ROLE securityadmin;

grant usage, monitor on warehouse haven_streamlit_application_dev_warehouse_xsmall to role _haven_streamlit_application_dev_warehouse_xsmall__usage;
grant role _haven_streamlit_application_dev_warehouse_xsmall__usage to role _haven_streamlit_application_dev_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_streamlit_application_dev_warehouse_xsmall to role _haven_streamlit_application_dev_warehouse_xsmall__operator;

GRANT ROLE _haven_streamlit_application_dev_warehouse_xsmall__usage TO ROLE caravan_sales_pricing_application_deployment_dev;

GRANT ROLE _HAVEN_STORE_DEV__CARAVAN_SALES_PRICING_APPLICATION__creator TO ROLE caravan_sales_pricing_application_deployment_dev;
GRANT ROLE _haven_master__usage TO ROLE caravan_sales_pricing_application_deployment_dev;
GRANT ROLE _haven_master__streamlits_dev__usage TO ROLE caravan_sales_pricing_application_deployment_dev;
GRANT CREATE streamlit ON SCHEMA haven_master.streamlits_dev TO ROLE caravan_sales_pricing_application_deployment_dev;
GRANT CREATE stage ON SCHEMA haven_master.streamlits_dev TO ROLE caravan_sales_pricing_application_deployment_dev;

GRANT ROLE _haven_base__plot__usage TO ROLE _caravan_sales_pricing_application_deployment_dev__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.vans TO ROLE _caravan_sales_pricing_application_deployment_dev__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.van_types TO ROLE _caravan_sales_pricing_application_deployment_dev__haven_base__plot__reader;
--GRANT SELECT ON VIEW haven_base.plot.van_type_enum TO ROLE _caravan_sales_pricing_application_deployment_dev__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.van_grades TO ROLE _caravan_sales_pricing_application_deployment_dev__haven_base__plot__reader;
GRANT SELECT ON VIEW haven_base.plot.parks TO ROLE _caravan_sales_pricing_application_deployment_dev__haven_base__plot__reader;

GRANT ROLE _caravan_sales_pricing_application_deployment_dev__haven_base__plot__reader TO ROLE caravan_sales_pricing_application_deployment_dev;

GRANT ROLE caravan_sales_pricing_application_deployment_dev TO USER haven_streamlit_application_deployment_account_dev;
GRANT ROLE caravan_sales_pricing_application_deployment_dev TO ROLE dba;

use ROLE caravan_sales_pricing_application_deployment_dev;
use DATABASE haven_master;
use SCHEMA information_schema;

show streamlits;

GRANT USAGE ON 
show schemas;

show databases;
show schemas;

use SCHEMA haven_base.plot;

show tables;
show views;

-- 29/09/2025

use ROLE securityadmin;

CARAVAN_SALES_PRICING_APPLICATION_DEPLOYMENT_DEV
HAVEN_STORE_DEV.CARAVAN_SALES_PRICING_APPLICATION.CSPA_PARK_TIERS_EDITABLE