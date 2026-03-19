USE ROLE useradmin;
CREATE ROLE tag_admin;

USE ROLE sysadmin;
USE DATABASE bourne_master;
USE SCHEMA tag_admin;
--CREATE SCHEMA tag_admin;
--DROP SCHEMA tag_admin;
--DROP SCHEMA bourne_raw.tag_admin;

USE ROLE securityadmin;
SHOW GRANTS TO ROLE _BOURNE_MASTER__TAG_ADMIN__USAGE;
GRANT ROLE _BOURNE_MASTER__USAGE TO ROLE _BOURNE_MASTER__TAG_ADMIN__USAGE;
GRANT ROLE _BOURNE_MASTER__TAG_ADMIN__USAGE TO ROLE TAG_ADMIN;
SHOW GRANTS TO ROLE tag_admin;
REVOKE ROLE _BOURNE_RAW__TAG_ADMIN__OWNER FROM ROLE tag_admin;
GRANT ROLE _BOURNE_MASTER__TAG_ADMIN__OWNER TO ROLE tag_admin;
REVOKE ROLE _bourne_raw__usage FROM ROLE tag_admin;

--revoke USAGE ON DATABASE BOURNE_MASTER from ROLE TAG_ADMIN;
--revoke USAGE ON SCHEMA BOURNE_MASTER.TAG_ADMIN FROM ROLE TAG_ADMIN;
GRANT CREATE TAG ON SCHEMA bourne_MASTER.tag_admin TO ROLE tag_admin;
GRANT CREATE masking policy ON SCHEMA bourne_MASTER.tag_admin TO ROLE tag_admin;

SHOW GRANTS TO ROLE tag_admin;

USE ROLE ACCOUNTADMIN;
GRANT APPLY MASKING POLICY ON ACCOUNT TO ROLE TAG_ADMIN;
GRANT APPLY MASKING POLICY ON ACCOUNT TO ROLE DBA;
GRANT apply TAG ON ACCOUNT TO ROLE tag_admin;
GRANT apply TAG ON ACCOUNT TO ROLE dba;


SHOW GRANTS TO ROLE tag_admin;
SHOW roles LIKE '%dba%warehouse%';

GRANT ROLE _bourne_MASTER__tag_admin__owner TO ROLE tag_admin;
GRANT ROLE _bourne__dba_wh__warehouse__usage TO ROLE tag_admin;
GRANT ROLE tag_admin TO ROLE dba;


USE ROLE tag_admin;
USE DATABASE bourne_MASTER;
USE SCHEMA tag_admin;

CREATE OR REPLACE TAG postcode allowed_values 'postcode';
CREATE OR REPLACE TAG email_address allowed_values 'email_address'; 
CREATE OR REPLACE TAG Personally_identifiable_data allowed_values 'pii';

DROP TAG postcode;
DROP TAG email_address;
DROP TAG Personally_identifiable_data;

SELECT CURRENT_ROLE();
SHOW masking POLICIES;
SHOW tags;
ALTER TAG bourne_MASTER.TAG_ADMIN.EMAIL_ADDRESS SET masking POLICY bourne_MASTER.TAG_ADMIN.email_masking_policy;
ALTER TAG bourne_MASTER.TAG_ADMIN.POSTCODE unSET masking POLICY bourne_MASTER.TAG_ADMIN.POSTCODE_masking_policy;

ALTER TAG bourne_MASTER.TAG_ADMIN.EMAIL_ADDRESS unSET masking POLICY  bourne_MASTER.TAG_ADMIN.email_masking_policy;
ALTER TAG bourne_MASTER.TAG_ADMIN.POSTCODE unSET masking POLICY bourne_MASTER.TAG_ADMIN.POSTCODE_masking_policy;


USE ROLE dba;
SHOW tags;

USE SCHEMA training.training;

ALTER TABLE training.training.LOCATION
MODIFY COLUMN zipcode
unSET TAG bourne_MASTER.tag_admin.postcode;

USE WAREHOUSE dba_wh;
select *
  from TABLE(training.information_schema.tag_references_all_columns('location', 'table'));

select *
  from TABLE(training.information_schema.tag_references('location', 'table'));

USE ROLE accountadmin;
select *
  from table(snowflake.account_usage.tag_references_with_lineage('BOURNE_MASTER.TAG_ADMIN.EMAIL_ADDRESS'));
 
 SELECT * FROM LOCATION;

