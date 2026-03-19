-- 05/12/2025

use role dba;

use schema training.class_mask_tag;

create table person as select * from haven_base.workforce_sam.person;

select get_ddl('table', 'person');

create or replace TABLE PERSON (
	PERSON_ID NUMBER(38,0),
	ACCOUNT_ID VARCHAR(128),
	PLATFORM_ID VARCHAR(144),
	FIRST_NAME VARCHAR(256) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_FIRSTNAME='first name'),
	LAST_NAME VARCHAR(256) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_LASTNAME='last name'),
	MIDDLE_NAME VARCHAR(256) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_MIDDLENAME='middle name'),
	STREET VARCHAR(512),
	SUBURB VARCHAR(128),
	STATE VARCHAR(384),
	POSTCODE VARCHAR(40),
	COUNTRY_ID VARCHAR(8),
	HOME VARCHAR(400),
	WORK VARCHAR(400),
	MOBILE VARCHAR(400),
	FAX VARCHAR(400),
	PAGER VARCHAR(400),
	OTHER VARCHAR(400),
	PRIVATE_EMAIL VARCHAR(384),
	DOB VARCHAR(16777216) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_DATEOFBIRTH='date of birth'),
	GENDER VARCHAR(8),
	NEXT_OF_KIN_NAME VARCHAR(128),
	NEXT_OF_KIN_RELATIONSHIP VARCHAR(128),
	NEXT_OF_KIN_CONTACT1 VARCHAR(128),
	NEXT_OF_KIN_CONTACT2 VARCHAR(128),
	NEXT_OF_KIN_CONTACT VARCHAR(128),
	NATIONAL_ID VARCHAR(128),
	REF_ID NUMBER(38,0),
	DELETED BOOLEAN,
	REFERENCED NUMBER(38,0),
	DATE_START TIMESTAMP_NTZ(9),
	DATE_END TIMESTAMP_NTZ(9),
	DATE_MODIFIED TIMESTAMP_NTZ(9),
	TITLE VARCHAR(40),
	EXTERNAL_MATCH_ID VARCHAR(1020)
);


create table bob 
as select concat(first_name, ' ', last_name) as full_name
from person;

select get_ddl('table', 'bob');

create or replace TABLE BOB (
	FULL_NAME VARCHAR(513) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_FIRSTNAME='first name', HAVEN_MASTER.TAG_ADMIN.TEAM_LASTNAME='last name')
);

select count(*) from bob;

-- testing with the on conflict set to the test fullname tag

alter table training.class_mask_tag.person
modify column first_name unset tag HAVEN_MASTER.TAG_ADMIN.TEAM_FIRSTNAME;

alter table training.class_mask_tag.person
modify column last_name unset tag HAVEN_MASTER.TAG_ADMIN.TEAM_lastNAME;

alter table training.class_mask_tag.person
modify column first_name set tag HAVEN_MASTER.TAG_ADMIN.TEAM_FIRSTNAME_TEST = 'first name';

alter table training.class_mask_tag.person
modify column last_name set tag HAVEN_MASTER.TAG_ADMIN.TEAM_lastNAME_TEST = 'last name';

drop table bob;

select * from person limit 50;

create table bob 
as select concat(first_name, ' ', last_name) as full_name
from person;

select * from bob limit 50;

select get_ddl('table', 'person');

HAVEN_STORE_QAT.HAVEN_STAGING.STAGING_CLEANING_PERFORMANCE_SAM_TIMECARD

create or replace TABLE PERSON (
	PERSON_ID NUMBER(38,0),
	ACCOUNT_ID VARCHAR(128),
	PLATFORM_ID VARCHAR(144),
	FIRST_NAME VARCHAR(256) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_FIRSTNAME_TEST='first name'),
	LAST_NAME VARCHAR(256) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_LASTNAME_TEST='last name'),
	MIDDLE_NAME VARCHAR(256) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_MIDDLENAME='middle name'),
	STREET VARCHAR(512),
	SUBURB VARCHAR(128),
	STATE VARCHAR(384),
	POSTCODE VARCHAR(40),
	COUNTRY_ID VARCHAR(8),
	HOME VARCHAR(400),
	WORK VARCHAR(400),
	MOBILE VARCHAR(400),
	FAX VARCHAR(400),
	PAGER VARCHAR(400),
	OTHER VARCHAR(400),
	PRIVATE_EMAIL VARCHAR(384),
	DOB VARCHAR(16777216) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_DATEOFBIRTH='date of birth'),
	GENDER VARCHAR(8),
	NEXT_OF_KIN_NAME VARCHAR(128),
	NEXT_OF_KIN_RELATIONSHIP VARCHAR(128),
	NEXT_OF_KIN_CONTACT1 VARCHAR(128),
	NEXT_OF_KIN_CONTACT2 VARCHAR(128),
	NEXT_OF_KIN_CONTACT VARCHAR(128),
	NATIONAL_ID VARCHAR(128),
	REF_ID NUMBER(38,0),
	DELETED BOOLEAN,
	REFERENCED NUMBER(38,0),
	DATE_START TIMESTAMP_NTZ(9),
	DATE_END TIMESTAMP_NTZ(9),
	DATE_MODIFIED TIMESTAMP_NTZ(9),
	TITLE VARCHAR(40),
	EXTERNAL_MATCH_ID VARCHAR(1020)
);

