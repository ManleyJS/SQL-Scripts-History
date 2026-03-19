USE ROLE sysadmin;

CREATE WAREHOUSE warner_dbt_transform_dev_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE WAREHOUSE warner_dbt_transform_dev_warehouse_xlarge WITH WAREHOUSE_SIZE = 'XLARGE' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _warner_dbt_transform_dev_warehouse_xsmall__warehouse__operator;
create role _warner_dbt_transform_dev_warehouse_xsmall__warehouse__usage;

create role _warner_dbt_transform_dev_warehouse_xlarge__warehouse__operator;
create role _warner_dbt_transform_dev_warehouse_xlarge__warehouse__usage;

CREATE ROLE warner_dbt_transform_dev;

create OR REPLACE user warner_dbt_transform_dev
login_name = 'warner.dbt.transform.dev'
display_name = 'Warner DBT transform dev'
comment = 'Warner DBT transform development service account'
default_role = warner_dbt_transform_dev
default_warehouse = warner_dbt_transform_dev_warehouse_xsmall
password = '<REDACTED>';

--show USERS LIKE '%warner%';

USE ROLE securityadmin;

grant usage, monitor on warehouse warner_dbt_transform_dev_warehouse_xsmall to role _warner_dbt_transform_dev_warehouse_xsmall__warehouse__usage;
grant role _warner_dbt_transform_dev_warehouse_xsmall__warehouse__usage to role _warner_dbt_transform_dev_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse warner_dbt_transform_dev_warehouse_xsmall to role _warner_dbt_transform_dev_warehouse_xsmall__warehouse__operator;

grant usage, monitor on warehouse warner_dbt_transform_dev_warehouse_xlarge to role _warner_dbt_transform_dev_warehouse_xlarge__warehouse__usage;
grant role _warner_dbt_transform_dev_warehouse_xlarge__warehouse__usage to role _warner_dbt_transform_dev_warehouse_xlarge__warehouse__operator;
grant operate, modify on warehouse warner_dbt_transform_dev_warehouse_xlarge to role _warner_dbt_transform_dev_warehouse_xlarge__warehouse__operator;

GRANT ROLE _warner_bus_dev__usage TO ROLE warner_dbt_transform_dev;
GRANT ROLE _warner_dbt_transform_dev_warehouse_xsmall__warehouse__usage TO ROLE warner_dbt_transform_dev;
GRANT ROLE _warner_dbt_transform_dev_warehouse_xlarge__warehouse__usage TO ROLE warner_dbt_transform_dev;

GRANT USAGE ON future SCHEMAS IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;
GRANT USAGE ON all SCHEMAS IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON future TABLES IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON all TABLES IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON future VIEWS IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON all VIEWS IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;

GRANT CREATE TABLE ON ALL SCHEMAS IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;
GRANT CREATE TABLE ON FUTURE SCHEMAS IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;

GRANT CREATE VIEW ON ALL SCHEMAS IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;
GRANT CREATE VIEW ON FUTURE SCHEMAS IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;

GRANT INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;
GRANT INSERT, UPDATE, DELETE, TRUNCATE ON FUTURE TABLES IN DATABASE warner_bus_dev TO ROLE warner_dbt_transform_dev;

GRANT ROLE warner_dbt_transform_dev TO ROLE dba;

GRANT ROLE warner_dbt_transform_dev TO USER warner_dbt_transform_dev;

------ WARNER_BASE_DEV
GRANT ROLE _warner_base_dev__usage TO ROLE warner_dbt_transform_dev;

GRANT USAGE ON future SCHEMAS IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;
GRANT USAGE ON all SCHEMAS IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON future TABLES IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON all TABLES IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON future VIEWS IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON all VIEWS IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;

GRANT CREATE TABLE ON ALL SCHEMAS IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;
GRANT CREATE TABLE ON FUTURE SCHEMAS IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;

GRANT CREATE VIEW ON ALL SCHEMAS IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;
GRANT CREATE VIEW ON FUTURE SCHEMAS IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;

