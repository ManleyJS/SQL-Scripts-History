use ROLE sysadmin;

CREATE WAREHOUSE haven_dbt_transform_data_science_dev_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use ROLE useradmin;

CREATE ROLE haven_dbt_transform_data_science_dev;

create role _haven_dbt_transform_data_science_dev_warehouse_xsmall__operator;
create role _haven_dbt_transform_data_science_dev_warehouse_xsmall__usage;
create role _haven_dbt_transform_data_science_dev_warehouse_xsmall__monitor;


create user haven_dbt_transform_data_science_dev
login_name = 'haven.dbt.transform.data.science.dev'
display_name = 'Haven Development Data Science Pipeline'
email = 'sarunas.jatautis@bourne-leisure.co.uk'
comment = 'Haven Data Science DBT Development Model DEV pipelines'
default_role =  haven_dbt_transform_data_science_dev
default_warehouse = haven_dbt_transform_data_science_dev_warehouse_xsmall
RSA_PUBLIC_KEY = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzuSfWeMW6AYemyln2r8N
BPfjyiMZYIkQEeNlrFTV0H8B2J6j4t/ICoFDsH4hreMEc1glmbHSomLfi4RuM8Yw
14Kanc4SDj5oTmXc16kFRt7xOcFZtVYs4j+144pWqBgV5Z1sCVcBrjBcnOtQ2yvO
8WOlTolV2AKl+zigHA909gFVM7l6lCCI5An2dTGsB9KoruegxPVWpme2NxiiYgw2
q4z0CTPvAdQwq5rLE22f1uWJj6oEbo/VV2wDVPAWZYg8KPiRTPNPGwSE3O3h+fCf
m9waFbLt6y5pIqWZHMhOgi/c3Nte88r4sygMq9mQk3+wpssru1zUyLR/y5fWgeGO
ewIDAQAB';


use ROLE securityadmin;

grant usage, monitor on warehouse haven_dbt_transform_data_science_dev_warehouse_xsmall to role _haven_dbt_transform_data_science_dev_warehouse_xsmall__usage;
grant role _haven_dbt_transform_data_science_dev_warehouse_xsmall__usage to role _haven_dbt_transform_data_science_dev_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_dbt_transform_data_science_dev_warehouse_xsmall to role _haven_dbt_transform_data_science_dev_warehouse_xsmall__operator;
grant monitor on warehouse haven_dbt_transform_data_science_dev_warehouse_xsmall to role _haven_dbt_transform_data_science_dev_warehouse_xsmall__monitor;

GRANT ROLE _haven_dbt_transform_data_science_dev_warehouse_xsmall__usage TO ROLE haven_dbt_transform_data_science_dev;
GRANT ROLE haven_dbt_transform_data_science_dev TO USER haven_dbt_transform_data_science_dev;

SHOW GRANTS TO ROLE haven_data_science_dev;

