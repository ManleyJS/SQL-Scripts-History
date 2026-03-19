USE ROLE sysadmin;

CREATE DATABASE warner_dev;
CREATE DATABASE warner_sit;
CREATE DATABASE warner_prod;

CREATE WAREHOUSE warner_dev_wh WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE WAREHOUSE warner_sit_wh WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _warner_dev_wh__warehouse__usage;
create role _warner_dev_wh__warehouse__operator;
create role _warner_sit_wh__warehouse__usage;
create role _warner_sit_wh__warehouse__operator;
create role _warner_prod_wh__warehouse__usage;
create role _warner_prod_wh__warehouse__operator;

CREATE ROLE _warner_dev__usage;
CREATE ROLE _warner_dev__schema;
CREATE ROLE _warner_sit__usage;
CREATE ROLE _warner_sit__schema;
CREATE ROLE _warner_prod__usage;
CREATE ROLE _warner_prod__schema;

CREATE ROLE Warner_terraform_dev;
CREATE ROLE Warner_dbt_dev;
CREATE ROLE Warner_terraform_sit;
CREATE ROLE Warner_dbt_sit;


use role securityadmin;

grant usage, monitor on warehouse warner_dev_wh to role _warner_dev_wh__warehouse__usage;
grant role _warner_dev_wh__warehouse__usage to role _warner_dev_wh__warehouse__operator;
grant operate, modify on warehouse warner_dev_wh to role _warner_dev_wh__warehouse__operator;

grant usage, monitor on warehouse warner_sit_wh to role _warner_sit_wh__warehouse__usage;
grant role _warner_sit_wh__warehouse__usage to role _warner_sit_wh__warehouse__operator;
grant operate, modify on warehouse warner_sit_wh to role _warner_sit_wh__warehouse__operator;

GRANT ROLE _warner_dev_wh__warehouse__usage TO ROLE Warner_terraform_dev;
GRANT ROLE _warner_dev_wh__warehouse__usage TO ROLE Warner_dbt_dev;

GRANT ROLE _warner_sit_wh__warehouse__usage TO ROLE Warner_terraform_sit;
GRANT ROLE _warner_sit_wh__warehouse__usage TO ROLE Warner_dbt_sit;

GRANT USAGE ON DATABASE warner_dev TO ROLE _warner_dev__usage;
GRANT ROLE _warner_dev__usage TO ROLE _warner_dev__schema;
GRANT CREATE SCHEMA ON DATABASE warner_dev TO ROLE _warner_dev__schema;

GRANT ROLE _warner_dev__schema TO ROLE Warner_terraform_dev;
GRANT ROLE _warner_dev__schema TO ROLE Warner_dbt_dev;

GRANT USAGE ON DATABASE warner_sit TO ROLE _warner_sit__usage;
GRANT ROLE _warner_sit__usage TO ROLE _warner_sit__schema;
GRANT CREATE SCHEMA ON DATABASE warner_sit TO ROLE _warner_sit__schema;

GRANT ROLE _warner_sit__schema TO ROLE Warner_terraform_sit;
GRANT ROLE _warner_sit__schema TO ROLE Warner_dbt_sit;

GRANT USAGE ON DATABASE warner_prod TO ROLE _warner_prod__usage;
GRANT ROLE _warner_prod__usage TO ROLE _warner_prod__schema;
GRANT CREATE SCHEMA ON DATABASE warner_prod TO ROLE _warner_prod__schema;

SHOW GRANTS OF ROLE warner_data_transform; 

GRANT ROLE taskadmin TO ROLE Warner_terraform_dev;
GRANT ROLE taskadmin TO ROLE Warner_dbt_dev;

GRANT ROLE taskadmin TO ROLE Warner_terraform_sit;
GRANT ROLE taskadmin TO ROLE Warner_dbt_sit;

GRANT ROLE Warner_terraform_dev TO ROLE dba;
GRANT ROLE Warner_dbt_dev TO ROLE dba;

GRANT ROLE Warner_terraform_sit TO ROLE dba;
GRANT ROLE Warner_dbt_sit TO ROLE dba;


USE ROLE dba;

USE ROLE warner_dbt_dev;

CREATE SCHEMA warner_dev.jm_test;

USE SCHEMA warner_dev.jm_test;

