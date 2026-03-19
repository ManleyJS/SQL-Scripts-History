USE ROLE sysadmin;

CREATE WAREHOUSE haven_data_engineering_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 4 SCALING_POLICY = 'STANDARD';

CREATE WAREHOUSE haven_data_engineering_warehouse_medium WITH WAREHOUSE_SIZE = 'MEDIUM' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 4 SCALING_POLICY = 'STANDARD';


use role useradmin;

CREATE ROLE haven_data_engineering;

create role _haven_data_engineering_warehouse_xsmall__operator;
create role _haven_data_engineering_warehouse_xsmall__usage;

create role _haven_data_engineering_warehouse_medium__operator;
create role _haven_data_engineering_warehouse_medium__usage;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_data_engineering_warehouse_xsmall to role _haven_data_engineering_warehouse_xsmall__usage;
grant role _haven_data_engineering_warehouse_xsmall__usage to role _haven_data_engineering_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_data_engineering_warehouse_xsmall to role _haven_data_engineering_warehouse_xsmall__operator;

grant usage, monitor on warehouse haven_data_engineering_warehouse_medium to role _haven_data_engineering_warehouse_medium__usage;
grant role _haven_data_engineering_warehouse_medium__usage to role _haven_data_engineering_warehouse_medium__operator;
grant operate, modify on warehouse haven_data_engineering_warehouse_medium to role _haven_data_engineering_warehouse_medium__operator;

revoke role _haven_data_engineering_warehouse_xsmall__usage from role haven_dbt_development;

revoke role _haven_data_engineering_warehouse_medium__usage from role haven_dbt_development;

grant role _haven_data_engineering_warehouse_xsmall__usage to role haven_data_engineering;

grant role _haven_data_engineering_warehouse_medium__usage to role haven_data_engineering;


USE ROLE sysadmin;

CREATE DATABASE haven_data_engineering;

USE ROLE useradmin;

CREATE ROLE _haven_data_engineering__usage;
CREATE ROLE _haven_data_engineering__schema;

USE ROLE securityadmin;

GRANT USAGE ON DATABASE haven_data_engineering TO ROLE _haven_data_engineering__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_data_engineering TO ROLE _haven_data_engineering__usage;
GRANT SELECT ON future TABLES IN DATABASE haven_data_engineering TO ROLE _haven_data_engineering__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_data_engineering TO ROLE _haven_data_engineering__usage;
GRANT SELECT ON future MATERIALIZED VIEWS IN DATABASE haven_data_engineering TO ROLE _haven_data_engineering__usage;
GRANT SELECT ON future DYNAMIC TABLES IN DATABASE haven_data_engineering TO ROLE _haven_data_engineering__usage;
GRANT USAGE ON future STAGES IN DATABASE haven_data_engineering TO ROLE _haven_data_engineering__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE haven_data_engineering TO ROLE _haven_data_engineering__usage;
--GRANT SELECT ON future PIPES IN DATABASE haven_data_engineering TO ROLE _haven_data_engineering__usage;
GRANT ROLE _haven_data_engineering__usage TO ROLE _haven_data_engineering__schema;
GRANT CREATE SCHEMA ON DATABASE haven_data_engineering TO ROLE _haven_data_engineering__schema;

GRANT ROLE _haven_data_engineering__schema TO ROLE haven_data_engineering;

GRANT ROLE haven_data_engineering TO ROLE dba;

GRANT ROLE haven_data_engineering TO USER SARUNASJATAUTIS;
GRANT ROLE haven_data_engineering TO USER GARYRANSON;
GRANT ROLE haven_dbt_development TO USER GARYRANSON;

