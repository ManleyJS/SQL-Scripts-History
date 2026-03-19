-- 10/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;

call haven_master.procedures.schema_role_creation('haven_data_science', 'owner_churn');

-- rota scheduling

use ROLE sysadmin;

CREATE WAREHOUSE haven_owner_churn_warehouse_XSMALL 
WITH WAREHOUSE_SIZE = XSMALL 
WAREHOUSE_TYPE = STANDARD
AUTO_SUSPEND = 60 
AUTO_RESUME = TRUE 
MIN_CLUSTER_COUNT = 1
MAX_CLUSTER_COUNT = 1 
SCALING_POLICY = 'STANDARD';

use ROLE accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS haven_owner_churn_compute_pool_small
    MIN_NODES = 1
    MAX_NODES = 1
    INSTANCE_FAMILY = 'CPU_X64_S'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;


USE ROLE useradmin;

CREATE ROLE haven_owner_churn;

create role _haven_owner_churn_compute_pool_small__operator;
create role _haven_owner_churn_compute_pool_small__usage;

create role _haven_owner_churn_warehouse_XSMALL__operator;
create role _haven_owner_churn_warehouse_XSMALL__usage;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_owner_churn_warehouse_XSMALL to role _haven_owner_churn_warehouse_XSMALL__usage;
grant role _haven_owner_churn_warehouse_XSMALL__usage to role _haven_owner_churn_warehouse_XSMALL__operator;
grant operate, modify on warehouse haven_owner_churn_warehouse_XSMALL to role _haven_owner_churn_warehouse_XSMALL__operator;

GRANT ROLE _haven_owner_churn_warehouse_XSMALL__usage TO ROLE haven_owner_churn;

grant usage, monitor on compute pool haven_owner_churn_compute_pool_small TO ROLE _haven_owner_churn_compute_pool_small__usage;
grant operate, modify on compute pool haven_owner_churn_compute_pool_small TO ROLE _haven_owner_churn_compute_pool_small__operator;
GRANT ROLE _haven_owner_churn_compute_pool_small__usage TO ROLE _haven_owner_churn_compute_pool_small__operator;

GRANT ROLE _haven_owner_churn_compute_pool_small__usage TO ROLE haven_owner_churn;

GRANT ROLE _haven_data_science__owner_churn__creator TO ROLE haven_owner_churn;

GRANT ROLE haven_owner_churn TO USER sarunasjatautis;
GRANT ROLE haven_owner_churn TO ROLE dba;

use ROLE haven_owner_churn;

use SCHEMA haven_data_science.owner_churn;

SHOW warehouses;

SHOW compute pools;

SELECT current_role();

CREATE TASK mytask1
  WAREHOUSE = HAVEN_OWNER_CHURN_WAREHOUSE_XSMALL
  SCHEDULE = '5 MINUTES'
  AS
	SHOW TABLES;

SHOW tasks;

DROP TASK mytask1;

-- 12/11/2025
-- Add default permissions to functional role

use role securityadmin;

GRANT USAGE	ON INTEGRATION	DATA_SCIENCE_NOTIFICATIONS_SNS_TOPIC TO ROLE haven_owner_churn;
--USAGE	ROLE	TASKADMIN
GRANT ROLE	_HAVEN_DATA_SCIENCE__DATA_SCIENCE__READER TO ROLE haven_owner_churn;
--GRANT	ROLE	_HAVEN_DATA_SCIENCE__HAVEN_OWNER_CHURN__CREATOR TO ROLE haven_owner_churn;
GRANT	ROLE	_HAVEN_STORE__ARRIVAL__READER TO ROLE haven_owner_churn;
GRANT	ROLE	_HAVEN_STORE__COMMON__READER TO ROLE haven_owner_churn;
GRANT	ROLE	_HAVEN_STORE__RETAIL__READER TO ROLE haven_owner_churn;
GRANT	ROLE	_HAVEN_STORE__WEATHER__READER TO ROLE haven_owner_churn;
GRANT	ROLE	_HAVEN_STORE__WORKFORCE__READER TO ROLE haven_owner_churn;
GRANT	ROLE	_MET_OFFICE_POSTCODE_DATA__USAGE TO ROLE haven_owner_churn;
GRANT CREATE SERVICE ON	SCHEMA	HAVEN_DATA_SCIENCE.OWNER_CHURN TO ROLE haven_owner_churn;
GRANT CREATE TASK ON SCHEMA	HAVEN_DATA_SCIENCE.OWNER_CHURN TO ROLE haven_owner_churn;


