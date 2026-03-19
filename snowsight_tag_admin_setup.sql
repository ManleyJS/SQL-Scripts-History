use ROLE useradmin;

CREATE ROLE tag_admin;

USE ROLE ACCOUNTADMIN;

GRANT APPLY MASKING POLICY ON ACCOUNT TO ROLE tag_admin;
GRANT APPLY TAG ON ACCOUNT TO ROLE tag_admin;

use ROLE securityadmin;

GRANT ROLE tag_admin TO ROLE dba;

GRANT CREATE TAG ON SCHEMA HAVEN_MASTER.TAG_ADMIN TO ROLE TAG_ADMIN;
GRANT CREATE MASKING POLICY ON SCHEMA HAVEN_MASTER.TAG_ADMIN TO ROLE TAG_ADMIN;

GRANT ROLE _HAVEN_MASTER__TAG_ADMIN__USAGE TO ROLE TAG_ADMIN;

GRANT ROLE _haven_master__tag_admin__owner TO ROLE dba;

USE ROLE TAG_ADMIN;

USE SCHEMA HAVEN_MASTER.TAG_ADMIN;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.EMAIL
ALLOWED_VALUES 'email_address', 'web_login_address'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

create or replace masking policy haven_master.tag_admin.email_masking_policy as (columnValue string) returns string -> 
	case when is_role_in_session('__masking_policy_role_email_address') then columnValue
         when is_role_in_session('__masking_policy_role_email_provider') then coalesce(split_part(columnValue, '@', 2), 'None')
         else '########' END;

use ROLE securityadmin;

--revoke READ ON tag haven_master.tag_admin.email from ROLE _haven_master__tag_admin__owner;

USE ROLE TAG_ADMIN;

ALTER TAG HAVEN_MASTER.TAG_ADMIN.email SET masking POLICY haven_master.tag_admin.email_masking_policy;

-- 18/06/2025

use role tag_admin;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.PII
ALLOWED_VALUES 'address', 'email', 'name', 'personal'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.address
ALLOWED_VALUES 'street', 'town', 'county', 'country', 'postcode', 'location'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.name
ALLOWED_VALUES 'first name', 'middle name', 'last name', 'full name'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.personal
ALLOWED_VALUES 'telephone', 'age', 'date of birth', 'gender', 'title', 'car registration'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

show tags;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.street
ALLOWED_VALUES 'street name', 'house number'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.town
ALLOWED_VALUES 'town', 'city'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.county
ALLOWED_VALUES 'county', 'district'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.country
ALLOWED_VALUES 'country', 'nation'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.postcode
ALLOWED_VALUES 'postcode'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.location
ALLOWED_VALUES 'park', 'venue', 'location', 'office'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.firstname
ALLOWED_VALUES 'first name', 'forename'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.middlename
ALLOWED_VALUES 'middle name', 'middile initial'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.lastname
ALLOWED_VALUES 'last name', 'surname'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.fullname
ALLOWED_VALUES 'full name'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.telephone
ALLOWED_VALUES 'mobile', 'work', 'home'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.age
ALLOWED_VALUES 'age'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.dateofbirth
ALLOWED_VALUES 'dob', 'date of birth'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.gender
ALLOWED_VALUES 'gender', 'male', 'female'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.title
ALLOWED_VALUES 'title'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.carregistration
ALLOWED_VALUES 'car reg', 'car registration'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

-- 24/09/2025
-- changfe tag from carregistration to car_registration

ALTER TAG HAVEN_MASTER.TAG_ADMIN.carregistration RENAME TO HAVEN_MASTER.TAG_ADMIN.car_registration;

DROP TAG HAVEN_MASTER.TAG_ADMIN.carregistration;

ALTER TAG haven_master.tag_admin.CAR_REGISTRATION UNSET MASKING POLICY haven_master.tag_admin.car_registration_masking_policy;


CREATE OR REPLACE TAG HAVEN_MASTER.TAG_ADMIN.car_registration
ALLOWED_VALUES 'car reg', 'car registration'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

