use role sysadmin;

CREATE WAREHOUSE haven_unit_weeks_warehouse_xs WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

--USE ROLE sysadmin;
--CREATE DATABASE haven_unit_weeks;

USE ROLE useradmin;

--CREATE ROLE _haven_unit_weeks__usage;
--CREATE ROLE _haven_unit_weeks__schema;
create role _haven_unit_weeks_warehouse_xs__warehouse__operator;
create role _haven_unit_weeks_warehouse_xs__warehouse__usage;

CREATE ROLE haven_unit_weeks;
--CREATE ROLE haven_unit_weeks_davidcook;

create user benmackey
login_name = 'ben.mackey@bourne-leisure.co.uk'
display_name = 'Ben MacKey'
email = 'ben.mackey@bourne-leisure.co.uk'
comment = 'Haven Unit Week Discovery'
default_role = haven_unit_weeks;

create user MarkJank
login_name = 'mark.jank@bourne-leisure.co.uk'
display_name = 'Mark Jank'
email = 'mark.jank@bourne-leisure.co.uk'
comment = 'Demand & Data Analyst Purchasing'
default_role = haven_unit_weeks
default_warehouse = haven_unit_weeks_warehouse_xs;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_unit_weeks_warehouse_xs to role _haven_unit_weeks_warehouse_xs__warehouse__usage;
grant role _haven_unit_weeks_warehouse_xs__warehouse__usage to role _haven_unit_weeks_warehouse_xs__warehouse__operator;
grant operate, modify on warehouse haven_unit_weeks_warehouse_xs to role _haven_unit_weeks_warehouse_xs__warehouse__operator;
GRANT ROLE _haven_unit_weeks_warehouse_xs__warehouse__usage TO ROLE haven_unit_weeks;

--GRANT USAGE ON DATABASE haven_unit_weeks TO ROLE _haven_unit_weeks__usage;
--GRANT USAGE ON future SCHEMAS IN DATABASE haven_unit_weeks TO ROLE _haven_unit_weeks__usage;
--GRANT SELECT ON future TABLES IN DATABASE haven_unit_weeks TO ROLE _haven_unit_weeks__usage;
--GRANT SELECT ON future VIEWS IN DATABASE haven_unit_weeks TO ROLE _haven_unit_weeks__usage;
--GRANT SELECT ON all VIEWS IN DATABASE haven_unit_weeks TO ROLE _haven_unit_weeks__usage;
--GRANT ROLE _haven_unit_weeks__usage TO ROLE _haven_unit_weeks__schema;
--GRANT CREATE SCHEMA ON DATABASE haven_unit_weeks TO ROLE _haven_unit_weeks__schema;

--GRANT ROLE _haven_unit_weeks__usage TO ROLE haven_unit_weeks;
GRANT ROLE _haven_store__caravans__reader TO  ROLE haven_unit_weeks;
GRANT ROLE _haven_store__trooper__reader TO  ROLE haven_unit_weeks;
--GRANT ROLE _haven_raw__seaware_clone_03102022__reader TO  ROLE haven_unit_weeks;

--GRANT ROLE haven_unit_weeks TO ROLE  haven_unit_weeks_davidcook;
--GRANT ROLE _haven_unit_weeks__schema  TO ROLE  haven_unit_weeks_davidcook;

USE ROLE useradmin;

create user haven_unit_weeks_test
login_name = 'haven.unit.weeks.test'
password = '<REDACTED>'
display_name = 'Haven Unit Weeks Test'
comment = 'Haven Unit Weeks Discovery'
default_role = haven_unit_weeks
DEFAULT_WAREHOUSE = haven_unit_weeks_warehouse_xs;

--CREATE ROLE haven_unit_weeks_testuser;

USE ROLE securityadmin;
--GRANT ROLE haven_unit_weeks TO ROLE  haven_unit_weeks_testuser;
--GRANT ROLE _haven_unit_weeks__schema  TO ROLE  haven_unit_weeks_testuser;

GRANT ROLE haven_unit_weeks TO USER benmackey;
GRANT ROLE haven_unit_weeks TO USER haven_unit_weeks_test;

USE ROLE useradmin;

create user markjank
login_name = 'mark.jank@bourne-leisure.co.uk'
display_name = 'Mark jank'
email = 'mark.jank@bourne-leisure.co.uk'
comment = 'Haven Unit Week Discovery'
default_role = haven_unit_weeks;

USE ROLE securityadmin;
--GRANT ROLE haven_unit_weeks TO ROLE  haven_unit_weeks_testuser;
--GRANT ROLE _haven_unit_weeks__schema  TO ROLE  haven_unit_weeks_testuser;

GRANT ROLE haven_unit_weeks TO USER markjank;

USE ROLE securityadmin;

SHOW USERS LIKE 'mark%';

SHOW GRANTS TO USER markjank;