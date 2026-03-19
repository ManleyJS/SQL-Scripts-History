USE ROLE securityadmin;
GRANT CREATE APPLICATION PACKAGE ON ACCOUNT TO ROLE dba;

USE ROLE accountadmin;
CREATE APPLICATION PACKAGE hello_snowflake_package;

SHOW APPLICATION PACKAGES;

USE DATABASE training;

USE APPLICATION PACKAGE hello_snowflake_package;

CREATE SCHEMA stage_content;

CREATE OR REPLACE STAGE hello_snowflake_package.stage_content.hello_snowflake_stage
  FILE_FORMAT = (TYPE = 'csv' FIELD_DELIMITER = '|' SKIP_HEADER = 1);
  
 