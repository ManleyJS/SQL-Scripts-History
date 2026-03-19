USE ROLE sysadmin;

CREATE WAREHOUSE haven_procurement_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_procurement_warehouse_xsmall__warehouse__operator;
create role _haven_procurement_warehouse_xsmall__warehouse__usage;

use role sysadmin;
grant usage, monitor on warehouse haven_procurement_warehouse_xsmall to role _haven_procurement_warehouse_xsmall__warehouse__usage;
grant operate, modify on warehouse haven_procurement_warehouse_xsmall to role _haven_procurement_warehouse_xsmall__warehouse__operator;

use role useradmin;
create role haven_procurement;

-- colin.gower@haven.com 
create user colingower
login_name = 'colin.gower@haven.com'
display_name = 'colin gower'
email = 'colin.gower@haven.com'
comment = 'Caravan Planning Manager'
default_role = haven_procurement
default_warehouse = haven_procurement_warehouse_xsmall;

use role securityadmin;

grant role _haven_procurement_warehouse_xsmall__warehouse__usage to role _haven_procurement_warehouse_xsmall__warehouse__operator;
GRANT ROLE _haven_store__caravans__reader TO  role haven_procurement;
GRANT ROLE _haven_store__sales_planner__reader TO role haven_procurement;
grant role _haven_procurement_warehouse_xsmall__warehouse__operator to role haven_procurement;
grant role _haven_store__financial_cube__reader to role haven_procurement;
GRANT ROLE _haven_base__coupa__reader TO ROLE haven_procurement;

GRANT ROLE haven_procurement TO ROLE dba;

grant role haven_procurement to user colingower;

use role useradmin;

-- tejal.mistry@bourne-leisure.co.uk
create user tejalmistry
login_name = 'tejal.mistry@bourne-leisure.co.uk'
display_name = 'Tejal Mistry'
email = 'tejal.mistry@bourne-leisure.co.uk'
comment = 'Finance Business Partner - Procurement'
default_role = haven_procurement
default_warehouse = haven_procurement_warehouse_xsmall;

--mark.jank@bourne-leisure.co.uk

create user markjank
login_name = 'mark.jank@bourne-leisure.co.uk'
display_name = 'Mark Jank'
email = 'mark.jank@bourne-leisure.co.uk'
comment = 'Demand & Data Analyst'
default_role = haven_procurement
default_warehouse = haven_procurement_warehouse_xsmall;


alter user markjank
SET comment = 'Demand & Data Analyst',
default_role = haven_procurement,
default_warehouse = haven_procurement_warehouse_xsmall;

use role securityadmin;

SHOW USERS LIKE '%mistr%';
grant role haven_procurement to user tejalmistry;
grant role haven_procurement to user markjank;