ALTER TAG haven_master.tag_admin.CAR_REGISTRATION SET MASKING POLICY haven_master.tag_admin.car_registration_masking_policy;

-- 11/09/2025
-- Adding new free text tag

CREATE TAG HAVEN_MASTER.TAG_ADMIN.freetext
ALLOWED_VALUES 'url string', 'text field', 'free text'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;


show tags;

-- 10/09/2025

select current_role();
SELECT current_database();
SELECT current_schema();

-- getting rid of existing tag masking policy relationship

use ROLE dba;
SELECT * from table(information_schema.policy_references(policy_name=>'email_masking_policy'));

use ROLE tag_admin;
ALTER TAG email unset masking policy haven_master.tag_admin.email_masking_policy;


create or replace masking policy haven_master.tag_admin.address_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__address_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.street_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__street_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.town_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__town_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.county_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__county_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.country_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__country_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.postcode_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__postcode_masking_policy_role') then columnValue
                when is_role_in_session('__postcode_masking_policy_area_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z][a-zA-Z]?'), 'None') 
                when is_role_in_session('__postcode_masking_policy_region_role') then coalesce(substr(regexp_substr(columnValue, '^[a-zA-Z]+\\\\d+?\\\\s\\\\d+'),
                1, length(regexp_substr(columnValue, '^[a-zA-Z]+\\\\d+?\\\\s\\\\d+')) - 1), 'None')
                when is_role_in_session('__postcode_masking_policy_sector_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z]+\\\\d+?\\\\s\\\\d+'), 'None')
                else '########' END;
                
create or replace masking policy haven_master.tag_admin.location_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__location_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.first_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__first_name_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.last_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__last_name_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.middle_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__middle_name_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.full_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__full_name_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.telephone_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__telephone_masking_policy_role') then columnValue
                else '########' END;
                
create or replace masking policy haven_master.tag_admin.age_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__age_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.date_of_birth_masking_policy as (columnValue string)
                returns string -> case
                when is_role_in_session('__date_of_birth_masking_policy_role') then cast(columnValue as string)
                when is_role_in_session('__date_of_birth_masking_policy_age_data_role') then
                cast(coalesce(datediff(year, to_timestamp_ntz(columnValue), current_date), 0) as string)
                when is_role_in_session('__date_of_birth_masking_policy_age_data_range_role') then
                (case when datediff(year, to_timestamp_ntz(columnValue), current_date) between 0 and 9 then '0-9'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 10 and 19 then '10-19'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 20 and 29 then '20-29'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 30 and 39 then '30-39'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 40 and 49 then '40-49'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 50 and 59 then '50-59'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 60 and 69 then '60-69'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 70 and 79 then '70-79'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 80 and 89 then '80-89'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 90 and 99 then '90-99'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) > 100 then '100+'
                else 'not set' end)
                else '##########' END;
                
create or replace masking policy haven_master.tag_admin.gender_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__gender_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.title_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__title_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy haven_master.tag_admin.email_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__email_masking_policy_role') then columnValue
                when is_role_in_session('__email_masking_policy_provider_role') then coalesce(split_part(columnValue, '@', 2), 'None')
                else '########' END;

create or replace masking policy haven_master.tag_admin.car_registration_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__car_registration_masking_policy_role') then columnValue
                when is_role_in_session('__car_registration_masking_policy_location_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z][a-zA-Z]'), 'None')
                when is_role_in_session('__car_registration_masking_policy_location_year_role') then coalesce(substring(regexp_substr(columnValue, '^[a-zA-Z]{2}[0-9]{2}'), 3, 2), 'None')
                when is_role_in_session('__car_registration_masking_policy_year_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z]{2}[0-9]{2}'), 'None')
                else '########' END;

create or replace masking policy haven_master.tag_admin.free_text_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__free_text_masking_policy_role') then columnValue
                else '########' END;

SHOW masking policies;

use ROLE useradmin;

