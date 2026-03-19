use role dba;

use schema haven_base.workforce_sam;

select * from person limit 20;
-- first_name, last_name, middle_name, DOB

select * from haven_store.workforce.stg_staff limit 20;

alter view haven_base.workforce_sam.person
modify column dob
set tag haven_master.tag_admin.team_DATEOFBIRTH = 'date of birth';

alter view haven_base.workforce_sam.person
modify column first_name
set tag haven_master.tag_admin.team_firstname = 'first name';

alter view haven_base.workforce_sam.person
modify column last_name
set tag haven_master.tag_admin.team_lastname = 'last name';

alter view haven_base.workforce_sam.person
modify column middle_name
set tag haven_master.tag_admin.team_middlename = 'middle name';

select * from haven_store.workforce.stg_staff limit 20;

select * from person limit 20;

use role securityadmin;

-- haven_dbt_transform
grant role __team_date_of_birth_masking_policy_role to role haven_dbt_transform;
grant role __team_first_name_masking_policy_role to role haven_dbt_transform;
grant role __team_last_name_masking_policy_role to role haven_dbt_transform;
grant role __team_middle_name_masking_policy_role to role haven_dbt_transform;
grant role __team_full_name_masking_policy_role to role haven_dbt_transform;

-- haven_dbt_transform_qat
grant role __team_date_of_birth_masking_policy_role to role haven_dbt_transform_qat;
grant role __team_first_name_masking_policy_role to role haven_dbt_transform_qat;
grant role __team_last_name_masking_policy_role to role haven_dbt_transform_qat;
grant role __team_middle_name_masking_policy_role to role haven_dbt_transform_qat;
grant role __team_full_name_masking_policy_role to role haven_dbt_transform_qat;

-- haven_dbt_transform_dev
grant role __team_date_of_birth_masking_policy_role to role haven_dbt_transform_dev;
grant role __team_first_name_masking_policy_role to role haven_dbt_transform_dev;
grant role __team_last_name_masking_policy_role to role haven_dbt_transform_dev;
grant role __team_middle_name_masking_policy_role to role haven_dbt_transform_dev;
grant role __team_full_name_masking_policy_role to role haven_dbt_transform_dev;

-- haven_dbt_development
grant role __team_date_of_birth_masking_policy_role to role haven_dbt_development;
grant role __team_first_name_masking_policy_role to role haven_dbt_development;
grant role __team_last_name_masking_policy_role to role haven_dbt_development;
grant role __team_middle_name_masking_policy_role to role haven_dbt_development;
grant role __team_full_name_masking_policy_role to role haven_dbt_development;

-- haven_data_engineering
grant role __team_date_of_birth_masking_policy_role to role haven_data_engineering;
grant role __team_first_name_masking_policy_role to role haven_data_engineering;
grant role __team_last_name_masking_policy_role to role haven_data_engineering;
grant role __team_middle_name_masking_policy_role to role haven_data_engineering;
grant role __team_full_name_masking_policy_role to role haven_data_engineering;

-- haven_commercial
grant role __team_date_of_birth_masking_policy_role to role haven_commercial;
grant role __team_first_name_masking_policy_role to role haven_commercial;
grant role __team_last_name_masking_policy_role to role haven_commercial;
grant role __team_middle_name_masking_policy_role to role haven_commercial;
grant role __team_full_name_masking_policy_role to role haven_commercial;

use role haven_dbt_transform;

use warehouse haven_dbt_transform_warehouse_xsmall;

select * from person;

select is_role_in_session(('__TEAM_LAST_NAME_MASKING_POLICY_ROLE'));

show grants to user jonathanmanley;

use role bourne_governance;

select is_role_in_session(('__TEAM_DATE_OF_BIRTH_MASKING_POLICY_ROLE'));

use warehouse bourne_governance_warehouse_xsmall;

select * from haven_base.workforce_sam.person limit 50;

select * from haven_store.workforce.stg_staff limit 20;

select policy_name, count(*)
from snowflake.account_usage.policy_references
group by all;

