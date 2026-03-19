USE ROLE sysadmin;

CREATE WAREHOUSE haven_dbt_transform_uat_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

--create OR REPLACE role haven_dbt_transform_uat;

CREATE ROLE _haven_dbt_transform_uat_xsmall__warehouse__operator;
CREATE ROLE _haven_dbt_transform_uat_xsmall__warehouse__usage;

create user haven_dbt_transform_uat
login_name = 'haven.dbt.transform.uat'
password = '<REDACTED>'
display_name = 'Haven DBT UAT'
email = 'donatas.gedgaudas@haven.com'
comment = 'Haven DBT UAT Model Development'
default_role = haven_dbt_transform_uat
default_warehouse = haven_dbt_transform_uat_xsmall;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_dbt_transform_uat_xsmall to role _haven_dbt_transform_uat_xsmall__warehouse__usage;
grant role _haven_dbt_transform_uat_xsmall__warehouse__usage to role _haven_dbt_transform_uat_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_dbt_transform_uat_xsmall to role _haven_dbt_transform_uat_xsmall__warehouse__operator;

GRANT ROLE _haven_dbt_transform_uat_xsmall__warehouse__usage TO ROLE haven_dbt_transform_uat;

GRANT ROLE haven_dbt_transform_uat TO ROLE dba;
GRANT ROLE haven_dbt_transform_uat TO USER haven_dbt_transform_uat;

-------------------------------------------------------------------

USE ROLE sysadmin;

CREATE WAREHOUSE haven_dbt_transform_dev_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create OR REPLACE role haven_dbt_transform_dev;

CREATE ROLE _haven_dbt_transform_dev_xsmall__warehouse__operator;
CREATE ROLE _haven_dbt_transform_dev_xsmall__warehouse__usage;

create user haven_dbt_transform_dev
login_name = 'haven.dbt.transform.dev'
password = '<REDACTED>'
display_name = 'Haven DBT Development'
email = 'donatas.gedgaudas@haven.com'
comment = 'Haven DBT Development Model Development'
default_role = haven_dbt_transform_dev
default_warehouse = haven_dbt_transform_dev_xsmall;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_dbt_transform_dev_xsmall to role _haven_dbt_transform_dev_xsmall__warehouse__usage;
grant role _haven_dbt_transform_dev_xsmall__warehouse__usage to role _haven_dbt_transform_dev_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_dbt_transform_dev_xsmall to role _haven_dbt_transform_dev_xsmall__warehouse__operator;

GRANT ROLE _haven_dbt_transform_dev_xsmall__warehouse__usage TO ROLE haven_dbt_transform_dev;

GRANT ROLE haven_dbt_transform_dev TO ROLE dba;
GRANT ROLE haven_dbt_transform_dev TO USER haven_dbt_transform_dev;

-------------------------------------------------------------------

USE ROLE sysadmin;

CREATE WAREHOUSE haven_dbt_transform_qat_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create OR REPLACE role haven_dbt_transform_qat;

DROP ROLE haven_dbt_transform_qat;

CREATE ROLE _haven_dbt_transform_qat_xsmall__warehouse__operator;
CREATE ROLE _haven_dbt_transform_qat_xsmall__warehouse__usage;

create user haven_dbt_transform_qat
login_name = 'haven.dbt.transform.qat'
password = '<REDACTED>'
display_name = 'Haven DBT QAT'
email = 'donatas.gedgaudas@haven.com'
comment = 'Haven DBT QAT Model development'
default_role = haven_dbt_transform_qat
default_warehouse = haven_dbt_transform_qat_xsmall;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_dbt_transform_qat_xsmall to role _haven_dbt_transform_qat_xsmall__warehouse__usage;
grant role _haven_dbt_transform_qat_xsmall__warehouse__usage to role _haven_dbt_transform_qat_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_dbt_transform_qat_xsmall to role _haven_dbt_transform_qat_xsmall__warehouse__operator;

--GRANT ROLE _haven_dbt_transform_qat_xsmall__warehouse__usage TO ROLE haven_dbt_transform_qat;

--GRANT ROLE haven_dbt_transform_qat TO ROLE dba;
--GRANT ROLE haven_dbt_transform_qat TO USER haven_dbt_transform_qat;

-------------------------------------------------------------------
--17/06/2024

USE ROLE sysadmin;

CREATE WAREHOUSE haven_pipeline_transform_uat_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role haven_pipeline_transform_uat;

--DROP ROLE haven_pipeline_transform_uat;

CREATE ROLE _haven_pipeline_transform_uat_xsmall__warehouse__operator;
CREATE ROLE _haven_pipeline_transform_uat_xsmall__warehouse__usage;

create user haven_pipeline_transform_uat
login_name = 'haven.pipeline.transform.uat'
password = '<REDACTED>'
display_name = 'Haven pipeline uat'
email = 'donatas.gedgaudas@haven.com'
comment = 'Haven pipeline uat Model development'
default_role = haven_pipeline_transform_uat
default_warehouse = haven_pipeline_transform_uat_xsmall;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_pipeline_transform_uat_xsmall to role _haven_pipeline_transform_uat_xsmall__warehouse__usage;
grant role _haven_pipeline_transform_uat_xsmall__warehouse__usage to role _haven_pipeline_transform_uat_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_pipeline_transform_uat_xsmall to role _haven_pipeline_transform_uat_xsmall__warehouse__operator;

--GRANT ROLE _haven_dbt_transform_qat_xsmall__warehouse__usage TO ROLE haven_dbt_transform_qat;

