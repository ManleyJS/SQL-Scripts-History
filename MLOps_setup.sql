use ROLE sysadmin;

CREATE DATABASE haven_data_science_dev;

CREATE DATABASE haven_data_science;

CREATE WAREHOUSE haven_data_science_dev_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE WAREHOUSE haven_data_science_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE WAREHOUSE haven_rota_scheduling_build_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 2 SCALING_POLICY = 'STANDARD';

use ROLE accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS haven_rota_scheduling_inference_compute_pool_small
    MIN_NODES = 1
    MAX_NODES = 2
    INSTANCE_FAMILY = 'CPU_X64_S'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;

CREATE COMPUTE POOL IF NOT EXISTS haven_rota_scheduling_training_compute_pool_medium
    MIN_NODES = 1
    MAX_NODES = 2
    INSTANCE_FAMILY = 'CPU_X64_M'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;

USE ROLE useradmin;

CREATE ROLE _haven_data_science_dev__usage;
CREATE ROLE _haven_data_science_dev__schema;

CREATE ROLE _haven_data_science__usage;
CREATE ROLE _haven_data_science__schema;

create role _haven_data_science_dev_warehouse_xsmall__operator;
create role _haven_data_science_dev_warehouse_xsmall__usage;

create role _haven_data_science_warehouse_xsmall__operator;
create role _haven_data_science_warehouse_xsmall__usage;

create role _haven_rota_scheduling_build_warehouse_xsmall__operator;
create role _haven_rota_scheduling_build_warehouse_xsmall__usage;

create role _haven_rota_scheduling_inference_compute_pool_small__operator;
create role _haven_rota_scheduling_inference_compute_pool_small__usage;

create role _haven_rota_scheduling_training_compute_pool_medium__operator;
create role _haven_rota_scheduling_training_compute_pool_medium__usage;

CREATE ROLE haven_data_science_dev;
CREATE ROLE haven_data_science;

CREATE ROLE haven_rota_scheduling;

create user haven_data_science_pipeline
LOGIN_NAME = 'haven.data.science.pipeline'
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxEccxVvCsTZp7Rj+zi6T
UnFZOe5YkElBIL2JCxLQF4MnxiPuIQLGO1Oz8aFQc86Pkz4SfeDn4B+29g0yESER
CyJ/hafZHzmOX29Qzd1TV/r1Du0GXIVQ5uXfhViFHSq2xcOXgHXbVO6L/cE+sxum
c9f6XCLf5hDSdBQMdHGN6lY7JeXzQLM6XTHeIFnoFjJiQ9kA9Akj+F2e1Uw6P/sQ
KumV1mWYVvkd1WlsNtTo6C0TJhFUFVP2GTI9J9vDh1Vt7PM9191T7LmBu8hxNBp7
ROTfgEbb831O5TXiMDOHBc9XVWfVNq2OjcjIl/C0iMeeRm1tiNKRTWFcCIRw9gzZ
xQIDAQAB';

-- step 2 - commands above completed

use ROLE securityadmin;

-- DATABASE ROLE SETUP 

GRANT USAGE ON DATABASE haven_data_science_dev TO ROLE _haven_data_science_dev__usage;
GRANT USAGE ON ALL SCHEMAS IN DATABASE haven_data_science_dev  TO ROLE _haven_data_science_dev__usage;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE haven_data_science_dev  TO ROLE _haven_data_science_dev__usage;
GRANT select ON ALL tables IN DATABASE haven_data_science_dev  TO ROLE _haven_data_science_dev__usage;
GRANT select ON FUTURE tables IN DATABASE haven_data_science_dev  TO ROLE _haven_data_science_dev__usage;
GRANT select ON ALL views IN DATABASE haven_data_science_dev  TO ROLE _haven_data_science_dev__usage;
GRANT select ON FUTURE views IN DATABASE haven_data_science_dev  TO ROLE _haven_data_science_dev__usage;
GRANT select ON ALL materialized views IN DATABASE haven_data_science_dev  TO ROLE _haven_data_science_dev__usage;
GRANT select ON FUTURE materialized views IN DATABASE haven_data_science_dev  TO ROLE _haven_data_science_dev__usage;
GRANT USAGE ON ALL stages IN DATABASE haven_data_science_dev  TO ROLE _haven_data_science_dev__usage;
GRANT USAGE ON FUTURE stages IN DATABASE haven_data_science_dev  TO ROLE _haven_data_science_dev__usage;