drop role  street_masking_policy_role;
drop role town_masking_policy_role;
drop role county_masking_policy_role;
drop role country_masking_policy_role;
drop role postcode_masking_policy_role;
drop role postcode_masking_policy_area_role;
drop role postcode_masking_policy_region_role;
drop role postcode_masking_policy_sector_role;
drop role location_masking_policy_role;
drop role first_name_masking_policy_role;
drop role last_name_masking_policy_role;
drop role middle_name_masking_policy_role;
drop role full_name_masking_policy_role;
drop role telephone_masking_policiy_role;
drop role age_masking_policy_role;
drop role date_of_birth_masking_policy_role;
drop role date_of_birth_masking_policy_age_data_role;
drop role date_of_birth_masking_policy_age_data_range_role;
drop role gender_masking_policy_role;
drop role title_masking_policy_role;
drop role email_masking_policy_role;
drop role email_masking_policy_provider_role;
drop role car_registration_masking_policy_role;
drop role car_registration_masking_policy_location_role;
drop role car_registration_masking_policy_location_year_role;
drop role car_registration_masking_policy_year_role;


create role if not exists __address_masking_policy_role;
create role if not exists __street_masking_policy_role;
create role if not exists __town_masking_policy_role;
create role if not exists __county_masking_policy_role;
create role if not exists __country_masking_policy_role;
create role if not exists __postcode_masking_policy_role;
create role if not exists __postcode_masking_policy_area_role;
create role if not exists __postcode_masking_policy_region_role;
create role if not exists __postcode_masking_policy_sector_role;
create role if not exists __location_masking_policy_role;
create role if not exists __first_name_masking_policy_role;
create role if not exists __last_name_masking_policy_role;
create role if not exists __middle_name_masking_policy_role;
create role if not exists __full_name_masking_policy_role;
create role if not exists __telephone_masking_policiy_role;
create role if not exists __age_masking_policy_role;
create role if not exists __date_of_birth_masking_policy_role;
create role if not exists __date_of_birth_masking_policy_age_data_role;
create role if not exists __date_of_birth_masking_policy_age_data_range_role;
create role if not exists __gender_masking_policy_role;
create role if not exists __title_masking_policy_role;
create role if not exists __email_masking_policy_role;
create role if not exists __email_masking_policy_provider_role;
create role if not exists __car_registration_masking_policy_role;
create role if not exists __car_registration_masking_policy_location_role;
create role if not exists __car_registration_masking_policy_location_year_role;
create role if not exists __car_registration_masking_policy_year_role;
create role if not exists __free_text_masking_policy_role;

SHOW roles LIKE '%masking_policy%';

drop role if exists __telephone_masking_policiy_role;
create role if not exists __telephone_masking_policy_role;

use ROLE tag_admin;

DESC masking policy email_masking_policy;
show masking policies;

SHOW tags;

use ROLE dba;
use warehouse dba_wh;
SELECT * from table(information_schema.policy_references(policy_name=>'age_masking_policy'));


use ROLE tag_admin;