GRANT INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;
GRANT INSERT, UPDATE, DELETE, TRUNCATE ON FUTURE TABLES IN DATABASE warner_base_dev TO ROLE warner_dbt_transform_dev;


---- WARNER_DWH_DEV
GRANT ROLE _warner_dwh_dev__usage TO ROLE warner_dbt_transform_dev;

GRANT USAGE ON future SCHEMAS IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;
GRANT USAGE ON all SCHEMAS IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON future TABLES IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON all TABLES IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON future VIEWS IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON all VIEWS IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;

GRANT CREATE TABLE ON ALL SCHEMAS IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;
GRANT CREATE TABLE ON FUTURE SCHEMAS IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;

GRANT CREATE VIEW ON ALL SCHEMAS IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;
GRANT CREATE VIEW ON FUTURE SCHEMAS IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;

GRANT INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;
GRANT INSERT, UPDATE, DELETE, TRUNCATE ON FUTURE TABLES IN DATABASE warner_dwh_dev TO ROLE warner_dbt_transform_dev;


---- WARNER_EXCP_DEV
GRANT ROLE _warner_excp_dev__usage TO ROLE warner_dbt_transform_dev;

GRANT USAGE ON future SCHEMAS IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;
GRANT USAGE ON all SCHEMAS IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON future TABLES IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON all TABLES IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON future VIEWS IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON all VIEWS IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;

GRANT CREATE TABLE ON ALL SCHEMAS IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;
GRANT CREATE TABLE ON FUTURE SCHEMAS IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;

GRANT CREATE VIEW ON ALL SCHEMAS IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;
GRANT CREATE VIEW ON FUTURE SCHEMAS IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;

GRANT INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;
GRANT INSERT, UPDATE, DELETE, TRUNCATE ON FUTURE TABLES IN DATABASE warner_excp_dev TO ROLE warner_dbt_transform_dev;

-----WARNER_STORE_DEV
GRANT ROLE _warner_store_dev__usage TO ROLE warner_dbt_transform_dev;

GRANT USAGE ON future SCHEMAS IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;
GRANT USAGE ON all SCHEMAS IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON future TABLES IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON all TABLES IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON future VIEWS IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;
GRANT SELECT ON all VIEWS IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;

GRANT CREATE TABLE ON ALL SCHEMAS IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;
GRANT CREATE TABLE ON FUTURE SCHEMAS IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;

GRANT CREATE VIEW ON ALL SCHEMAS IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;
GRANT CREATE VIEW ON FUTURE SCHEMAS IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;

GRANT INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;
GRANT INSERT, UPDATE, DELETE, TRUNCATE ON FUTURE TABLES IN DATABASE warner_store_dev TO ROLE warner_dbt_transform_dev;

USE ROLE warner_dbt_transform_dev;
USE WAREHOUSE warner_dbt_transform_dev_warehouse_xsmall;

CREATE TABLE WARNER_BASE_DEV.SUMIT_DEV.deleteme (cola int);
DROP TABLE DELETEME ;
SELECT * FROM WARNER_BASE_DEV.SUMIT_DEV.deleteme;

USE SCHEMA warner_base_dev.sumit_dev;
SHOW TABLES;

USE ROLE warner_terraform_transform_dev;
USE WAREHOUSE warner_terraform_transform_dev_warehouse_xsmall;

CREATE SCHEMA warner_excp_dev.deleteme;

USE ROLE warner_dbt_transform_dev;
USE WAREHOUSE warner_dbt_transform_dev_warehouse_xsmall;

CREATE TABLE WARNER_excp_DEV.DELETEME.deleteme (cola int);
DROP TABLE deleteme;
DROP schema warner_excp_dev.deleteme;

USE ROLE warner_terraform_transform_dev;
USE WAREHOUSE warner_terraform_transform_dev_warehouse_xsmall;
DROP schema warner_excp_dev.deleteme;

