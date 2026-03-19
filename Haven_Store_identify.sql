USE ROLE dba;

USE SCHEMA haven_base.seaware;

SHOW VIEWS;

SELECT  FROM haven_base.information_schema."VIEWS" ;

SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_CATALOG = 'HAVEN_BASE' AND TABLE_SCHEMA = 'SEAWARE' ORDER BY TABLE_NAME;

USE ROLE useradmin;

CREATE ROLE haven_identity_management;

CREATE ROLE haven_identity_management_guspowers;
CREATE ROLE haven_identity_management_stevecresswell;
CREATE ROLE haven_identity_management_kevinrichards1;

USE ROLE bourne_accountadmin;

SHOW USERS;

use role sysadmin;

CREATE WAREHOUSE haven_identity_management_warehouse_xs WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_identity_management_warehouse_xs__warehouse__operator;
create role _haven_identity_management_warehouse_xs__warehouse__usage;

use role securityadmin;

grant usage, monitor on warehouse haven_identity_management_warehouse_xs to role _haven_identity_management_warehouse_xs__warehouse__usage;
grant role _haven_identity_management_warehouse_xs__warehouse__usage to role _haven_identity_management_warehouse_xs__warehouse__operator;
grant operate, modify on warehouse haven_identity_management_warehouse_xs to role _haven_identity_management_warehouse_xs__warehouse__operator;
GRANT ROLE _haven_identity_management_warehouse_xs__warehouse__usage TO ROLE haven_identity_management;

USE ROLE useradmin;

create user stevecresswell
login_name = 'steve.cresswell@bourne-leisure.co.uk'
display_name = 'Steve Cresswell'
email = 'steve.cresswell@bourne-leisure.co.uk'
comment = 'Identity management Team'
default_role = haven_identity_management
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xsmall;

create user kevinrichards1
login_name = 'kevin.richards1@haven.com'
display_name = 'Kevin Richards'
email = 'kevin.richards1@haven.com'
comment = 'Identity management Team'
default_role = haven_identity_management
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xsmall;

USE ROLE sysadmin;
CREATE DATABASE haven_identity;
USE ROLE useradmin;
CREATE ROLE _haven_identity__usage;
CREATE ROLE _haven_identity__schema;

USE ROLE securityadmin;
GRANT USAGE ON DATABASE haven_identity TO ROLE _haven_identity__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_identity TO ROLE _haven_identity__usage;
GRANT ROLE _haven_identity__usage TO ROLE _haven_identity__schema;
GRANT CREATE SCHEMA ON DATABASE haven_identity TO ROLE _haven_identity__schema;
GRANT SELECT ON future TABLES IN DATABASE haven_identity TO ROLE _haven_identity__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_identity TO ROLE _haven_identity__usage;
GRANT SELECT ON all VIEWS IN DATABASE haven_identity TO ROLE _haven_identity__udage;

GRANT ROLE _haven_identity__usage TO ROLE haven_identity_management;
GRANT ROLE _haven_base__seaware__reader TO ROLE haven_identity_management;
GRANT ROLE _haven_base__plot__reader TO ROLE haven_identity_management;
GRANT ROLE _haven_base__sas_common__reader TO ROLE haven_identity_management;
GRANT ROLE _haven_base__sas_scv__reader TO ROLE haven_identity_management;

USE ROLE useradmin;
CREATE ROLE haven_identity_management_guspower;
CREATE ROLE haven_identity_management_stevecresswell;
CREATE ROLE haven_identity_management_kevinrichards1;

GRANT ROLE haven_identity_management TO ROLE  haven_identity_management_guspower;
GRANT ROLE haven_identity_management TO ROLE  haven_identity_management_stevecresswell;
GRANT ROLE haven_identity_management TO ROLE  haven_identity_management_kevinrichards1;
GRANT ROLE _haven_identity__schema  TO ROLE  haven_identity_management_guspower;
GRANT ROLE _haven_identity__schema TO ROLE  haven_identity_management_stevecresswell;
GRANT ROLE _haven_identity__schema TO ROLE  haven_identity_management_kevinrichards1;

