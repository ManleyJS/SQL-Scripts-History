-- setting up initial permissions and role
-- https://www.snowflake.com/en/developers/guides/getting-started-with-openflow-spcs/

use role useradmin;

create role if not exists openflowadmin;

use role accountadmin;

GRANT CREATE DATABASE ON ACCOUNT TO ROLE OPENFLOWADMIN;
GRANT CREATE COMPUTE POOL ON ACCOUNT TO ROLE OPENFLOWADMIN;
GRANT CREATE INTEGRATION ON ACCOUNT TO ROLE OPENFLOWADMIN;
GRANT BIND SERVICE ENDPOINT ON ACCOUNT TO ROLE OPENFLOWADMIN;

CALL SYSTEM$BEHAVIOR_CHANGE_BUNDLE_STATUS('2025_06');

-- additional permissions from https://docs.snowflake.com/en/user-guide/data-integration/openflow/about-spcs
-- https://docs.snowflake.com/en/user-guide/data-integration/openflow/setup-openflow-spcs-sf

grant create role on account to role openflowadmin;

GRANT CREATE OPENFLOW DATA PLANE INTEGRATION ON ACCOUNT TO ROLE OPENFLOWADMIN;
GRANT CREATE OPENFLOW RUNTIME INTEGRATION ON ACCOUNT TO ROLE OPENFLOWADMIN;
GRANT CREATE COMPUTE POOL ON ACCOUNT TO ROLE OPENFLOWADMIN;

-- grant new openflowadmin role to system admins
grant role openflowadmin to role accountadmin;
grant role openflowadmin to role dba;


-- after creating a deployment setting up openflow dedicated event table
-- https://docs.snowflake.com/en/user-guide/data-integration/openflow/setup-openflow-spcs-deployment
--  
use role openflowadmin;

CREATE EVENT TABLE IF NOT EXISTS haven_master.openflow_events.EVENTS;
SHOW OPENFLOW DATA PLANE INTEGRATIONS;

ALTER OPENFLOW DATA PLANE INTEGRATION
  OPENFLOW_DATAPLANE_0B49C8AA_2402_4499_9B85_7EA23BAF6BDB
  SET EVENT_TABLE = 'HAVEN_MASTER.OPENFLOW_EVENTS.EVENTS';

-- creating openflow runtime
-- https://docs.snowflake.com/en/user-guide/data-integration/openflow/setup-openflow-spcs-create-rr

use role useradmin;
CREATE ROLE IF NOT EXISTS OPENFLOW_RUNTIME_TEST_DEPLOYMENT_ROLE;

USE ROLE securityadmin;

GRANT ROLE OPENFLOW_RUNTIME_TEST_DEPLOYMENT_ROLE TO ROLE OPENFLOWADMIN;

use role sysadmin;

CREATE WAREHOUSE openflow_runtime_test_deployment_warehouse_small WITH WAREHOUSE_SIZE = 'SMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 4 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _openflow_runtime_test_deployment_warehouse_small__operator;
create role _openflow_runtime_test_deployment_warehouse_small__usage;
create role _openflow_runtime_test_deployment_warehouse_small__monitor;


USE ROLE securityadmin;

grant usage, monitor on warehouse openflow_runtime_test_deployment_warehouse_small to role _openflow_runtime_test_deployment_warehouse_small__usage;
grant role _openflow_runtime_test_deployment_warehouse_small__usage to role _openflow_runtime_test_deployment_warehouse_small__operator;
grant operate, modify on warehouse openflow_runtime_test_deployment_warehouse_small to role _openflow_runtime_test_deployment_warehouse_small__operator;
grant monitor on warehouse openflow_runtime_test_deployment_warehouse_small to role _openflow_runtime_test_deployment_warehouse_small__monitor;

GRANT ROLE _openflow_runtime_test_deployment_warehouse_small__usage TO ROLE openflow_runtime_test_deployment_role;

grant ownership on role OPENFLOW_RUNTIME_TEST_DEPLOYMENT_ROLE to role openflowadmin revoke current grants;

grant role _training__training__creator to role OPENFLOW_RUNTIME_TEST_DEPLOYMENT_ROLE;

show roles like 'OPENFLOW%';
show grants to role OPENFLOW_RUNTIME_TEST_DEPLOYMENT_ROLE;
grant role 

use role openflowadmin;