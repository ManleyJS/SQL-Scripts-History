-- original - September 2025

use ROLE sysadmin;

CREATE DATABASE haven_store_rms_dev;
CREATE DATABASE haven_staging_rms_dev;
CREATE DATABASE haven_pipeline_rms_dev;
CREATE DATABASE haven_master_rms_dev;
CREATE DATABASE haven_semantic_rms_dev;
DROP warehouse haven_dbt_development_rms_dev_warehouse_xsmall;
DROP warehouse haven_dbt_development_rms_dev_warehouse_medium;

CREATE warehouse haven_dbt_development_rms_warehouse_xsmall
WITH WAREHOUSE_SIZE = XSMALL WAREHOUSE_TYPE = STANDARD 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';
CREATE warehouse haven_dbt_development_rms_warehouse_medium
WITH WAREHOUSE_SIZE = medium WAREHOUSE_TYPE = STANDARD 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';


use role useradmin;
CREATE role haven_dbt_development_rms;
CREATE ROLE _haven_store_rms_dev__usage;
CREATE ROLE _haven_staging_rms_dev__usage;
CREATE ROLE _haven_pipeline_rms_dev__usage;
CREATE ROLE _haven_semantic_rms_dev__usage;
CREATE ROLE _haven_master_rms_dev__usage;
CREATE ROLE _haven_store_rms_dev__schema;
CREATE ROLE _haven_staging_rms_dev__schema;
CREATE ROLE _haven_pipeline_rms_dev__schema;
CREATE ROLE _haven_semantic_rms_dev__schema;
CREATE ROLE _haven_master_rms_dev__schema;

create role _haven_dbt_development_rms_warehouse_xsmall__operator;
create role _haven_dbt_development_rms_warehouse_xsmall__usage;
create role _haven_dbt_development_rms_warehouse_xsmall__monitor;

create role _haven_dbt_development_rms_warehouse_medium__operator;
create role _haven_dbt_development_rms_warehouse_medium__usage;
create role _haven_dbt_development_rms_warehouse_medium__monitor;

use ROLE securityadmin;

-- warehouse permissions

grant usage, monitor on warehouse haven_dbt_development_rms_warehouse_xsmall to role _haven_dbt_development_rms_warehouse_xsmall__usage;
grant role _haven_dbt_development_rms_warehouse_xsmall__usage to role _haven_dbt_development_rms_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_dbt_development_rms_warehouse_xsmall to role _haven_dbt_development_rms_warehouse_xsmall__operator;
grant monitor on warehouse haven_dbt_development_rms_warehouse_xsmall to role _haven_dbt_development_rms_warehouse_xsmall__monitor;

grant usage, monitor on warehouse haven_dbt_development_rms_warehouse_medium to role _haven_dbt_development_rms_warehouse_medium__usage;
grant role _haven_dbt_development_rms_warehouse_medium__usage to role _haven_dbt_development_rms_warehouse_medium__operator;
grant operate, modify on warehouse haven_dbt_development_rms_warehouse_medium to role _haven_dbt_development_rms_warehouse_medium__operator;
grant monitor on warehouse haven_dbt_development_rms_warehouse_medium to role _haven_dbt_development_rms_warehouse_medium__monitor;


-- WAREHOUSE GRANTS

GRANT ROLE _haven_dbt_development_rms_warehouse_xsmall__usage TO ROLE haven_dbt_development_rms;
GRANT ROLE _haven_dbt_development_rms_warehouse_medium__usage TO ROLE haven_dbt_development_rms;

-- STANDARD DATABASE ROLE PERMISSIONS 

GRANT USAGE ON DATABASE HAVEN_STORE_rms_dev TO ROLE _HAVEN_STORE_rms_dev__USAGE;
GRANT USAGE ON DATABASE HAVEN_STAGING_rms_dev TO ROLE _HAVEN_STAGING_rms_dev__USAGE;
GRANT USAGE ON DATABASE HAVEN_PIPELINE_rms_dev TO ROLE _HAVEN_PIPELINE_rms_dev__USAGE;
GRANT USAGE ON DATABASE HAVEN_MASTER_rms_dev TO ROLE _HAVEN_MASTER_rms_dev__USAGE;
GRANT USAGE ON DATABASE HAVEN_SEMANTIC_rms_dev TO ROLE _HAVEN_SEMANTIC_rms_dev__USAGE;

