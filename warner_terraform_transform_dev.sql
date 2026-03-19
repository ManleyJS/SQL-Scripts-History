USE ROLE sysadmin;

CREATE WAREHOUSE warner_terraform_transform_dev_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _warner_terraform_transform_dev_warehouse_xsmall__warehouse__operator;
create role _warner_terraform_transform_dev_warehouse_xsmall__warehouse__usage;

CREATE OR REPLACE ROLE warner_terraform_transform_dev;

create OR REPLACE user warner_terraform_transform_dev
login_name = 'warner.terraform.transform.dev'
display_name = 'Warner terraform transform dev'
comment = 'Warner terraform transform development service account'
default_role = warner_terraform_transform_dev
default_warehouse = warner_terraform_transform_dev_warehouse_xsmall
rsa_public_key = 
'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2REsg1TGhhYbQmhlGCfp
8DKcVwg9z2hCrRPM9IDPvCzpy1RyMgnuUhAFBR3Q2AbAE9hZQVruIiYHYsHVD17M
UZ7gTxtGV6ge/wosVqK3TRfdQUS9Ch/SkLUohsaN2BU68l0is3OX+DUuEvFon8La
idMTvvpmYZBfZyzzFnxpyVp6lTXfFWOqj7XbR+Iunsn5RbDIpBCjCb1mClJitJed
2SjCI/32nSkRR2cqm4aA4KFhuytc8ZC76MEZyiskhB8BoU8D7SZ3rXCZTmGCOS0f
878g8fpD7QjmgNDYOXXkAnFWCQy3DHc8PXuBtWTVebGO8OSw4vy+ik4J9qjMIK6+
EQIDAQAB';

--show USERS LIKE '%warner%';

SHOW ROLES LIKE '%warner_bus_dev%';

SHOW GRANTS TO ROLE warner_terraform_transform_dev;

SHOW roles LIKE '_warner_bus_dev%';

USE ROLE securityadmin;

grant usage, monitor on warehouse warner_terraform_transform_dev_warehouse_xsmall to role _warner_terraform_transform_dev_warehouse_xsmall__warehouse__usage;
grant role _warner_terraform_transform_dev_warehouse_xsmall__warehouse__usage to role _warner_terraform_transform_dev_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse warner_terraform_transform_dev_warehouse_xsmall to role _warner_terraform_transform_dev_warehouse_xsmall__warehouse__operator;

GRANT ROLE _warner_bus_dev__schema TO ROLE warner_terraform_transform_dev;
GRANT ROLE _warner_terraform_transform_dev_warehouse_xsmall__warehouse__usage TO ROLE warner_terraform_transform_dev; 
GRANT ROLE warner_terraform_transform_dev TO USER warner_terraform_transform_dev;
GRANT ROLE warner_terraform_transform_dev TO ROLE dba;

USE ROLE sysadmin;

CREATE DATABASE WARNER_DWH_DEV;
CREATE DATABASE WARNER_EXCP_DEV;

USE ROLE useradmin;
CREATE ROLE _WARNER_DWH_DEV__usage;
CREATE ROLE _WARNER_DWH_DEV__schema;
CREATE ROLE _WARNER_excp_DEV__usage;
CREATE ROLE _WARNER_excp_DEV__schema;

USE ROLE SECURITYadmin;

GRANT USAGE ON DATABASE WARNER_DWH_DEV TO ROLE _WARNER_DWH_DEV__usage;
GRANT ROLE _WARNER_DWH_DEV__usage TO ROLE _WARNER_DWH_DEV__schema;
GRANT CREATE SCHEMA ON DATABASE WARNER_DWH_DEV TO ROLE _WARNER_DWH_DEV__schema;

GRANT USAGE ON DATABASE WARNER_EXCP_DEV TO ROLE _WARNER_excp_DEV__usage;
GRANT ROLE _WARNER_excp_DEV__usage TO ROLE _WARNER_excp_DEV__schema;
GRANT CREATE SCHEMA ON DATABASE WARNER_excp_DEV TO ROLE _WARNER_excp_DEV__schema;

GRANT ROLE _WARNER_BASE_DEV__schema TO ROLE warner_terraform_transform_dev;
GRANT ROLE _WARNER_DWH_DEV__schema TO ROLE warner_terraform_transform_dev;
GRANT ROLE _WARNER_EXCP_DEV__schema TO ROLE warner_terraform_transform_dev;
GRANT ROLE _WARNER_STORE_DEV__schema TO ROLE warner_terraform_transform_dev;


SHOW ROLES LIKE '_warner_store__%';
SHOW GRANTS TO ROLE _warner_store_dev__schema;

USE ROLE securityadmin;

SHOW GRANTS TO ROLE WARNER_DEV_DBT_RW;

GRANT ROLE WARNER_DEV_DBT_RW TO ROLE warner_dbt_transform_dev;




warner_dbt_transform_dev