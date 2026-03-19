USE ROLE sysadmin;

CREATE WAREHOUSE haven_bloomreach_management_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE DATABASE haven_bloomreach_management;

USE ROLE useradmin;

create role haven_bloomreach_management_ROUANWILSENACH;
create role haven_bloomreach_management;

create OR REPLACE role _haven_bloomreach_management_warehouse_xsmall__operator;
create OR REPLACE role _haven_bloomreach_management_warehouse_xsmall__usage;

CREATE ROLE _haven_bloomreach_management__usage;
CREATE ROLE _haven_bloomreach_management__schema;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_bloomreach_management_warehouse_xsmall to role _haven_bloomreach_management_warehouse_xsmall__usage;
grant role _haven_bloomreach_management_warehouse_xsmall__usage to role _haven_bloomreach_management_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_bloomreach_management_warehouse_xsmall to role _haven_bloomreach_management_warehouse_xsmall__operator;

GRANT role _haven_bloomreach_management_warehouse_xsmall__usage TO ROLE haven_bloomreach_management;
GRANT ROLE haven_bloomreach_management TO ROLE DBA;

GRANT USAGE ON DATABASE haven_bloomreach_management TO ROLE _haven_bloomreach_management__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_bloomreach_management TO ROLE _haven_bloomreach_management__usage;
GRANT SELECT ON future TABLES IN DATABASE haven_bloomreach_management TO ROLE _haven_bloomreach_management__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_bloomreach_management TO ROLE _haven_bloomreach_management__usage;
GRANT SELECT ON future MATERIALIZED VIEWS IN DATABASE haven_bloomreach_management TO ROLE _haven_bloomreach_management__usage;
GRANT USAGE ON future STAGES IN DATABASE haven_bloomreach_management TO ROLE _haven_bloomreach_management__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE haven_bloomreach_management TO ROLE _haven_bloomreach_management__usage;
GRANT ROLE _haven_bloomreach_management__usage TO ROLE _haven_bloomreach_management__schema;
GRANT CREATE SCHEMA ON DATABASE haven_bloomreach_management TO ROLE _haven_bloomreach_management__schema;

GRANT ROLE _haven_base__bloomreach__reader TO ROLE haven_bloomreach_management;
GRANT ROLE _haven_bloomreach_management__schema  TO ROLE haven_bloomreach_management;

GRANT ROLE haven_bloomreach_management TO ROLE dba;
GRANT ROLE haven_bloomreach_management TO USER donovanransome;
GRANT ROLE haven_bloomreach_management TO USER ROUANWILSENACH;


-- 02/12/2024

USE ROLE useradmin;

create role haven_bloomreach_management_ROUANWILSENACH;


USE ROLE securityadmin;

GRANT ROLE _haven_base__bloomreach__reader TO ROLE haven_bloomreach_management;
GRANT ROLE _haven_bloomreach_management__usage  TO ROLE haven_bloomreach_management;

REVOKE ROLE _haven_bloomreach_management__schema  FROM ROLE haven_bloomreach_management;

GRANT ROLE _haven_bloomreach_management__schema  TO ROLE haven_bloomreach_management_ROUANWILSENACH;

REVOKE ROLE haven_bloomreach_management FROM USER ROUANWILSENACH;
GRANT ROLE haven_bloomreach_management TO ROLE haven_bloomreach_management_ROUANWILSENACH;

GRANT ROLE haven_bloomreach_management_ROUANWILSENACH TO USER ROUANWILSENACH;

SHOW GRANTS TO USER ROUANWILSENACH;

SHOW GRANTS TO ROLE HAVEN_BLOOMREACH_MANAGEMENT_ROUANWILSENACH;

SHOW GRANTS TO ROLE haven_bloomreach_management;