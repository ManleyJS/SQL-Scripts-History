USE ROLE sysadmin;

CREATE WAREHOUSE haven_caravan_sales_xsmall WITH WAREHOUSE_SIZE = 'xsmall' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE DATABASE HAVEN_CARAVAN_SALES;

use role useradmin;

create role haven_caravan_sales;
CREATE ROLE _HAVEN_CARAVAN_SALES__USAGE;
CREATE ROLE _HAVEN_CARAVAN_SALES__SCHEMA;

CREATE ROLE _haven_caravan_sales_xsmall__warehouse__operator;
CREATE ROLE _haven_caravan_sales_xsmall__warehouse__usage;

-- tommessett
-- tom.messett@haven.com
-- 

create role haven_caravan_sales_TomMessett;

create user TomMessett
login_name = 'tom.messett@haven.com'
display_name = 'Tom Messett'
email = 'tom.messett@haven.com'
comment = 'Product consultant'
default_role = haven_caravan_sales_TomMessett 
default_warehouse = haven_caravan_sales_xsmall;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_caravan_sales_xsmall to role _haven_caravan_sales_xsmall__warehouse__usage;
grant role _haven_caravan_sales_xsmall__warehouse__usage to role _haven_caravan_sales_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_caravan_sales_xsmall to role _haven_caravan_sales_xsmall__warehouse__operator;

GRANT USAGE ON DATABASE haven_caravan_sales TO ROLE _haven_caravan_sales__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_caravan_sales TO ROLE _haven_caravan_sales__usage;
GRANT ROLE _haven_caravan_sales__usage TO ROLE _haven_caravan_sales__schema;
GRANT CREATE SCHEMA ON DATABASE haven_caravan_sales TO ROLE _haven_caravan_sales__schema;
GRANT SELECT ON future TABLES IN DATABASE haven_caravan_sales TO ROLE _haven_caravan_sales__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_caravan_sales TO ROLE _haven_caravan_sales__usage;
GRANT SELECT ON all VIEWS IN DATABASE haven_caravan_sales TO ROLE _haven_caravan_sales__usage;

GRANT ROLE _haven_caravan_sales_xsmall__warehouse__usage TO ROLE haven_caravan_sales;
GRANT ROLE _haven_caravan_sales__usage TO ROLE haven_caravan_sales;

GRANT ROLE _haven_base__freshsales__reader TO ROLE haven_caravan_sales;
grant role _haven_store__caravans__reader TO ROLE haven_caravan_sales;
grant role _haven_store__caravan_sales__reader TO ROLE haven_caravan_sales;
grant role _haven_store__common__reader TO ROLE haven_caravan_sales;
grant role _haven_store__holiday__reader TO ROLE haven_caravan_sales;
grant role _haven_store__identity__reader TO ROLE haven_caravan_sales;
grant role _haven_base__identity__reader TO ROLE haven_caravan_sales;
grant role _haven_base__consent_and_preference__reader TO ROLE haven_caravan_sales;
grant role _haven_store__performance_marketing__reader TO ROLE haven_caravan_sales;

grant ROLE haven_caravan_sales TO ROLE haven_caravan_sales_TomMessett;
grant ROLE _haven_caravan_sales__schema TO ROLE haven_caravan_sales_TomMessett;

GRANT ROLE haven_caravan_sales_TomMessett TO user TomMessett; 

GRANT ROLE haven_caravan_sales TO ROLE dba;
GRANT ROLE haven_caravan_sales_TomMessett TO ROLE dba;

USE ROLE securityadmin;
GRANT ROLE haven_caravan_sales TO USER donovanransome;

USE ROLE haven_caravan_sales_TomMessett;

USE DATABASE haven_caravan_sales;

CREATE SCHEMA bob;

DROP SCHEMA bob;


