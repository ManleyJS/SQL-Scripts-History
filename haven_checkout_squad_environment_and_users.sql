use ROLE sysadmin;

CREATE WAREHOUSE haven_checkout_squad_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE DATABASE haven_checkout_squad;

USE ROLE USERADMIN;

CREATE ROLE _haven_checkout_squad__usage;
CREATE ROLE _haven_checkout_squad__schema;

create role _haven_checkout_squad_warehouse_xsmall__operator;
create role _haven_checkout_squad_warehouse_xsmall__usage;

CREATE ROLE haven_checkout_squad;
CREATE ROLE haven_checkout_squadeloper;


ALTER USER KevinRichards2  
SET default_role =  haven_checkout_squad,
DEFAULT_WAREHOUSE = haven_checkout_squad_warehouse_xsmall
;

use ROLE securityadmin;

-- DATABASE ROLE SETUP 

GRANT USAGE ON DATABASE haven_checkout_squad TO ROLE _haven_checkout_squad__usage;
GRANT USAGE ON ALL SCHEMAS IN DATABASE haven_checkout_squad  TO ROLE _haven_checkout_squad__usage;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE haven_checkout_squad  TO ROLE _haven_checkout_squad__usage;
GRANT select ON ALL tables IN DATABASE haven_checkout_squad  TO ROLE _haven_checkout_squad__usage;
GRANT select ON FUTURE tables IN DATABASE haven_checkout_squad  TO ROLE _haven_checkout_squad__usage;
GRANT select ON ALL views IN DATABASE haven_checkout_squad  TO ROLE _haven_checkout_squad__usage;
GRANT select ON FUTURE views IN DATABASE haven_checkout_squad  TO ROLE _haven_checkout_squad__usage;
GRANT select ON ALL materialized views IN DATABASE haven_checkout_squad  TO ROLE _haven_checkout_squad__usage;
GRANT select ON FUTURE materialized views IN DATABASE haven_checkout_squad  TO ROLE _haven_checkout_squad__usage;
GRANT USAGE ON ALL stages IN DATABASE haven_checkout_squad  TO ROLE _haven_checkout_squad__usage;
GRANT USAGE ON FUTURE stages IN DATABASE haven_checkout_squad  TO ROLE _haven_checkout_squad__usage;

GRANT ROLE _haven_checkout_squad__usage TO ROLE _haven_checkout_squad__schema;
GRANT CREATE SCHEMA ON DATABASE haven_checkout_squad TO ROLE _haven_checkout_squad__schema;

grant usage, monitor on WAREHOUSE haven_checkout_squad_warehouse_xsmall TO ROLE _haven_checkout_squad_warehouse_xsmall__usage;
grant operate, modify on warehouse haven_checkout_squad_warehouse_xsmall TO ROLE _haven_checkout_squad_warehouse_xsmall__operator;
GRANT ROLE _haven_checkout_squad_warehouse_xsmall__USAGE TO ROLE _haven_checkout_squad_warehouse_xsmall__operator;

GRANT ROLE _haven_checkout_squad_warehouse_xsmall__USAGE TO ROLE haven_checkout_squad;

GRANT ROLE _haven_checkout_squad__usage TO ROLE haven_checkout_squad;

GRANT ROLE _haven_store__availability__reader TO ROLE haven_checkout_squad;
GRANT ROLE _haven_store__caravans__reader TO ROLE haven_checkout_squad;
GRANT ROLE _haven_store__common__reader TO ROLE haven_checkout_squad;
GRANT ROLE _haven_store__holiday__reader TO ROLE haven_checkout_squad;

GRANT ROLE _haven_base__identity__reader TO ROLE haven_checkout_squad;
GRANT ROLE _haven_base__plot__reader TO ROLE haven_checkout_squad;
GRANT ROLE _haven_base__seaware__reader TO ROLE haven_checkout_squad;


GRANT ROLE haven_checkout_squad TO ROLE haven_checkout_squad_developer;
GRANT ROLE _haven_checkout_squad__schema TO ROLE haven_checkout_squad_developer;

GRANT ROLE haven_checkout_squad TO ROLE dba;
GRANT ROLE haven_checkout_squad_developer TO ROLE dba;
GRANT ROLE haven_checkout_squad TO USER donovanransome;

use ROLE securityadmin;
GRANT ROLE haven_checkout_squad TO USER kevinrichards2;
GRANT ROLE haven_checkout_squad_developer TO USER kevinrichards2;


use ROLE haven_checkout_squad;

SHOW databases;

use DATABASE haven_base;

SHOW SCHEMAs;

use DATABASE haven_store;

SHOW SCHEMAs;

use ROLE haven_checkout_squad_developer;

CREATE SCHEMA haven_checkout_squad.deleteme;
DROP SCHEMA haven_checkout_squad.deleteme;



----------

-- 
-- 
-- 

USE ROLE USERADMIN;

create USER  
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = haven_checkout_squad
DEFAULT_WAREHOUSE = haven_checkout_squad_warehouse_xsmall
TYPE = person
;

use ROLE securityadmin;

GRANT ROLE haven_checkout_squad TO USER 

