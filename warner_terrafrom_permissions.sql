USE ROLE useradmin;

CREATE ROLE warner_role_admin;

USE ROLE securityadmin;

SHOW GRANTS TO ROLE _WARNER_DBT_TRANSFO

grant usage on database warner_base_dev to role _warner_base_dev__usage with grant option;
grant usage on database warner_bus_dev to role _warner_bus_dev__usage with grant option;
grant usage on database warner_dwh_dev to role _warner_dwh_dev__usage with grant option;
grant usage on database warner_excp_dev to role _warner_excp_dev__usage with grant option;

grant USAGE, monitor ON WAREHOUSE WARNER_terraform_TRANSFORM_DEV_WAREHOUSE_XSMALL to ROLE _WARNER_terraform_TRANSFORM_DEV_WAREHOUSE_XSMALL__WAREHOUSE__USAGE with grant option; 
grant USAGE, monitor ON WAREHOUSE WARNER_BASE_DEV_DWH to ROLE _WARNER_BASE_DEV_DWH__WAREHOUSE__USAGE with grant option;

SHOW roles LIKE '_warner_%_dev_warehouse%';

GRANT CREATE ROLE ON ACCOUNT TO ROLE warner_role_admin;

GRANT ROLE warner_role_admin TO ROLE dba;
REVOKE ROLE warner_role_admin FROM ROLE warner_terraform_trnsform_dev;
GRANT ROLE warner_role_admin TO user warner_terraform_transfoarm_dev;
REVOKE ROLE warner_role_admin FROM USER warner_terraform_transform_dev;
GRANT ROLE warner_role_admin TO ROLE warner_terraform_transform_dev;

GRANT ROLE _warner_base_dev__usage TO ROLE warner_terraform_transform_dev;
GRANT ROLE _WARNER_BASE_DEV_DWH__WAREHOUSE__USAGE TO ROLE warner_terraform_transform_dev;

USE ROLE warner_terraform_transform_dev;


use role securityadmin;

show roles like '_warner_%__usage';

show grants to role warner_terraform_transform_dev;
show databases like 'warner_%';


use role warner_terraform_transform_dev;

CREATE ROLE deleteme;

GRANT USAGE ON DATABASE warner_base_dev TO ROLE deleteme;
GRANT USAGE ON WAREHOUSE  WARNER_terraform_TRANSFORM_DEV_WAREHOUSE_XSMALL TO ROLE deleteme;
GRANT USAGE ON WAREHOUSE WARNER_BASE_DEV_DWH  TO ROLE deleteme;


CREATE OR REPLACE SCHEMA warner_base_dev.deleteme;
CREATE OR REPLACE ROLE _warner_base_dev__deleteme__usage ;
GRANT USAGE ON SCHEMA warner_base_dev.deleteme TO ROLE _warner_base_dev__deleteme__usage;
GRANT ROLE _warner_base_dev__deleteme__usage TO ROLE deleteme;

DROP ROLE _warner_base_dev__deleteme__usage;
DROP SCHEMA warner_base_dev.deleteme;
DROP ROLE deleteme;

GRANT ROLE deleteme TO ROLE dba;

USE ROLE deleteme;

USE ROLE sysadmin;

CREATE DATABASE warner_cust;

USE ROLE useradmin;

CREATE ROLE warner_dbt_transform;
CREATE ROLE warner_terraform_transform;
CREATE ROLE _warner_cust__usage;

USE ROLE sysadmin;

GRANT OWNERSHIP on DATABASE warner_cust TO ROLE warner_terraform_transform;


USE ROLE warner_terraform_transform;

USE DATABASE warner_cust;

CREATE SCHEMA ma_mart;

USE ROLE securityadmin;

GRANT ROLE warner_terraform_transform TO ROLE dba;
GRANT ROLE warner_dbt_transform TO ROLE dba;

GRANT ROLE warner_terraform_transform TO USER VISHALJAKHAR;
GRANT ROLE warner_terraform_transform TO USER SUMITGUPTA;
GRANT ROLE warner_terraform_transform TO USER SUNILSHARMA;
GRANT ROLE warner_terraform_transform TO USER DEEPAKGAIKWAD;
 
GRANT ROLE warner_dbt_transform TO USER VISHALJAKHAR;
GRANT ROLE warner_dbt_transform TO USER SUMITGUPTA;
GRANT ROLE warner_dbt_transform TO USER SUNILSHARMA;
GRANT ROLE warner_dbt_transform TO USER DEEPAKGAIKWAD;


grant role _WARNER_BASE__AZTECACTIVITYMANAGEMENT__READER to role warner_dbt_transform;
grant role _WARNER_BASE__AZTEC__READER to role warner_dbt_transform;
grant role _WARNER_BASE__COUPA__READER to role warner_dbt_transform;
grant role _WARNER_BASE__FINANCIAL_CUBE__READER to role warner_dbt_transform;
grant role _WARNER_BASE__KMSREPORTING__READER to role warner_dbt_transform;
grant role _WARNER_BASE__MAESTRO__READER to role warner_dbt_transform;
grant role _WARNER_BASE__MA_MART__READER to role warner_dbt_transform;
grant role _WARNER_BASE__QUALTRICS__READER to role warner_dbt_transform;
grant role _WARNER_BASE__ROTAREADY__READER to role warner_dbt_transform;
grant role _WARNER_BASE__SAS_SCV__READER to role warner_dbt_transform;
grant role _WARNER_BASE__SEAWARE__READER to role warner_dbt_transform;
grant role _WARNER_BASE__SEAWARE_APS__READER to role warner_dbt_transform;
grant role _WARNER_BASE__ZBSDATA__READER to role warner_dbt_transform;
grant role _WARNER_STORE__APS_SHARE__READER to role warner_dbt_transform;
grant role _WARNER_STORE__COMMON__READER to role warner_dbt_transform;
grant role _WARNER_STORE__KMSREPORTING__READER to role warner_dbt_transform;
grant role _WARNER_STORE__MA_MART__READER to role warner_dbt_transform;
grant role _WARNER_STORE__SAS_SCV__READER to role warner_dbt_transform;
grant role _WARNER_STORE__ZBSDATA__READER to role warner_dbt_transform;
grant role _WARNER_STORE__SEAWARE_APS__CREATOR to role warner_dbt_transform;
grant role _WARNER_CUST__MA_MART__CREATOR to role warner_dbt_transform;

USE ROLE warner_dbt_transform;