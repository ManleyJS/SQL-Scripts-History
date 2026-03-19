USE DATABASE bourne_store;
USE SCHEMA finance_shared_services;

USE ROLE useradmin;

CREATE ROLE bourne_finance_shared_services;
CREATE ROLE _bourne_finance_shared_services_xsmall__warehouse__operator;
CREATE ROLE _bourne_finance_shared_services_xsmall__warehouse__usage;

USE ROLE sysadmin;

CREATE WAREHOUSE bourne_finance_shared_services_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE securityadmin;

grant usage, monitor on warehouse bourne_finance_shared_services_xsmall to role _bourne_finance_shared_services_xsmall__warehouse__usage;
grant role _bourne_finance_shared_services_xsmall__warehouse__usage to role _bourne_finance_shared_services_xsmall__warehouse__operator;
grant operate, modify on warehouse bourne_finance_shared_services_xsmall to role _bourne_finance_shared_services_xsmall__warehouse__operator;
 
GRANT ROLE _bourne_store__finance_shared_services__reader TO ROLE bourne_finance_shared_services;
GRANT ROLE _bourne_finance_shared_services_xsmall__warehouse__usage TO ROLE bourne_finance_shared_services;

USE ROLE dba;