GRANT USAGE ON ALL stages IN schema haven_data_science_dev.data_science  TO ROLE _haven_data_science_dev__usage;

GRANT ROLE _haven_data_science_dev__usage TO ROLE _haven_data_science_dev__schema;
GRANT CREATE SCHEMA ON DATABASE haven_data_science_dev TO ROLE _haven_data_science_dev__schema;

GRANT USAGE ON DATABASE haven_data_science TO ROLE _haven_data_science__usage;

GRANT ROLE _haven_data_science_dev__schema TO ROLE haven_data_science_dev;


-- WAREHOUSE ROLE SETUP

grant usage, monitor on WAREHOUSE haven_data_science_dev_warehouse_xsmall TO ROLE _haven_data_science_dev_warehouse_xsmall__USAGE;
grant operate, modify on warehouse haven_data_science_dev_warehouse_xsmall TO ROLE _haven_data_science_dev_warehouse_xsmall__operator;
GRANT ROLE _haven_data_science_dev_warehouse_xsmall__USAGE TO ROLE _haven_data_science_dev_warehouse_xsmall__operator;

grant usage, monitor on WAREHOUSE haven_data_science_warehouse_xsmall TO ROLE _haven_data_science_warehouse_xsmall__usage;
grant operate, modify on warehouse haven_data_science_warehouse_xsmall TO ROLE _haven_data_science_warehouse_xsmall__operator;
GRANT ROLE _haven_data_science_warehouse_xsmall__USAGE TO ROLE _haven_data_science_warehouse_xsmall__operator;

create role _haven_rota_scheduling_inference_compute_pool_small__operator;
create role _haven_rota_scheduling_inference_compute_pool_small__usage;

create role _haven_rota_scheduling_training_compute_pool_medium__operator;
create role _haven_rota_scheduling_training_compute_pool_medium__usage;

grant usage, monitor on WAREHOUSE haven_rota_scheduling_build_warehouse_xsmall TO ROLE _haven_rota_scheduling_build_warehouse_xsmall__USAGE;
grant operate, modify on warehouse haven_rota_scheduling_build_warehouse_xsmall TO ROLE _haven_rota_scheduling_build_warehouse_xsmall__operator;
GRANT ROLE _haven_rota_scheduling_build_warehouse_xsmall__USAGE TO ROLE _haven_rota_scheduling_build_warehouse_xsmall__operator;

grant usage, monitor on compute pool haven_rota_scheduling_inference_compute_pool_small TO ROLE _haven_rota_scheduling_inference_compute_pool_small__usage;
grant operate, modify on compute pool haven_rota_scheduling_inference_compute_pool_small TO ROLE _haven_rota_scheduling_inference_compute_pool_small__operator;
GRANT ROLE _haven_rota_scheduling_inference_compute_pool_small__usage TO ROLE _haven_rota_scheduling_inference_compute_pool_small__operator;

grant usage, monitor on compute pool haven_rota_scheduling_training_compute_pool_medium TO ROLE _haven_rota_scheduling_training_compute_pool_medium__usage;
grant operate, modify on compute pool haven_rota_scheduling_training_compute_pool_medium TO ROLE _haven_rota_scheduling_training_compute_pool_medium__operator;
GRANT ROLE _haven_rota_scheduling_training_compute_pool_medium__usage TO ROLE _haven_rota_scheduling_training_compute_pool_medium__operator;

GRANT ROLE _haven_data_science_dev_warehouse_xsmall__USAGE TO ROLE haven_data_science_dev;
GRANT ROLE _haven_data_science_warehouse_xsmall__usage TO ROLE haven_data_science;
GRANT ROLE _haven_rota_scheduling_build_warehouse_xsmall__USAGE TO ROLE haven_rota_scheduling;
GRANT ROLE _haven_rota_scheduling_inference_compute_pool_small__usage TO ROLE haven_rota_scheduling; 
GRANT ROLE _haven_rota_scheduling_training_compute_pool_medium__usage TO ROLE haven_rota_scheduling;

-- clone data science schema

use ROLE sysadmin;

DROP SCHEMA haven_data_science_dev.data_science;
DROP SCHEMA haven_data_science.data_science;