select *
from snowflake.account_usage.policy_references
where policy_name = 'TEAM_DATE_OF_BIRTH_MASKING_POLICY';

select *
FROM TABLE(HAVEN_STORE.INFORMATION_SCHEMA.TAG_REFERENCES_ALL_COLUMNS( 'HAVEN_STORE.WORKFORCE.STG_STAFF' , 'TABLE' ));

select *
FROM TABLE(HAVEN_STORE.INFORMATION_SCHEMA.TAG_REFERENCES_ALL_COLUMNS( 'HAVEN_BASE.WORKFORCE_SAM.PERSON' , 'TABLE' ));

use role dba;

select * from snowflake.account_usage.tag_references 
where tag_name = 'TEAM_DATEOFBIRTH';

use database haven_base;

SELECT * FROM INFORMATION_SCHEMA.TAG_REFERENCES 
WHERE TAG_NAME = 'TEAM_DATEOFBIRTH';


SELECT * FROM snowflake.account_usage.POLICY_REFERENCES 
WHERE POLICY_KIND = 'MASKING_POLICY'
--and tag_name = 'TEAM_DATEOFBIRTH'
and ref_database_name = 'HAVEN_BASE'
and REF_SCHEMA_NAME = 'WORKFORCE_SAM'
and ref_entity_name = 'PERSON';

-- 05/12/2025 - change tags from granular to general name to work around masking policy conflict

use role dba;

use warehouse dba_wh;

alter view haven_base.workforce_sam.person
modify column first_name
unset tag haven_master.tag_admin.team_firstname;

alter view haven_base.workforce_sam.person
modify column last_name
unset tag haven_master.tag_admin.team_lastname;

alter view haven_base.workforce_sam.person
modify column middle_name
unset tag haven_master.tag_admin.team_middlename;

alter view haven_base.workforce_sam.person
modify column first_name
set tag haven_master.tag_admin.team_name = 'first name';

alter view haven_base.workforce_sam.person
modify column last_name
set tag haven_master.tag_admin.team_name = 'last name';

alter view haven_base.workforce_sam.person
modify column middle_name
set tag haven_master.tag_admin.team_name = 'middle name';

use role dba;

select get_ddl('view', 'haven_base.workforce_sam.person');

create or replace view PERSON(
	PERSON_ID,
	ACCOUNT_ID,
	PLATFORM_ID,
	FIRST_NAME WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_NAME='first name'),
	LAST_NAME WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_NAME='last name'),
	MIDDLE_NAME WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_NAME='middle name'),
	STREET,
	SUBURB,
	STATE,
	POSTCODE,
	COUNTRY_ID,
	HOME,
	WORK,
	MOBILE,
	FAX,
	PAGER,
	OTHER,
	PRIVATE_EMAIL,
	DOB WITH TAG (HAVEN_MASTER.TAG_ADMIN.TEAM_DATEOFBIRTH='date of birth'),
	GENDER,
	NEXT_OF_KIN_NAME,
	NEXT_OF_KIN_RELATIONSHIP,
	NEXT_OF_KIN_CONTACT1,
	NEXT_OF_KIN_CONTACT2,
	NEXT_OF_KIN_CONTACT,
	NATIONAL_ID,
	REF_ID,
	DELETED,
	REFERENCED,
	DATE_START,
	DATE_END,
	DATE_MODIFIED,
	TITLE,
	EXTERNAL_MATCH_ID
) COMMENT='HAVEN_BASE.WORKFORCE_SAM.PERSON manages detailed information about individuals, with columns for personal details, contact information, employment data, and timestamps. Related to HAVEN_BASE.WORKFORCE_SAM.DIVISION_OPENING_TIMES via ACCOUNT_ID and DELETED flags.'
 as SELECT "PERSON_ID", "ACCOUNT_ID", "PLATFORM_ID", "FIRST_NAME", "LAST_NAME", "MIDDLE_NAME", "STREET", "SUBURB", "STATE", "POSTCODE", "COUNTRY_ID", "HOME", "WORK", "MOBILE", "FAX", "PAGER", "OTHER", "PRIVATE_EMAIL", "DOB", "GENDER", "NEXT_OF_KIN_NAME", "NEXT_OF_KIN_RELATIONSHIP", "NEXT_OF_KIN_CONTACT1", "NEXT_OF_KIN_CONTACT2", "NEXT_OF_KIN_CONTACT", "NATIONAL_ID", "REF_ID", "DELETED", "REFERENCED", "DATE_START", "DATE_END", "DATE_MODIFIED", "TITLE", "EXTERNAL_MATCH_ID" FROM "HAVEN_RAW"."WORKFORCE_SAM"."PERSON";