GRANT CREATE SCHEMA ON DATABASE HAVEN_STORE_rms_dev TO ROLE _HAVEN_STORE_rms_dev__SCHEMA;
GRANT CREATE SCHEMA ON DATABASE HAVEN_STAGING_rms_dev TO ROLE _HAVEN_STAGING_rms_dev__SCHEMA;
GRANT CREATE SCHEMA ON DATABASE HAVEN_PIPELINE_rms_dev TO ROLE _HAVEN_PIPELINE_rms_dev__SCHEMA;
GRANT CREATE SCHEMA ON DATABASE HAVEN_SEMANTIC_rms_dev TO ROLE _HAVEN_SEMANTIC_rms_dev__SCHEMA;
GRANT CREATE SCHEMA ON DATABASE HAVEN_MASTER_rms_dev TO ROLE _HAVEN_MASTER_rms_dev__SCHEMA;

GRANT ROLE _HAVEN_STORE_rms_dev__USAGE TO ROLE _HAVEN_STORE_rms_dev__SCHEMA;
GRANT ROLE _HAVEN_STAGING_rms_dev__USAGE TO ROLE _HAVEN_STAGING_rms_dev__SCHEMA;
GRANT ROLE _HAVEN_PIPELINE_rms_dev__USAGE TO ROLE _HAVEN_PIPELINE_rms_dev__SCHEMA;
GRANT ROLE _HAVEN_SEMANTIC_rms_dev__USAGE TO ROLE _HAVEN_SEMANTIC_rms_dev__SCHEMA;
GRANT ROLE _HAVEN_MASTER_rms_dev__USAGE TO ROLE _HAVEN_MASTER_rms_dev__SCHEMA;

GRANT ROLE _HAVEN_STORE_rms_dev__SCHEMA TO ROLE haven_dbt_development_rms;
GRANT ROLE _HAVEN_STAGING_rms_dev__SCHEMA TO ROLE haven_dbt_development_rms;
GRANT ROLE _HAVEN_PIPELINE_rms_dev__SCHEMA TO ROLE haven_dbt_development_rms;
GRANT ROLE _HAVEN_SEMANTIC_rms_dev__SCHEMA TO ROLE haven_dbt_development_rms;
GRANT ROLE _HAVEN_MASTER_rms_dev__SCHEMA TO ROLE haven_dbt_development_rms;

GRANT ROLE haven_dbt_development_rms TO ROLE dba;
GRANT ROLE haven_dbt_development_rms TO USER sarunasjatautis;


-- to be revoked after data and views replicated

use ROLE useradmin;

CREATE ROLE _haven_store_rms_dev__development__usage;
CREATE ROLE _haven_semantic_rms_dev__development__usage;
CREATE ROLE _haven_pipeline_rms_dev__development__usage;
CREATE ROLE _haven_staging_rms_dev__development__usage;

use ROLE securityadmin;

GRANT USAGE ON DATABASE haven_store_rms_dev TO ROLE _haven_store_rms_dev__development__usage;
GRANT USAGE ON ALL SCHEMAS IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;
GRANT select ON ALL tables IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;
GRANT select ON FUTURE tables IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;
GRANT select ON ALL views IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;
GRANT select ON FUTURE views IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;
GRANT select ON ALL materialized views IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;
GRANT select ON FUTURE materialized views IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;
GRANT USAGE ON ALL stages IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;
GRANT USAGE ON FUTURE stages IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;
GRANT USAGE ON ALL file formats IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;
GRANT USAGE ON FUTURE file formats IN DATABASE haven_store_rms_dev  TO ROLE _haven_store_rms_dev__development__usage;


GRANT ROLE _haven_store_rms_dev__development__usage TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;


GRANT USAGE ON DATABASE haven_semantic_rms_dev TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT USAGE ON ALL SCHEMAS IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT select ON ALL tables IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT select ON FUTURE tables IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT select ON ALL views IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT select ON FUTURE views IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT select ON ALL materialized views IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT select ON FUTURE materialized views IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT USAGE ON ALL stages IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT USAGE ON FUTURE stages IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT USAGE ON ALL file formats IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;
GRANT USAGE ON FUTURE file formats IN DATABASE haven_semantic_rms_dev  TO ROLE _haven_semantic_rms_dev__development__usage;

GRANT ROLE _haven_semantic_rms_dev__development__usage TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;

-- haven_pipeline future grants


