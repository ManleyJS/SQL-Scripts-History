USE ROLE sysadmin;

CREATE WAREHOUSE bourne_dbt_transform_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE WAREHOUSE bourne_data_transform_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE DATABASE bourne_data_transform;

use role useradmin;

create OR REPLACE role bourne_dbt_transform;
create OR REPLACE role bourne_data_transform;

CREATE ROLE _bourne_data_transform_xsmall__warehouse__operator;
CREATE ROLE _bourne_data_transform_xsmall__warehouse__usage;

CREATE ROLE _bourne_dbt_transform_xsmall__warehouse__operator;
CREATE ROLE _bourne_dbt_transform_xsmall__warehouse__usage;

create OR REPLACE role _bourne_data_transform__usage;
create OR REPLACE role _bourne_data_transform__schema;

USE ROLE securityadmin;

grant usage, monitor on warehouse bourne_dbt_transform_xsmall to role _bourne_dbt_transform_xsmall__warehouse__usage;
grant role _bourne_dbt_transform_xsmall__warehouse__usage to role _bourne_dbt_transform_xsmall__warehouse__operator;
grant operate, modify on warehouse bourne_dbt_transform_xsmall to role _bourne_dbt_transform_xsmall__warehouse__operator;


revoke usage, monitor on warehouse bourne_data_transform_xsmall from role _bourne_data_transform_xsmall__warehouse__operator;
grant usage, monitor on warehouse bourne_data_transform_xsmall to role _bourne_data_transform_xsmall__warehouse__usage;
grant role _bourne_data_transform_xsmall__warehouse__usage to role _bourne_data_transform_xsmall__warehouse__operator;
grant operate, modify on warehouse bourne_data_transform_xsmall to role _bourne_data_transform_xsmall__warehouse__operator;

GRANT ROLE _bourne_dbt_transform_xsmall__warehouse__usage TO ROLE bourne_dbt_transform;
GRANT ROLE _bourne_data_transform_xsmall__warehouse__usage TO ROLE bourne_data_transform;

GRANT USAGE ON DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT ROLE _bourne_data_transform__usage TO ROLE _bourne_data_transform__schema;
GRANT CREATE SCHEMA ON DATABASE bourne_data_transform TO ROLE _bourne_data_transform__schema;
GRANT SELECT ON future TABLES IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT SELECT ON ALL TABLES IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT SELECT ON future VIEWS IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT SELECT ON all VIEWS IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT USAGE ON future STAGES IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT USAGE ON ALL STAGES IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT USAGE ON ALL FILE FORMATS IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;

GRANT ROLE bourne_dbt_transform TO ROLE dba;
GRANT ROLE bourne_data_transform TO ROLE dba;

USE ROLE dba;

USE ROLE bourne_data_transform;

USE ROLE useradmin;
create ROLE bourne_data_transform_johnpering;
create ROLE bourne_data_transform_garyranson;
create ROLE bourne_data_transform_jonathanmanley;

USE ROLE securityadmin;
GRANT ROLE _bourne_data_transform__usage TO ROLE bourne_data_transform;

GRANT ROLE bourne_data_transform TO ROLE bourne_data_transform_jonathanmanley;
GRANT ROLE _bourne_data_transform__schema TO ROLE bourne_data_transform_jonathanmanley;
grant ROLE bourne_data_transform_jonathanmanley TO USER jonathanmanley;

GRANT ROLE bourne_data_transform TO ROLE bourne_data_transform_garyranson;
GRANT ROLE _bourne_data_transform__schema TO ROLE bourne_data_transform_garyranson;
grant ROLE bourne_data_transform_garyranson TO USER garyranson;

GRANT ROLE bourne_data_transform TO ROLE bourne_data_transform_johnpering;
GRANT ROLE _bourne_data_transform__schema TO ROLE bourne_data_transform_johnpering;
grant ROLE bourne_data_transform_johnpering TO USER johnpering;


SHOW GRANTS TO USER jonathanmanley;
USE ROLE dba;
USE ROLE bourne_dbt_transform_jonathanmanley;
USE ROLE bourne_data_transform;
USE ROLE bourne_dbt_transform;

USE SCHEMA bourne_store.finance_shared_services;

CREATE TABLE bob (cola int);
DROP TABLE bob;

USE ROLE useradmin;

create user bourne_dbt_transform
login_name = 'bourne.dbt.transform'
password = 'LyQk08OGxaBtTfVb'
display_name = 'Bourne DBT Transform'
comment = 'Bourne DBT Transform'
default_role = bourne_dbt_transform
DEFAULT_WAREHOUSE = bourne_dbt_transform_xsmall;

CREATE ROLE _bourne_store__schema;

USE ROLE securityadmin;

GRANT ROLE _bourne_dbt_transform_xsmall__warehouse__usage TO ROLE bourne_dbt_transform;
GRANT ROLE _bourne_store__finance_shared_services__creator TO ROLE bourne_dbt_transform;
GRANT ROLE bourne_dbt_transform TO USER bourne_dbt_transform;

GRANT USAGE ON DATABASE bourne_store TO ROLE _bourne_store__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE bourne_store TO ROLE _bourne_store__usage;
GRANT ROLE _bourne_store__usage TO ROLE _bourne_store__schema;
GRANT CREATE SCHEMA ON DATABASE bourne_store TO ROLE _bourne_store__schema;
GRANT SELECT ON future TABLES IN DATABASE bourne_store TO ROLE _bourne_store__usage;
GRANT SELECT ON ALL TABLES IN DATABASE bourne_store TO ROLE _bourne_store__usage;
GRANT SELECT ON future VIEWS IN DATABASE bourne_store TO ROLE _bourne_store__usage;
GRANT SELECT ON all VIEWS IN DATABASE bourne_store TO ROLE _bourne_store__usage;
GRANT USAGE ON future STAGES IN DATABASE bourne_store TO ROLE _bourne_store__usage;
GRANT USAGE ON ALL STAGES IN DATABASE bourne_store TO ROLE _bourne_store__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE bourne_store TO ROLE _bourne_store__usage;
GRANT USAGE ON ALL FILE FORMATS IN DATABASE bourne_store TO ROLE _bourne_store__usage;

GRANT ROLE _bourne_store__schema TO ROLE bourne_dbt_transform;