ALTER TAG haven_master.tag_admin.AGE SET MASKING POLICY haven_master.tag_admin.age_masking_policy;
ALTER TAG haven_master.tag_admin.CARREGISTRATION SET MASKING POLICY haven_master.tag_admin.car_registration_masking_policy;
ALTER TAG haven_master.tag_admin.COUNTRY SET MASKING POLICY haven_master.tag_admin.country_masking_policy;
ALTER TAG haven_master.tag_admin.COUNTY SET MASKING POLICY haven_master.tag_admin.county_masking_policy;
ALTER TAG haven_master.tag_admin.DATEOFBIRTH SET MASKING POLICY haven_master.tag_admin.date_of_birth_masking_policy;
ALTER TAG haven_master.tag_admin.EMAIL SET MASKING POLICY haven_master.tag_admin.email_masking_policy;
ALTER TAG haven_master.tag_admin.FIRSTNAME SET MASKING POLICY haven_master.tag_admin.first_name_masking_policy;
ALTER TAG haven_master.tag_admin.FULLNAME SET MASKING POLICY haven_master.tag_admin.full_name_masking_policy;
ALTER TAG haven_master.tag_admin.GENDER SET MASKING POLICY haven_master.tag_admin.gender_masking_policy;
ALTER TAG haven_master.tag_admin.LASTNAME SET MASKING POLICY haven_master.tag_admin.last_name_masking_policy;
ALTER TAG haven_master.tag_admin.LOCATION SET MASKING POLICY haven_master.tag_admin.location_masking_policy;
ALTER TAG haven_master.tag_admin.MIDDLENAME SET MASKING POLICY haven_master.tag_admin.middle_name_masking_policy;
ALTER TAG haven_master.tag_admin.POSTCODE SET MASKING POLICY haven_master.tag_admin.postcode_masking_policy;
ALTER TAG haven_master.tag_admin.STREET SET MASKING POLICY haven_master.tag_admin.street_masking_policy;
ALTER TAG haven_master.tag_admin.TELEPHONE SET MASKING POLICY haven_master.tag_admin.telephone_masking_policy;
ALTER TAG haven_master.tag_admin.TITLE SET MASKING POLICY haven_master.tag_admin.title_masking_policy;
ALTER TAG haven_master.tag_admin.TOWN SET MASKING POLICY haven_master.tag_admin.town_masking_policy;

SHOW tags;

DESC TAG car_registration;

use ROLE securityadmin;

GRANT ROLE __free_text_masking_policy_role TO ROLE haven_dbt_development;

-- 11/09/2025

use ROLE tag_admin;

SHOW tags;

ALTER TAG haven_master.tag_admin.freetext SET masking policy haven_master.tag_admin.free_text_masking_policy;

-- 24/09/2025

USE SCHEMA HAVEN_MASTER.TAG_ADMIN;

SHOW WAREHOUSES;

USE ROLE DBA;

USE WAREHOUSE DBA_WH;

select *
  from table(training.information_schema.policy_references(ref_entity_name => 'HAVEN_MASTER.TAG_ADMIN.CAR_REGISTRATION', ref_entity_domain => 'TAG'));

select *
  from table(information_schema.policy_references(ref_entity_name => 'HAVEN_MASTER.TAG_ADMIN.NAME', ref_entity_domain => 'TAG'));



-- 02/12/2025

use role useradmin;

-- team

create role if not exists __team_first_name_masking_policy_role;
create role if not exists __team_last_name_masking_policy_role;
create role if not exists __team_middle_name_masking_policy_role;
create role if not exists __team_full_name_masking_policy_role;

-- owner

create role if not exists __owner_first_name_masking_policy_role;
create role if not exists __owner_last_name_masking_policy_role;
create role if not exists __owner_middle_name_masking_policy_role;
create role if not exists __owner_full_name_masking_policy_role;

-- guest

create role if not exists __guest_first_name_masking_policy_role;
create role if not exists __guest_last_name_masking_policy_role;
create role if not exists __guest_middle_name_masking_policy_role;
create role if not exists __guest_full_name_masking_policy_role;


use role tag_admin;

USE SCHEMA HAVEN_MASTER.TAG_ADMIN;

-- team tags

CREATE TAG HAVEN_MASTER.TAG_ADMIN.team_firstname
ALLOWED_VALUES 'first name', 'forename'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.team_middlename
ALLOWED_VALUES 'middle name', 'middile initial'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.team_lastname
ALLOWED_VALUES 'last name', 'surname'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.team_fullname
ALLOWED_VALUES 'full name'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

create masking policy haven_master.tag_admin.team_first_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__team_first_name_masking_policy_role') then columnValue
                else '########' END;

create masking policy haven_master.tag_admin.team_last_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__team_last_name_masking_policy_role') then columnValue
                else '########' END;

create masking policy haven_master.tag_admin.team_middle_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__team_middle_name_masking_policy_role') then columnValue
                else '########' END;

create masking policy haven_master.tag_admin.team_full_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__team_full_name_masking_policy_role') then columnValue
                else '########' END;