-- failed to correct the conflict so now testing two scenarios. A team_name tag
-- 1. on conflict set to ALLOWED_VALUES_SEQUENCE
-- 2. on conflict set to full name

alter table training.class_mask_tag.person
modify column first_name unset tag HAVEN_MASTER.TAG_ADMIN.TEAM_FIRSTNAME_TEST;

alter table training.class_mask_tag.person
modify column last_name unset tag HAVEN_MASTER.TAG_ADMIN.TEAM_lastNAME_TEST;

alter table training.class_mask_tag.person
modify column first_name set tag HAVEN_MASTER.TAG_ADMIN.TEAM_NAME_TEST_ALLOWED = 'first name';

alter table training.class_mask_tag.person
modify column last_name set tag HAVEN_MASTER.TAG_ADMIN.TEAM_NAME_TEST_ALLOWED = 'last name';

drop table bob;

select * from person limit 50;

create table bob 
as select concat(first_name, ' ', last_name) as full_name
from person;

select * from bob limit 50;

select get_ddl('table', 'bob');


create or replace TABLE BOB (
	FULL_NAME VARCHAR(513) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_NAME_TEST_ALLOWED='first name')
);

alter table training.class_mask_tag.person
modify column first_name unset tag HAVEN_MASTER.TAG_ADMIN.TEAM_NAME_TEST_ALLOWED;

alter table training.class_mask_tag.person
modify column last_name unset tag HAVEN_MASTER.TAG_ADMIN.TEAM_NAME_TEST_ALLOWED;

alter table training.class_mask_tag.person
modify column first_name set tag HAVEN_MASTER.TAG_ADMIN.TEAM_NAME_TEST_full = 'first name';

alter table training.class_mask_tag.person
modify column last_name set tag HAVEN_MASTER.TAG_ADMIN.TEAM_NAME_TEST_full = 'last name';

drop table bob;

select * from person limit 50;

create table bob 
as select concat(first_name, ' ', last_name) as full_name
from person;

select * from bob limit 50;

select get_ddl('table', 'bob');

create or replace TABLE BOB (
	FULL_NAME VARCHAR(513) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_NAME_TEST_FULL='full name')
);

drop table bob;

drop table training.class_mask_tag.person;



select *
FROM TABLE(HAVEN_STORE.INFORMATION_SCHEMA.TAG_REFERENCES_ALL_COLUMNS( 'HAVEN_STORE_QAT.HAVEN_STAGING.STAGING_CLEANING_PERFORMANCE_SAM_TIMECARD' , 'TABLE' ));

select get_ddl('table', 'HAVEN_STORE_QAT.HAVEN_STAGING.STAGING_CLEANING_PERFORMANCE_SAM_TIMECARD' );

create or replace TRANSIENT TABLE STAGING_CLEANING_PERFORMANCE_SAM_TIMECARD (
	WORKER_NAME VARCHAR(1537) WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_FIRSTNAME='first name', HAVEN_MASTER.TAG_ADMIN.TEAM_LASTNAME='last name'),
	TIMECARD_DATE DATE,
	PARK_CODE VARCHAR(8),
	WORKER_ENTITY_ID VARCHAR(16777216),
	WORKER_ENTITY_TYPE VARCHAR(8),
	TOTAL_ACTUAL_HOURS NUMBER(38,12),
	TOTAL_ACTUAL_MINUTES NUMBER(38,6),
	TOTAL_PAY_HOURS NUMBER(38,12),
	TOTAL_PAY_MINUTES NUMBER(38,6)
);




use role dba;

select policy_name, count(*)
from snowflake.account_usage.policy_references
group by all;

select *
from snowflake.account_usage.policy_references
where policy_name = 'TEAM_DATE_OF_BIRTH_MASKING_POLICY';

select *
FROM TABLE(HAVEN_STORE.INFORMATION_SCHEMA.TAG_REFERENCES_ALL_COLUMNS( 'HAVEN_STORE.WORKFORCE.STG_STAFF' , 'TABLE' ));

use role bourne_governance;

use warehouse bourne_governance_warehouse_xsmall;

select * from HAVEN_STORE.WORKFORCE.STG_STAFF limit 50;

show grants to role haven_etleap_dataload;

use role securityadmin;

use role accountadmin;

grant apply tag on account to role haven_etleap_dataload;








