USE ROLE sysadmin;

CREATE WAREHOUSE haven_fivetran_logs_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE useradmin;

CREATE ROLE haven_fivetran_logs;
create OR REPLACE role _haven_fivetran_logs_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _haven_fivetran_logs_warehouse_xsmall__warehouse__usage;

CREATE ROLE _haven_master__usage;
CREATE ROLE _haven_master__schema;

--pete.richardson@haven.com
--pete.richardson

create user haven_fivetran_logs_service_account
login_name = 'haven.fivetran.logs.service.account'
display_name = 'Haven Fivetran Logs Service Account'
email = 'jonathan.manley@bourrne-leisure.co.uk'
password = '<REDACTED>'
comment = 'Haven Fivetran Logs Service Account'
default_role = haven_fivetran_logs
default_warehouse = haven_fivetran_logs_warehouse_xsmall;

USE ROLE securityadmin;

GRANT USAGE ON DATABASE haven_master TO ROLE _haven_master__usage;
GRANT ROLE _haven_master__usage TO ROLE _haven_master__schema;
GRANT CREATE SCHEMA, MONITOR, USAGE ON DATABASE haven_master TO ROLE _haven_master__schema;
GRANT ROLE _haven_master__schema TO ROLE haven_fivetran_logs;

grant usage, monitor on warehouse haven_fivetran_logs_warehouse_xsmall to role _haven_fivetran_logs_warehouse_xsmall__warehouse__usage;
grant role _haven_fivetran_logs_warehouse_xsmall__warehouse__usage to role _haven_fivetran_logs_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_fivetran_logs_warehouse_xsmall to role _haven_fivetran_logs_warehouse_xsmall__warehouse__operator;

GRANT role _haven_fivetran_logs_warehouse_xsmall__warehouse__usage TO ROLE haven_fivetran_logs;

GRANT ROLE haven_fivetran_logs TO USER haven_fivetran_logs_service_account;
GRANT ROLE haven_fivetran_logs TO ROLE dba;

USE ROLE accountadmin;
GRANT CREATE integration ON ACCOUNT to role haven_fivetran_logs;

GRANT ROLE _haven_master__fivetran_logs__creator TO ROLE haven_fivetran_logs; 

USE ROLE haven_fivetran_logs;

USE ROLE securityadmin;

SHOW GRANTS TO USER johnpering;

GRANT ROLE _haven_master__fivetran_logs__reader TO ROLE BOURNE_CDC_DATALOAD_SCHEMA_VIEWER;  
GRANT ROLE _haven_master__fivetran_metadata__reader TO ROLE BOURNE_CDC_DATALOAD_SCHEMA_VIEWER;

USE ROLE haven_fivetran_logs;