ALTER TAG haven_master.tag_admin.team_FIRSTNAME SET MASKING POLICY haven_master.tag_admin.team_first_name_masking_policy;
ALTER TAG haven_master.tag_admin.team_FULLNAME SET MASKING POLICY haven_master.tag_admin.team_full_name_masking_policy;
ALTER TAG haven_master.tag_admin.team_MIDDLENAME SET MASKING POLICY haven_master.tag_admin.team_middle_name_masking_policy;
ALTER TAG haven_master.tag_admin.team_LASTNAME SET MASKING POLICY haven_master.tag_admin.team_last_name_masking_policy;

-- owner tags

CREATE TAG HAVEN_MASTER.TAG_ADMIN.owner_firstname
ALLOWED_VALUES 'first name', 'forename'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.owner_middlename
ALLOWED_VALUES 'middle name', 'middile initial'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.owner_lastname
ALLOWED_VALUES 'last name', 'surname'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.owner_fullname
ALLOWED_VALUES 'full name'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

create masking policy haven_master.tag_admin.owner_first_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__owner_first_name_masking_policy_role') then columnValue
                else '########' END;

create masking policy haven_master.tag_admin.owner_last_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__owner_last_name_masking_policy_role') then columnValue
                else '########' END;

create masking policy haven_master.tag_admin.owner_middle_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__owner_middle_name_masking_policy_role') then columnValue
                else '########' END;

create masking policy haven_master.tag_admin.owner_full_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__owner_full_name_masking_policy_role') then columnValue
                else '########' END;

ALTER TAG haven_master.tag_admin.owner_FIRSTNAME SET MASKING POLICY haven_master.tag_admin.owner_first_name_masking_policy;
ALTER TAG haven_master.tag_admin.owner_FULLNAME SET MASKING POLICY haven_master.tag_admin.owner_full_name_masking_policy;
ALTER TAG haven_master.tag_admin.owner_MIDDLENAME SET MASKING POLICY haven_master.tag_admin.owner_middle_name_masking_policy;
ALTER TAG haven_master.tag_admin.owner_LASTNAME SET MASKING POLICY haven_master.tag_admin.owner_last_name_masking_policy;


-- guest tags

CREATE TAG HAVEN_MASTER.TAG_ADMIN.guest_firstname
ALLOWED_VALUES 'first name', 'forename'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.guest_middlename
ALLOWED_VALUES 'middle name', 'middile initial'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.guest_lastname
ALLOWED_VALUES 'last name', 'surname'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.guest_fullname
ALLOWED_VALUES 'full name'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

create masking policy haven_master.tag_admin.guest_first_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__guest_first_name_masking_policy_role') then columnValue
                else '########' END;

create masking policy haven_master.tag_admin.guest_last_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__guest_last_name_masking_policy_role') then columnValue
                else '########' END;

create masking policy haven_master.tag_admin.guest_middle_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__guest_middle_name_masking_policy_role') then columnValue
                else '########' END;

create masking policy haven_master.tag_admin.guest_full_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__guest_full_name_masking_policy_role') then columnValue
                else '########' END;

ALTER TAG haven_master.tag_admin.guest_FIRSTNAME SET MASKING POLICY haven_master.tag_admin.guest_first_name_masking_policy;
ALTER TAG haven_master.tag_admin.guest_FULLNAME SET MASKING POLICY haven_master.tag_admin.guest_full_name_masking_policy;
ALTER TAG haven_master.tag_admin.guest_MIDDLENAME SET MASKING POLICY haven_master.tag_admin.guest_middle_name_masking_policy;
ALTER TAG haven_master.tag_admin.guest_LASTNAME SET MASKING POLICY haven_master.tag_admin.guest_last_name_masking_policy;

-- 02/12/2025 

-- Adding date of birth

use role useradmin;

create role if not exists __team_date_of_birth_masking_policy_role;
create role if not exists __team_date_of_birth_masking_policy_age_data_role;
create role if not exists __team_date_of_birth_masking_policy_age_data_range_role;