GRANT USAGE ON DATABASE haven_pipeline_rms_dev TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT USAGE ON ALL SCHEMAS IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT select ON ALL tables IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT select ON FUTURE tables IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT select ON ALL views IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT select ON FUTURE views IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT select ON ALL materialized views IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT select ON FUTURE materialized views IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT USAGE ON ALL stages IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT USAGE ON FUTURE stages IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT USAGE ON ALL file formats IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;
GRANT USAGE ON FUTURE file formats IN DATABASE haven_pipeline_rms_dev  TO ROLE _haven_pipeline_rms_dev__development__usage;

GRANT ROLE _haven_pipeline_rms_dev__development__usage TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;

-- haven_staging future grants

GRANT USAGE ON DATABASE haven_staging_rms_dev TO ROLE _haven_staging_rms_dev__development__usage;
GRANT USAGE ON ALL SCHEMAS IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;
GRANT select ON ALL tables IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;
GRANT select ON FUTURE tables IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;
GRANT select ON ALL views IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;
GRANT select ON FUTURE views IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;
GRANT select ON ALL materialized views IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;
GRANT select ON FUTURE materialized views IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;
GRANT USAGE ON ALL stages IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;
GRANT USAGE ON FUTURE stages IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;
GRANT USAGE ON ALL file formats IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;
GRANT USAGE ON FUTURE file formats IN DATABASE haven_staging_rms_dev  TO ROLE _haven_staging_rms_dev__development__usage;


GRANT ROLE _haven_staging_rms_dev__development__usage TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;

GRANT ROLE _haven_store_rms_dev__development__usage TO ROLE haven_dbt_development_rms;
GRANT ROLE _haven_pipeline_rms_dev__development__usage TO ROLE haven_dbt_development_rms;
GRANT ROLE _haven_semantic_rms_dev__development__usage TO ROLE haven_dbt_development_rms;
GRANT ROLE _haven_staging_rms_dev__development__usage TO ROLE haven_dbt_development_rms;


USE ROLE SECURITYADMIN;

GRANT ROLE _HAVEN_MASTER_RMS_DEV__SCHEMA TO ROLE HAVEN_SCHEMA_SETUP;
GRANT ROLE _HAVEN_STORE_RMS_DEV__SCHEMA TO ROLE HAVEN_SCHEMA_SETUP;
GRANT ROLE _HAVEN_STAGING_RMS_DEV__SCHEMA TO ROLE HAVEN_SCHEMA_SETUP;
GRANT ROLE _HAVEN_PIPELINE_RMS_DEV__SCHEMA TO ROLE HAVEN_SCHEMA_SETUP;
GRANT ROLE _HAVEN_SEMANTIC_RMS_DEV__SCHEMA TO ROLE HAVEN_SCHEMA_SETUP;
use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;

call haven_master.procedures.schema_role_creation('HAVEN_MASTER_RMS_DEV', 'STREAMLITS');

USE ROLE SECURITYADMIN;

GRANT ROLE _HAVEN_MASTER_RMS_DEV__STREAMLITS__USAGE TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT CREATE STREAMLIT ON SCHEMA HAVEN_MASTER_RMS_DEV.STREAMLITS TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;

-- HAVEN_REVENUE_MANAGEMENT permissions

show grants to role haven_revenue_management;


GRANT ROLE _HAVEN_BASE__BIGQUERY__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_BASE__BLUEYONDER__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_BASE__CYHH__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_BASE__DREAM__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_BASE__PLOT__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_BASE__PRICER__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_BASE__SEAWARE__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_BASE__ZONAL__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
-- _HAVEN_PIPELINE_QAT__BLUEYONDER__READER
-- _HAVEN_PIPELINE_UAT__BLUEYONDER__READER
GRANT ROLE _HAVEN_PIPELINE__BLUEYONDER__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_PIPELINE__PX0007_PITCH_PERFECT__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
-- _HAVEN_REVENUE_MANAGEMENT__HAVEN_STORE__COMMON__READER
-- _HAVEN_REVENUE_MANAGEMENT__HAVEN_STORE__PERFORMANCE_MARKETING__READER
-- _HAVEN_REVENUE_MANAGEMENT__USAGE
-- _HAVEN_REVENUE_MANAGMENT__HAVEN_BASE__HIT_ADMIN__READER
GRANT ROLE _HAVEN_SEMANTIC__REVENUE_MANAGEMENT_REPORTING__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_SEMANTIC__RMS_LAUNCH_PRICE_TOOL__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_SEMANTIC__RMS_PRICER_COMMON__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_SEMANTIC__RMS_REPORTING_GRADE__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__ACTIVITIES__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__ALIGN_ALYTICS__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__AVAILABILITY__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__CARAVANS__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__CARAVAN_SALES_PRICING_APPLICATION__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__CARAVAN_SALES__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__COMMERCIAL__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__COMMON__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__COMPETITOR__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__CYHH_PRICING_PILOT_REPORTING__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__DIGITAL__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__FINANCIAL_CUBE__READER  TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__HOLIDAY__READER  TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__MA_MART__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__OCANDC__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__PAYMENTS__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__PITCH_PERFECT__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__PRICER_DECISION_MATRIX__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__PRICER_FORECAST__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__PRICER__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__PROSPECTS__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__RETAIL__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__REVENUE_MANAGEMENT_REPORTING__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__SASMART__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__SAS_SCV__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__SURVEY__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__TROOPER2__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__TROOPER__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;
GRANT ROLE _HAVEN_STORE__TRPREPRS__READER TO ROLE HAVEN_DBT_DEVELOPMENT_RMS;