--GRANT ROLE haven_dbt_transform_qat TO ROLE dba;
--GRANT ROLE haven_dbt_transform_qat TO USER haven_dbt_transform_qat;

USE ROLE sysadmin;

DROP WAREHOUSE haven_dbt_transform_medium;

CREATE WAREHOUSE haven_dbt_transform_warehouse_medium WITH WAREHOUSE_SIZE = 'MEDIUM' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

--create OR REPLACE role haven_dbt_transform_uat;

CREATE ROLE _haven_dbt_transform_medium__warehouse__operator;
CREATE ROLE _haven_dbt_transform_medium__warehouse__usage;

DROP ROLE _haven_dbt_transform_medium__warehouse__operator;
DROP ROLE _haven_dbt_transform_medium__warehouse__usage;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_dbt_transform_warehouse_medium to role _haven_dbt_transform_medium__warehouse__usage;
grant role _haven_dbt_transform_medium__warehouse__usage to role _haven_dbt_transform_medium__warehouse__operator;
grant operate, modify on warehouse haven_dbt_transform_warehouse_medium to role _haven_dbt_transform_medium__warehouse__operator;

GRANT ROLE _haven_dbt_transform_medium__warehouse__usage TO ROLE haven_dbt_transform;

USE ROLE haven_dbt_transform;

SHOW WAREHOUSES;

-------------------------------------------------------------------
--16/10/2024
---- haven_dbt_transform_test


USE ROLE sysadmin;

CREATE WAREHOUSE haven_dbt_transform_test_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role haven_dbt_transform_test;

--DROP ROLE haven_dbt_transform_test;

CREATE ROLE _haven_dbt_transform_test_xsmall__warehouse__operator;
CREATE ROLE _haven_dbt_transform_test_xsmall__warehouse__usage;

create user haven_dbt_transform_test
login_name = 'haven.dbt.transform.test'
display_name = 'Haven DBT Test'
email = 'donatas.gedgaudas@haven.com'
comment = 'Haven dbt test Model development'
default_role = haven_dbt_transform_test
default_warehouse = haven_dbt_transform_test_xsmall
RSA_PUBLIC_KEY = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtTNRG0BVJ8sAVT2RtawH
J1HU36VK9AhPBx/v0CW2IboWQAeY5qDi0rP7f73cZNlogm2pO+6NBAMQQ0CnkKqi
uzhfcg1XBoQJ4IieDfzvRNa8Db/saxQroC24Gmwwn9oZSBrjlUwSzPygRiG56knl
nSoitPImu0yzc/iySXaO1lC5nvFU3d5yV2nWg2NkaWU7+7g25PFTTE79E2FUN1Qm
f8vXwsZlinGUKwxVq/5W7g2OHIwYwExUI8T3BEVOIXZ4EpOwSOphYlaCyxO/ctoO
5k8gK8fC7voQ+D+eUUHMGVwGIEqESwaNqeGTK9I436swX+kI/eeqZmOxB+dumCZs
VQIDAQAB';


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_dbt_transform_test_xsmall to role _haven_dbt_transform_test_xsmall__warehouse__usage;
grant role _haven_dbt_transform_test_xsmall__warehouse__usage to role _haven_dbt_transform_test_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_dbt_transform_test_xsmall to role _haven_dbt_transform_test_xsmall__warehouse__operator;

GRANT ROLE _haven_dbt_transform_test_xsmall__warehouse__usage TO ROLE haven_dbt_transform_test;

GRANT ROLE haven_dbt_transform_test TO ROLE dba;
GRANT ROLE haven_dbt_transform_test TO USER haven_dbt_transform_test;

USE ROLE haven_dbt_transform_test;

SHOW DATABASES;

SHOW WAREHOUSES;

-- 26/08/2025

USE ROLE sysadmin;

CREATE WAREHOUSE haven_dbt_transform_xlarge WITH WAREHOUSE_SIZE = xlarge WAREHOUSE_TYPE = STANDARD 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = STANDARD;

use role useradmin;

CREATE ROLE _haven_dbt_transform_xlarge__warehouse__operator;
CREATE ROLE _haven_dbt_transform_xlarge__warehouse__usage;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_dbt_transform_xlarge to role _haven_dbt_transform_xlarge__warehouse__usage;
grant role _haven_dbt_transform_xlarge__warehouse__usage to role _haven_dbt_transform_xlarge__warehouse__operator;
grant operate, modify on warehouse haven_dbt_transform_xlarge to role _haven_dbt_transform_xlarge__warehouse__operator;

GRANT ROLE _haven_dbt_transform_xlarge__warehouse__usage TO ROLE haven_dbt_transform;

use ROLE haven_dbt_transform;

show warehouses;

USE ROLE sysadmin;

ALTER  WAREHOUSE haven_dbt_transform_xlarge RENAME TO haven_dbt_transform_warehouse_xlarge; 

use role useradmin;

CREATE ROLE _haven_dbt_transform_xlarge__warehouse__operator;
CREATE ROLE _haven_dbt_transform_xlarge__warehouse__usage;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_dbt_transform_warehouse_xlarge to role _haven_dbt_transform_xlarge__warehouse__usage;
grant role _haven_dbt_transform_xlarge__warehouse__usage to role _haven_dbt_transform_xlarge__warehouse__operator;
grant operate, modify on warehouse haven_dbt_transform_warehouse_xlarge to role _haven_dbt_transform_xlarge__warehouse__operator;

GRANT ROLE _haven_dbt_transform_xlarge__warehouse__usage TO ROLE haven_dbt_transform;

use ROLE haven_dbt_transform;

show warehouses;
