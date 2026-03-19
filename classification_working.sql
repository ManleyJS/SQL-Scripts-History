-- classification work

use role sysadmin;

drop schema governance;

use schema bourne_master.tag_admin;

use role securityadmin;

GRANT DATABASE ROLE SNOWFLAKE.CLASSIFICATION_ADMIN TO ROLE tag_admin;

grant create SNOWFLAKE.DATA_PRIVACY.CLASSIFICATION_PROFILE on schema bourne_master.tag_admin to role tag_admin;

use role accountadmin;

GRANT EXECUTE AUTO CLASSIFICATION ON ACCOUNT TO ROLE tag_admin;

use role tag_admin;

use SCHEMA haven_master.tag_admin;

SHOW SNOWFLAKE.DATA_PRIVACY.classification_profile IN account;

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

SHOW masking policies;

SELECT current_role();

SHOW tags;

-- tag work email

use database haven_master;

use schema tag_admin;

show tags;
show masking policies;

use role dba;

use schema training.training;

show tables;

desc table client;

select email from CLIENT_SOURCE;

create table client_source as select * from client;
create table client_target as select * from client;

select email from client_source limit 10;
select email from client_target limit 10;

select a.*, b.* from client_source a
inner join client_target b
where a.client_id = b.client_id
;

alter table client_source modify column email set tag bourne_master.tag_admin.email_address = 'email_address';

create table client_clone clone client_source;

select email from client_clone limit 10;

create table client_copy as select * from client_source;

select email from client_copy limit 10;

use role useradmin;

create role email_masking_policy_provider_role;

use role securityadmin;

grant role email_masking_policy_provider_role to role dba;

create table client_like like client_source;

select system$get_tag('bourne_master.tag_admin.email_address', 'client_like.email', 'column');

-- 12/06/2025
-- PROPAGATE TAG TESTING

USE ROLE SECURITYADMIN;

REVOKE role email_masking_policy_provider_role FROM role dba;

USE ROLE DBA;

 create table client_COPY_PROPAGATE AS SELECT * FROM client_source;

select system$get_tag('bourne_master.tag_admin.email_address', 'client_copy_propagate.email', 'column');

select email from client_COPY_PROPAGATE;

use role securityadmin;

grant role email_masking_policy_provider_role to role dba;

use role dba;

 select email from client_COPY_PROPAGATE;

 drop table client_copy_propagate;

 use role useradmin;

 create role email_masking_policy_role;

 use role securityadmin;

 grant role email_masking_policy_role to role dba;

 use role dba;
 
 select email, web_login_name from client where email is not null;

 create table client_copy_propagate as 
 select email from client_source where email is not null;

 select system$get_tag('bourne_master.tag_admin.email_address', 'client_copy_propagate.email', 'column');

select email from client_source where email is not null;

use role securityadmin;

revoke role email_masking_policy_role from role dba;
revoke role EMAIL_MASKING_POLICY_PROVIDER_ROLE from role dba;
 
use role dba;

use schema training.training;

select email from client_copy_propagate where email is not null;

show grants to role dba;

use role securityadmin;

grant role email_masking_policy_role to role dba;
grant role EMAIL_MASKING_POLICY_PROVIDER_ROLE to role dba;

use role dba;

select get_ddl('table', 'client_source');

create or replace TABLE CLIENT_CREATE_ITAS (
	CLIENT_ID NUMBER(9,0),
	HOUSEHOLD_ID NUMBER(9,0),
	LAST_NAME VARCHAR(30),
	FIRST_NAME VARCHAR(30),
	MIDDLE_NAME VARCHAR(30),
	FULL_NAME VARCHAR(60),
	SALUTATION VARCHAR(100),
	TITLE VARCHAR(50),
	OCCUPATION VARCHAR(30),
	IS_ACTIVE VARCHAR(1),
	BIRTHDAY TIMESTAMP_NTZ(0),
	BIRTH_PLACE VARCHAR(30),
	SEX VARCHAR(1),
	IS_HANDICAPPED VARCHAR(1),
	IS_SMOKER VARCHAR(1),
	SOUVENIR_FNAME VARCHAR(30),
	SOUVENIR_LNAME VARCHAR(30),
	LANGUAGE VARCHAR(20),
	PASSPORT_NUMBER VARCHAR(30),
	PASSPORT_ISSUE_PLACE VARCHAR(30),
	PASSPORT_ISSUE_DATE TIMESTAMP_NTZ(0),
	PASSPORT_EXP_DATE TIMESTAMP_NTZ(0),
	NATIONALITY VARCHAR(30),
	CITIZENSHIP VARCHAR(30),
	REFERRAL_TYPE VARCHAR(15),
	REFERRAL_DATE TIMESTAMP_NTZ(0),
	REFERRAL_CLIENT_ID NUMBER(9,0),
	REFERRAL_HOUSEHOLD_ID NUMBER(9,0),
	REFERRAL_SOURCE VARCHAR(30),
	COMMENTS VARCHAR(255),
	CLIENT_TYPE VARCHAR(15),
	GUEST_TYPE VARCHAR(20),
	DIRECTORY_NAME VARCHAR(100),
	CLIENT_CLASS_CODE VARCHAR(30),
	EMAIL VARCHAR(80),
	COUNTRY_OF_BIRTH VARCHAR(3),
	WEB_PASSWORD VARCHAR(30),
	WEB_LOGIN_NAME VARCHAR(80),
	WEB_LAST_LOGIN TIMESTAMP_NTZ(0),
	SSN NUMBER(9,0),
	LANGUAGE_CODE VARCHAR(3),
	HISTORICAL_CRUISES_NUM NUMBER(5,0),
	HISTORICAL_DAYS_NUM NUMBER(5,0),
	ALLOW_WEB_ACCESS VARCHAR(1),
	CL_ENTITY_TYPE VARCHAR(15),
	SEND_PROMOTIONAL_MAIL VARCHAR(1),
	SEND_PROMOTIONAL_EMAIL VARCHAR(1),
	SEND_PROMOTIONAL_SMS VARCHAR(1),
	NOTIF_DFLT_DISTR_TYPE VARCHAR(15),
	LAST_NAME_UPPER VARCHAR(30),
	SEND_PROMOTIONAL_PHONE VARCHAR(1)
);

