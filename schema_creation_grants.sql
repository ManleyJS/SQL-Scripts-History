USE ROLE DBA;

call haven_master.procedures.test_schema_creation('training', 'deleteme');

USE DATABASE TRAINING;

SHOW SCHEMAS;

show grants to role haven_schema_setup;

use role securityadmin;

grant create schema on database training to role haven_schema_setup;
grant create schema on database haven_store_dev to role haven_schema_setup;

grant role _haven_commercial__usage to role haven_data_engineering;

grant role _haven_store_qat__lettings__creator to role haven_dbt_transform_qat;
grant role _haven_store_qat__lettings__reader to role haven_data_engineering;

use role dba;
drop role deleteme;

show roles like 'haven_dbt_transform%qat';

use role dba;

use schema haven_store.availability;

show tables;

use role securityadmin;

show databases;

grant create schema on database BOURNE_BASE to role haven_schema_setup;
grant create schema on database BOURNE_GOVERNANCE to role haven_schema_setup;
grant create schema on database BOURNE_MASTER to role haven_schema_setup;
grant create schema on database BOURNE_RAW to role haven_schema_setup;
grant create schema on database BOURNE_STORE to role haven_schema_setup;
grant create schema on database BOURNE_STORE_DEV to role haven_schema_setup;
grant create schema on database BOURNE_STORE_PROD to role haven_schema_setup;
grant create schema on database BOURNE_STORE_QAT to role haven_schema_setup;
grant create schema on database BOURNE_STORE_TEST to role haven_schema_setup;
grant create schema on database BOURNE_STORE_UAT to role haven_schema_setup;
grant create schema on database HAVEN_BASE to role haven_schema_setup;
grant create schema on database HAVEN_MASTER to role haven_schema_setup;
grant create schema on database HAVEN_PIPELINE to role haven_schema_setup;
grant create schema on database HAVEN_PIPELINE_DEV to role haven_schema_setup;
grant create schema on database HAVEN_PIPELINE_PROD to role haven_schema_setup;
grant create schema on database HAVEN_PIPELINE_QAT to role haven_schema_setup;
grant create schema on database HAVEN_PIPELINE_TEST to role haven_schema_setup;
grant create schema on database HAVEN_PIPELINE_UAT to role haven_schema_setup;
grant create schema on database HAVEN_RAW to role haven_schema_setup;
grant create schema on database HAVEN_STAGING to role haven_schema_setup;
grant create schema on database HAVEN_STAGING_DEV to role haven_schema_setup;
grant create schema on database HAVEN_STAGING_PROD to role haven_schema_setup;
grant create schema on database HAVEN_STAGING_QAT to role haven_schema_setup;
grant create schema on database HAVEN_STAGING_TEST to role haven_schema_setup;
grant create schema on database HAVEN_STAGING_UAT to role haven_schema_setup;
grant create schema on database HAVEN_STORE to role haven_schema_setup;
grant create schema on database HAVEN_STORE_DEV to role haven_schema_setup;
grant create schema on database HAVEN_STORE_PROD to role haven_schema_setup;
grant create schema on database HAVEN_STORE_QAT to role haven_schema_setup;
grant create schema on database HAVEN_STORE_TEST to role haven_schema_setup;
grant create schema on database HAVEN_STORE_UAT to role haven_schema_setup;
grant create schema on database HAVEN_TEST to role haven_schema_setup;
grant create schema on database HAVEN_WORK to role haven_schema_setup;
grant create schema on database TRAINING to role haven_schema_setup;

use role securityadmin;

grant create schema on database haven_data_engineering to role haven_schema_setup;
