USE ROLE sysadmin;

USE DATABASE warner_dwh_dev;

DROP NETWORK RULE loqate_network_rule;

CREATE NETWORK RULE loqate_network_rule
TYPE = HOST_PORT
MODE = EGRESS
VALUE_LIST = ('api.addressy.com:443');
 
DROP SECRET loqate_secrets;

CREATE OR REPLACE SECRET loqate_secrets
TYPE = GENERIC_STRING
SECRET_STRING = 'JM18-UZ98-KJ47-YA68';
 
USE ROLE accountadmin;
DROP EXTERNAL ACCESS INTEGRATION loqate_api_access_integration;

CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION loqate_api_access_integration
ALLOWED_NETWORK_RULES = (loqate_network_rule)
ALLOWED_AUTHENTICATION_SECRETS = (loqate_secrets)
ENABLED = true;

GRANT USAGE ON integration loqate_api_access_integration TO ROLE warner_dbt_transform_dev;

USE ROLE useradmin;

SHOW GRANTS TO ROLE warner_api_integration;

SHOW ROLES LIKE '%warner_api_integration%';
CREATE ROLE warner_api_integration;

USE ROLE securityadmin;

GRANT USAGE ON DATABASE warner_dwh_dev TO ROLE warner_api_integration;
GRANT USAGE ON SCHEMA warner_dwh_dev.WARNER_BUS TO ROLE warner_api_integration;
GRANT CREATE NETWORK RULE ON SCHEMA warner_dwh_dev.WARNER_BUS TO ROLE warner_api_integration;

GRANT CREATE secret ON SCHEMA warner_dwh_dev.WARNER_BUS TO ROLE warner_api_integration;
USE ROLE accountadmin;
GRANT CREATE integration ON account TO ROLE warner_api_integration;

GRANT ROLE  warner_api_integration TO ROLE dba;

USE ROLE warner_api_integration;
DROP NETWORK RULE loqate_network_rule_test;
DROP NETWORK RULE loqate_network_rule;

USE schema warner_dwh_dev.warner_bus;
CREATE NETWORK RULE loqate_network_rule
TYPE = HOST_PORT
MODE = EGRESS
VALUE_LIST = ('api.addressy.com:443');
 
DROP SECRET loqate_secrets_test;
CREATE OR REPLACE SECRET loqate_secrets
TYPE = GENERIC_STRING
SECRET_STRING = 'JM18-UZ98-KJ47-YA68';
 
DROP EXTERNAL ACCESS INTEGRATION loqate_api_access_integration_test;

CREATE EXTERNAL ACCESS INTEGRATION loqate_api_access_integration
ALLOWED_NETWORK_RULES = (loqate_network_rule)
ALLOWED_AUTHENTICATION_SECRETS = (loqate_secrets)
ENABLED = true;

USE ROLE securityadmin;

GRANT ROLE warner_api_integration TO USER sunilsharma;

use ROLE warner_api_integration;

use SCHEMA warner_dwh_dev.warner_bus;

show secrets;

show network rules;

show integrations;

use ROLE securityadmin;

show grants TO USER sunilsharma;

GRANT ROLE warner_api_integration TO USER ;

use ROLE orgadmin;

show accounts;
show users;

use ROLE securityadmin;
REVOKE ROLE warner_api_integration FROM USER sunilsharma;
GRANT ROLE warner_api_integration TO USER sunilsharma;

show users LIKE 'sunil%';

USE ROLE sysadmin;

CREATE WAREHOUSE warner_api_integration_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _warner_api_integration_warehouse_xsmall__operator;
create role _warner_api_integration_warehouse_xsmall__usage;

USE ROLE securityadmin;

grant usage, monitor on warehouse warner_api_integration_warehouse_xsmall	 to role _warner_api_integration_warehouse_xsmall__usage;
grant role _warner_api_integration_warehouse_xsmall__usage to role _warner_api_integration_warehouse_xsmall__operator;
grant operate, modify on warehouse warner_api_integration_warehouse_xsmall to role _warner_api_integration_warehouse_xsmall__operator;

GRANT ROLE _warner_api_integration_warehouse_xsmall__usage TO ROLE warner_api_integration;

revoke ROLE _warner_api_integration_warehouse_xsmall__usage from ROLE warner_api_integration;

show grants TO USER sunilsharma;




