USE ROLE sysadmin;

CREATE WAREHOUSE Haven_Seaware_product_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _Haven_Seaware_product_warehouse_xsmall__warehouse__operator;
create role _Haven_Seaware_product_warehouse_xsmall__warehouse__usage;

create role Haven_Seaware_product;

--Damian Meddings
--damian.meddings@haven.com
--Product Owner - Bookings
create user DamianMeddings
login_name = 'damian.meddings@haven.com'
display_name = 'Damian Meddings'
email = 'damian.meddings@haven.com'
comment = 'Product Owner - Bookings'
default_role = Haven_Seaware_product
default_warehouse = Haven_Seaware_product_warehouse_xsmall;

--Alex Dell
--alex.dell@haven.com
--Senior Product Operations
create user AlexDell
login_name = 'alex.dell@haven.com'
display_name = 'Alex Dell'
email = 'alex.dell@haven.com'
comment = 'Senior Product Operations'
default_role = Haven_Seaware_product
default_warehouse = Haven_Seaware_product_warehouse_xsmall;

--Luke Waller
--luke.waller@haven.com
--Product Operations
create USER LukeWaller 
login_name = 'luke.waller@haven.com'
display_name = 'Luke Waller'
email = 'luke.waller@haven.com'
comment = 'Product Operations'
default_role = Haven_Seaware_product
default_warehouse = Haven_Seaware_product_warehouse_xsmall;

--James Nicks
--james.nicks@haven.com
--Product Operations
create USER JamesNicks 
login_name = 'james.nicks@haven.com'
display_name = 'James Nicks'
email = 'james.nicks@haven.com'
comment = 'Product Operations'
default_role = Haven_Seaware_product
default_warehouse = Haven_Seaware_product_warehouse_xsmall;

--Jade North
--jade.north@haven.com
--Product Operations
create user JadeNorth
login_name = 'jade.north@haven.com'
display_name = 'Jade North'
email = 'jade.north@haven.com'
comment = 'Product Operations'
default_role = Haven_Seaware_product
default_warehouse = Haven_Seaware_product_warehouse_xsmall;

--Tom Evans
--tom.evans@haven.com
--Product Operations
create user TomEvans
login_name = 'tom.evans@haven.com'
display_name = 'Tom Evans'
email = 'tom.evans@haven.com'
comment = 'Product Operations'
default_role = Haven_Seaware_product
default_warehouse = Haven_Seaware_product_warehouse_xsmall;

use role securityadmin;

grant usage, monitor on warehouse Haven_Seaware_product_warehouse_xsmall to role _Haven_Seaware_product_warehouse_xsmall__warehouse__usage;
grant operate, modify on warehouse Haven_Seaware_product_warehouse_xsmall to role _Haven_Seaware_product_warehouse_xsmall__warehouse__operator;
grant role _Haven_Seaware_product_warehouse_xsmall__warehouse__usage to role _Haven_Seaware_product_warehouse_xsmall__warehouse__operator;

GRANT ROLE _haven_base__seaware__reader TO ROLE Haven_Seaware_product;
GRANT ROLE _Haven_Seaware_product_warehouse_xsmall__warehouse__usage TO ROLE Haven_Seaware_product;

GRANT ROLE Haven_Seaware_product TO USER DamianMeddings;
GRANT ROLE Haven_Seaware_product TO USER AlexDell;
GRANT ROLE Haven_Seaware_product TO USER LukeWaller;
GRANT ROLE Haven_Seaware_product TO USER JamesNicks;
GRANT ROLE Haven_Seaware_product TO USER JadeNorth;
GRANT ROLE Haven_Seaware_product TO USER TomEvans;

GRANT ROLE Haven_Seaware_product TO ROLE dba;

-- 29/11/2024

USE ROLE securityadmin;

GRANT ROLE _haven_base__equaliser__reader TO ROLE Haven_Seaware_product;

SHOW GRANTS TO ROLE Haven_Seaware_product;

-- 02/12/2024

USE ROLE securityadmin;

REVOKE ROLE _haven_base__equaliser__reader from ROLE Haven_Seaware_product;

SHOW GRANTS TO ROLE Haven_Seaware_product;

USE ROLE useradmin;




