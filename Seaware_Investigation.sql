use role sysadmin;

CREATE WAREHOUSE haven_seaware_investigation_warehouse_xs WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE sysadmin;
CREATE DATABASE haven_seaware_investigation;

USE ROLE useradmin;

CREATE ROLE _haven_seaware_investigation__usage;
CREATE ROLE _haven_seaware_investigation__schema;
create role _haven_seaware_investigation_warehouse_xs__warehouse__operator;
create role _haven_seaware_investigation_warehouse_xs__warehouse__usage;

CREATE ROLE haven_seaware_investigation;
CREATE ROLE haven_seaware_investigation_davidcook;

create user davidcook
login_name = 'david.cook@bourne-leisure.co.uk'
display_name = 'David Cook'
email = 'david.cook@bourne-leisure.co.uk'
comment = 'Haven Seaware Discovery'
default_role = haven_seaware_investigation_davidcook;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_seaware_investigation_warehouse_xs to role _haven_seaware_investigation_warehouse_xs__warehouse__usage;
grant role _haven_seaware_investigation_warehouse_xs__warehouse__usage to role _haven_seaware_investigation_warehouse_xs__warehouse__operator;
grant operate, modify on warehouse haven_seaware_investigation_warehouse_xs to role _haven_seaware_investigation_warehouse_xs__warehouse__operator;
GRANT ROLE _haven_seaware_investigation_warehouse_xs__warehouse__usage TO ROLE haven_seaware_investigation;

GRANT USAGE ON DATABASE haven_seaware_investigation TO ROLE _haven_seaware_investigation__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_seaware_investigation TO ROLE _haven_seaware_investigation__usage;
GRANT SELECT ON future TABLES IN DATABASE haven_seaware_investigation TO ROLE _haven_seaware_investigation__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_seaware_investigation TO ROLE _haven_seaware_investigation__usage;
GRANT SELECT ON all VIEWS IN DATABASE haven_seaware_investigation TO ROLE _haven_seaware_investigation__usage;
GRANT ROLE _haven_seaware_investigation__usage TO ROLE _haven_seaware_investigation__schema;
GRANT CREATE SCHEMA ON DATABASE haven_seaware_investigation TO ROLE _haven_seaware_investigation__schema;

GRANT ROLE _haven_seaware_investigation__usage TO ROLE haven_seaware_investigation;
GRANT ROLE _haven_raw__seaware__reader TO  ROLE haven_seaware_investigation;
GRANT ROLE _haven_raw__seaware_restore__reader TO  ROLE haven_seaware_investigation;
GRANT ROLE _haven_raw__seaware_clone_03102022__reader TO  ROLE haven_seaware_investigation;

GRANT ROLE haven_seaware_investigation TO ROLE  haven_seaware_investigation_davidcook;
GRANT ROLE _haven_seaware_investigation__schema  TO ROLE  haven_seaware_investigation_davidcook;

USE ROLE useradmin;
DROP USER haven_seaware_investigation_test;
create user haven_seaware_investigation_test
login_name = 'haven.seaware.investigation.test'
password = '<REDACTED>'
display_name = 'Seaware Investigation Test'
comment = 'Haven Seaware Investigation Discovery'
default_role = haven_seaware_investigation_testuser
DEFAULT_WAREHOUSE = haven_seaware_investigation_warehouse_xs;

CREATE ROLE haven_seaware_investigation_testuser;

USE ROLE securityadmin;
GRANT ROLE haven_seaware_investigation TO ROLE  haven_seaware_investigation_testuser;
GRANT ROLE _haven_seaware_investigation__schema  TO ROLE  haven_seaware_investigation_testuser;
GRANT ROLE haven_seaware_investigation_testuser TO USER haven_seaware_investigation_test;

GRANT ROLE haven_seaware_investigation_davidcook TO USER davidcook;

SHOW GRANTS TO USER johngoodwin;
SHOW GRANTS TO ROLE usage_monitor;
SHOW GRANTS TO ROLE _monitor_system_usage;

GRANT ROLE usage_monitor TO USER simonjones;

