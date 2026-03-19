-- 24/10/2025

select * from snowflake.account_usage.tables
where startswith(table_owner, 'HAVEN_DBT_TRANSFORM_PRICER' )
and deleted is null
order by table_owner, table_catalog, table_schema, created
;



-- 23/10/2025

use role dba;

select * from snowflake.account_usage.tables
where table_owner IN (
'HAVEN_DBT_TRANSFORM_PRICER_QAT',
'HAVEN_DBT_TRANSFORM_RMS_PRICER_DEV',
'HAVEN_DBT_TRANSFORM_RMS_PRICER_QAT',
'HAVEN_DBT_TRANSFORM_RMS_PRICER_PROD',
'HAVEN_DBT_TRANSFORM_RMS_PRICER')
and deleted is null
order by table_owner, table_catalog, table_schema, created
;

use role dba;

drop schema HAVEN_STORE.DBT_CI_HAVEN_CORE_PR_357;
drop schema HAVEN_STORE.DBT_CI_HAVEN_CORE_PR_357_DBT_CARAVANS;
drop schema HAVEN_STORE.DBT_CI_HAVEN_CORE_PR_357_DBT_COMMON;
drop schema HAVEN_STORE.DBT_CI_HAVEN_CORE_PR_357_DBT_CUSTOMER;
drop schema HAVEN_STORE.DBT_CI_HAVEN_CORE_PR_357_DBT_HAVEN_STAGING;
drop schema HAVEN_STORE.DBT_CLOUD_PR_2666_315_DBT_AVAILABILITY;
drop schema HAVEN_STORE.DBT_CLOUD_PR_2666_315_DBT_CARAVANS;
drop schema HAVEN_STORE.DBT_CLOUD_PR_2666_315_DBT_FINANCE_CUBE_ERPX;
drop schema HAVEN_STORE.DBT_CLOUD_PR_2666_315_DBT_HAVEN_STAGING;
drop schema HAVEN_STORE.DBT_CLOUD_PR_2666_315_DBT_HOLIDAY;
drop schema HAVEN_STORE.DBT_CLOUD_PR_2666_315_DBT_PERFORMANCE_MARKETING;
drop schema HAVEN_STORE.DBT_CLOUD_PR_2666_315_DBT_PROSPECTS;
drop schema HAVEN_STORE_DEV.COMMON_DBT_PRICER;
drop schema HAVEN_STORE_DEV.COMMON_DBT_REVENUE_MANAGEMENT_REPORTING;
drop schema HAVEN_STORE_DEV.COMMON_DBT_SJATAUTIS_DBT_V2;
drop schema HAVEN_STORE_DEV.DBT_SJATAUTIS_CORE_DBT_HAVEN_STAGING;
--drop schema HAVEN_STORE_DEV.DBT_SJATAUTIS_HAVEN_RMS_CORE_CYHH_PRICING_PILOT_REPORTING;
drop schema HAVEN_STORE_DEV.DBT_SJATAUTIS_PITCH_PERFECT_DBT_PITCH_PERFECT;
-- drop schema HAVEN_STORE_DEV.DBT_SJATAUTIS_RMS_CORE_TEST;
drop schema HAVEN_STORE_DEV.DBT_SJATAUTIS_RMS_PRICER;
drop schema HAVEN_STORE_DEV.DBT_SJATAUTIS_RMS_PRICER_DBT_PRICER;
drop schema HAVEN_STORE_DEV.DBT_SJATAUTIS_RMS_PRICER_DBT_REVENUE_MANAGEMENT_REPORTING;
drop schema HAVEN_STORE_DEV.DBT_SJATAUTIS_RMS_PRICER_TEST;
drop schema HAVEN_STORE_DEV.SJATAUTIS_DBT;
drop schema HAVEN_STORE_DEV.SJATAUTIS_RMS_PRICER_DBT_REVENUE_MANAGEMENT_REPORTING;
drop schema HAVEN_STORE_DEV.SJATAUTIS_RMS_PRICER_DBT_RM_STAGING;
drop schema HAVEN_STORE_QAT.COMMON_DBT_HAVEN_STAGING;
drop schema HAVEN_STORE_QAT.COMMON_DBT_PRICER;
drop schema HAVEN_STORE_QAT.COMMON_DBT_REVENUE_MANAGEMENT_REPORTING;
drop schema HAVEN_STORE_QAT.DBT_SJATAUTIS_RMS_PRICER;
drop schema HAVEN_STORE_QAT.DBT_SJATAUTIS_RMS_PRICER_DBT_PRICER;
drop schema HAVEN_STORE_QAT.DBT_SJATAUTIS_RMS_PRICER_DBT_REVENUE_MANAGEMENT_REPORTING;
drop schema HAVEN_STORE_QAT.RMS_PRICER;
drop schema HAVEN_STORE_QAT.SJATAUTIS_TEST;
drop schema BOURNE_STORE_DEV.DBT_CI_FINANCE_CORE_DBT_FINANCE_SHARED_SERVICES;
drop schema BOURNE_STORE_DEV.TEST;
drop schema BOURNE_STORE_DEV.TEST_DBT_FINANCE_SHARED_SERVICES;
drop schema BOURNE_STORE_DEV.TEST_HAVEN_DBT_DEVELOPMENT_ROLE;
drop schema HAVEN_STAGING_QAT.COMMON_DBT_RM_STAGING;
drop schema HAVEN_STAGING_QAT.DBT_SJATAUTIS_RMS_PRICER_DBT_DMS_STAGING;
drop schema HAVEN_STAGING_QAT.DBT_SJATAUTIS_RMS_PRICER_DBT_REVENUE_MANAGEMENT_OUTPUT;
drop schema HAVEN_STAGING_QAT.DBT_SJATAUTIS_RMS_PRICER_DBT_RM_STAGING;
drop schema HAVEN_STORE_DEV.REVENUE_MANAGEMENT_OUTPUT;
drop schema HAVEN_STORE_DEV.RM_STAGING;