GRANT ROLE _BOURNE_BASE__AZTECACTIVITYMANAGEMENT__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_BASE__AZTEC__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_BASE__BRAINTREE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_BASE__CONCUR__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_BASE__COUPA__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_BASE__DREAM__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_BASE__FINANCIAL_CUBE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_BASE__KMSREPORTING__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_BASE__QUALTRICS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_BASE__ZBSDATA__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_STORE__FINANCE_SHARED_SERVICES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_STORE__KMSREPORTING__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_STORE__SAS_COMMON__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_STORE__SAS_SCV__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _BOURNE_STORE__ZBSDATA__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__ACTIVITIES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__ADTHENA__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__AMPLITUDE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__ARCADES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__AWIN__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__AZTECACTIVITYMANAGEMENT_COMPLEX__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__AZTEC_COMPLEX__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__AZTEC_RETAIL__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__BIGQUERY__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__BLAPI_HID__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__BLOOMREACH_INTEGRATION__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__BLOOMREACH__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__BLUEYONDER__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__BRAINTREE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__CARAVAN_SALES_PRICING_APPLICATION__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__COMMON__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__COMPETITOR__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__CONSENT_AND_PREFERENCE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__COUPA__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__CYHH__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_AAC_ONPARKWIFI__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_ACCEPTANCE_OF_RISK__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_ACTIVITIES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_ARRIVALS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_BOOKINGS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_CAPACITY__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_FB_EAGLEEYE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_FB_ENTERTAINMENT__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_FB_TABLE_BOOKING__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_OWNERSHIP_OWNERS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_OWNERS_ARRIVALS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_PARK_AREAS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_PAYMENTS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_PLAYPASS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_PRICING__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_TEAM_CARD__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_TEAM_COMMS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DIG_VENUE_DISRUPTION__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DREAM_EVERGREEN__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DREAM_ROCKLEYBOATPARK__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__DREAM__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__ECLIENT__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__ENERGY_METERS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__ENTRA_ID__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__EQUALISER__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__ERPX__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__EXPERIAN__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__FACEBOOK_CARAVAN_SALES_LEADS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__FACEBOOK_CARAVAN_SALES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__FACEBOOK_HOLIDAY_SALES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__FACEBOOK__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__FINANCIAL_CUBE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__FREEDOMPAY__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__FRESHSALES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__GOOGLE_INTEGRATION__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__HIT_ADMIN__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__ICLEAN__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__IDENTITY__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__JDAADMIN__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__KAPPTURE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__KMSREPORTING_COMPLEX__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__MARINER__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__MATTERPORT_IMAGES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__OECD__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__PAYMENT_SERVICE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__PLAYSAFE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__PLOT_ARCHIVE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__PLOT_DREAM__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__PLOT__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__PRICER__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__PRIME__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__QUALTRICS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__SAGACITY__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__SAS_COMMON__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__SAS_SCV__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__SEAWARE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__SPORTS_FIXTURES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__TIKTOK_ADS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__WETHERSPOONS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__WORKFORCE_SAM__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__ZBSDATA_COMPLEX__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__ZBSDATA_RETAIL__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_BASE__ZONAL__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_DATA_ENGINEERING__USAGE to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_DATA_SCIENCE__DATA_SCIENCE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_MASTER__COMMON__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_MASTER__ETLEAP_STATUS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_MASTER__EVENT_LOG__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__ACTIVITIES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__ALIGN_ALYTICS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__ARRIVAL__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__AVAILABILITY__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__BUDGET_DATA__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__CARAVANS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__CARAVAN_SALES_PRICING_APPLICATION__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__CARAVAN_SALES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__COMMERCIAL__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__COMMON_RESTRICTED__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__COMMON__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__COMPETITOR__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__CONSENT_AND_PREFERENCE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__COUPA_CUBE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__CUSTOMER__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__CYHH_PRICING_CONFIG__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__CYHH_PRICING_PILOT_REPORTING__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__DECISION_MATRIX_REPORTING__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__DIGITAL__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__FINANCE_CUBE_ERPX__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__FINANCE_SHARED_SERVICES__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__FINANCIAL_CUBE__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__FLEX_CALCULATOR__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__HAVEN_ACCOUNTANTS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__HAVEN_STAGING__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__HOLIDAY__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__IDENTITY__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__INTEGRATION__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__JDAADMIN__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__JDAPREP__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__KMSREPORTING_COMPLEX__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__KPMG_VIEWS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__LETTINGS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__MA_MART__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__OCANDC__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__PARK_OPERATIONS__READER to role haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_STORE__PART_EXCHANGE_MODEL__READER to role haven_dbt_transform_data_science_dev;

use ROLE securityadmin;

GRANT ROLE haven_dbt_transform_data_science_dev TO USER sarunasjatautis;

-- 14/11/2025

use role accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL
    MIN_NODES = 1
    MAX_NODES = 4
    INSTANCE_FAMILY = 'CPU_X64_S'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;

CREATE COMPUTE POOL IF NOT EXISTS HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM
    MIN_NODES = 1
    MAX_NODES = 6
    INSTANCE_FAMILY = 'CPU_X64_M'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;

use ROLE sysadmin;

CREATE WAREHOUSE HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL 
WITH WAREHOUSE_SIZE = XSMALL 
WAREHOUSE_TYPE = STANDARD
AUTO_SUSPEND = 60 
AUTO_RESUME = TRUE 
MIN_CLUSTER_COUNT = 1
MAX_CLUSTER_COUNT = 2
SCALING_POLICY = 'STANDARD';


use ROLE useradmin;

DROP ROLE HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__usage;
DROP ROLE HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__operator;
DROP ROLE HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__monitor;

DROP ROLE HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__usage;
DROP ROLE HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__operator;
DROP ROLE HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__monitor;

DROP ROLE HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__usage;
DROP ROLE HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__operator;
DROP ROLE HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__monitor;

CREATE ROLE _HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__usage;
CREATE ROLE _HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__operator;
CREATE ROLE _HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__monitor;

CREATE ROLE _HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__usage;
CREATE ROLE _HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__operator;
CREATE ROLE _HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__monitor;

CREATE ROLE _HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__usage;
CREATE ROLE _HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__operator;
CREATE ROLE _HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__monitor;

use ROLE securityadmin;

grant usage, monitor on compute pool HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL TO ROLE _HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__usage;
grant operate, modify on compute pool HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL TO ROLE _HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__operator;
GRANT ROLE _HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__usage TO ROLE _HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__operator;
grant monitor on compute pool HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL TO ROLE _HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__Monitor;

