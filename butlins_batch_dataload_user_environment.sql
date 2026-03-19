use role useradmin;

CREATE ROLE _bourne_batch_dataload__warehouse__usage;
create ROLE _bourne_batch_dataload__warehouse__operator;

CREATE ROLE bourne_batch_dataload;
CREATE ROLE butlins_batch_dataload;
CREATE ROLE warner_batch_dataload;

USE ROLE useradmin;
 
create user butlins_batch_dataload
password = 'ButlinsBatch202!' 
login_name = 'butlins.batch.dataload'
display_name = 'Butlins Batch Data Load'
default_role = butlins_batch_dataload
default_warehouse = bourne_batch_dataload_xsmall
default_namespace = butlins_store;

use role sysadmin;

CREATE DATABASE bourne_store;
CREATE DATABASE butlins_store;
CREATE DATABASE warner_store;

create warehouse bourne_batch_dataload_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 30 
AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'ECONOMY';

grant usage on warehouse bourne_batch_dataload_xsmall to role _bourne_batch_dataload__warehouse__usage;
GRANT ROLE _bourne_batch_dataload__warehouse__usage TO ROLE _bourne_batch_dataload__warehouse__operator;
GRANT MODIFY, MONITOR, OPERATE ON WAREHOUSE bourne_batch_dataload_xsmall TO ROLE _bourne_batch_dataload__warehouse__operator;


USE ROLE securityadmin;

REVOKE ROLE _HAVEN_BATCH_DATALOAD__WAREHOUSE__USAGE FROM ROLE haven_batch_dataload;
GRANT ROLE _bourne_batch_dataload__warehouse__usage TO ROLE haven_batch_dataload;

DROP ROLE _HAVEN_BATCH_DATALOAD__WAREHOUSE__OPERATOR;
DROP ROLE _HAVEN_BATCH_DATALOAD__WAREHOUSE__USAGE;

GRANT ROLE _bourne_batch_dataload__warehouse__usage TO ROLE bourne_batch_dataload;
GRANT ROLE _bourne_batch_dataload__warehouse__usage TO ROLE butlins_batch_dataload;
GRANT ROLE _bourne_batch_dataload__warehouse__usage TO ROLE warner_batch_dataload;
GRANT ROLE _bourne_batch_dataload__warehouse__usage TO ROLE haven_batch_dataload;

GRANT ROLE butlins_batch_dataload TO USER butlins_batch_dataload;
GRANT ROLE bourne_batch_dataload TO USER bourne_batch_dataload;
GRANT ROLE warner_batch_dataload TO USER warner_batch_dataload;
