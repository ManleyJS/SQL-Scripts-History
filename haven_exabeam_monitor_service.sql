USE ROLE sysadmin;

CREATE WAREHOUSE haven_exabeam_monitor_medium WITH WAREHOUSE_SIZE = 'medium' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE WAREHOUSE haven_exabeam_monitor_xsmall WITH WAREHOUSE_SIZE = 'xsmall' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create OR REPLACE role haven_exabeam_monitor_service;

CREATE ROLE _haven_exabeam_monitor_medium__warehouse__operator;
CREATE ROLE _haven_exabeam_monitor_medium__warehouse__usage;

CREATE ROLE _haven_exabeam_monitor_xsmall__warehouse__operator;
CREATE ROLE _haven_exabeam_monitor_xsmall__warehouse__usage;

create user haven_exabeam_monitor_service
login_name = 'haven.exabeam.monitor.service'
display_name = 'Haven Exabeam Monitor Service'
email = 'jonathan.manley@bourne-leisure.co.uk'
comment = 'Haven Exabeam Monitor Service Account'
default_role = haven_exabeam_monitor_service
default_warehouse = haven_exabeam_monitor_medium;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_exabeam_monitor_medium to role _haven_exabeam_monitor_medium__warehouse__usage;
grant role _haven_exabeam_monitor_medium__warehouse__usage to role _haven_exabeam_monitor_medium__warehouse__operator;
grant operate, modify on warehouse haven_exabeam_monitor_medium to role _haven_exabeam_monitor_medium__warehouse__operator;

grant usage, monitor on warehouse haven_exabeam_monitor_xsmall to role _haven_exabeam_monitor_xsmall__warehouse__usage;
grant role _haven_exabeam_monitor_xsmall__warehouse__usage to role _haven_exabeam_monitor_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_exabeam_monitor_xsmall to role _haven_exabeam_monitor_xsmall__warehouse__operator;

GRANT ROLE _haven_exabeam_monitor_medium__warehouse__usage TO ROLE haven_exabeam_monitor_service;
GRANT ROLE _haven_exabeam_monitor_xsmall__warehouse__usage TO ROLE haven_exabeam_monitor_service;
GRANT ROLE _haven_master__exabeam_monitor__reader TO ROLE haven_exabeam_monitor_service;
GRANT ROLE haven_exabeam_monitor_service TO USER haven_exabeam_monitor_service;
GRANT ROLE haven_exabeam_monitor_service TO USER jonathanmanley;

GRANT ROLE _haven_exabeam_monitor_medium__warehouse__operator TO ROLE dba;

USE ROLE dba;


SELECT * FROM SNOWFLAKE.account_usage.query_history LIMIT 10; 
SELECT * FROM SNOWFLAKE.account_usage.login_history LIMIT 10;
SELECT * FROM SNOWFLAKE.account_usage.sessions LIMIT 10;

SELECT min(created_on)
FROM SNOWFLAKE.account_usage.sessions LIMIT 10;

SELECT min(s)
FROM SNOWFLAKE.account_usage.query_history LIMIT 10;

SELECT count(*)
FROM SNOWFLAKE.account_usage.query_history;

SELECT count(*)
FROM SNOWFLAKE.account_usage.sessions ;

USE ROLE securityadmin;

USE ROLE useradmin;

-- jonathanbradley
-- jonathan.bradley@bourne-leisure.co.uk
-- Head of Information Security

create user jonathanBradley
login_name = 'jonathan.bradley@bourne-leisure.co.uk'
display_name = 'jonathan Bradley'
email = 'jonathan.bradley@bourne-leisure.co.uk'
comment = 'Head of Information Security'
default_role = haven_exabeam_monitor_service
default_warehouse = haven_exabeam_monitor_xsmall;

-- timothystraughan
-- timothy.straughan@bourne-leisure.co.uk
-- Security Engineer

create user timothystraughan
login_name = 'timothy.straughan@bourne-leisure.co.uk'
display_name = 'Timothy Straughan'
email = 'timothy.straughan@bourne-leisure.co.uk'
comment = 'Security Engineer'
default_role = haven_exabeam_monitor_service
default_warehouse = haven_exabeam_monitor_xsmall;

-- philchambers
-- phil.chambers@haven.com
-- Security Engineer

create user philchambers
login_name = 'phil.chambers@haven.com'
display_name = 'Phil Chambers'
email = 'phil.chambers@haven.com'
comment = 'Security Engineer'
default_role = haven_exabeam_monitor_service
default_warehouse = haven_exabeam_monitor_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_exabeam_monitor_service TO USER jonathanBradley;
GRANT ROLE haven_exabeam_monitor_service TO USER timothystraughan;  
GRANT ROLE haven_exabeam_monitor_service TO USER philchambers;