grant usage, monitor on compute pool HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM TO ROLE _HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__usage;
grant operate, modify on compute pool HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM TO ROLE _HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__operator;
GRANT ROLE _HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__usage TO ROLE _HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__operator;
grant monitor on compute pool HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM TO ROLE _HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__monitor;


grant usage, monitor on warehouse HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL to role _HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__usage;
grant role _HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__usage to role _HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__operator;
grant operate, modify on warehouse HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL to role _HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__operator;
grant monitor on warehouse HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL to role _HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__monitor;

GRANT ROLE _HAVEN_ROTA_SCHEDULING_DEV_INFERENCE_COMPUTE_POOL_SMALL__usage TO ROLE haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_ROTA_SCHEDULING_DEV_TRAINING_COMPUTE_POOL_MEDIUM__usage TO ROLE haven_dbt_transform_data_science_dev;
GRANT ROLE _HAVEN_ROTA_SCHEDULING_DEV_BUILD_WAREHOUSE_XSMALL__usage  TO ROLE haven_dbt_transform_data_science_dev;

GRANT ROLE haven_dbt_transform_data_science_dev TO ROLE dba;

use ROLE haven_dbt_transform_data_science_dev;

SHOW compute pools;

SHOW warehouses;

use ROLE dba;

-- 27/11/2025                                                                                                                                                                                               
                                                                                                                                                                                                            
use role accountadmin;                                                                                                                                                                                      
                                                                                                                                                                                                            
CREATE COMPUTE POOL IF NOT EXISTS HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL                                                                                                                    
    MIN_NODES = 1                                                                                                                                                                                           
    MAX_NODES = 4                                                                                                                                                                                           
    INSTANCE_FAMILY = 'CPU_X64_S'                                                                                                                                                                           
    AUTO_RESUME = TRUE                                                                                                                                                                                      
	INITIALLY_SUSPENDED = TRUE                                                                                                                                                                              
	AUTO_SUSPEND_SECS = 60;                                                                                                                                                                                 
                                                                                                                                                                                                            
CREATE COMPUTE POOL IF NOT EXISTS HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM                                                                                                                    
    MIN_NODES = 1                                                                                                                                                                                           
    MAX_NODES = 6                                                                                                                                                                                           
    INSTANCE_FAMILY = 'CPU_X64_M'                                                                                                                                                                           
    AUTO_RESUME = TRUE                                                                                                                                                                                      
	INITIALLY_SUSPENDED = TRUE                                                                                                                                                                              
	AUTO_SUSPEND_SECS = 60;                                                                                                                                                                                 
                                                                                                                                                                                                            
                                                                                                                
                                                                                                                
                                                                                                                
use ROLE useradmin;                                                                                                                                                                                         
                                                                                                                                                                                                            
CREATE ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL__usage;                                                                                                                                 
CREATE ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL__operator;                                                                                                                              
CREATE ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL__monitor;                                                                                                                               
                                                                                                                                                                                                            
CREATE ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM__usage;                                                                                                                                 
CREATE ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM__operator;                                                                                                                              
CREATE ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM__monitor;                                                                                                                               
                                                                                                                                                                                                            
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                                                                                                            
use ROLE securityadmin;                                                                                                                                                                                     
                                                                                                                                                                                                            
grant usage, monitor on compute pool HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL TO ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL__usage;                                         
grant operate, modify on compute pool HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL TO ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL__operator;                                     
GRANT ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL__usage TO ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL__operator;                                                        
grant monitor on compute pool HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL TO ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL__Monitor;                                              
                                                                                                                                                                                                            
grant usage, monitor on compute pool HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM TO ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM__usage;                                         
grant operate, modify on compute pool HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM TO ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM__operator;                                     
GRANT ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM__usage TO ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM__operator;                                                        
grant monitor on compute pool HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM TO ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM__monitor;                                              
                                                                                                                                                                                                            
                                                                                                                                                                                                            
                                        
                                        
                                        
                                        
                                        
GRANT ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_SMALL__usage TO ROLE haven_dbt_transform_data_science_dev;                                                                                     
GRANT ROLE _HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV_COMPUTE_POOL_MEDIUM__usage TO ROLE haven_dbt_transform_data_science_dev;                                                                                     
                                                                                     
                                                                                     
GRANT ROLE haven_dbt_transform_data_science_dev TO ROLE dba;                                                                                                                                                


use ROLE haven_dbt_transform_data_science_dev;                                                                                                                                                              
                                                                                                                                                                                                            
SHOW compute pools;                                                                                                                                                                                         
                                                                                                                                                                                                            
SHOW warehouses;                                                                                                                                                                                            
                                                                                                                                                                                                            
use ROLE dba;                                                                                                                                                                                               