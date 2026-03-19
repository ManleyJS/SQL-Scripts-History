use ROLE sysadmin;


CREATE WAREHOUSE haven_arcade_integration_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE useradmin;

create role _haven_arcade_integration_warehouse_xsmall__operator;
create role _haven_arcade_integration_warehouse_xsmall__usage;

CREATE ROLE haven_arcade_integration;

-- ChristianHaddrell
-- Christian.Haddrell@haven.com
-- Integration Engineer

create USER  ChristianHaddrell
login_name = 'Christian.Haddrell@haven.com'
display_name = 'Christian Haddrell'
email = 'Christian.Haddrell@haven.com'
comment = 'Integrations Engineer'
default_warehouse = haven_arcade_integration_warehouse_xsmall
default_role = haven_arcade_integration
default_secondary_roles = ();

-- JohnFitzgerald
-- John.Fitzgerald@haven.com
-- Integration Engineer

create USER  JohnFitzgerald
login_name = 'John.Fitzgerald@haven.com'
display_name = 'John Fitzgerald'
email = 'John.Fitzgerald@haven.com'
comment = 'Integrations Engineer'
default_warehouse = haven_arcade_integration_warehouse_xsmall
default_role = haven_arcade_integration
default_secondary_roles = ();

use ROLE securityadmin;

grant usage, monitor on warehouse haven_arcade_integration_warehouse_xsmall to role _haven_arcade_integration_warehouse_xsmall__usage;
grant role _haven_arcade_integration_warehouse_xsmall__usage to role _haven_arcade_integration_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_arcade_integration_warehouse_xsmall to role _haven_arcade_integration_warehouse_xsmall__operator;

GRANT ROLE _haven_arcade_integration_warehouse_xsmall__usage TO ROLE haven_arcade_integration;

GRANT ROLE _haven_base__playsafe__reader TO ROLE haven_arcade_integration;

GRANT ROLE haven_arcade_integration TO USER ChristianHaddrell;
GRANT ROLE haven_arcade_integration TO USER JohnFitzgerald;

GRANT ROLE haven_arcade_integration TO USER donovanransome;
GRANT ROLE haven_arcade_integration TO ROLE  dba;

use ROLE haven_arcade_integration;

show databases;

use DATABASE haven_base;

show schemas;

use SCHEMA playsafe;

show tables;
show views;