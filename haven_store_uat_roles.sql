USE ROLE sysadmin;

CREATE WAREHOUSE haven_store_uat_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE useradmin;

CREATE ROLE _haven_store_uat__usage;
CREATE ROLE _haven_store_uat__schema;
CREATE ROLE _haven_store_uat_xsmall__warehouse__operator;
CREATE ROLE _haven_store_uat_xsmall__warehouse__usage;

CREATE OR REPLACE ROLE haven_dbt_transform_uat;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_store_uat_xsmall to role _haven_store_uat_xsmall__warehouse__usage;
grant role _haven_store_uat_xsmall__warehouse__usage to role _haven_store_uat_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_store_uat_xsmall to role _haven_store_uat_xsmall__warehouse__operator;

GRANT ROLE _haven_store_uat_xsmall__warehouse__usage TO ROLE haven_dbt_transform_uat;

GRANT USAGE ON DATABASE haven_store_uat TO ROLE _haven_store_uat__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_store_uat TO ROLE _haven_store_uat__usage;
GRANT ROLE _haven_store_uat__usage TO ROLE _haven_store_uat__schema;
GRANT CREATE SCHEMA ON DATABASE haven_store_uat TO ROLE _haven_store_uat__schema;
GRANT SELECT ON future TABLES IN DATABASE haven_store_uat TO ROLE _haven_store_uat__usage;
GRANT SELECT ON ALL TABLES IN DATABASE haven_store_uat TO ROLE _haven_store_uat__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_store_uat TO ROLE _haven_store_uat__usage;
GRANT SELECT ON all VIEWS IN DATABASE haven_store_uat TO ROLE _haven_store_uat__usage;
GRANT USAGE ON future STAGES IN DATABASE haven_store_uat TO ROLE _haven_store_uat__usage;
GRANT USAGE ON ALL STAGES IN DATABASE haven_store_uat TO ROLE _haven_store_uat__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE haven_store_uat TO ROLE _haven_store_uat__usage;
GRANT USAGE ON ALL FILE FORMATS IN DATABASE haven_store_uat TO ROLE _haven_store_uat__usage;

GRANT ROLE _haven_store_uat__schema to ROLE haven_dbt_transform_uat;


SHOW GRANTS TO ROLE HAVEN_DBT_TRANSFORM_UAT;
