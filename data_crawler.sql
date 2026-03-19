use role accountadmin;

SET major = 2;
SET minor = 0;
SET COMMENT = concat('{"origin": "sf_sit",
            "name": "data_catalog",
            "version": {"major": ',$major,', "minor": ',$minor,'}}');

use warehouse haven_cdc_migration_wh;

SET (streamlit_warehouse)=(SELECT CURRENT_WAREHOUSE());

CREATE DATABASE IF NOT EXISTS DATA_CATALOG
COMMENT = $COMMENT;
USE DATABASE DATA_CATALOG;

CREATE SCHEMA IF NOT EXISTS DATA_CATALOG.TABLE_CATALOG
COMMENT = $COMMENT;
USE SCHEMA DATA_CATALOG.TABLE_CATALOG;

-- Create API Integration for Git
CREATE OR REPLACE API INTEGRATION git_api_integration_snowflake_labs_emerging_solutions_toolbox
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/Snowflake-Labs')
  ENABLED = TRUE;

-- Create Git Repository
CREATE OR REPLACE GIT REPOSITORY EMERGING_SOLUTION_TOOLBOX
  API_INTEGRATION = git_api_integration_snowflake_labs_emerging_solutions_toolbox
  ORIGIN = 'https://github.com/Snowflake-Labs/emerging-solutions-toolbox.git';

ALTER GIT REPOSITORY EMERGING_SOLUTION_TOOLBOX FETCH;

CREATE OR REPLACE STAGE DATA_CATALOG.TABLE_CATALOG.SRC_FILES
DIRECTORY = (ENABLE = true);

COPY FILES
  INTO @DATA_CATALOG.TABLE_CATALOG.SRC_FILES/
  FROM @EMERGING_SOLUTION_TOOLBOX/branches/main/sfguide-data-crawler/src/
  PATTERN='.*[.]py';
-- PUT file://src/*.py @DATA_CATALOG.TABLE_CATALOG.SRC_FILES OVERWRITE = TRUE AUTO_COMPRESS = FALSE;

COPY FILES
  INTO @DATA_CATALOG.TABLE_CATALOG.SRC_FILES
  FROM @EMERGING_SOLUTION_TOOLBOX/branches/main/sfguide-data-crawler/streamlit/
  FILES=('manage.py', 'environment.yml');

COPY FILES
  INTO @DATA_CATALOG.TABLE_CATALOG.SRC_FILES/pages/
  FROM @EMERGING_SOLUTION_TOOLBOX/branches/main/sfguide-data-crawler/streamlit/pages/
  FILES=('run.py');

-- PUT file://streamlit/manage.py @DATA_CATALOG.TABLE_CATALOG.SRC_FILES OVERWRITE = TRUE AUTO_COMPRESS = FALSE;
-- PUT file://streamlit/environment.yml @DATA_CATALOG.TABLE_CATALOG.SRC_FILES OVERWRITE = TRUE AUTO_COMPRESS = FALSE;
-- PUT file://streamlit/pages/run.py @DATA_CATALOG.TABLE_CATALOG.SRC_FILES/pages/ OVERWRITE = TRUE AUTO_COMPRESS = FALSE;

CREATE OR ALTER TABLE DATA_CATALOG.TABLE_CATALOG.TABLE_CATALOG (
  TABLENAME VARCHAR
  ,DESCRIPTION VARCHAR
  ,CREATED_ON TIMESTAMP
  ,EMBEDDINGS VECTOR(FLOAT, 768)
  ,COMMENT_UPDATED BOOLEAN
  )
COMMENT = $COMMENT;


CREATE OR REPLACE FUNCTION DATA_CATALOG.TABLE_CATALOG.PCTG_NONNULL(records VARIANT)
returns STRING
language python
RUNTIME_VERSION = '3.10'
IMPORTS = ('@DATA_CATALOG.TABLE_CATALOG.SRC_FILES/tables.py')
COMMENT = $COMMENT
HANDLER = 'tables.pctg_nonnulls'
PACKAGES = ('pandas','snowflake-snowpark-python');

CREATE OR REPLACE PROCEDURE DATA_CATALOG.TABLE_CATALOG.CATALOG_TABLE(
                                                          tablename string,
                                                          prompt string,
                                                          sampling_mode string DEFAULT 'fast',
                                                          n integer DEFAULT 5,
                                                          model string DEFAULT 'mistral-7b',
                                                          update_comment boolean Default FALSE,
                                                          use_native_feature boolean DEFAULT FALSE)
RETURNS VARIANT
LANGUAGE PYTHON
RUNTIME_VERSION = '3.10'
IMPORTS = ('@DATA_CATALOG.TABLE_CATALOG.SRC_FILES/tables.py', '@DATA_CATALOG.TABLE_CATALOG.SRC_FILES/prompts.py')
PACKAGES = ('snowflake-snowpark-python','joblib', 'pandas', 'snowflake-ml-python')
HANDLER = 'tables.generate_description'
COMMENT = $COMMENT
EXECUTE AS CALLER;

CREATE OR REPLACE PROCEDURE DATA_CATALOG.TABLE_CATALOG.DATA_CATALOG(target_database string,
                                                         catalog_database string,
                                                         catalog_schema string,
                                                         catalog_table string,
                                                         target_schema string DEFAULT '',
                                                         include_tables ARRAY DEFAULT null,
                                                         exclude_tables ARRAY DEFAULT null,
                                                         replace_catalog boolean DEFAULT FALSE,
                                                         sampling_mode string DEFAULT 'fast',
                                                         update_comment boolean Default FALSE,
                                                         n integer DEFAULT 5,
                                                         model string DEFAULT 'mistral-7b',
                                                         use_native_feature boolean DEFAULT FALSE
                                                         )
