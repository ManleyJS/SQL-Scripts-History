USE ROLE useradmin;

--CREATE ROLE _butlins_base__usage;
create role _haven_activities_reporting__warehouse__usage;
create role _haven_activities_reporting__warehouse__operator;

USE ROLE sysadmin;
create warehouse haven_activities_reporting_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 60 
AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'ECONOMY';

USE ROLE securityadmin;
grant MONITOR, usage on warehouse haven_activities_reporting_xsmall to role _haven_activities_reporting__warehouse__usage;
GRANT ROLE _haven_activities_reporting__warehouse__usage TO ROLE _haven_activities_reporting__warehouse__operator;
GRANT MODIFY, OPERATE on warehouse haven_activities_reporting_xsmall TO ROLE _haven_activities_reporting__warehouse__operator;

GRANT ROLE _haven_activities_reporting__warehouse__usage TO ROLE haven_activities_reporting;
GRANT ROLE haven_activities_reporting TO ROLE dba;


USE ROLE useradmin;
CREATE ROLE _warner_base__usage;

USE ROLE sysadmin;
grant usage on database warner_base to role _warner_base__usage;

USE ROLE useradmin;
CREATE ROLE _haven_base__usage;

USE ROLE sysadmin;
grant usage on database haven_base to role _haven_base__usage;

USE ROLE sysadmin;
CREATE DATABASE bourne_work;

USE ROLE securityadmin;
grant role _butlins_store__sas_pims__creator to role butlins_cdc_dataload;
grant role _butlins_store__sas_scv__creator to role butlins_cdc_dataload;

grant role _warner_store__sas_scv__creator to role warner_cdc_dataload;

REVOKE ROLE _butlins_store__sas_pims__creator from role butlins_batch_dataload;
revoke role _butlins_store__sas_scv__creator from role butlins_batch_dataload;

revoke role _warner_store__sas_scv__creator from role warner_batch_dataload;
revoke role _haven_store__sas_scv__creator from role haven_batch_dataload;

REVOKE ROLE _bourne_store__sas_common__creator from role bourne_batch_dataload;
revoke role _bourne_store__sas_scv__creator from role bourne_batch_dataload;

GRANT ROLE _bourne_store__sas_common__creator to role bourne_cdc_dataload;

SHOW GRANTS TO USER bourne_cdc_dataload;

USE ROLE useradmin;
 
create user bourne_cdc_dataload
password = '<REDACTED>' 
login_name = 'bourne.cdc.dataload'
display_name = 'Bourne CDC Data Load'
default_role = bourne_cdc_dataload
default_namespace = bourne_raw;

CREATE ROLE bourne_cdc_dataload;

GRANT ROLE _bourne_store__sas_common__creator to role bourne_cdc_dataload;
GRANT ROLE _bourne_cdc__warehouse__usage TO ROLE  bourne_cdc_dataload;

SHOW GRANTS TO ROLE butlins_cdc_dataload;

SHOW ROLES LIKE '%%cdc%usage';

SHOW GRANTS TO ROLE _butlins_cdc_dataload__warehouse__usage;

USE ROLE useradmin;
CREATE ROLE _bourne_cdc_dataload__warehouse__usage;
CREATE ROLE _bourne_store__usage;
USE ROLE securityadmin;
GRANT USAGE ON WAREHOUSE bourne_cdc_dataload_xsmall TO ROLE _bourne_cdc_dataload__warehouse__usage; 
GRANT ROLE _bourne_cdc_dataload__warehouse__usage TO ROLE bourne_cdc_dataload;
USE ROLE sysadmin;
GRANT USAGE ON DATABASE bourne_store TO ROLE _bourne_store__usage;
GRANT USAGE ON SCHEMA bourne_store.sas_common TO ROLE _bourne_store__sas_common__usage;
USE ROLE securityadmin;
GRANT ROLE _bourne_store__usage TO ROLE _bourne_store__sas_common__usage;
GRANT ROLE _bourne_store__sas_common__usage;
GRANT ROLE bourne_cdc_dataload TO USER bourne_cdc_dataload;

SHOW ROLES LIKE '%saS_COMMON%';

SHOW GRANTS TO ROLE _bourne_store__sas_common__USAGE;
SHOW GRANTS TO ROLE BOURNE_CDC_DATALOAD;