use ROLE securityadmin;

GRANT ROLE haven_owner_churn TO USER haven_data_science_pipeline;

-- 24/11/2025

use ROLE dba;

use DATABASE haven_data_science_dev;

SHOW 

use ROLE securityadmin;

GRANT CREATE SERVICE ON	SCHEMA	haven_data_science_dev.owner_churn TO ROLE haven_dbt_transform_data_science_dev;
GRANT CREATE SERVICE ON SCHEMA	haven_data_science_dev.test_owner_churn TO ROLE haven_dbt_transform_data_science_dev;
GRANT CREATE task ON	SCHEMA	haven_data_science_dev.owner_churn TO ROLE haven_dbt_transform_data_science_dev;
GRANT CREATE task ON SCHEMA	haven_data_science_dev.test_owner_churn TO ROLE haven_dbt_transform_data_science_dev;

-- 25/11/2025

use role accountadmin; 
                                                                              
CREATE COMPUTE POOL IF NOT EXISTS haven_owner_churn_dev_compute_pool_small        
    MIN_NODES = 1                                                             
    MAX_NODES = 4                                                             
    INSTANCE_FAMILY = 'CPU_X64_S'                                             
    AUTO_RESUME = TRUE                                                        
	INITIALLY_SUSPENDED = TRUE                                                
	AUTO_SUSPEND_SECS = 60;                                                   
                                                                              
ALTER COMPUTE POOL haven_owner_churn_compute_pool_small
SET MAX_NODES = 4   ;

use ROLE useradmin;

create role _haven_owner_churn_dev_compute_pool_small__operator;          
create role _haven_owner_churn_dev_compute_pool_small__usage;    

USE ROLE securityadmin;                                                                                                            
                                                                                                                                   
grant usage, monitor on compute pool haven_owner_churn_dev_compute_pool_small TO ROLE _haven_owner_churn_dev_compute_pool_small__usage;       
grant operate, modify on compute pool haven_owner_churn_dev_compute_pool_small TO ROLE _haven_owner_churn_dev_compute_pool_small__operator;   
GRANT ROLE _haven_owner_churn_dev_compute_pool_small__usage TO ROLE _haven_owner_churn_dev_compute_pool_small__operator;                      
                                                                                                                                      
GRANT ROLE _haven_owner_churn_dev_compute_pool_small__usage TO ROLE haven_dbt_transform_data_science_dev;                                                        
    

use ROLE accountadmin;

CREATE EXTERNAL ACCESS INTEGRATION python_pip_access_integration
  ALLOWED_NETWORK_RULES = (snowflake.external_access.pypi_rule)
  ENABLED = true;

GRANT USAGE ON integration python_pip_access_integration TO ROLE haven_dbt_transform_data_science_dev;
GRANT USAGE ON integration python_pip_access_integration TO ROLE haven_owner_churn;

-- 26/11/2025
                                                   
use role accountadmin;                                                                                                                                         
                                                                                                                                                               
CREATE COMPUTE POOL IF NOT EXISTS haven_owner_churn_dev_compute_pool_medium                                                                                     
    MIN_NODES = 1                                                                                                                                              
    MAX_NODES = 4                                                                                                                                              
    INSTANCE_FAMILY = 'CPU_X64_M'                                                                                                                              
    AUTO_RESUME = TRUE                                                                                                                                         
	INITIALLY_SUSPENDED = TRUE                                                                                                                                 
	AUTO_SUSPEND_SECS = 60;                                                                                                                                    
                                                                                                                                                                                                                                                                                                        
use ROLE useradmin;                                                                                                                                            
                                                                                                                                                               
create role _haven_owner_churn_dev_compute_pool_medium__operator;                                                                                               
create role _haven_owner_churn_dev_compute_pool_medium__usage;                                                                                                  
                                                                                                                                                               
USE ROLE securityadmin;                                                                                                                                        
                                                                                                                                                               
grant usage, monitor on compute pool haven_owner_churn_dev_compute_pool_medium TO ROLE _haven_owner_churn_dev_compute_pool_medium__usage;                        
grant operate, modify on compute pool haven_owner_churn_dev_compute_pool_medium TO ROLE _haven_owner_churn_dev_compute_pool_medium__operator;                    
GRANT ROLE _haven_owner_churn_dev_compute_pool_medium__usage TO ROLE _haven_owner_churn_dev_compute_pool_medium__operator;                                       
                                                                                                                                                               