RETURNS TABLE()
LANGUAGE PYTHON
RUNTIME_VERSION = '3.10'
PACKAGES = ('snowflake-snowpark-python','pandas', 'snowflake-ml-python')
IMPORTS = ('@DATA_CATALOG.TABLE_CATALOG.SRC_FILES/tables.py',
           '@DATA_CATALOG.TABLE_CATALOG.SRC_FILES/main.py',
           '@DATA_CATALOG.TABLE_CATALOG.SRC_FILES/prompts.py')
HANDLER = 'main.run_table_catalog'
COMMENT = $COMMENT
EXECUTE AS CALLER;

CREATE OR REPLACE STREAMLIT DATA_CATALOG.TABLE_CATALOG.DATA_CRAWLER
ROOT_LOCATION = '@data_catalog.table_catalog.src_files'
MAIN_FILE = '/manage.py'
QUERY_WAREHOUSE = $streamlit_warehouse
COMMENT = $COMMENT;

CALL DATA_CATALOG.TABLE_CATALOG.DATA_CATALOG(target_database => 'HAVEN_STORE',
                                  catalog_database => 'DATA_CATALOG',
                                  catalog_schema => 'TABLE_CATALOG',
                                  catalog_table => 'TABLE_CATALOG',
                                  target_schema => 'CARAVANS',
                                  sampling_mode => 'fast',
                                  update_comment => FALSE,
                                  use_native_feature => TRUE
                                  );


use role useradmin;

create role _data_catalog__usage;
create role _data_catalog__data_catalog__usage;

use role securityadmin;;

grant usage on database data_catalog to role _data_catalog__usage;

grant role _data_catalog__usage to role _data_catalog__data_catalog__usage;
grant usage on schema data_catalog.table_catalog to role _data_catalog__data_catalog__usage;

show roles like '%governance%';
grant role _data_catalog__data_catalog__usage to role bourne_governance;
grant usage on streamlit data_catalog.table_catalog.data_crawler to role bourne_governance;

use role accountadmin;;

CALL SNOWFLAKE.MODELS.CORTEX_BASE_MODELS_REFRESH();

truncate table DATA_CATALOG.TABLE_CATALOG.TABLE_CATALOG;;

CALL DATA_CATALOG.TABLE_CATALOG.DATA_CATALOG(target_database => 'HAVEN_STORE',
                                  catalog_database => 'DATA_CATALOG',
                                  catalog_schema => 'TABLE_CATALOG',
                                  catalog_table => 'TABLE_CATALOG',
                                  target_schema => 'CARAVAN_SALES',
                                  sampling_mode => 'fast',
                                  update_comment => FALSE,
                                  use_native_feature => FALSE
                                  );


CALL DATA_CATALOG.TABLE_CATALOG.DATA_CATALOG(target_database => 'HAVEN_STORE',
                                  catalog_database => 'DATA_CATALOG',
                                  catalog_schema => 'TABLE_CATALOG',
                                  catalog_table => 'TABLE_CATALOG',
                                  target_schema => 'CARAVANS',
                                  sampling_mode => 'fast',
                                  update_comment => TRUE,
                                  use_native_feature => FALSE
                                  );



use role accountadmin;

show parameters;

select SYSTEM$ALLOWLIST();

SHOW MODELS IN SNOWFLAKE.MODELS;

use database data_catalog;

use schema table_catalog;

SHOW APPLICATION ROLES IN APPLICATION SNOWFLAKE;

use database snowflake;

ALTER ACCOUNT SET CORTEX_MODELS_ALLOWLIST = 'None';

grant application role "CORTEX-MODEL-ROLE-MISTRAL-7B" to role bourne_governance;
SELECT SNOWFLAKE.CORTEX.EMBED_TEXT_768('snowflake-arctic-embed-m-v1.5', 'hello world');
use role accountadmin;

SELECT SNOWFLAKE.CORTEX.COMPLETE('claude-4-sonnet', 'What are large language models?');

use role securityadmin;
grant role _data_catalog__data_catalog__usage to role dba;
grant usage on streamlit data_catalog.table_catalog.data_crawler to role dba;

-- 20/11/2025
-- run for entire HAVEN_BASE database using the default AI model

use role accountadmin;

show databases;

use database haven_base;
CALL DATA_CATALOG.TABLE_CATALOG.DATA_CATALOG(target_database => 'HAVEN_BASE',
                                  catalog_database => 'DATA_CATALOG',
                                  catalog_schema => 'TABLE_CATALOG',
                                  catalog_table => 'TABLE_CATALOG',
                                  sampling_mode => 'fast',
                                  update_comment => TRUE,
                                  use_native_feature => FALSE
                                  );


use ROLE 
CALL DATA_CATALOG.TABLE_CATALOG.DATA_CATALOG(target_database => 'HAVEN_STORE',
                                  catalog_database => 'DATA_CATALOG',
                                  catalog_schema => 'TABLE_CATALOG',
                                  catalog_table => 'TABLE_CATALOG',
                                  target_schema => 'CARAVANS',
                                  sampling_mode => 'fast',
                                  update_comment => TRUE,
                                  use_native_feature => FALSE
                                  );