create role if not exists __owner_date_of_birth_masking_policy_role;
create role if not exists __owner_date_of_birth_masking_policy_age_data_role;
create role if not exists __owner_date_of_birth_masking_policy_age_data_range_role;

create role if not exists __guest_date_of_birth_masking_policy_role;
create role if not exists __guest_date_of_birth_masking_policy_age_data_role;
create role if not exists __guest_date_of_birth_masking_policy_age_data_range_role;

use role tag_admin;

use schema haven_master.tag_admin;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.team_dateofbirth
ALLOWED_VALUES 'dob', 'date of birth'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.owner_dateofbirth
ALLOWED_VALUES 'dob', 'date of birth'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.guest_dateofbirth
ALLOWED_VALUES 'dob', 'date of birth'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

create masking policy haven_master.tag_admin.team_date_of_birth_masking_policy as (columnValue string)
                returns string -> case
                when is_role_in_session('__team_date_of_birth_masking_policy_role') then cast(columnValue as string)
                when is_role_in_session('__team_date_of_birth_masking_policy_age_data_role') then
                cast(coalesce(datediff(year, to_timestamp_ntz(columnValue), current_date), 0) as string)
                when is_role_in_session('__team_date_of_birth_masking_policy_age_data_range_role') then
                (
                    case when datediff(year, to_timestamp_ntz(columnValue), current_date) between 0 and 9 then '0-9'
                    when datediff(year, to_timestamp_ntz(columnValue), current_date) between 10 and 19 then '10-19'
                    when datediff(year, to_timestamp_ntz(columnValue), current_date) between 20 and 29 then '20-29'
                    when datediff(year, to_timestamp_ntz(columnValue), current_date) between 30 and 39 then '30-39'
                    when datediff(year, to_timestamp_ntz(columnValue), current_date) between 40 and 49 then '40-49'
                    when datediff(year, to_timestamp_ntz(columnValue), current_date) between 50 and 59 then '50-59'
                    when datediff(year, to_timestamp_ntz(columnValue), current_date) between 60 and 69 then '60-69'
                    when datediff(year, to_timestamp_ntz(columnValue), current_date) between 70 and 79 then '70-79'
                    when datediff(year, to_timestamp_ntz(columnValue), current_date) between 80 and 89 then '80-89'
                    when datediff(year, to_timestamp_ntz(columnValue), current_date) between 90 and 99 then '90-99'
                    when datediff(year, to_timestamp_ntz(columnValue), current_date) > 100 then '100+'
                    else 'not set' end
                )
                else '##########' END;
                

create masking policy haven_master.tag_admin.owner_date_of_birth_masking_policy as (columnValue string)
                returns string -> case
                when is_role_in_session('__owner_date_of_birth_masking_policy_role') then cast(columnValue as string)
                when is_role_in_session('__owner_date_of_birth_masking_policy_age_data_role') then
                cast(coalesce(datediff(year, to_timestamp_ntz(columnValue), current_date), 0) as string)
                when is_role_in_session('__owner_date_of_birth_masking_policy_age_data_range_role') then
                (case when datediff(year, to_timestamp_ntz(columnValue), current_date) between 0 and 9 then '0-9'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 10 and 19 then '10-19'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 20 and 29 then '20-29'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 30 and 39 then '30-39'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 40 and 49 then '40-49'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 50 and 59 then '50-59'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 60 and 69 then '60-69'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 70 and 79 then '70-79'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 80 and 89 then '80-89'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 90 and 99 then '90-99'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) > 100 then '100+'
                else 'not set' end)
                else '##########' END;
                

