USE ROLE sysadmin;

CREATE WAREHOUSE haven_dbt_pricer_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_dbt_pricer_warehouse_xsmall__warehouse__operator;
create role _haven_dbt_pricer_warehouse_xsmall__warehouse__usage;

USE ROLE securityadmin;
grant usage, monitor on warehouse haven_dbt_pricer_warehouse_xsmall to role _haven_dbt_pricer_warehouse_xsmall__warehouse__usage;
grant role _haven_dbt_pricer_warehouse_xsmall__warehouse__usage to role _haven_dbt_pricer_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_dbt_pricer_warehouse_xsmall to role _haven_dbt_pricer_warehouse_xsmall__warehouse__operator;

GRANT ROLE _haven_dbt_pricer_warehouse_xsmall__warehouse__usage TO ROLE haven_dbt_transform;
GRANT ROLE _haven_dbt_pricer_warehouse_xsmall__warehouse__usage TO ROLE haven_data_transform_santoshnair;

USE ROLE accountadmin;

ALTER WAREHOUSE haven_dbt_transform_warehouse_xsmall
set max_cluster_count = 4, scaling_policy = standard;