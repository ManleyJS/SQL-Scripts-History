use role securityadmin;

create role taskadmin;

-- set the active role to ACCOUNTADMIN before granting the EXECUTE TASK privilege to the new role
use role accountadmin;

grant execute task on account to role taskadmin;

-- set the active role to SECURITYADMIN to show that this role can grant a role to another role
use role securityadmin;

grant role taskadmin to role dba;

use role useradmin;

create role digital_operations;
create role _haven__haven_store_digital_operations__warehouse__usage;
create role _haven__haven_store_digital_operations__warehouse__operator;

use role securityadmin;

grant role _haven_store__digital__creator to role digital_operations;
grant role _haven__haven_store_digital_operations__warehouse__usage to role digital_operations;

use role sysadmin;

create warehouse haven_store_digital_operations_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 30 
AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'ECONOMY';

alter warehouse BOURNE_CDC_DATALOAD_XSMALL set warehouse_size = 'SMALL';

grant usage on warehouse haven_store_digital_operations_xsmall to role _haven__haven_store_digital_operations__warehouse__usage;

grant role digital_operations to role dba;

use role dba;

show stages;


list @s3_digital_extract;

show roles like '%batch%';
use role securityadmin;
show users;

show grants to role haven_batch_dataload;

use role securityadmin;
alter user hvr_cdc_training10 set password='<REDACTED>';