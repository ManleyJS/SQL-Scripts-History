USE ROLE sysadmin;

CREATE DATABASE haven_commercial;

USE ROLE useradmin;
CREATE ROLE _haven_commercial__usage;
CREATE ROLE _haven_commercial__schema;

CREATE ROLE haven_commercial_harrybillimore;

GRANT ROLE haven_commercial_harrybillimore TO USER 

USE ROLE securityadmin;
GRANT USAGE ON DATABASE haven_commercial TO ROLE _haven_commercial__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_commercial TO ROLE _haven_commercial__usage;
GRANT ROLE _haven_commercial__usage TO ROLE _haven_commercial__schema;
GRANT CREATE SCHEMA ON DATABASE haven_commercial TO ROLE _haven_commercial__schema;
GRANT SELECT ON future TABLES IN DATABASE haven_commercial TO ROLE _haven_commercial__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_commercial TO ROLE _haven_commercial__usage;
GRANT SELECT ON all VIEWS IN DATABASE haven_commercial TO ROLE _haven_commercial__usage;
 
GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_test;
GRANT ROLE  _haven_commercial__usage TO ROLE haven_commercial;

GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_danieleldridge;
REVOKE ROLE _haven_work__commercial__CREATOR FROM ROLE haven_commercial_danieleldridge;
REVOKE ROLE _haven_work__commercial__CREATOR FROM ROLE HAVEN_COMMERCIAL_TEST;
REVOKE ROLE _haven_work__commercial__CREATOR FROM ROLE HAVEN_COMMERCIAL_DEMOUSER;
GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_DEMOUSER;

GRANT ROLE _HAVEN_PIPELINE__PX0007_PITCH_PERFECT__READER TO ROLE haven_commercial_test;
GRANT ROLE _HAVEN_PIPELINE__PX0007_PITCH_PERFECT__READER TO ROLE haven_commercial_danieleldridge;

USE ROLE useradmin;
CREATE ROLE haven_commercial_harrybillimore;

USE ROLE securityadmin;
GRANT ROLE haven_commercial_harrybillimore TO USER harrybillimore; 
GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_harrybillimore;
GRANT ROLE haven_commercial TO ROLE haven_commercial_harrybillimore;
REVOKE ROLE _haven_work__commercial__CREATOR FROM ROLE haven_commercial_harrybillimore;

USE ROLE securityadmin;
GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_ELLISHAMANN1;
REVOKE ROLE _haven_work__commercial__CREATOR FROM ROLE haven_commercial_ELLISHAMANN1;
GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_MATTHEWLAMBERT;
REVOKE ROLE _haven_work__commercial__CREATOR FROM ROLE haven_commercial_MATTHEWLAMBERT;
GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_OLIVIATHOMPSON;
REVOKE ROLE _haven_work__commercial__CREATOR FROM ROLE haven_commercial_OLIVIATHOMPSON;
GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_SAIMANASIR;
REVOKE ROLE _haven_work__commercial__CREATOR FROM ROLE haven_commercial_SAIMANASIR;
GRANT ROLE _haven_commercial__schema TO ROLE HAVEN_COMMERCIAL_EMMANUELADEDEJI;
REVOKE ROLE _haven_work__commercial__CREATOR FROM ROLE HAVEN_COMMERCIAL_EMMANUELADEDEJI;
GRANT ROLE _haven_commercial__schema TO ROLE HAVEN_COMMERCIAL_GHUFRANSHABIR;
REVOKE ROLE _haven_work__commercial__CREATOR FROM ROLE HAVEN_COMMERCIAL_GHUFRANSHABIR;
GRANT ROLE _haven_commercial__schema TO ROLE HAVEN_COMMERCIAL_LUKEMURPHY;
REVOKE ROLE _haven_work__commercial__CREATOR FROM ROLE HAVEN_COMMERCIAL_LUKEMURPHY;

SHOW GRANTs to role haven_commercial;

USE ROLE USERADMIN;

-- gary.malcolm@haven.com
-- 
CREATE ROLE HAVEN_COMMERCIAL_garymalcolm;

create user garymalcolm
login_name = 'gary.malcolm@haven.com'
display_name = 'gary Malcolm'
email = 'gary.malcolm@haven.com'
comment = 'Marketing & Acquisition BI Lead'
default_role = HAVEN_COMMERCIAL_garymalcolm
default_warehouse = HAVEN_COMMERCIAL_XSMALL;

USE ROLE securityadmin;

REVOKE ROLE _HAVEN_COMMERCIAL__WAREHOUSE__USAGE FROM ROLE HAVEN_COMMERCIAL_garymalcolm; 
GRANT ROLE _HAVEN_COMMERCIAL__SCHEMA TO ROLE HAVEN_COMMERCIAL_garymalcolm;
GRANT ROLE HAVEN_COMMERCIAL TO ROLE HAVEN_COMMERCIAL_garymalcolm;
GRANT ROLE HAVEN_COMMERCIAL_garymalcolm TO USER GARYMALCOLM;

-- 02/08/2024
USE ROLE USERADMIN;

-- Ben Sterling
-- ben.sterling@haven.com
-- Lead Engineer

CREATE ROLE HAVEN_COMMERCIAL_BenSterling;

create user BenSterling
login_name = 'ben.sterling@haven.com'
display_name = 'Ben Sterling'
email = 'ben.sterling@haven.com'
comment = 'Lead Engineer'
default_role = HAVEN_COMMERCIAL_BenSterling
default_warehouse = HAVEN_COMMERCIAL_XSMALL;

USE ROLE securityadmin;

GRANT ROLE _HAVEN_COMMERCIAL__SCHEMA TO ROLE HAVEN_COMMERCIAL_BenSterling;
GRANT ROLE HAVEN_COMMERCIAL TO ROLE HAVEN_COMMERCIAL_BenSterling;
GRANT ROLE HAVEN_COMMERCIAL_BenSterling TO USER BenSterling;

-- 22/11/2024

USE ROLE USERADMIN;

-- 
-- 
-- 

CREATE ROLE HAVEN_COMMERCIAL_;

create user 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = HAVEN_COMMERCIAL_
default_warehouse = HAVEN_COMMERCIAL_XSMALL;

USE ROLE securityadmin;

GRANT ROLE _HAVEN_COMMERCIAL__SCHEMA TO ROLE HAVEN_COMMERCIAL_;
GRANT ROLE HAVEN_COMMERCIAL TO ROLE HAVEN_COMMERCIAL_;
GRANT ROLE HAVEN_COMMERCIAL_ TO USER ;

___________________________

USE ROLE USERADMIN;

-- Richard Taylor
-- richard.taylor@bourne-leisure.co.uk
-- 

CREATE ROLE HAVEN_COMMERCIAL_RichardTaylor;

create user RichardTaylor
login_name = 'richard.taylor@bourne-leisure.co.uk'
display_name = 'Richard Taylor'
email = 'richard.taylor@bourne-leisure.co.uk'
comment = 'Data Analyst'
default_role = HAVEN_COMMERCIAL_RichardTaylor
default_warehouse = HAVEN_COMMERCIAL_XSMALL;

USE ROLE securityadmin;

GRANT ROLE _HAVEN_COMMERCIAL__SCHEMA TO ROLE HAVEN_COMMERCIAL_RichardTaylor;
GRANT ROLE HAVEN_COMMERCIAL TO ROLE HAVEN_COMMERCIAL_RichardTaylor;
GRANT ROLE HAVEN_COMMERCIAL_RichardTaylor TO USER RichardTaylor;

