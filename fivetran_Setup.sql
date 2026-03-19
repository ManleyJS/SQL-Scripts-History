use role sysadmin;

create warehouse haven_fivetran_dataload_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 30 
AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'ECONOMY';

use role useradmin;

create role haven_fivetran_dataload;

create user haven_fivetran_dataload
password = '<REDACTED>' 
login_name = 'haven.fivetran.dataload'
display_name = 'haven fivetran Data Load'
default_role = haven_fivetran_dataload
default_warehouse = haven_fivetran_dataload_xsmall
default_namespace = haven_raw;

CREATE ROLE _haven_fivetran_dataload_xsmall__warehouse__usage;
CREATE ROLE _haven_fivetran_dataload_xsmall__warehouse__operator;

use role securityadmin;

grant usage, monitor on warehouse haven_fivetran_dataload_xsmall to role _haven_fivetran_dataload_xsmall__warehouse__usage;
grant role _haven_fivetran_dataload_xsmall__warehouse__usage to role _haven_fivetran_dataload_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_fivetran_dataload_xsmall to role _haven_fivetran_dataload_xsmall__warehouse__operator;
GRANT ROLE _haven_fivetran_dataload_xsmall__warehouse__usage TO ROLE haven_fivetran_dataload;

grant role _haven_raw__workforce_sam__creator to role haven_fivetran_dataload;
grant role haven_fivetran_dataload to user haven_fivetran_dataload;

SHOW GRANTS TO ROLE haven_fivetran_dataload;

SHOW ROLES LIKE '_haven_raw__%';
SHOW GRANTS TO ROLE _haven_raw__create;

use role useradmin;

CREATE ROLE _bourne_raw__create;

SHOW GRANTS TO ROLE _bourne_raw__create;

use role securityadmin;

GRANT CREATE SCHEMA, MONITOR ON DATABASE bourne_raw TO ROLE _bourne_raw__create;

GRANT ROLE _haven_raw__create TO ROLE haven_fivetran_dataload; 


