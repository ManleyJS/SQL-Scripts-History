USE ROLE dba;

SHOW ROLES LIKE '%__READER';

USE SCHEMA haven_base.seaware;

SHOW masking POLICIES;

IF in_session(role_all) THEN SHOW COLUMN
elif IN_session(role_some) THEN SHOW string(1,4)
ELSE SHOW '######';

SHOW GRANTS TO ROLE haven_commercial_test;


USE ROLE bourne_governance;
USE SCHEMA haven_base.seaware;
SHOW masking POLICIES;

USE ROLE useradmin;
CREATE role _haven_base__seaware__view_masking_policy;

USE ROLE securityadmin;
GRANT apply masking POLICY ON SCHEMA haven_base.seaware TO ROLE _haven_base__seaware__view_masking_policy; 
GRANT ROLE _haven_base__seaware__view_masking_policy TO ROLE bourne_governance;
revoke apply masking POLICY ON ACCOUNT from ROLE _haven_base__seaware__view_masking_policy;
Revoke ROLE _haven_base__seaware__view_masking_policy from ROLE bourne_governance;