DROP SCHEMA warner_dev.jm_test;

SHOW GRANTS TO ROLE warner_data_transform;

USE ROLE securityadmin;


grant role _WARNER_BASE__AZTECACTIVITYMANAGEMENT__READER to role Warner_terraform_dev;
grant role _WARNER_BASE__AZTEC__READER to role Warner_terraform_dev;
grant role _WARNER_BASE__COUPA__READER to role Warner_terraform_dev;
grant role _WARNER_BASE__FINANCIAL_CUBE__READER to role Warner_terraform_dev;
grant role _WARNER_BASE__KMSREPORTING__READER to role Warner_terraform_dev;
grant role _WARNER_BASE__MAESTRO__READER to role Warner_terraform_dev;
grant role _WARNER_BASE__MA_MART__READER to role Warner_terraform_dev;
grant role _WARNER_BASE__QUALTRICS__READER to role Warner_terraform_dev;
grant role _WARNER_BASE__ROTAREADY__READER to role Warner_terraform_dev;
grant role _WARNER_BASE__SAS_SCV__READER to role Warner_terraform_dev;
grant role _WARNER_BASE__SEAWARE__READER to role Warner_terraform_dev;
grant role _WARNER_BASE__ZBSDATA__READER to role Warner_terraform_dev;
grant role _WARNER_STORE__APS_SHARE__READER to role Warner_terraform_dev;
grant role _WARNER_STORE__COMMON__READER to role Warner_terraform_dev;
grant role _WARNER_STORE__KMSREPORTING__READER to role Warner_terraform_dev;
grant role _WARNER_STORE__MA_MART__READER to role Warner_terraform_dev;
grant role _WARNER_STORE__SAS_SCV__READER to role Warner_terraform_dev;
grant role _WARNER_STORE__ZBSDATA__READER to role Warner_terraform_dev;

grant role _WARNER_BASE__AZTECACTIVITYMANAGEMENT__READER to role Warner_dbt_dev;
grant role _WARNER_BASE__AZTEC__READER to role Warner_dbt_dev;
grant role _WARNER_BASE__COUPA__READER to role Warner_dbt_dev;
grant role _WARNER_BASE__FINANCIAL_CUBE__READER to role Warner_dbt_dev;
grant role _WARNER_BASE__KMSREPORTING__READER to role Warner_dbt_dev;
grant role _WARNER_BASE__MAESTRO__READER to role Warner_dbt_dev;
grant role _WARNER_BASE__MA_MART__READER to role Warner_dbt_dev;
grant role _WARNER_BASE__QUALTRICS__READER to role Warner_dbt_dev;
grant role _WARNER_BASE__ROTAREADY__READER to role Warner_dbt_dev;
grant role _WARNER_BASE__SAS_SCV__READER to role Warner_dbt_dev;
grant role _WARNER_BASE__SEAWARE__READER to role Warner_dbt_dev;
grant role _WARNER_BASE__ZBSDATA__READER to role Warner_dbt_dev;
grant role _WARNER_STORE__APS_SHARE__READER to role Warner_dbt_dev;
grant role _WARNER_STORE__COMMON__READER to role Warner_dbt_dev;
grant role _WARNER_STORE__KMSREPORTING__READER to role Warner_dbt_dev;
grant role _WARNER_STORE__MA_MART__READER to role Warner_dbt_dev;
grant role _WARNER_STORE__SAS_SCV__READER to role Warner_dbt_dev;
grant role _WARNER_STORE__ZBSDATA__READER to role Warner_dbt_dev;

