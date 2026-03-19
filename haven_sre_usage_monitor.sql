USE ROLE sysadmin;

CREATE WAREHOUSE haven_sre_usage_monitor_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_sre_usage_monitor_warehouse_xsmall__operator;
create role _haven_sre_usage_monitor_warehouse_xsmall__usage;

create role haven_sre_usage_monitor;

-- Paul Waller 
-- paul.waller@haven.com
-- Site Reliability Engineer

create user PaulWaller
login_name = 'paul.waller@haven.com'
display_name = 'Paul Waller'
email = 'paul.waller@haven.com'
comment = 'Site Reliability Engineer'
default_role = haven_sre_usage_monitor 
DEFAULT_WAREHOUSE = haven_sre_usage_monitor_warehouse_xsmall;

-- Laurent Douchy 
-- laurent.douchy@haven.com
-- Cloud Engineering Manager

create user LaurentDouchy
login_name = 'laurent.douchy@haven.com'
display_name = 'Laurent Douchy'
email = 'laurent.douchy@haven.com'
comment = 'Cloud Engineering Manager'
default_role = haven_sre_usage_monitor 
DEFAULT_WAREHOUSE = haven_sre_usage_monitor_warehouse_xsmall;

-- Ben Jones 
-- ben.jones3@haven.com
-- Site Reliability Engineer

create user BenJones
login_name = 'ben.jones3@haven.com'
display_name = 'Ben Jones'
email = 'ben.jones3@haven.com'
comment = 'Site Reliability Engineer'
default_role = haven_sre_usage_monitor 
DEFAULT_WAREHOUSE = haven_sre_usage_monitor_warehouse_xsmall;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_sre_usage_monitor_warehouse_xsmall to role _haven_sre_usage_monitor_warehouse_xsmall__usage;
grant role _haven_sre_usage_monitor_warehouse_xsmall__usage to role _haven_sre_usage_monitor_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_sre_usage_monitor_warehouse_xsmall to role _haven_sre_usage_monitor_warehouse_xsmall__operator;

USE role accountadmin;

USE DATABASE snowflake;

USE SCHEMA account_usage;

grant database role USAGE_VIEWER to ROLE haven_sre_usage_monitor;

USE ROLE securityadmin;

GRANT ROLE _haven_sre_usage_monitor_warehouse_xsmall__usage TO ROLE haven_sre_usage_monitor 
grant ROLE haven_sre_usage_monitor TO ROLE dba;

USE ROLE haven_sre_usage_monitor;

GRANT ROLE haven_sre_usage_monitor TO USER PaulWaller;
GRANT ROLE haven_sre_usage_monitor TO USER LaurentDouchy;
GRANT ROLE haven_sre_usage_monitor TO USER BenJones;

grant database role snowflake.OBJECT_VIEWER to ROLE haven_sre_usage_monitor;
grant database role snowflake.GOVERNANCE_VIEWER to ROLE haven_sre_usage_monitor;
grant database role snowflake.SECURITY_VIEWER to ROLE haven_sre_usage_monitor;

-- Grant ORGANIZATION_USAGE_VIEWER to the new role. Do this if you wish to collect Snowflake organization usage metrics.
grant database role ORGANIZATION_USAGE_VIEWER to ROLE haven_sre_usage_monitor;
-- Grant ORGANIZATION_BILLING_VIEWER to the new role. Do this if you wish to collect Snowflake cost data.

grant database role ORGANIZATION_BILLING_VIEWER to role haven_sre_usage_monitor;

SHOW GRANTS TO ROLE haven_sre_usage_monitor;

SHOW GRANTS OF ROLE haven_sre_usage_monitor;

use ROLE haven_sre_usage_monitor;

use warehouse haven_sre_usage_monitor_warehouse_xsmall;