CREATE SCHEMA haven_data_science_dev.data_science clone haven_data_engineering.data_science include internal stages;
CREATE SCHEMA haven_data_science.data_science clone haven_data_engineering.data_science include internal stages;


-- added grant create schema for use by schema creation function - 2025/08/21

use ROLE securityadmin; 
GRANT CREATE SCHEMA ON DATABASE haven_data_science TO ROLE _haven_data_science__schema;

-- schema access in production

use ROLE securityadmin;
GRANT ROLE _haven_data_science__data_science__creator TO ROLE haven_data_science;

-- grant data science role to developers
 
use role securityadmin;

GRANT ROLE haven_data_science_dev TO ROLE dba;
GRANT ROLE haven_data_science_dev TO USER sarunasjatautis;

GRANT ROLE haven_data_science TO ROLE dba;
GRANT ROLE haven_data_science TO USER sarunasjatautis;

--GRANT CREATE NOTEBOOKS ON DATA SCIENCE SCHEMA TO DEV

GRANT CREATE notebook ON SCHEMA haven_data_Science_dev.data_science TO ROLE haven_data_science_dev;

-- rota scheduling role permissions

use ROLE securityadmin;

GRANT ROLE taskadmin TO role HAVEN_ROTA_SCHEDULING;
GRANT ROLE haven_rota_scheduling TO USER haven_data_science_pipeline;


GRANT ROLE _haven_store__common__reader TO role HAVEN_ROTA_SCHEDULING;
GRANT ROLE _haven_store__arrival__reader TO role HAVEN_ROTA_SCHEDULING;
GRANT ROLE _haven_store__retail__reader TO role HAVEN_ROTA_SCHEDULING;

GRANT ROLE _haven_data_science__rota_scheduling_footfall__creator TO ROLE haven_rota_scheduling;
GRANT ROLE _haven_data_science__rota_scheduling_revenue_fb__creator TO ROLE haven_rota_scheduling;

GRANT ROLE haven_rota_scheduling TO ROLE dba;
GRANT ROLE haven_rota_scheduling TO USER sarunasjatautis;

-- 22-08-2025

use ROLE securityadmin;

GRANT ROLE _haven_data_science__data_science__reader TO ROLE haven_rota_scheduling;

GRANT ROLE _haven_data_science__data_science__reader TO ROLE haven_data_science_dev;


GRANT ROLE _haven_data_science_dev__notebooks__creator TO ROLE haven_data_science_dev;
GRANT CREATE notebook ON SCHEMA haven_data_Science_dev.notebooks TO ROLE haven_data_science_dev;
REVOKE CREATE notebook ON SCHEMA haven_data_Science_dev.data_science from ROLE haven_data_science_dev;

grant CREATE TASK ON SCHEMA haven_data_science.rota_scheduling_footfall TO ROLE haven_rota_scheduling;
grant CREATE TASK ON SCHEMA haven_data_science.rota_scheduling_revenue_fb TO ROLE haven_rota_scheduling;

show roles like '%haven_data_science_dev%';

GRANT ROLE _haven_data_science_dev__data_science__creator TO ROLE haven_data_science_dev;

grant role _MET_OFFICE_POSTCODE_DATA__USAGE to role haven_data_science_dev;
grant role _MET_OFFICE_POSTCODE_DATA__USAGE to role haven_data_science;
grant role _MET_OFFICE_POSTCODE_DATA__USAGE to role haven_rota_scheduling;

SELECT current_role();

use ROLE securityadmin;

show grants TO ROLE haven_rota_scheduling;
show grants TO ROLE taskadmin;

use ROLE haven_rota_scheduling;
use SCHEMA haven_data_science.rota_scheduling_footfall;

show stages;

use ROLE securityadmin;

GRANT CREATE service ON SCHEMA haven_data_science.rota_scheduling_footfall TO ROLE haven_rota_scheduling;
GRANT CREATE service ON SCHEMA haven_data_science.rota_scheduling_revenue_fb TO ROLE haven_rota_scheduling;
GRANT CREATE service ON SCHEMA haven_data_science.data_science TO ROLE haven_rota_scheduling;

-- 28/08/2025

use role accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS haven_data_science_dev_compute_pool_small
    MIN_NODES = 1
    MAX_NODES = 2
    INSTANCE_FAMILY = 'CPU_X64_S'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;

