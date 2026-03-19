
use role sysadmin;

drop schema governance;

use schema bourne_master.tag_admin;

use role securityadmin;

GRANT DATABASE ROLE SNOWFLAKE.CLASSIFICATION_ADMIN TO ROLE tag_admin;

grant create SNOWFLAKE.DATA_PRIVACY.CLASSIFICATION_PROFILE on schema bourne_master.tag_admin to role tag_admin;

use role accountadmin;

GRANT EXECUTE AUTO CLASSIFICATION ON ACCOUNT TO ROLE tag_admin;

use role tag_admin;

CREATE SNOWFLAKE.DATA_PRIVACY.CLASSIFICATION_PROFILE
  bourne_master.tag_admin.classification_profile_schedule (
      {
        'minimum_object_age_for_classification_days': 0,
        'maximum_classification_validity_days': 30,
        'auto_tag': true
      }
      );


CALL bourne_master.tag_admin.classification_profile_schedule!SET_TAG_MAP(
  {'column_tag_map':[
    {
      'tag_name':'bourne_master.tag_admin.email_address',
      'tag_value':'email_address',
      'semantic_categories':['EMAIL']
    }]});      

ALTER SCHEMA training.training
  SET CLASSIFICATION_PROFILE = 'bourne_master.tag_admin.classification_profile_schedule';    

use role dba;

CALL SYSTEM$GET_CLASSIFICATION_RESULT('training.training.client');

use schema training.training;

select email, web_login_name from client_target limit 20;

ALTER SCHEMA training.training
  UNSET CLASSIFICATION_PROFILE;    

