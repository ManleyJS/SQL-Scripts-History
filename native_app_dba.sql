use role dba;
show roles like '%training%';

create APPLICATION PACKAGE dba_snowflake_package;
use application package dba_snowflake_package;

show references in application dba_snowflake_app;


show applications;
show application packages;

CREATE SCHEMA stage_content;

show stages;

CREATE OR REPLACE STAGE dba_snowflake_package.stage_content.dba_snowflake_stage
  FILE_FORMAT = (TYPE = 'csv' FIELD_DELIMITER = '|' SKIP_HEADER = 1);

LIST @dba_snowflake_package.stage_content.dba_snowflake_stage;

drop application dba_SNOWFLAKE_APP;

CREATE APPLICATION dba_SNOWFLAKE_APP
  FROM APPLICATION PACKAGE dba_SNOWFLAKE_PACKAGE
  USING '@dba_snowflake_package.stage_content.dba_snowflake_stage';

show applications;

CALL dba_core.hello();

use application dba_snowflake_app;

show schemas;
show application roles in application dba_SNOWFLAKE_APP;

drop application dba_SNOWFLAKE_APP cascade;
drop application package dba_SNOWFLAKE_PACKAGE;

CALL core.hello();

show applications;
show application packages;

use application package dba_snowflake_package;

drop schema shared_data;

use schema shared_data;

CREATE SCHEMA IF NOT EXISTS shared_data;

CREATE TABLE IF NOT EXISTS accounts (ID INT, NAME VARCHAR, VALUE VARCHAR);
INSERT INTO accounts VALUES
  (1, 'Nihar', 'Snowflake'),
  (2, 'Frank', 'Snowflake'),
  (3, 'Benoit', 'Snowflake'),
  (4, 'Steven', 'Acme');

SELECT * FROM shared_schema.accounts;  

CREATE TABLE IF NOT EXISTS accounts_output (ID INT, NAME VARCHAR, VALUE VARCHAR);
CREATE OR REPLACE STAGE dba_snowflake_package.stage_content.dba_snowflake_stage
  FILE_FORMAT = (TYPE = 'csv' FIELD_DELIMITER = '|' SKIP_HEADER = 1);

grant usage on stage 



drop view activity;
drop view activities;
create view activity as select * from haven_base.dig_activities.activities;
create view activities as select * from haven_raw.dig_activities.activities;

select * from activity;

GRANT USAGE ON SCHEMA shared_data TO SHARE IN APPLICATION PACKAGE dba_snowflake_package;
GRANT SELECT ON TABLE accounts TO SHARE IN APPLICATION PACKAGE dba_snowflake_package;

LIST @dba_snowflake_package.stage_content.dba_snowflake_stage;

grant select on view activity to SHARE IN APPLICATION PACKAGE dba_snowflake_package;
grant reference_usage on database haven_base to SHARE IN APPLICATION PACKAGE dba_snowflake_package;
grant reference_usage on database dba_snowflake_package to SHARE IN APPLICATION PACKAGE dba_snowflake_package;

use role dba;

DROP APPLICATION dba_snowflake_app;

show applications;

CREATE APPLICATION dba_SNOWFLAKE_APP
  FROM APPLICATION PACKAGE dba_SNOWFLAKE_PACKAGE
  USING '@dba_snowflake_package.stage_content.dba_snowflake_stage';

SELECT * FROM code_schema.accounts_view;

LIST @dba_snowflake_package.stage_content.dba_snowflake_stage;

DROP APPLICATION dba_snowflake_app;

show applications;

CREATE APPLICATION dba_SNOWFLAKE_APP
  FROM APPLICATION PACKAGE dba_SNOWFLAKE_PACKAGE
  USING '@dba_snowflake_package.stage_content.dba_snowflake_stage';

SELECT code_schema.addone(9);
select code_schema.multiply(5,5);

LIST @dba_snowflake_package.stage_content.dba_snowflake_stage;

DROP APPLICATION dba_snowflake_app;

show applications;

DROP APPLICATION dba_snowflake_app;

CREATE APPLICATION dba_SNOWFLAKE_APP
  FROM APPLICATION PACKAGE dba_SNOWFLAKE_PACKAGE
  USING '@dba_snowflake_package.stage_content.dba_snowflake_stage';

show references in application dba_snowflake_app;
  
ALTER APPLICATION PACKAGE dba_snowflake_package
  ADD VERSION v2_1 USING '@dba_snowflake_package.stage_content.dba_snowflake_stage';  
ALTER APPLICATION PACKAGE dba_snowflake_package
  drop version v2_0;
SHOW VERSIONS IN APPLICATION PACKAGE dba_snowflake_package;

DROP APPLICATION dba_snowflake_app;

show applications;

CREATE APPLICATION dba_SNOWFLAKE_APP
  FROM APPLICATION PACKAGE dba_SNOWFLAKE_PACKAGE
  USING VERSION V1_0;

use application dba_snowflake_app;
LIST @dba_snowflake_package.stage_content.dba_snowflake_stage;
CALL dba_core.hello();
SELECT * FROM code_schema.accounts_view;
SELECT code_schema.addone(10);
SELECT code_schema.multiply(2,3);

revoke application role dba_public from role haven_commercial_dillonsim;
grant application role dba_public to role dbt_training_dataload;

use role accountadmin;
show applications;
DROP APPLICATION dba_snowflake_app;

use role dba;

use role warner_commercial;

use application dba_snowflake_app;
show references in application dba_snowflake_app;

SELECT SYSTEM$REFERENCE('table', 'haven_raw.dig_activities.activities', 'session', 'select');

call config.register_callback(
SYSTEM$REFERENCE('TABLE', 'haven_raw.dig_activities.activities', 'session', 'select'), 'ADD', 'activity_table'
);

--ENT_REF_VIEW_187577454523922_E19F8C08A2C0652BF3D928F20D595B5F371C1A9E

SELECT SYSTEM$SET_REFERENCE('Activity_table', 'ENT_REF_VIEW_187577454523922_E19F8C08A2C0652BF3D928F20D595B5F371C1A9E');

select * from reference('activity_table');

use role sysadmin;

grant reference_usage on database haven_base to share IN APPLICATION PACKAGE dba_snowflake_package;