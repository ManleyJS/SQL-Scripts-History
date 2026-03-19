USE ROLE sysadmin;

CREATE DATABASE bourne_pwc_finance_transformation;

CREATE WAREHOUSE bourne_pwc_finance_transformation_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create OR REPLACE role _bourne_pwc_finance_transformation_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _bourne_pwc_finance_transformation_warehouse_xsmall__warehouse__usage;

CREATE OR REPLACE ROLE bourne_pwc_finance_transformation;

CREATE ROLE _bourne_pwc_finance_transformation__usage;
CREATE ROLE _bourne_pwc_finance_transformation__schema;

create user bourne_pwc_finance_transformation_test
login_name = 'bourne.pwc.finance.transformation.test'
password = 'bournePWCFinanceTransformation@2023'
display_name = 'Bourne PWC Finance Transformation Test'
comment = 'Bourne PWC Finance Transformation Test'
default_role = bourne_pwc_finance_transformation
DEFAULT_WAREHOUSE = bourne_pwc_finance_transformation_warehouse_xsmall;

--Brian Westbury 
--brian.westbury@bourne-leisure.co.uk 

create user BrianWestbury
login_name = 'brian.westbury@bourne-leisure.co.uk'
display_name = 'Brian Westbury'
email = 'brian.westbury@bourne-leisure.co.uk'
comment = 'Central Finance Support - Level8 Solutions'
default_role = bourne_pwc_finance_transformation
default_warehouse = bourne_pwc_finance_transformation_warehouse_xsmall;

use role securityadmin;

GRANT USAGE ON DATABASE bourne_pwc_finance_transformation TO ROLE _bourne_pwc_finance_transformation__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE bourne_pwc_finance_transformation TO ROLE _bourne_pwc_finance_transformation__usage;
GRANT SELECT ON future TABLES IN DATABASE bourne_pwc_finance_transformation TO ROLE _bourne_pwc_finance_transformation__usage;
GRANT SELECT ON ALL TABLES IN DATABASE bourne_pwc_finance_transformation TO ROLE _bourne_pwc_finance_transformation__usage;
GRANT SELECT ON future VIEWS IN DATABASE bourne_pwc_finance_transformation TO ROLE _bourne_pwc_finance_transformation__usage;
GRANT SELECT ON all VIEWS IN DATABASE bourne_pwc_finance_transformation TO ROLE _bourne_pwc_finance_transformation__usage;
GRANT USAGE ON future STAGES IN DATABASE bourne_pwc_finance_transformation TO ROLE _bourne_pwc_finance_transformation__usage;
GRANT USAGE ON ALL STAGES IN DATABASE bourne_pwc_finance_transformation TO ROLE _bourne_pwc_finance_transformation__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE bourne_pwc_finance_transformation TO ROLE _bourne_pwc_finance_transformation__usage;
GRANT USAGE ON ALL FILE FORMATS IN DATABASE bourne_pwc_finance_transformation TO ROLE _bourne_pwc_finance_transformation__usage;
GRANT ROLE _bourne_pwc_finance_transformation__usage TO ROLE _bourne_pwc_finance_transformation__schema;
GRANT CREATE SCHEMA ON DATABASE bourne_pwc_finance_transformation TO ROLE _bourne_pwc_finance_transformation__schema;

grant usage, monitor on warehouse bourne_pwc_finance_transformation_warehouse_xsmall to role _bourne_pwc_finance_transformation_warehouse_xsmall__warehouse__usage;
grant role _bourne_pwc_finance_transformation_warehouse_xsmall__warehouse__usage to role _bourne_pwc_finance_transformation_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse bourne_pwc_finance_transformation_warehouse_xsmall to role _bourne_pwc_finance_transformation_warehouse_xsmall__warehouse__operator;

GRANT role _bourne_pwc_finance_transformation_warehouse_xsmall__warehouse__usage TO ROLE bourne_pwc_finance_transformation;
GRANT ROLE _haven_base__plot__reader TO ROLE bourne_pwc_finance_transformation;
GRANT ROLE _haven_base__coupa__reader TO ROLE bourne_pwc_finance_transformation;
GRANT ROLE _haven_base__dream__reader TO ROLE bourne_pwc_finance_transformation;
GRANT ROLE _haven_base__dream_rockleyboatpark__reader TO ROLE bourne_pwc_finance_transformation;
GRANT ROLE _haven_base__dream_evergreen__reader TO ROLE bourne_pwc_finance_transformation;
GRANT ROLE _bourne_pwc_finance_transformation__schema TO ROLE bourne_pwc_finance_transformation;

USE ROLE securityadmin;

revoke ROLE _haven_base__coupa__reader from ROLE bourne_pwc_finance_transformation;
revoke ROLE _haven_base__dream__reader from ROLE bourne_pwc_finance_transformation;

GRANT ROLE _bourne_base__coupa__reader TO ROLE bourne_pwc_finance_transformation;
GRANT ROLE _bourne_base__dream__reader TO ROLE bourne_pwc_finance_transformation;

GRANT ROLE bourne_pwc_finance_transformation TO USER BrianWestbury;
GRANT ROLE bourne_pwc_finance_transformation TO USER bourne_pwc_finance_transformation_test;

