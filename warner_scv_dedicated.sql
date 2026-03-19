USE ROLE sysadmin;

CREATE WAREHOUSE warner_scv_dedicated_warehouse_small WITH WAREHOUSE_SIZE = 'small' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

ALTER WAREHOUSE warner_scv_dedicated_warehouse_xsmall RENAME TO warner_scv_dedicated_warehouse_small;

use role useradmin;

drop role _warner_scv_dedicated_warehouse_xsmall__operator;
drop role _warner_scv_dedicated_warehouse_xsmall__usage;

create role _warner_scv_dedicated_warehouse_small__operator;
create role _warner_scv_dedicated_warehouse_small__usage;

USE ROLE securityadmin;

grant usage, monitor on warehouse warner_scv_dedicated_warehouse_small to role _warner_scv_dedicated_warehouse_small__usage;
grant role _warner_scv_dedicated_warehouse_small__usage to role _warner_scv_dedicated_warehouse_small__operator;
grant operate, modify on warehouse warner_scv_dedicated_warehouse_small to role _warner_scv_dedicated_warehouse_small__operator;

revoke ROLE _warner_scv_dedicated_warehouse_xsmall__usage from ROLE warner_dbt_transform_dev;
GRANT ROLE _warner_scv_dedicated_warehouse_small__usage TO ROLE warner_dbt_transform_dev;