USE ROLE useradmin;
create user haven_identity_test
login_name = 'haven.identity.test'
password = '<REDACTED>'
display_name = 'Haven Identity Test'
comment = 'Identity management Team'
default_role = haven_identity_management
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xsmall;

CREATE ROLE haven_identity_management_testuser;

USE ROLE securityadmin;
GRANT ROLE haven_identity_management TO ROLE  haven_identity_management_testuser;
GRANT ROLE _haven_identity__schema  TO ROLE  haven_identity_management_testuser;
GRANT ROLE haven_identity_management_testuser TO USER haven_identity_test;

GRANT ROLE haven_identity_management_guspower TO USER guspower;

GRANT ROLE haven_identity_management_stevecresswell TO USER stevecresswell;

GRANT ROLE haven_identity_management_kevinrichards1 TO USER kevinrichards1;

USE ROLE useradmin;

CREATE ROLE haven_identity_management_DaveCartwright;
CREATE ROLE haven_identity_management_ViktorIlles;
CREATE ROLE haven_identity_management_JonMoore;

--Dave Cartwright
--dave.cartwright@bourne-leisure.co.uk
create user DaveCartwright
login_name = 'dave.cartwright@bourne-leisure.co.uk'
display_name = 'Dave Cartwright'
email = 'dave.cartwright@bourne-leisure.co.uk'
comment = 'Junior Engineer'
default_role = haven_identity_management
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xsmall;

-- Viktor Illes
-- viktor.illes@bourne-leisure.co.uk
create user ViktorIlles
login_name = 'viktor.illes@bourne-leisure.co.uk'
display_name = 'Viktor Illes'
email = 'viktor.illes@bourne-leisure.co.uk'
comment = 'Web Developer'
default_role = haven_identity_management
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xsmall;

-- Jon Moore
-- jon.moore@haven.com

create user JonMoore
login_name = 'jon.moore@haven.com'
display_name = 'Jon Moore'
email = 'jon.moore@haven.com'
comment = 'Senior Engineer'
default_role = haven_identity_management
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_identity_management TO ROLE haven_identity_management_DaveCartwright;
GRANT ROLE haven_identity_management TO ROLE haven_identity_management_ViktorIlles;
GRANT ROLE haven_identity_management TO ROLE haven_identity_management_JonMoore;

GRANT ROLE _haven_identity__schema TO ROLE haven_identity_management_DaveCartwright;
GRANT ROLE _haven_identity__schema TO ROLE haven_identity_management_ViktorIlles;
GRANT ROLE _haven_identity__schema TO ROLE haven_identity_management_JonMoore;

GRANT ROLE haven_identity_management_DaveCartwright TO USER DaveCartwright;
GRANT ROLE haven_identity_management_ViktorIlles TO USER ViktorIlles;
GRANT ROLE haven_identity_management_JonMoore TO USER JonMoore;


-- 21/08/2024

-- Frank Carver
-- frank.carver@haven.com
-- Senior Engineer

USE ROLE useradmin;

create user FrankCarver
login_name = 'frank.carver@haven.com'
display_name = 'Frank Carver'
email = 'frank.carver@haven.com'
comment = 'Senior Engineer'
default_role = haven_identity_management_developer
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xsmall;

USE ROLE securityadmin;

--SHOW GRANTS TO USER jonmoore;

GRANT ROLE haven_identity_management_developer TO USER FrankCarver;

-- 14/05/2025

-- Jay Gould
-- jay.gould@haven.com
-- Senior Engineer

USE ROLE useradmin;

create user JayGould
login_name = 'jay.gould@haven.com'
display_name = 'Jay Gould'
email = 'jay.gould@haven.com'
comment = 'Senior Engineer'
default_role = haven_identity_management_developer
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xsmall;

USE ROLE securityadmin;

--SHOW GRANTS TO USER jonmoore;

GRANT ROLE haven_identity_management_developer TO USER JayGould;


-- new user setup

-- 
-- 
-- 

USE ROLE useradmin;

create user 
login_name = ''
display_name = ''
email = 'f'
comment = ''
default_role = haven_identity_management_developer
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xsmall;

USE ROLE securityadmin;

--SHOW GRANTS TO USER jonmoore;

GRANT ROLE haven_identity_management_developer TO USER ;