GRANT ROLE HAVEN_DBT_DEVELOPMENT_RMS TO USER DILLONSIM;

use role haven_dbt_development_rms;

show databases;

use database haven_store_rms_dev;

create schema deleteme;


drop schema deleteme;

use role accountadmin;


use role accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS haven_dbt_development_rms_compute_pool_small
    MIN_NODES = 1
    MAX_NODES = 4
    INSTANCE_FAMILY = 'CPU_X64_S'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;


USE ROLE useradmin;

create role _haven_dbt_development_rms_compute_pool_small__operator;
create role _haven_dbt_development_rms_compute_pool_small__usage;
create role _haven_dbt_development_rms_compute_pool_small__monitor;

use ROLE securityadmin;

grant usage, monitor on compute pool haven_dbt_development_rms_compute_pool_small TO ROLE _haven_dbt_development_rms_compute_pool_small__usage;
grant operate, modify on compute pool haven_dbt_development_rms_compute_pool_small TO ROLE _haven_dbt_development_rms_compute_pool_small__operator;
GRANT ROLE _haven_dbt_development_rms_compute_pool_small__usage TO ROLE _haven_dbt_development_rms_compute_pool_small__operator;

grant monitor on compute pool haven_dbt_development_rms_compute_pool_small TO ROLE _haven_dbt_development_rms_compute_pool_small__monitor;

--GRANT CREATE service ON SCHEMA haven_store_dev.pitch_perfect TO ROLE haven_dbt_development_rms;

GRANT ROLE _haven_dbt_development_rms_compute_pool_small__usage TO ROLE haven_dbt_development_rms;

-- 03/10/2025

use role accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS haven_dbt_development_rms_compute_pool_medium
    MIN_NODES = 1
    MAX_NODES = 4
    INSTANCE_FAMILY = 'CPU_X64_M'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;


USE ROLE useradmin;

create role _haven_dbt_development_rms_compute_pool_medium__operator;
create role _haven_dbt_development_rms_compute_pool_medium__usage;
create role _haven_dbt_development_rms_compute_pool_medium__monitor;

use ROLE securityadmin;

grant usage, monitor on compute pool haven_dbt_development_rms_compute_pool_medium TO ROLE _haven_dbt_development_rms_compute_pool_medium__usage;
grant operate, modify on compute pool haven_dbt_development_rms_compute_pool_medium TO ROLE _haven_dbt_development_rms_compute_pool_medium__operator;
GRANT ROLE _haven_dbt_development_rms_compute_pool_medium__usage TO ROLE _haven_dbt_development_rms_compute_pool_medium__operator;
grant monitor on compute pool haven_dbt_development_rms_compute_pool_medium TO ROLE _haven_dbt_development_rms_compute_pool_medium__monitor;

GRANT ROLE _haven_dbt_development_rms_compute_pool_medium__usage TO ROLE haven_dbt_development_rms;

use role haven_dbt_development_rms;

show compute pools;

use role securityadmin;

grant role _haven_staging__rms_pricer_forecast__reader to role haven_dbt_development_rms;
grant role _haven_staging__rms_reporting_grade__reader to role haven_dbt_development_rms;
grant role _haven_staging__rms_launch_price_tool__reader to role haven_dbt_development_rms;
------

grant role haven_dbt_development_rms to user lewischai;
grant role haven_dbt_development_rms to user caitlinsmith;
