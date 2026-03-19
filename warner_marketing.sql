USE ROLE accountadmin;
SHOW USERS;

USE ROLE sysadmin;

CREATE WAREHOUSE warner_marketing_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE DATABASE warner_marketing;

use role useradmin;

create role _warner_marketing_warehouse_xsmall__warehouse__operator;
create role _warner_marketing_warehouse_xsmall__warehouse__usage;

CREATE ROLE _warner_marketing__usage;
CREATE ROLE _warner_marketing__schema;

CREATE ROLE warner_marketing_RaheelTahir;
CREATE ROLE warner_marketing_JosephEvans;

create role warner_marketing;

--Raheel Tahir Raheel.Tahir@bourne-leisure.co.uk
--DROP user RaheelTahir;
create user RaheelTahir
login_name = 'Raheel.Tahir@bourne-leisure.co.uk'
display_name = 'Raheel Tahir'
email = 'Raheel.Tahir@bourne-leisure.co.uk'
comment = 'Warner Marketing - Consultant'
default_role = warner_marketing
default_warehouse = warner_marketing_warehouse_xsmall;

--Joseph Evans Joseph.Evans@bourne-leisure.co.uk
--DROP USER JosephEvans;
create user JosephEvans
login_name = 'Joseph.Evans@bourne-leisure.co.uk'
display_name = 'Joseph Evans'
email = 'Joseph.Evans@bourne-leisure.co.uk'
comment = 'Warner Marketing - Lead Consultant'
default_role = warner_marketing
default_warehouse = warner_marketing_warehouse_xsmall;

use role securityadmin;

grant usage, monitor on warehouse warner_marketing_warehouse_xsmall to role _warner_marketing_warehouse_xsmall__warehouse__usage;
GRANT ROLE _warner_marketing_warehouse_xsmall__warehouse__usage to role _warner_marketing_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse warner_marketing_warehouse_xsmall to role _warner_marketing_warehouse_xsmall__warehouse__operator;

GRANT USAGE ON DATABASE warner_marketing TO ROLE _warner_marketing__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE warner_marketing TO ROLE _warner_marketing__usage;
GRANT ROLE _warner_marketing__usage TO ROLE _warner_marketing__schema;
GRANT CREATE SCHEMA ON DATABASE warner_marketing TO ROLE _warner_marketing__schema;
GRANT SELECT ON future TABLES IN DATABASE warner_marketing TO ROLE _warner_marketing__usage;
GRANT SELECT ON future VIEWS IN DATABASE warner_marketing TO ROLE _warner_marketing__usage;
GRANT SELECT ON all VIEWS IN DATABASE warner_marketing TO ROLE _warner_marketing__usage;

grant role _warner_base__qualtrics__reader to role warner_marketing;
grant role _warner_base__seaware__reader to role warner_marketing;
grant role _warner_base__maestro__reader to role warner_marketing;
GRANT ROLE _warner_store__APS_Share__reader  to role warner_marketing;
revoke role _warner_marketing_warehouse_xsmall__warehouse__operator from role warner_marketing;
grant role _warner_marketing_warehouse_xsmall__warehouse__usage to role warner_marketing;

grant role warner_marketing to role warner_marketing_RaheelTahir;
GRANT ROLE _warner_marketing__schema TO ROLE warner_marketing_RaheelTahir;
grant role warner_marketing to role warner_marketing_JosephEvans;
GRANT ROLE _warner_marketing__schema TO ROLE warner_marketing_JosephEvans;

GRANT ROLE warner_marketing_RaheelTahir to USER RaheelTahir;
GRANT ROLE warner_marketing_JosephEvans to USER JosephEvans;