use role securityadmin;

-- haven_dbt_transform
grant role __team_date_of_birth_masking_policy_role to role haven_dbt_transform;

revoke role __team_first_name_masking_policy_role from role haven_dbt_transform;
revoke role __team_last_name_masking_policy_role from role haven_dbt_transform;
revoke role __team_middle_name_masking_policy_role from role haven_dbt_transform;
revoke role __team_full_name_masking_policy_role from role haven_dbt_transform;

grant role __team_name_masking_policy_role to role haven_dbt_transform;

-- haven_dbt_transform_qat
grant role __team_date_of_birth_masking_policy_role to role haven_dbt_transform_qat;

revoke role __team_first_name_masking_policy_role from role haven_dbt_transform_qat;
revoke role __team_last_name_masking_policy_role from role haven_dbt_transform_qat;
revoke role __team_middle_name_masking_policy_role from role haven_dbt_transform_qat;
revoke role __team_full_name_masking_policy_role from role haven_dbt_transform_qat;

grant role __team_name_masking_policy_role to role haven_dbt_transform_qat;

-- haven_dbt_transform_dev
grant role __team_date_of_birth_masking_policy_role to role haven_dbt_transform_dev;

revoke role __team_first_name_masking_policy_role from role haven_dbt_transform_dev;
revoke role __team_last_name_masking_policy_role from role haven_dbt_transform_dev;
revoke role __team_middle_name_masking_policy_role from role haven_dbt_transform_dev;
revoke role __team_full_name_masking_policy_role from role haven_dbt_transform_dev;

grant role __team_name_masking_policy_role to role haven_dbt_transform_dev;

-- haven_dbt_development
grant role __team_date_of_birth_masking_policy_role to role haven_dbt_development;

revoke role __team_first_name_masking_policy_role from role haven_dbt_development;
revoke role __team_last_name_masking_policy_role from role haven_dbt_development;
revoke role __team_middle_name_masking_policy_role from role haven_dbt_development;
revoke role __team_full_name_masking_policy_role from role haven_dbt_development;

grant role __team_name_masking_policy_role to role haven_dbt_development;

-- haven_data_engineering
grant role __team_date_of_birth_masking_policy_role to role haven_data_engineering;

revoke role __team_first_name_masking_policy_role from role haven_data_engineering;
revoke role __team_last_name_masking_policy_role from role haven_data_engineering;
revoke role __team_middle_name_masking_policy_role from role haven_data_engineering;
revoke role __team_full_name_masking_policy_role from role haven_data_engineering;

grant role __team_name_masking_policy_role to role haven_data_engineering;

-- haven_commercial
grant role __team_date_of_birth_masking_policy_role to role haven_commercial;

revoke role __team_first_name_masking_policy_role from role haven_commercial;
revoke role __team_last_name_masking_policy_role from role haven_commercial;
revoke role __team_middle_name_masking_policy_role from role haven_commercial;
revoke role __team_full_name_masking_policy_role from role haven_commercial;

grant role __team_name_masking_policy_role to role haven_commercial;

use role haven_commercial;

use warehouse haven_commercial_xsmall;

select * from haven_store.workforce.dim_staff limit 50;

use role bourne_governance;

show warehouses;

use warehouse BOURNE_GOVERNANCE_WAREHOUSE_XSMALL;

select * from haven_store.workforce.dim_staff limit 50;

select * from haven_base.workforce_sam.person limit 50;