CREATE COMPUTE POOL IF NOT EXISTS haven_data_science_dev_compute_pool_medium
    MIN_NODES = 1
    MAX_NODES = 2
    INSTANCE_FAMILY = 'CPU_X64_M'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;

CREATE COMPUTE POOL IF NOT EXISTS haven_data_science_compute_pool_small
    MIN_NODES = 1
    MAX_NODES = 2
    INSTANCE_FAMILY = 'CPU_X64_S'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;

CREATE COMPUTE POOL IF NOT EXISTS haven_data_science_compute_pool_medium
    MIN_NODES = 1
    MAX_NODES = 2
    INSTANCE_FAMILY = 'CPU_X64_M'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;



USE ROLE useradmin;

create role _haven_data_science_dev_compute_pool_small__operator;
create role _haven_data_science_dev_compute_pool_small__usage;

create role _haven_data_science_dev_compute_pool_medium__operator;
create role _haven_data_science_dev_compute_pool_medium__usage;

create role _haven_data_science_compute_pool_small__operator;
create role _haven_data_science_compute_pool_small__usage;

create role _haven_data_science_compute_pool_medium__operator;
create role _haven_data_science_compute_pool_medium__usage;

use ROLE securityadmin;

grant usage, monitor on compute pool haven_data_science_dev_compute_pool_small TO ROLE _haven_data_science_dev_compute_pool_small__usage;
grant operate, modify on compute pool haven_data_science_dev_compute_pool_small TO ROLE _haven_data_science_dev_compute_pool_small__operator;
GRANT ROLE _haven_data_science_dev_compute_pool_small__usage TO ROLE _haven_data_science_dev_compute_pool_small__operator;

grant usage, monitor on compute pool haven_data_science_dev_compute_pool_medium TO ROLE _haven_data_science_dev_compute_pool_medium__usage;
grant operate, modify on compute pool haven_data_science_dev_compute_pool_medium TO ROLE _haven_data_science_dev_compute_pool_medium__operator;
GRANT ROLE _haven_data_science_dev_compute_pool_medium__usage TO ROLE _haven_data_science_dev_compute_pool_medium__operator;


grant usage, monitor on compute pool haven_data_science_compute_pool_small TO ROLE _haven_data_science_compute_pool_small__usage;
grant operate, modify on compute pool haven_data_science_compute_pool_small TO ROLE _haven_data_science_compute_pool_small__operator;
GRANT ROLE _haven_data_science_compute_pool_small__usage TO ROLE _haven_data_science_compute_pool_small__operator;

grant usage, monitor on compute pool haven_data_science_compute_pool_medium TO ROLE _haven_data_science_compute_pool_medium__usage;
grant operate, modify on compute pool haven_data_science_compute_pool_medium TO ROLE _haven_data_science_compute_pool_medium__operator;
GRANT ROLE _haven_data_science_compute_pool_medium__usage TO ROLE _haven_data_science_compute_pool_medium__operator;

grant role _haven_data_science_dev_compute_pool_small__usage to role haven_data_science_dev; 
grant role _haven_data_science_dev_compute_pool_medium__usage to role haven_data_science_dev;
grant role _haven_data_science_compute_pool_small__usage to role haven_data_science; 
grant role _haven_data_science_compute_pool_medium__usage to role haven_data_science;

GRANT CREATE service ON SCHEMA haven_data_science_dev.data_science TO ROLE haven_data_science_dev;
GRANT CREATE service ON SCHEMA haven_data_science.data_science TO ROLE haven_data_science;


-- 02/09/2025

use ROLE securityadmin;

GRANT ROLE haven_data_science_dev TO USER balintnemeth;

-- 03/09/2025

use role useradmin;

show users;

use ROLE securityadmin;
GRANT ROLE haven_data_science_dev TO USER PETERZENTAI;
GRANT ROLE haven_data_science_dev TO USER ROLANDNAGY;

--03/09/2025

use ROLE securityadmin;
GRANT ROLE taskadmin TO ROLE haven_data_science_dev;



-- 08/09/2025

use ROLE accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS haven_data_science_dev_compute_pool_large
    MIN_NODES = 1
    MAX_NODES = 4
    INSTANCE_FAMILY = 'CPU_X64_L'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;

ALTER compute pool haven_data_science_dev_compute_pool_medium
SET max_nodes = 4;

use ROLE useradmin;

create role _haven_data_science_dev_compute_pool_large__operator;
create role _haven_data_science_dev_compute_pool_large__usage;