grant role _WARNER_BASE__AZTECACTIVITYMANAGEMENT__READER to role Warner_terraform_sit;
grant role _WARNER_BASE__AZTEC__READER to role Warner_terraform_sit;
grant role _WARNER_BASE__COUPA__READER to role Warner_terraform_sit;
grant role _WARNER_BASE__FINANCIAL_CUBE__READER to role Warner_terraform_sit;
grant role _WARNER_BASE__KMSREPORTING__READER to role Warner_terraform_sit;
grant role _WARNER_BASE__MAESTRO__READER to role Warner_terraform_sit;
grant role _WARNER_BASE__MA_MART__READER to role Warner_terraform_sit;
grant role _WARNER_BASE__QUALTRICS__READER to role Warner_terraform_sit;
grant role _WARNER_BASE__ROTAREADY__READER to role Warner_terraform_sit;
grant role _WARNER_BASE__SAS_SCV__READER to role Warner_terraform_sit;
grant role _WARNER_BASE__SEAWARE__READER to role Warner_terraform_sit;
grant role _WARNER_BASE__ZBSDATA__READER to role Warner_terraform_sit;
grant role _WARNER_STORE__APS_SHARE__READER to role Warner_terraform_sit;
grant role _WARNER_STORE__COMMON__READER to role Warner_terraform_sit;
grant role _WARNER_STORE__KMSREPORTING__READER to role Warner_terraform_sit;
grant role _WARNER_STORE__MA_MART__READER to role Warner_terraform_sit;
grant role _WARNER_STORE__SAS_SCV__READER to role Warner_terraform_sit;
grant role _WARNER_STORE__ZBSDATA__READER to role Warner_terraform_sit;

grant role _WARNER_BASE__AZTECACTIVITYMANAGEMENT__READER to role Warner_dbt_sit;
grant role _WARNER_BASE__AZTEC__READER to role Warner_dbt_sit;
grant role _WARNER_BASE__COUPA__READER to role Warner_dbt_sit;
grant role _WARNER_BASE__FINANCIAL_CUBE__READER to role Warner_dbt_sit;
grant role _WARNER_BASE__KMSREPORTING__READER to role Warner_dbt_sit;
grant role _WARNER_BASE__MAESTRO__READER to role Warner_dbt_sit;
grant role _WARNER_BASE__MA_MART__READER to role Warner_dbt_sit;
grant role _WARNER_BASE__QUALTRICS__READER to role Warner_dbt_sit;
grant role _WARNER_BASE__ROTAREADY__READER to role Warner_dbt_sit;
grant role _WARNER_BASE__SAS_SCV__READER to role Warner_dbt_sit;
grant role _WARNER_BASE__SEAWARE__READER to role Warner_dbt_sit;
grant role _WARNER_BASE__ZBSDATA__READER to role Warner_dbt_sit;
grant role _WARNER_STORE__APS_SHARE__READER to role Warner_dbt_sit;
grant role _WARNER_STORE__COMMON__READER to role Warner_dbt_sit;
grant role _WARNER_STORE__KMSREPORTING__READER to role Warner_dbt_sit;
grant role _WARNER_STORE__MA_MART__READER to role Warner_dbt_sit;
grant role _WARNER_STORE__SAS_SCV__READER to role Warner_dbt_sit;
grant role _WARNER_STORE__ZBSDATA__READER to role Warner_dbt_sit;

SHOW USERS;

GRANT ROLE Warner_dbt_dev TO USER VISHALJAKHAR;
GRANT ROLE Warner_dbt_dev TO USER SUMITGUPTA;
GRANT ROLE Warner_dbt_dev TO USER SUNILSHARMA;
GRANT ROLE Warner_dbt_dev TO USER DEEPAKGAIKWAD;

GRANT ROLE Warner_terraform_dev TO USER VISHALJAKHAR;
GRANT ROLE Warner_terraform_dev TO USER SUMITGUPTA;
GRANT ROLE Warner_terraform_dev TO USER SUNILSHARMA;
GRANT ROLE Warner_terraform_dev TO USER DEEPAKGAIKWAD;

GRANT ROLE Warner_terraform_sit TO USER VISHALJAKHAR;
GRANT ROLE Warner_terraform_sit TO USER SUMITGUPTA;
GRANT ROLE Warner_terraform_sit TO USER SUNILSHARMA;
GRANT ROLE Warner_terraform_sit TO USER DEEPAKGAIKWAD;
GRANT ROLE Warner_terraform_sit TO USER ANUSASI;

GRANT ROLE Warner_dbt_sit TO USER VISHALJAKHAR;
GRANT ROLE Warner_dbt_sit TO USER SUMITGUPTA;
GRANT ROLE Warner_dbt_sit TO USER SUNILSHARMA;
GRANT ROLE Warner_dbt_sit TO USER DEEPAKGAIKWAD;
GRANT ROLE Warner_dbt_sit TO USER ANUSASI;

