USE ROLE sysadmin;

CREATE WAREHOUSE haven_privacy_management_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE useradmin;

create role haven_privacy_management;

create OR REPLACE role _haven_privacy_management_warehouse_xsmall__operator;
create OR REPLACE role _haven_privacy_management_warehouse_xsmall__usage;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_privacy_management_warehouse_xsmall to role _haven_privacy_management_warehouse_xsmall__usage;
grant role _haven_privacy_management_warehouse_xsmall__usage to role _haven_privacy_management_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_privacy_management_warehouse_xsmall to role _haven_privacy_management_warehouse_xsmall__operator;

GRANT role _haven_privacy_management_warehouse_xsmall__usage TO ROLE haven_privacy_management;

GRANT ROLE _haven_base__ethyca_fides__reader TO ROLE haven_privacy_management;

GRANT ROLE haven_privacy_management TO ROLE dba;
GRANT ROLE haven_privacy_management TO USER donovanransome;
GRANT ROLE haven_privacy_management TO USER dangrainger;

use ROLE securityadmin;

GRANT ROLE haven_privacy_management TO USER johnhegarty;
GRANT ROLE haven_privacy_management TO USER garymalcolm;
GRANT ROLE haven_privacy_management TO USER danielcarter;



USE ROLE haven_privacy_management;
use SCHEMA haven_base.ethyca_fides;
SHOW views;
