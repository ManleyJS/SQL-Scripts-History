USE ROLE useradmin;
--Raheel.Tahir@bourne-leisure.co.uk
--Raheel Tahir
create user RaheelTahir
login_name = 'Raheel.Tahir@bourne-leisure.co.uk'
display_name = 'Raheel Tahir'
email = 'Raheel.Tahir@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--Joseph.Evans@bourne-leisure.co.uk
--Joseph Evans
create user JosephEvans
login_name = 'Joseph.Evans@bourne-leisure.co.uk'
display_name = 'Joseph Evans'
email = 'Joseph.Evans@bourne-leisure.co.uk'
comment = 'Lead Consultant'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

ALTER USER RaheelTahir SET default_role = warner_guest_commercial, default_warehouse = warner_guest_commercial_warehouse_xsmall;
ALTER USER JosephEvans SET default_role = warner_guest_commercial, default_warehouse = warner_guest_commercial_warehouse_xsmall;

SHOW GRANTS TO ROLE warner_commercial;

use role sysadmin;

CREATE WAREHOUSE warner_guest_commercial_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE useradmin;
CREATE ROLE warner_guest_commercial;

create role _warner_guest_commercial_warehouse_xsmall__warehouse__operator;
create role _warner_guest_commercial_warehouse_xsmall__warehouse__usage;

USE ROLE securityadmin;

grant usage, monitor on warehouse warner_guest_commercial_warehouse_xsmall to role _warner_guest_commercial_warehouse_xsmall__warehouse__usage;
GRANT ROLE _warner_guest_commercial_warehouse_xsmall__warehouse__operator TO ROLE _warner_guest_commercial_warehouse_xsmall__warehouse__usage;
grant operate, modify on warehouse warner_guest_commercial_warehouse_xsmall to role _warner_guest_commercial_warehouse_xsmall__warehouse__operator;

revoke ROLE _warner_guest_commercial_warehouse_xsmall__warehouse__operator from ROLE warner_guest_commercial;
grant ROLE _warner_guest_commercial_warehouse_xsmall__warehouse__usage to ROLE warner_guest_commercial;
GRANT ROLE _warner_base__seaware__reader TO ROLE warner_guest_commercial;
GRANT ROLE _warner_store__aps_share__reader TO ROLE warner_guest_commercial;
GRANT ROLE _warner_base__ma_mart__reader TO ROLE warner_guest_commercial;
GRANT ROLE _warner_base__sas_scv__reader TO ROLE warner_guest_commercial;
GRANT ROLE _warner_base__ma_mart__reader TO ROLE warner_data_management;
GRANT ROLE _warner_base__sas_scv__reader TO ROLE warner_data_management;

grant role warner_guest_commercial to user RaheelTahir;
grant role warner_guest_commercial to user JosephEvans;


USE ROLE dba;
SHOW ROLES LIKE '_warner__%__reader';
SHOW ROLES LIKE 'warner_%';
SHOW GRANTS TO ROLE warner_data_management;

----- Set up special roles for developers --------

USE ROLE sysadmin;
CREATE DATABASE warner_guest_commercial;

USE ROLE useradmin;
CREATE ROLE _warner_guest_commercial__usage;
CREATE ROLE _warner_guest_commercial__schema;
CREATE ROLE warner_guest_commercial_RaheelTahir;
CREATE ROLE warner_guest_commercial_JosephEvans;

ALTER USER RaheelTahir SET default_role = warner_guest_commercial_RaheelTahir;
ALTER USER JosephEvans SET default_role = warner_guest_commercial_JosephEvans;

USE ROLE securityadmin;
GRANT USAGE ON DATABASE warner_guest_commercial TO ROLE _warner_guest_commercial__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE warner_guest_commercial TO ROLE _warner_guest_commercial__usage;
GRANT ROLE _warner_guest_commercial__usage TO ROLE _warner_guest_commercial__schema;
GRANT CREATE SCHEMA ON DATABASE warner_guest_commercial TO ROLE _warner_guest_commercial__schema;
GRANT SELECT ON future TABLES IN DATABASE warner_guest_commercial TO ROLE _warner_guest_commercial__usage;
GRANT SELECT ON future VIEWS IN DATABASE warner_guest_commercial TO ROLE _warner_guest_commercial__usage;
GRANT SELECT ON all VIEWS IN DATABASE warner_guest_commercial TO ROLE _warner_guest_commercial__usage;

REVOKE ROLE warner_guest_commercial from user RaheelTahir;
revoke role warner_guest_commercial from user JosephEvans;

grant role warner_guest_commercial to role warner_guest_commercial_RaheelTahir;
grant role warner_guest_commercial to role warner_guest_commercial_JosephEvans;

grant role _warner_guest_commercial__schema to role warner_guest_commercial_RaheelTahir;
grant role _warner_guest_commercial__schema to role warner_guest_commercial_JosephEvans;

GRANT ROLE warner_guest_commercial_RaheelTahir to USER RaheelTahir;
GRANT ROLE warner_guest_commercial_JosephEvans to USER JosephEvans;