create masking policy haven_master.tag_admin.guest_date_of_birth_masking_policy as (columnValue string)
                returns string -> case
                when is_role_in_session('__guest_date_of_birth_masking_policy_role') then cast(columnValue as string)
                when is_role_in_session('__guest_date_of_birth_masking_policy_age_data_role') then
                cast(coalesce(datediff(year, to_timestamp_ntz(columnValue), current_date), 0) as string)
                when is_role_in_session('__guest_date_of_birth_masking_policy_age_data_range_role') then
                (case when datediff(year, to_timestamp_ntz(columnValue), current_date) between 0 and 9 then '0-9'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 10 and 19 then '10-19'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 20 and 29 then '20-29'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 30 and 39 then '30-39'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 40 and 49 then '40-49'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 50 and 59 then '50-59'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 60 and 69 then '60-69'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 70 and 79 then '70-79'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 80 and 89 then '80-89'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) between 90 and 99 then '90-99'
                when datediff(year, to_timestamp_ntz(columnValue), current_date) > 100 then '100+'
                else 'not set' end)
                else '##########' END;
                
ALTER TAG haven_master.tag_admin.team_DATEOFBIRTH SET MASKING POLICY haven_master.tag_admin.team_date_of_birth_masking_policy;
ALTER TAG haven_master.tag_admin.owner_DATEOFBIRTH SET MASKING POLICY haven_master.tag_admin.owner_date_of_birth_masking_policy;
ALTER TAG haven_master.tag_admin.guest_DATEOFBIRTH SET MASKING POLICY haven_master.tag_admin.guest_date_of_birth_masking_policy;

-- 05/11/2025
-- testing tag conflict on combined tag columns

CREATE TAG HAVEN_MASTER.TAG_ADMIN.team_firstname_test
ALLOWED_VALUES 'first name', 'forename', 'TEAM_FULLNAME_TEST'
propagate = on_dependency_and_data_movement
ON_CONFLICT = 'TEAM_FULLNAME_TEST';

CREATE TAG HAVEN_MASTER.TAG_ADMIN.team_lastname_test
ALLOWED_VALUES 'last name', 'surname', 'TEAM_FULLNAME_TEST'
propagate = on_dependency_and_data_movement
ON_CONFLICT = 'TEAM_FULLNAME_TEST';

CREATE TAG HAVEN_MASTER.TAG_ADMIN.team_fullname_test
ALLOWED_VALUES 'full name'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

ALTER TAG haven_master.tag_admin.team_FIRSTNAME_TEST SET MASKING POLICY haven_master.tag_admin.team_first_name_masking_policy;
ALTER TAG haven_master.tag_admin.team_FULLNAME_TEST SET MASKING POLICY haven_master.tag_admin.team_full_name_masking_policy;
ALTER TAG haven_master.tag_admin.team_LASTNAME_TEST SET MASKING POLICY haven_master.tag_admin.team_last_name_masking_policy;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.team_name_test_allowed
ALLOWED_VALUES 'full name', 'first name', 'forename', 'last name', 'surname'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.team_name_test_full
ALLOWED_VALUES 'full name', 'first name', 'forename', 'last name', 'surname'
propagate = on_dependency_and_data_movement
ON_CONFLICT = 'full name';

ALTER TAG haven_master.tag_admin.team_NAME_TEST_allowed SET MASKING POLICY haven_master.tag_admin.team_full_name_masking_policy;
ALTER TAG haven_master.tag_admin.team_NAME_TEST_full SET MASKING POLICY haven_master.tag_admin.team_full_name_masking_policy;

-- creating tag team_name as a workaround to the conflict caused by combining first name and last name

use role useradmin;

create role __team_name_masking_policy_role;

DROP TAG HAVEN_MASTER.TAG_ADMIN.team_name;

CREATE TAG HAVEN_MASTER.TAG_ADMIN.team_name
ALLOWED_VALUES 'full name', 'first name', 'forename', 'last name', 'surname', 'middle name', 'middile initial'
propagate = on_dependency_and_data_movement
ON_CONFLICT = ALLOWED_VALUES_SEQUENCE;

create masking policy haven_master.tag_admin.team_name_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('__team_name_masking_policy_role') then columnValue
                else '########' END;

ALTER TAG haven_master.tag_admin.team_NAME SET MASKING POLICY haven_master.tag_admin.team_name_masking_policy;

