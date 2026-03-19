use role accountadmin;

-- <REDACTED>
-- <REDACTED>
use schema haven_master.common;

CREATE OR REPLACE SECRET haven_master.common.manleyjs_test_repo_secret
  TYPE = password
  USERNAME = 'ManleyJS'
  PASSWORD = '<REDACTED>';

CREATE OR REPLACE API INTEGRATION manleyjs_test_repo_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/ManleyJS/streamlit-example')
  ALLOWED_AUTHENTICATION_SECRETS = (manleyjs_test_repo_secret)
  ENABLED = TRUE;  

CREATE OR REPLACE GIT REPOSITORY "streamlit-example" 
	ORIGIN = 'https://github.com/ManleyJS/streamlit-example' 
	API_INTEGRATION = 'MANLEYJS_TEST_REPO_API_INTEGRATION' 
	GIT_CREDENTIALS = 'HAVEN_MASTER.COMMON.MANLEYJS_TEST_REPO_SECRET' 
	COMMENT = 'test integration'; 

grant usage on application training.training.test_git_repo_import to user sarunas;  

-- <REDACTED>

use role accountadmin;

use schema haven_master.common;

CREATE OR REPLACE SECRET HAVEN_MASTER.COMMON.MANLEYJS63_RMS_STREAMLIT_SECRET
  TYPE = password
  USERNAME = 'ManleyJS63'
  PASSWORD = '<REDACTED>';

CREATE OR REPLACE API INTEGRATION MANLEYJS63_RMS_STREAMLIT_API_INTEGRATION COPY GRANTS
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/RMS-Darius/cspa-snowflake/')
  ALLOWED_AUTHENTICATION_SECRETS = (MANLEYJS63_RMS_STREAMLIT_SECRET)
  ENABLED = TRUE;  



grant usage on integration MANLEYJS63_RMS_STREAMLIT_API_INTEGRATION to role dba;
grant usage on secret   HAVEN_MASTER.COMMON.MANLEYJS63_RMS_STREAMLIT_SECRET to role dba;

drop GIT REPOSITORY "rms-streamlit-integration";

use role securityadmin;

grant create git repository on schema haven_master.common to role dba;

use role DBA;

CREATE OR REPLACE GIT REPOSITORY "rms-streamlit-integration"
	ORIGIN = 'https://github.com/RMS-Darius/cspa-snowflake/' 
	API_INTEGRATION = MANLEYJS63_RMS_STREAMLIT_API_INTEGRATION
	GIT_CREDENTIALS = HAVEN_MASTER.COMMON.MANLEYJS63_RMS_STREAMLIT_SECRET
	COMMENT = 'RMS Streamlit integration'; 

grant usage on integration MANLEYJS63_RMS_STREAMLIT_API_INTEGRATION to role dba;

show git repositories;

grant read, write on git repository "rms-streamlit-integration" to role haven_revenue_management_dariustinca;

use role haven_revenue_management_dariustinca;

use role securityadmin;
grant role _haven_master__usage to role haven_revenue_management_dariustinca;
grant role _haven_master__streamlits__usage to role haven_revenue_management_dariustinca;

grant usage on integration MANLEYJS63_RMS_STREAMLIT_API_INTEGRATION to role haven_revenue_management_dariustinca;
grant usage on secret   HAVEN_MASTER.COMMON.MANLEYJS63_RMS_STREAMLIT_SECRET to role haven_revenue_management_dariustinca;

use role dba;
grant read, write on git repository "rms-streamlit-integration" to role haven_revenue_management_dariustinca;


-- setting up Darius

use role securityadmin;

grant usage on integration MANLEYJS63_RMS_STREAMLIT_API_INTEGRATION to role haven_revenue_management_dariustinca;
grant usage on secret   HAVEN_MASTER.COMMON.MANLEYJS63_RMS_STREAMLIT_SECRET to role haven_revenue_management_dariustinca;

revoke usage on integration MANLEYJS63_RMS_STREAMLIT_API_INTEGRATION from role haven_revenue_management_dariustinca;
revoke usage on secret   HAVEN_MASTER.COMMON.MANLEYJS63_RMS_STREAMLIT_SECRET from role haven_revenue_management_dariustinca;

grant role _haven_master__common__usage to role haven_revenue_management_dariustinca;

revoke create git repository on schema haven_master.common from role haven_revenue_management_dariustinca;

use role haven_revenue_management_dariustinca;

CREATE OR REPLACE GIT REPOSITORY cdsa_streamlit_repository
	ORIGIN = 'https://github.com/RMS-Darius/cspa-snowflake/' 
	API_INTEGRATION = MANLEYJS63_RMS_STREAMLIT_API_INTEGRATION
	GIT_CREDENTIALS = HAVEN_MASTER.COMMON.MANLEYJS63_RMS_STREAMLIT_SECRET
	COMMENT = 'CSPA Streamlit Repository'; 

drop GIT REPOSITORY cdsa_streamlit_repository;

show git repositories;

grant read, write on git repository "rms-streamlit-integration" to role haven_revenue_management_dariustinca;

use role haven_revenue_management_dariustinca;
show git repositories;


use role securityadmin;
grant role _haven_master__usage to role haven_revenue_management_dariustinca;
grant role _haven_master__streamlits__usage to role haven_revenue_management_dariustinca;


use role dba;

use schema haven_store.caravan_sales_pricing_application;

