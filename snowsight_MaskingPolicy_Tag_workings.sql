USE ROLE bourne_accountadmin;

SELECT * FROM SNOWFLAKE.ACCOUNT_USAGE.USERS
where deleted_on IS NULL
AND contains(LOGIN_NAME, '@')
ORDER BY CREATED_ON;

USE ROLE useradmin;
CREATE ROLE tag_admin;
CREATE ROLE derived_masking_policy_role;

USE ROLE securityadmin;

GRANT CREATE TAG ON schema training.training TO ROLE tag_admin;
GRANT apply TAG ON ACCOUNT TO ROLE tag_admin;

GRANT CREATE masking POLICY ON SCHEMA training.training TO ROLE tag_admin;
GRANT apply masking POLICY ON ACCOUNT TO ROLE tag_admin;

GRANT ROLE _training__usage TO ROLE tag_admin;
GRANT ROLE _training__training__usage TO ROLE tag_admin;

GRANT ROLE tag_admin TO ROLE dba;
GRANT ROLE tag_admin TO USER jonathanmanley;

USE ROLE accountadmin;
SELECT CURRENT_ACCOUNT();
USE DATABASE training;
USE SCHEMA training;

USE ROLE dba;

DROP TAG training.training.piidata;
DROP masking POLICY training.training.derived_masking_policy;

--USE ROLE tag_admin;
USE ROLE sysadmin;
create or replace masking policy training.training.derived_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('derived_masking_policy_role') then columnValue
                else '########' END;

CREATE OR REPLACE TAG training.training.pii_data allowed_VALUES 
	'Address', 'Postcode', 'E-mail address', 'First Name', 'Middle Name', 'Surname', 'Age', 'Date of Birth', 
	'Gender', 'Title', 'Telephone Number', 'Location', 'Car Registration', 'Web Login Details'; 
	

SHOW tags;
SHOW masking POLICIES;

ALTER TAG pii_data RENAME TO PIIDATA;

alter tag training.training.piidata set masking policy training.training.derived_masking_policy;

USE ROLE dba;
USE ROLE sysadmin;

SHOW masking POLICIES;


--drop masking policy HAVEN_BASE.MARINER.HAVEN_BASE__MARINER__PERSONAL__POLICY;
--drop masking policy HAVEN_BASE.MARINER.HAVEN_BASE__MARINER__SENSITIVE__POLICY;
drop masking policy HAVEN_BASE.ZENDESK.HAVEN_BASE__ZENDESK__DERIVED__POLICY;
drop masking policy HAVEN_BASE.ZENDESK.HAVEN_BASE__ZENDESK__FINANCIAL__POLICY;
drop masking policy HAVEN_BASE.ZENDESK.HAVEN_BASE__ZENDESK__PERSONAL__POLICY;
drop masking policy HAVEN_BASE.ZENDESK.HAVEN_BASE__ZENDESK__SENSITIVE__POLICY;
drop masking policy WARNER_BASE.SEAWARE.WARNER_BASE__SEAWARE__DERIVED__POLICY;
drop masking policy WARNER_BASE.SEAWARE.WARNER_BASE__SEAWARE__FINANCIAL__POLICY;
drop masking policy WARNER_BASE.SEAWARE.WARNER_BASE__SEAWARE__PERSONAL__POLICY;
drop masking policy WARNER_BASE.SEAWARE.WARNER_BASE__SEAWARE__SENSITIVE__POLICY;
drop masking policy WARNER_BASE.ZENDESK.WARNER_BASE__ZENDESK__DERIVED__POLICY;
drop masking policy WARNER_BASE.ZENDESK.WARNER_BASE__ZENDESK__FINANCIAL__POLICY;
drop masking policy WARNER_BASE.ZENDESK.WARNER_BASE__ZENDESK__PERSONAL__POLICY;
drop masking policy WARNER_BASE.ZENDESK.WARNER_BASE__ZENDESK__SENSITIVE__POLICY;

drop masking policy HAVEN_BASE.COMPETITOR.HAVEN_BASE__COMPETITOR__DERIVED__POLICY;
drop masking policy HAVEN_BASE.COMPETITOR.HAVEN_BASE__COMPETITOR__FINANCIAL__POLICY;
drop masking policy HAVEN_BASE.COMPETITOR.HAVEN_BASE__COMPETITOR__PERSONAL__POLICY;
drop masking policy HAVEN_BASE.COMPETITOR.HAVEN_BASE__COMPETITOR__SENSITIVE__POLICY;
drop masking policy HAVEN_BASE.JDAADMIN.HAVEN_BASE__JDAADMIN__DERIVED__POLICY;
drop masking policy HAVEN_BASE.JDAADMIN.HAVEN_BASE__JDAADMIN__FINANCIAL__POLICY;
drop masking policy HAVEN_BASE.JDAADMIN.HAVEN_BASE__JDAADMIN__PERSONAL__POLICY;
drop masking policy HAVEN_BASE.JDAADMIN.HAVEN_BASE__JDAADMIN__SENSITIVE__POLICY;
drop masking policy HAVEN_BASE.MARINER.HAVEN_BASE__MARINER__DERIVED__POLICY;
drop masking policy HAVEN_BASE.MARINER.HAVEN_BASE__MARINER__FINANCIAL__POLICY;


USE ROLE dba;
SHOW masking POLICIES;
USE SCHEMA training.training;


select *
 from table(information_schema.policy_references(ref_entity_name => 'training.training.uk_customers', ref_entity_domain => 'table'));

ALTER VIEW training.training.CLIENT_TEST MODIFY COLUMN birthday UNSET masking POLICY;
SELECT * FROM table(INFORMATION_SCHEMA.policy_references(policy_name => 'training.training.derived_masking_polciy'));

DROP masking POLICY training.training._HAVEN_BASE__SEAWARE__BIRTHDATE_POLICY;

USE ROLE tag_admin;

SHOW masking POLICIES;

USE ROLE dba;

SHOW masking POLICIES;







 