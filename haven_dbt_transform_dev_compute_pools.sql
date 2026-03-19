use role accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS haven_dbt_transform_dev_compute_pool_small
    MIN_NODES = 1
    MAX_NODES = 1
    INSTANCE_FAMILY = 'CPU_X64_S'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;


USE ROLE useradmin;

create role _haven_dbt_transform_dev_compute_pool_small__operator;
create role _haven_dbt_transform_dev_compute_pool_small__usage;

use ROLE securityadmin;

grant usage, monitor on compute pool haven_dbt_transform_dev_compute_pool_small TO ROLE _haven_dbt_transform_dev_compute_pool_small__usage;
grant operate, modify on compute pool haven_dbt_transform_dev_compute_pool_small TO ROLE _haven_dbt_transform_dev_compute_pool_small__operator;
GRANT ROLE _haven_dbt_transform_dev_compute_pool_small__usage TO ROLE _haven_dbt_transform_dev_compute_pool_small__operator;

GRANT CREATE service ON SCHEMA haven_store_dev.pitch_perfect TO ROLE haven_dbt_transform_dev;

GRANT ROLE _haven_dbt_transform_dev_compute_pool_small__usage TO ROLE haven_dbt_transform_dev;

-- 03/10/2025

use role accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS haven_dbt_transform_dev_compute_pool_medium
    MIN_NODES = 1
    MAX_NODES = 1
    INSTANCE_FAMILY = 'CPU_X64_M'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;


USE ROLE useradmin;

create role _haven_dbt_transform_dev_compute_pool_medium__operator;
create role _haven_dbt_transform_dev_compute_pool_medium__usage;

use ROLE securityadmin;

grant usage, monitor on compute pool haven_dbt_transform_dev_compute_pool_medium TO ROLE _haven_dbt_transform_dev_compute_pool_medium__usage;
grant operate, modify on compute pool haven_dbt_transform_dev_compute_pool_medium TO ROLE _haven_dbt_transform_dev_compute_pool_medium__operator;
GRANT ROLE _haven_dbt_transform_dev_compute_pool_medium__usage TO ROLE _haven_dbt_transform_dev_compute_pool_medium__operator;

GRANT ROLE _haven_dbt_transform_dev_compute_pool_medium__usage TO ROLE haven_dbt_transform_dev;

use ROLE accountadmin;

ALTER compute pool haven_dbt_transform_dev_compute_pool_medium
SET max_nodes = 4;

ALTER compute pool haven_dbt_transform_dev_compute_pool_small
SET max_nodes = 4;

SHOW compute pools;


-- 06/10/2025

use ROLE accountadmin;

ALTER compute pool haven_dbt_transform_dev_compute_pool_small
SET max_nodes = 6;


use role accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS haven_dbt_transform_dev_compute_pool_four_node_SMALL
    MIN_NODES = 1
    MAX_NODES = 4
    INSTANCE_FAMILY = 'CPU_X64_M'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;


USE ROLE useradmin;

create role _haven_dbt_transform_dev_compute_pool_four_node_small__operator;
create role _haven_dbt_transform_dev_compute_pool_four_node_small__usage;

use ROLE securityadmin;

grant usage, monitor on compute pool haven_dbt_transform_dev_compute_pool_four_node_small TO ROLE _haven_dbt_transform_dev_compute_pool_four_node_small__usage;
grant operate, modify on compute pool haven_dbt_transform_dev_compute_pool_four_node_small TO ROLE _haven_dbt_transform_dev_compute_pool_four_node_small__operator;
GRANT ROLE _haven_dbt_transform_dev_compute_pool_four_node_small__usage TO ROLE _haven_dbt_transform_dev_compute_pool_four_node_small__operator;

GRANT ROLE _haven_dbt_transform_dev_compute_pool_four_node_small__usage TO ROLE haven_dbt_transform_dev;


SHOW compute pools;