select get_ddl('schema', 'haven_store.caravan_sales_pricing_application');
grant usage on integration MANLEYJS63_RMS_STREAMLIT_API_INTEGRATION to role haven_revenue_management_dariustinca;
grant usage on secret   HAVEN_MASTER.COMMON.MANLEYJS63_RMS_STREAMLIT_SECRET to role haven_revenue_management_dariustinca;

use role dba;
grant read, write on git repository "rms-streamlit-integration" to role haven_revenue_management_dariustinca;


-- 23/07/2025

use role accountadmin;

CREATE OR REPLACE API INTEGRATION test_oauth_integration
   API_PROVIDER = git_https_api
   API_ALLOWED_PREFIXES = ('https://github.com/ManleyJS/streamlit-example')
   API_USER_AUTHENTICATION = (
      TYPE = snowflake_github_app
   )
   ENABLED = TRUE;

DROP API INTEGRATION test_oauth_integration;

grant usage on integration test_oauth_integration to role dba;

use role dba;

use role accountadmin;

CREATE OR REPLACE API INTEGRATION pitch_perfect_repository
   API_PROVIDER = git_https_api
   API_ALLOWED_PREFIXES = ('https://github.com/HavenEngineering/service-haven-data-pitchperfect')
   API_USER_AUTHENTICATION = (
      TYPE = snowflake_github_app
   )
   ENABLED = TRUE;

grant usage on integration pitch_perfect_repository to role haven_data_engineering;

use role haven_data_engineering;

-- 30/07/2025

use role securityadmin;

show roles like 'dbt%';

use database haven_master;
use schema common;

show git repositories;

use role securityadmin;
show grants to role dbtadmin;

desc repository haven_master.common.pp_test;

use role haven_data_engineering;

use schema haven_master.common;

ALTER GIT REPOSITORY haven_master.common.pp_test FETCH;

use role securityadmin;

grant role _haven_master__common__creator to role haven_data_engineering;

use role haven_data_engineering;

use schema haven_master.common;

ALTER GIT REPOSITORY haven_master.common.pp_test FETCH;

use role securityadmin;

revoke role _haven_master__common__creator from role haven_data_engineering;

show grants to role haven_data_engineering;

show git repositories;

use role accountadmin;

grant ownership on git repository haven_master.common.pp_test to role haven_data_engineering revoke current grants;
grant read, write on git repository haven_master.common.pp_test to role haven_data_engineering;

use role haven_data_engineering;
use schema haven_master.common;
ALTER GIT REPOSITORY haven_master.common.pp_test FETCH;

use role accountadmin;
ALTER GIT REPOSITORY haven_master.common.pp_test FETCH;

desc git repository haven_master.common.pp_test;

desc api integration PITCH_PERFECT_REPOSITORY;

show grants on integration PITCH_PERFECT_REPOSITORY;

grant ownership on integration PITCH_PERFECT_REPOSITORY to role haven_data_engineering revoke current grants;

show integrations;

desc integration PITCH_PERFECT_REPOSITORY;
use role haven_data_engineering;
use schema haven_master.common;
ALTER GIT REPOSITORY haven_master.common.pp_test FETCH;

use role accountadmin;
ALTER GIT REPOSITORY haven_master.common.pp_test FETCH;

show grants to role haven_data_engineering;

select get_ddl('git repository', 'haven_master.common.pp_test');

use role securityadmin;

grant role _haven_master__usage to role haven_data_engineering;
grant role _haven_master__common__usage to role haven_data_engineering;
grant create git repository on schema haven_master.common to role haven_data_engineering;

use role haven_data_engineering;

use role accountadmin;

CREATE OR REPLACE GIT REPOSITORY haven_master.common.pp_test
  API_INTEGRATION = PITCH_PERFECT_REPOSITORY
  ORIGIN = 'https://github.com/HavenEngineering/service-haven-data-pitchperfect';

grant usage on integration PITCH_PERFECT_REPOSITORY to role haven_data_engineering;
grant read, write on git repository haven_master.common.pp_test to role haven_data_engineering;
grant create git repository on schema haven_master.common to role haven_data_engineering;
grant role _haven_master__common__creator to role haven_data_engineering;

use role haven_data_engineering;

show git branches in GIT REPOSITORY haven_master.common.pp_test;

ALTER GIT REPOSITORY haven_master.common.pp_test FETCH;

use role accountadmin;
ALTER GIT REPOSITORY haven_master.common.pp_test FETCH;

use schema haven_pipeline_qat;

use role securityadmin;

GRANT CREATE compute pool on account TO ROLE manage_data_science_resources;

use role accountadmin;

GRANT CREATE compute pool on account TO ROLE manage_data_science_resources;

-- 03/09/2025
-- dbt pricer

use role dba;

use role accountadmin;

CREATE OR REPLACE API INTEGRATION service_dbt_haven_rms_pricer_integration
   API_PROVIDER = git_https_api
   API_ALLOWED_PREFIXES = ('https://github.com/HavenEngineering/service-dbt-haven-rms-pricer')
   API_USER_AUTHENTICATION = (
      TYPE = snowflake_github_app
   )
   ENABLED = TRUE;

grant usage on integration service_dbt_haven_rms_pricer_integration to role haven_dbt_development;

show integrations;

-- note permissions need to be set on git hub when creating the git repository to enbable access and creation

use role accountadmin;

show git repositories in account;

show api integrations;

use role securityadmin;

revoke role taskadmin from  role haven_dbt_transform;
grant role taskadmin to role haven_dbt_development;

use role dba;