INSERT into UK_CUSTOMERS SELECT * FROM haven_MASTER.BLOOMREACH_INTEGRATION.CUSTOMERS; 

ALTER TABLE training.training.uk_customers
MODIFY COLUMN email
SET TAG bourne_MASTER.tag_admin.email_address = 'email_address';

SELECT * FROM training.training.uk_customers WHERE 
--havenid IS NOT NULL
--haventempid != '[]'
city ='Essex' 
;

SELECT * FROM training.information_schema.table_constraints
WHERE table_name = 'UK_CUSTOMERS';


USE ROLE useradmin;
create or replace role derived_masking_policy_role;
create or replace role personal_masking_policy_role;
create or replace role sensitive_masking_policy_role;
create or replace role financial_masking_policy_role;
create or replace role address_masking_policy_role;
create or replace role telephone_masking_policiy_role;
create or replace role email_masking_policy_role;
create or replace role email_masking_policy_provider_role;
create or replace role postcode_masking_policy_role;
create or replace role postcode_masking_policy_area_role;
create or replace role postcode_masking_policy_region_role;
create or replace role postcode_masking_policy_sector_role;
create or replace role car_license_masking_policy_role;
create or replace role car_license_masking_policy_location_role;
create or replace role car_license_masking_policy_location_year_role;
create or replace role car_license_masking_policy_year_role;
create or replace role third_party_masking_policy_role;
create or replace role birthday_masking_policy_role;
create or replace role birthday_masking_policy_age_data_role;
create or replace role birthday_masking_policy_age_data_range_role;


USE ROLE tag_admin;
USE DATABASE bourne_MASTER;
USE SCHEMA tag_admin;

create or replace masking policy general_default_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('personal_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy telephone_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('telephone_masking_policiy_role') then columnValue
                else '########' END;

create or replace masking policy email_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('email_masking_policy_role') then columnValue
                when is_role_in_session('email_masking_policy_provider_role') then coalesce(split_part(columnValue, '@', 2), 'None')
                else '########' END;

create or replace masking policy postcode_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('postcode_masking_policy_role') then columnValue
                when is_role_in_session('postcode_masking_policy_area_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z][a-zA-Z]?'), 'None') 
                when is_role_in_session('postcode_masking_policy_region_role') then coalesce(substr(regexp_substr(columnValue, '^[a-zA-Z]+\\\\d+?\\\\s\\\\d+'),
                1, length(regexp_substr(columnValue, '^[a-zA-Z]+\\\\d+?\\\\s\\\\d+')) - 1), 'None')
                when is_role_in_session('postcode_masking_policy_sector_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z]+\\\\d+?\\\\s\\\\d+'), 'None')
                else '########' END;

create or replace masking policy car_license_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('car_license_masking_policy_role') then columnValue
                when is_role_in_session('car_license_masking_policy_location_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z][a-zA-Z]'), 'None')
                when is_role_in_session('car_license_masking_policy_location_year_role') then coalesce(substring(regexp_substr(columnValue, '^[a-zA-Z]{2}[0-9]{2}'), 3, 2), 'None')
                when is_role_in_session('car_license_masking_policy_year_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z]{2}[0-9]{2}'), 'None')
                else '########' END;

create or replace masking policy birthday_masking_policy as (columnValue string)
                returns string -> case
                when is_role_in_session('birthday_masking_policy_role') then cast(columnValue as string)
                when is_role_in_session('birthday_masking_policy_age_data_role') then
                cast(coalesce(datediff(year, to_timestamp_ntz(columnValue), current_date), 0) as string)
                when is_role_in_session('birthday_masking_policy_age_data_range_role') then
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

-- 10/09/2025
-- moving to correct schema for tags and masking policies


use ROLE useradmin;
SHOW roles LIKE '%masking_policy%';

DROP ROLE DERIVED_MASKING_POLICY_ROLE;
DROP ROLE EMAIL_MASKING_POLICY_PROVIDER_ROLE;
DROP ROLE EMAIL_MASKING_POLICY_ROLE;
DROP ROLE _HAVEN_BASE__SEAWARE__VIEW_MASKING_POLICY;

USE ROLE tag_admin;
USE DATABASE haven_master;
USE SCHEMA tag_admin;

SHOW masking policies;
SHOW tags;
