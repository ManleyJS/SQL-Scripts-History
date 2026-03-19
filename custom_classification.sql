use role dba;

show grants to role tag_admin;

use database training;

create schema class_mask_tag;

use role useradmin;

create role classification_admin;

use role accountadmin;

GRANT DATABASE ROLE SNOWFLAKE.CLASSIFICATION_ADMIN
  TO ROLE classification_admin; 

use role securityadmin;

grant usage on database training to role classification_admin;
grant usage on schema training.class_mask_tag to role classification_admin;
grant usage on warehouse haven_cdc_migration_wh to role classification_admin;

use role dba;

show schemas;
show tables;

select * from haven_base.plot.owners limit 10;

create table training.class_mask_tag.owners as select * from haven_base.plot.owners order by owner_id;

desc table owners;
desc table account_cars;

select * from account_cars limit 10;

create table training.class_mask_tag.account_cars as select * from haven_base.plot.account_cars order by account_id;

use role securityadmin;

grant role classification_admin to role dba;

grant select on all tables in schema training.class_mask_tag to role classification_admin;
grant create SNOWFLAKE.DATA_PRIVACY.custom_classifier on schema training.class_mask_tag to role classification_admin;
grant create SNOWFLAKE.DATA_PRIVACY.CLASSIFICATION_PROFILE on schema training.class_mask_tag to role classification_admin;
grant role tag_admin to role classification_admin;

--SNOWFLAKE.ML.CLASSIFICATION

use role classification_admin;

select * from owners limit 10;

SHOW SNOWFLAKE.DATA_PRIVACY.CUSTOM_CLASSIFIER;

CREATE OR REPLACE SNOWFLAKE.DATA_PRIVACY.CUSTOM_CLASSIFIER car_registration();

select car_reg_no, 
regexp_count(car_reg_no, '^[a-zA-Z]{1,3}[0-9]{1,2}'), 
regexp_count(car_reg_no, '^[a-zA-Z][a-zA-Z]')
from account_cars;


CALL car_registration!ADD_REGEX(
  'CAR_REGISTRATION',
  'IDENTIFIER',
  '^[a-zA-Z]{1,3}\\s?[0-9]{1,2}\\s?[a-zA-Z]{1,3}\\s?',
  'CAR_RE.*',
  'Add a regex to identify car registration data in a column',
  0.8
);

CALL car_registration!ADD_REGEX(
  'CAR_REGISTRATION',
  'IDENTIFIER',
  '^[a-zA-Z]{1,3}[0-9]{1,2}'
);

select car_registration!LIST();

select * from account_cars
where car_reg_no regexp( '^[a-zA-Z]{1,3}\\s?[0-9]{1,2}\\s?[a-zA-Z]{1,3}' );


select * from account_cars
where not car_reg_no regexp( '^[a-zA-Z]{1,3}\\s?[0-9]{1,2}\\s?[a-zA-Z]{1,3}\\s?' );

select count(*) from account_cars
where car_reg_no is null;

select 

use role dba;
CALL SYSTEM$CLASSIFY_SCHEMA('training.class_mask_tag', {'auto_tag': true, 'use_all_custom_classifiers': true});

SELECT SYSTEM$GET_CLASSIFICATION_RESULT('training.class_mask_tag.account_cars');

SELECT *
FROM TABLE(
  training.INFORMATION_SCHEMA.TAG_REFERENCES_ALL_COLUMNS(
    'training.class_mask_tag.account_cars',
    'table'
));

SELECT SYSTEM$GET_CLASSIFICATION_RESULT('training.class_mask_tag.owners');

-- 24/09/2025
-- testing if we can get the customer classifier to work

use role dba;

show schemas;
show tables;

select car_registration!LIST();

select * from account_cars
where car_reg_no regexp( '^[a-zA-Z]{1,3}[0-9]{1,2}' );

CALL SYSTEM$CLASSIFY_SCHEMA('training.class_mask_tag', {'auto_tag': true, 'use_all_custom_classifiers': true});

SELECT SYSTEM$GET_CLASSIFICATION_RESULT('training.class_mask_tag.account_cars');

SELECT *
FROM TABLE(
  training.INFORMATION_SCHEMA.TAG_REFERENCES_ALL_COLUMNS(
    'training.class_mask_tag.account_cars',
    'table'
));

SELECT SYSTEM$GET_CLASSIFICATION_RESULT('training.class_mask_tag.owners');

-- SNOWFLAKE.DATA_PRIVACY.CUSTOM_CLASSIFIER car_registration

CALL SYSTEM$CLASSIFY_SCHEMA('training.class_mask_tag', 
    {'auto_tag': true, 'custom_classifiers': ['car_registration']});

SELECT SYSTEM$GET_CLASSIFICATION_RESULT('training.class_mask_tag.account_cars');

select * from account_cars limit 100;

use role accountadmin;

select system$get_tag('CAR_REGISTRATION', 'training.class_mask_tag.account_cars', 'table');

show masking policies in account;

desc masking policy haven_master.tag_admin.car_registration_masking_policy;

select * from 
snowflake.account_usage.tags
where deleted is null
ORDER BY TAG_NAME;

select * from 
snowflake.account_usage.tag_references
--where deleted is null
--order by tag_name
where object_name = 'ACCOUNT_CARS'
;

select * from 
snowflake.account_usage.policy_references
where policy_name = 'FIRST_NAME_MASKING_POLICY';

use role dba;

select *
  from table(training.information_schema.tag_references_all_columns('account_cars', 'table'));


-- 03/10/2025

use role tag_admin;

show tags;

use role dba;

SELECT *
FROM TABLE(
  training.INFORMATION_SCHEMA.TAG_REFERENCES_ALL_COLUMNS(
    'training.class_mask_tag.account_cars',
    'table'
));
