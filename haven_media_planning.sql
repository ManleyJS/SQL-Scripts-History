USE ROLE sysadmin;

CREATE WAREHOUSE haven_Media_Planning_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_Media_Planning_warehouse_xsmall__operator;
create role _haven_Media_Planning_warehouse_xsmall__usage;

create role haven_Media_Planning;

-- Natalia Mutanova
-- natalia.mutanova@haven.com
-- Media Planning Lead

create user NataliaMutanova
login_name = 'natalia.mutanova@haven.com'
display_name = 'Natalia Mutanova'
email = 'natalia.mutanova@haven.com'
comment = 'Media Planning Lead'
default_role = haven_Media_Planning 
DEFAULT_WAREHOUSE = haven_Media_Planning_warehouse_xsmall;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_Media_Planning_warehouse_xsmall to role _haven_Media_Planning_warehouse_xsmall__usage;
grant role _haven_Media_Planning_warehouse_xsmall__usage to role _haven_Media_Planning_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_Media_Planning_warehouse_xsmall to role _haven_Media_Planning_warehouse_xsmall__operator;


GRANT ROLE _haven_Media_Planning_warehouse_xsmall__usage TO ROLE haven_Media_Planning;
GRANT ROLE _haven_store__performance_marketing__reader TO ROLE haven_Media_Planning;
GRANT ROLE _haven_store_uat__performance_marketing__reader TO ROLE haven_Media_Planning;

GRANT ROLE haven_Media_Planning TO USER NataliaMutanova;

GRANT ROLE haven_Media_Planning TO ROLE dba;

-- 25/10/2024 Cleaning up haven_media_planning and replacing it with haven_performance_marketing 

USE ROLE securityadmin;

revoke ROLE haven_Media_Planning from USER NataliaMutanova;
revoke ROLE haven_Media_Planning from ROLE dba;

USE ROLE useradmin;

DROP role _haven_Media_Planning_warehouse_xsmall__operator;
drop role _haven_Media_Planning_warehouse_xsmall__usage;

drop role haven_Media_Planning;

USE ROLE sysadmin;

drop WAREHOUSE haven_Media_Planning_warehouse_xsmall; 