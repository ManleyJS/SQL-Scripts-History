use role sysadmin;

CREATE WAREHOUSE vanlife_4cassociates_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1;

use role useradmin;

create role sales_vanlife_planner;
create role _vanlife_4cassociates_warehouse_xsmall__usage;
create role _vanlife_4cassociates_warehouse_xsmall__operator;

use role securityadmin;

grant MONITOR, usage on warehouse vanlife_4cassociates_warehouse_xsmall to role _vanlife_4cassociates_warehouse_xsmall__usage;
grant role _vanlife_4cassociates_warehouse_xsmall__usage to role _vanlife_4cassociates_warehouse_xsmall__operator;
GRANT MODIFY, OPERATE on warehouse vanlife_4cassociates_warehouse_xsmall TO ROLE _vanlife_4cassociates_warehouse_xsmall__operator;

show roles like '%warehouse%';
grant role _haven_store__sales_planner__reader to role sales_vanlife_planner;
grant role _vanlife_4cassociates_warehouse_xsmall__usage to role sales_vanlife_planner;

grant role sales_vanlife_planner to user simonjones;
grant role sales_vanlife_planner to role dba;

use role dba;

use role sales_vanlife_planner;