use ROLE securityadmin;

grant usage, monitor on compute pool haven_data_science_dev_compute_pool_large TO ROLE _haven_data_science_dev_compute_pool_large__usage;
grant operate, modify on compute pool haven_data_science_dev_compute_pool_large TO ROLE _haven_data_science_dev_compute_pool_large__operator;
GRANT ROLE _haven_data_science_dev_compute_pool_large__usage TO ROLE _haven_data_science_dev_compute_pool_large__operator;

grant role _haven_data_science_dev_compute_pool_large__usage to role haven_data_science_dev;

-- 18/09/2025

use ROLE accountadmin;

ALTER compute pool HAVEN_ROTA_SCHEDULING_INFERENCE_COMPUTE_POOL_SMALL
SET max_nodes = 4;

ALTER compute pool HAVEN_ROTA_SCHEDULING_TRAINING_COMPUTE_POOL_MEDIUM
SET max_nodes = 6;

-- 25/09/2025

use role securityadmin;

GRANT ROLE haven_data_science TO USER balintnemeth;
GRANT ROLE haven_data_science TO USER rolandnagy;
GRANT ROLE haven_data_science TO USER peterzentai;

use role securityadmin;

GRANT ROLE _haven_data_science__rota_scheduling_footfall__reader TO ROLE haven_data_science;

use ROLE haven_data_science;

use DATABASE haven_data_science;

show schemas;

use SCHEMA role_scheduling_footfall;

SHOW tables;
show stages;

-- 13/10/2025

use ROLE accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS haven_data_science_dev_compute_pool_nvidia_small
    MIN_NODES = 1
    MAX_NODES = 4
    INSTANCE_FAMILY = 'GPU_NV_S'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;

use ROLE useradmin;

create role _haven_data_science_dev_compute_pool_nvidia_small__operator;
create role _haven_data_science_dev_compute_pool_nvidia_small__usage;

use ROLE securityadmin;

grant usage, monitor on compute pool haven_data_science_dev_compute_pool_nvidia_small TO ROLE _haven_data_science_dev_compute_pool_nvidia_small__usage;
grant operate, modify on compute pool haven_data_science_dev_compute_pool_nvidia_small TO ROLE _haven_data_science_dev_compute_pool_nvidia_small__operator;
GRANT ROLE _haven_data_science_dev_compute_pool_nvidia_small__usage TO ROLE _haven_data_science_dev_compute_pool_nvidia_small__operator;

grant role _haven_data_science_dev_compute_pool_large__usage to role haven_data_science_dev;
grant role _haven_data_science_dev_compute_pool_nvidia_small__usage to role haven_data_science_dev;

-- 08/01/2026

use role securityadmin;

GRANT USAGE ON integration python_pip_access_integration TO ROLE haven_data_science_dev; 

use role accountadmin;
grant usage on integration python_pip_access_integration to role HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV;
grant usage on integration python_pip_access_integration to role HAVEN_ROTA_SCHEDULING;
grant usage on integration python_pip_access_integration to role HAVEN_DATA_SCIENCE_DEV;;

use role securityadmin;
grant role _HAVEN_STORE__WEATHER__reader to role HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV;


-- 14/01/2026

use ROLE accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS haven_rota_scheduling_compute_pool_nvidia_small
    MIN_NODES = 1
    MAX_NODES = 6
    INSTANCE_FAMILY = 'GPU_NV_S'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;

use ROLE useradmin;

create role _haven_rota_scheduling_compute_pool_nvidia_small__operator;
create role _haven_rota_scheduling_compute_pool_nvidia_small__usage;

use ROLE securityadmin;

grant usage, monitor on compute pool haven_rota_scheduling_compute_pool_nvidia_small TO ROLE _haven_rota_scheduling_compute_pool_nvidia_small__usage;
grant operate, modify on compute pool haven_rota_scheduling_compute_pool_nvidia_small TO ROLE _haven_rota_scheduling_compute_pool_nvidia_small__operator;
GRANT ROLE _haven_rota_scheduling_compute_pool_nvidia_small__usage TO ROLE _haven_rota_scheduling_compute_pool_nvidia_small__operator;

grant role _haven_rota_scheduling_compute_pool_nvidia_small__usage to role haven_rota_scheduling;

GRANT ROLE _haven_store__workforce__reader TO ROLE HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV;