use role securityadmin;

grant role HAVEN_DBT_TRANSFORM_RMS_CORE_DEV to role dba;

use role HAVEN_DBT_TRANSFORM_RMS_CORE_DEV;
drop schema HAVEN_STORE_DEV.DBT_SJATAUTIS_HAVEN_RMS_CORE_CYHH_PRICING_PILOT_REPORTING;
drop schema HAVEN_STORE_DEV.DBT_SJATAUTIS_RMS_CORE_TEST;




-- 10/10/2025

use role securityadmin;

revoke usage on future schemas in database HAVEN_STAGING_UAT from role _HAVEN_STAGING_UAT__USAGE;

REVOKE SELECT ON FUTURE MATERIALIZED VIEWS IN DATABASE HAVEN_DATA_SCIENCE_DEV FROM ROLE _HAVEN_DATA_SCIENCE_DEV__USAGE;
REVOKE USAGE ON FUTURE SCHEMAS IN DATABASE HAVEN_DATA_SCIENCE_DEV FROM ROLE _HAVEN_DATA_SCIENCE_DEV__USAGE;
REVOKE USAGE ON FUTURE STAGES IN DATABASE HAVEN_DATA_SCIENCE_DEV FROM ROLE _HAVEN_DATA_SCIENCE_DEV__USAGE;
REVOKE SELECT ON FUTURE TABLES IN DATABASE HAVEN_DATA_SCIENCE_DEV FROM ROLE _HAVEN_DATA_SCIENCE_DEV__USAGE;
REVOKE SELECT ON FUTURE VIEWS IN DATABASE HAVEN_DATA_SCIENCE_DEV FROM ROLE _HAVEN_DATA_SCIENCE_DEV__USAGE;

-- 10/10/2025

use role dba;
show grants to role _haven_pipeline__usage;

show grants to role _haven_pipeline__schema;

revoke usage on future schemas in database haven_pipeline from role _haven_pipeline__usage;
revoke usage on future schemas in database haven_pipeline from role _haven_pipeline__schema;

revoke usage on future schemas in database haven_pipeline from role _haven_pipeline__usage;
revoke usage on future schemas in database haven_pipeline from role _haven_pipeline__schema;


-- 10/10/2025
-- clean upo testing from yesterday

use role dba;

use database haven_pipeline;

show schemas;

show roles like '_haven_pipeline%test%schema%';

use role HAVEN_SCHEMA_SETUP;

drop role _HAVEN_PIPELINE__TEST_SCHEMA__OWNER;
drop role _HAVEN_PIPELINE__TEST_SCHEMA__CREATOR;
drop role _HAVEN_PIPELINE__TEST_SCHEMA__WRITER;
drop role _HAVEN_PIPELINE__TEST_SCHEMA__READER;
drop role _HAVEN_PIPELINE__TEST_SCHEMA__USAGE;

drop schema haven_pipeline.test_schema;

use role dba;
drop schema haven_pipeline.test_create_schema;

use role HAVEN_SCHEMA_SETUP;

show grants to role _haven_pipeline__usage;

call haven_master.procedures.schema_role_creation('haven_pipeline', 'test_schema');

show grants to role _haven_pipeline__usage;

-- 10/10/2025

use role dba;
SHOW FUTURE GRANTS IN DATABASE haven_store;

select database_name from snowflake.account_usage.databases where deleted is null and type = 'STANDARD';

use role securityadmin;
revoke usage on future schemas in database haven_store from role haven_pipeline;
revoke select on future tables in database haven_store from role haven_pipeline;
revoke select on future views in database haven_store from role haven_pipeline;

show roles like '%haven_pipeline%';

show grants of role haven_pipeline;

use role dba;
show grants to role haven_dbt_transform_dev;
show grants to role haven_dbt_pipeline;

use role haven_dbt_pipeline;

show functions;

desc function haven_pipeline.system_functions.freshsales_sales_leads(String, String);

use role securityadmin;
grant role _met_office_postcode_data__usage to role haven_dbt_transform_dev;

show grants to role _haven_pipeline__system_functions__execute;
revoke role _haven_pipeline__system_functions__reader from role haven_dbt_pipeline;
revoke role _haven_pipeline__system_functions__usage from role haven_dbt_pipeline;

grant role _haven_pipeline__system_functions__usage to role _haven_pipeline__system_functions__execute;

revoke usage on future schemas in database haven_store from role _haven_store__usage;
revoke select on future tables in database haven_store from role _haven_store__usage;
revoke select on future views in database haven_store from role _haven_store__usage;







--08/10/2025

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_store', 'test_schema');

use role haven_schema_setup;
create schema haven_pipeline.test_create_schema;

use role dba;
show grants to role _haven_pipeline__usage;

show grants to role _haven_pipeline__test_schema__usage;

use role useradmin;

show users like '%evans%';




