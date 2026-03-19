use role dba;
use application package dba_snowflake_package;

list @dba_snowflake_package.stage_content.dba_snowflake_stage;

CREATE TABLE IF NOT EXISTS accounts_output (ID INT, NAME VARCHAR, VALUE VARCHAR);

CREATE OR REPLACE STAGE dba_snowflake_package.shared_data.dba_export_data
  ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE')
  FILE_FORMAT = (TYPE = 'csv' FIELD_DELIMITER = '|' SKIP_HEADER = 1);

show stages;

list @dba_snowflake_package.shared_data.dba_export_data;
drop stage dba_snowflake_package.shared_data.dba_export_data;


use schema shared_data;

GRANT SELECT ON TABLE accounts_output TO SHARE IN APPLICATION PACKAGE dba_snowflake_package;
drop table accounts_output;

drop application dba_snowflake_app;
CREATE APPLICATION dba_SNOWFLAKE_APP
  FROM APPLICATION PACKAGE dba_SNOWFLAKE_PACKAGE
  USING '@dba_snowflake_package.stage_content.dba_snowflake_stage';

-- copy into @dba_core.dba_export_data/code_schema/accounts_view.csv from code_schema.accounts_view single = true;  
list @dba_core.dba_export_data;

use application dba_snowflake_app;

select * from dba_core.accounts_output;
insert into dba_core.accounts_output select * from code_schema.accounts_view;

