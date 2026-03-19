use role accountadmin;

create APPLICATION PACKAGE actadm_snowflake_package;
use application package actadm_snowflake_package;

show applications;
show application packages;

CREATE SCHEMA stage_content;

show stages;

CREATE OR REPLACE STAGE actadm_snowflake_package.stage_content.actadm_snowflake_stage
  FILE_FORMAT = (TYPE = 'csv' FIELD_DELIMITER = '|' SKIP_HEADER = 1);

LIST @actadm_snowflake_package.stage_content.actadm_snowflake_stage;

CREATE APPLICATION ROLE actadm_public;
CREATE SCHEMA IF NOT EXISTS actadm_core;
GRANT USAGE ON SCHEMA actadm_core TO APPLICATION ROLE actadm_public;  

DROP APPLICATION actadm_SNOWFLAKE_APP;

CREATE APPLICATION actadm_SNOWFLAKE_APP
  FROM APPLICATION PACKAGE actadm_SNOWFLAKE_PACKAGE
  USING '@actadm_snowflake_package.stage_content.actadm_snowflake_stage';

show applications;

call core.hello();


show schemas;
show application roles in application actadm_SNOWFLAKE_APP;
drop application role actadm_showflake_app.app_public;
drop schema actadm_showflake_app.core;

drop application actadm_SNOWFLAKE_APP cascade;
drop application package actadm_SNOWFLAKE_PACKAGE;

show applications;
show application packages;