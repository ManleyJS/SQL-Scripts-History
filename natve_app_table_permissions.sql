USE APPLICATION PACKAGE dba_snowflake_package;
use role sysadmin;
GRANT REFERENCE_USAGE ON DATABASE haven_base TO SHARE IN APPLICATION PACKAGE dba_snowflake_package;
GRANT REFERENCE_USAGE ON DATABASE haven_raw TO SHARE IN APPLICATION PACKAGE dba_snowflake_package;

use role dba;
-- CREATE SCHEMA IN THE APP PACKAGE
CREATE SCHEMA REFERENCE_APP_PACKAGE.SHARED_CONTENT;

-- CREATE PROXY OBJECTS IN APP PACKAGE REFERENCING LOCAL DATA TO SHARE
CREATE or replace VIEW dba_snowflake_package.shared_data.activities AS SELECT * FROM haven_raw.dig_activities.activities;
CREATE or replace VIEW dba_snowflake_package.shared_data.v_activities AS SELECT * FROM haven_base.dig_activities.activities;

-- GRANT ACCESS TO THE CONTENT TO THE APP PACKAGE (WILL NOT WORK W/O THIS)
GRANT USAGE ON SCHEMA dba_snowflake_package.shared_data TO SHARE IN APPLICATION PACKAGE dba_snowflake_package;
GRANT SELECT ON VIEW dba_snowflake_package.shared_data.activities TO SHARE IN APPLICATION PACKAGE dba_snowflake_package;
GRANT SELECT ON VIEW dba_snowflake_package.shared_data.v_activities TO SHARE IN APPLICATION PACKAGE dba_snowflake_package;

use role sysadmin;
use application package rms_group_pricing_package;
GRANT REFERENCE_USAGE ON DATABASE HAVEN_STORE TO SHARE IN APPLICATION PACKAGE rms_group_pricing_package;
GRANT REFERENCE_USAGE ON DATABASE HAVEN_BASE TO SHARE IN APPLICATION PACKAGE rms_group_pricing_package;
GRANT REFERENCE_USAGE ON DATABASE HAVEN_RAW TO SHARE IN APPLICATION PACKAGE rms_group_pricing_package;

use role securityadmin;
grant role haven_commercial_dillonsim to role dba;
use role dba;
use role haven_commercial_dillonsim;

grant usage on application package rms_group_pricing_package to role sysadmin;

use application package rms_group_pricing;
