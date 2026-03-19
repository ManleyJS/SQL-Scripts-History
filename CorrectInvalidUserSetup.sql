USE ROLE securityadmin;
SHOW USERS;
SHOW GRANTs to USER rodpestell;
SHOW GRANTS TO ROLE warner_survey_management;
USE ROLE useradmin;
ALTER USER rodpestell SET default_role = warner_survey_management, default_warehouse = warner_survey_management_warehouse_xsmall;

ALTER USER jonathanmanley SET default_role = dba;