select system$get_tag('bourne_master.tag_admin.email_address', 'client_create_itas.email', 'column');

select email from client_source where email is not null limit 100;

insert into client_create_itas
select * from client_source
where email is not null limit 100;

select system$get_tag('bourne_master.tag_admin.email_address', 'client_create_itas.email', 'column');

select email from client_create_itas;

use role securityadmin;

revoke role email_masking_policy_role from role dba;

use role dba;

select email from client_create_itas;

use role securityadmin;

grant role EMAIL_MASKING_POLICY_PROVIDER_ROLE to role dba;

use role dba;

select email from client_create_itas;

use role securityadmin;

revoke role EMAIL_MASKING_POLICY_PROVIDER_ROLE from role dba;
grant role email_masking_policy_role to role dba;


use role dba;

select email from client_create_itas;

select system$get_tag('bourne_master.tag_admin.email_address', 'client_create_itas.email', 'column');

create table dropme (filler varchar(100));
select system$get_tag('bourne_master.tag_admin.email_address', 'dropme.filler', 'column');

insert into dropme (filler) select email from client_create_itas; 

select filler from dropme;

select system$get_tag('bourne_master.tag_admin.email_address', 'dropme.filler', 'column');

use role securityadmin;

revoke role EMAIL_MASKING_POLICY_PROVIDER_ROLE from role dba;
revoke role email_masking_policy_role from role dba;

use role dba;

select filler from dropme;

drop table dropme;


use role securityadmin;

revoke role EMAIL_MASKING_POLICY_PROVIDER_ROLE from role dba;
grant role email_masking_policy_role to role dba;


use role dba;

select email from client_create_itas;
select system$get_tag('bourne_master.tag_admin.email_address', 'client_create_itas.email', 'column');

create table dropme (filler varchar(100));
select system$get_tag('bourne_master.tag_admin.email_address', 'dropme.filler', 'column');

insert into dropme (filler) select coalesce(split_part(email, '@', 2), 'None') from client_create_itas; 

select filler from dropme;

select system$get_tag('bourne_master.tag_admin.email_address', 'client_create_itas.email', 'column');

use role securityadmin;

revoke role EMAIL_MASKING_POLICY_PROVIDER_ROLE from role dba;
revoke role email_masking_policy_role from role dba;

use role dba;

select filler from dropme;

drop table dropme;

create table dropme (filler varchar(100));
select system$get_tag('bourne_master.tag_admin.email_address', 'client.email', 'column');

insert into dropme (filler) select coalesce(split_part(email, '@', 2), 'None') from client_create_itas; 
select system$get_tag('bourne_master.tag_admin.email_address', 'dropme.filler', 'column');

select filler from dropme;

use role securityadmin;

grant role email_masking_policy_role to role dba;

use role dba;

select filler from dropme;

use role securityadmin;

revoke role email_masking_policy_role from role dba;

use role dba;

select email from client limit 50;

select * from information_schema.tables
where table_catalog = 'TRAINING'
and TABLE_SCHEMA = 'TRAINING'
ORDER BY TABLE_NAME;

select concat('drop table training.training.', table_name, ';')
from information_schema.tables
where table_catalog = 'TRAINING'
and TABLE_SCHEMA = 'TRAINING'
ORDER BY TABLE_NAME;

show tables;

show stages;

create table training.training.client as select * from haven_raw.seaware_etleap.client;

select system$get_tag('haven_master.tag_admin.email', 'training.training.client_source.email', 'column');

create table client_source as select * from client;
create table client_target as select * from client;