GRANT ROLE _haven_owner_churn_dev_compute_pool_medium__usage TO ROLE haven_dbt_transform_data_science_dev;                                                      
                                                                                                                                                                                                                                     

-- 08/12/2025
                                                   
use role accountadmin;                                                                                                                                         
                                                                                                                                                               
DROP COMPUTE POOL IF EXISTS haven_owner_churn_dev_compute_pool_large ;                                                                                    

CREATE COMPUTE POOL IF NOT EXISTS haven_owner_churn_compute_pool_large                                                                                     
    MIN_NODES = 1                                                                                                                                              
    MAX_NODES = 4                                                                                                                                              
    INSTANCE_FAMILY = 'CPU_X64_SL'                                                                                                                              
    AUTO_RESUME = TRUE                                                                                                                                         
	INITIALLY_SUSPENDED = TRUE                                                                                                                                 
	AUTO_SUSPEND_SECS = 60;                                                                                                                                    
                                                                                                                                                                                                                                                                                                        
use ROLE useradmin;                                                                                                                                            
                                                                                                                                                               
drop role _haven_owner_churn_dev_compute_pool_large__operator;                                                                                               
drop role _haven_owner_churn_dev_compute_pool_large__usage;

create role _haven_owner_churn_compute_pool_large__operator;                                                                                               
create role _haven_owner_churn_compute_pool_large__usage;

drop ROLE _have_owner_churn__haven_base__oecd__reader;

CREATE ROLE _haven_owner_churn__haven_base__oecd__reader;

CREATE ROLE _haven_owner_churn__haven_store__caravans__reader;
                                                                                                                                                               
USE ROLE securityadmin;                                                                                                                                        
                                                                                                                                                               
grant usage, monitor on compute pool haven_owner_churn_compute_pool_large TO ROLE _haven_owner_churn_compute_pool_large__usage;                        
grant operate, modify on compute pool haven_owner_churn_compute_pool_large TO ROLE _haven_owner_churn_compute_pool_large__operator;                    
GRANT ROLE _haven_owner_churn_compute_pool_large__usage TO ROLE _haven_owner_churn_compute_pool_large__operator;                                       
                                                                                                                                                               
GRANT ROLE _haven_owner_churn_compute_pool_large__usage TO ROLE haven_owner_churn;                                                      
             
GRANT ROLE _haven_base__oecd__usage  TO ROLE _haven_owner_churn__haven_base__oecd__reader;
GRANT SELECT ON VIEW HAVEN_BASE.OECD.INTEREST_RATES TO ROLE _haven_owner_churn__haven_base__oecd__reader;
GRANT SELECT ON VIEW HAVEN_BASE.OECD.CONSUMER_CONFIDENCE_INDEX_CPI TO ROLE _haven_owner_churn__haven_base__oecd__reader;
GRANT SELECT ON VIEW HAVEN_BASE.OECD.CONSUMER_PRICE_INDEX TO ROLE _haven_owner_churn__haven_base__oecd__reader;
GRANT SELECT ON VIEW HAVEN_BASE.OECD.UNEMPLOYMENT TO ROLE _haven_owner_churn__haven_base__oecd__reader;

GRANT ROLE _haven_owner_churn__haven_base__oecd__reader TO ROLE haven_owner_churn;

GRANT ROLE taskadmin TO ROLE haven_owner_churn;
GRANT CREATE TASK ON SCHEMA haven_data_science.owner_churn TO ROLE haven_owner_churn;
grant CREATE service ON SCHEMA haven_data_science.owner_churn TO ROLE haven_owner_churn;

SHOW roles LIKE '_haven_owner_churn%';

GRANT ROLE _haven_store__caravans__reader TO ROLE _haven_owner_churn__haven_store__caravans__reader;
GRANT SELECT ON TABLE HAVEN_STORE.CARAVANS.OWNER_STATUS_TIME_SERIES_ANALYSIS TO ROLE _haven_owner_churn__haven_store__caravans__reader;

GRANT ROLE _haven_owner_churn__haven_store__caravans__reader TO ROLE haven_owner_churn;

use ROLE haven_owner_churn;

SHOW GRANTS OF ROLE _haven_owner_churn__haven_base__oecd__reader;

use SCHEMA haven_base.oecd;

-- 08/01/2026

use ROLE securityadmin;

GRANT ROLE _HAVEN_DATA_SCIENCE__OWNER_CHURN__READER TO ROLE haven_data_science;


haven_data_science_dev.owner_churn and haven_data_science_dev.test_owner_churn
haven_data_science_dev.owner_churn and haven_data_science_dev.test_owner_churn