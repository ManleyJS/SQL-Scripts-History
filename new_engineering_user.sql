USE ROLE useradmin;

-- narayana.velaga@bourne-leisure.co.uk
-- Narayana Velaga
create role haven_data_transform_NarayanaVelaga;
create role haven_data_integrate_NarayanaVelaga;

create user NarayanaVelaga
login_name = 'narayana.velaga@bourne-leisure.co.uk'
display_name = 'Narayana Velaga'
email = 'narayana.velaga@bourne-leisure.co.uk'
comment = 'Senior Data Engineer'
default_role = haven_data_transform_NarayanaVelaga
default_warehouse = haven_data_transform_warehouse_xsmall;

-- rupam.pathak@bourne-leisure.co.uk
-- Rupam Pathak
create role haven_data_transform_RupamPathak;
create role haven_data_integrate_RupamPathak;

create user RupamPathak
login_name = 'rupam.pathak@bourne-leisure.co.uk'
display_name = 'Rupam Pathak'
email = 'rupam.pathak@bourne-leisure.co.uk'
comment = 'Senior Data Engineer'
default_role = haven_data_transform_RupamPathak
default_warehouse = haven_data_transform_warehouse_xsmall;

use ROLE securityadmin;

GRANT ROLE haven_data_transform TO ROLE haven_data_transform_NarayanaVelaga;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_NarayanaVelaga;
GRANT ROLE haven_data_transform_NarayanaVelaga TO USER NarayanaVelaga;

GRANT ROLE haven_data_transform TO ROLE haven_data_transform_RupamPathak;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_RupamPathak;
GRANT ROLE haven_data_transform_RupamPathak TO USER RupamPathak;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_NarayanaVelaga;
GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_NarayanaVelaga;
GRANT ROLE haven_data_integrate_NarayanaVelaga TO USER NarayanaVelaga;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_RupamPathak;
GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_RupamPathak;
GRANT ROLE haven_data_integrate_RupamPathak TO USER RupamPathak;

SHOW USERS;
SHOW ROLES LIKE 'haven_data_integrate%';
SHOW WAREHOUSES LIKE 'haven_data%';
SHOW GRANTS TO ROLE haven_data_transform_garyranson;



USE ROLE useradmin;

--santosh.nair@bourne-leisure.co.uk
--Santosh Nair
create role haven_data_transform_SantoshNair;
create role haven_data_integrate_SantoshNair;

create user SantoshNair
login_name = 'santosh.nair@bourne-leisure.co.uk'
display_name = 'Santosh Nair'
email = 'santosh.nair@bourne-leisure.co.uk'
comment = 'Senior Data Engineer'
default_role = haven_data_transform_RupamPathak
default_warehouse = haven_data_transform_warehouse_xsmall;

use ROLE securityadmin;

GRANT ROLE haven_data_transform TO ROLE haven_data_transform_SantoshNair;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_SantoshNair;
GRANT ROLE haven_data_transform_SantoshNair TO USER SantoshNair;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_SantoshNair;
GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_SantoshNair;
GRANT ROLE haven_data_integrate_SantoshNair TO USER SantoshNair;

USE ROLE useradmin;

--donatas.gedgaudas@haven.com
--Donatas Gedgaudas
create role haven_data_transform_DonatasGedgaudas;
create role haven_data_integrate_DonatasGedgaudas;

create user DonatasGedgaudas
login_name = 'donatas.gedgaudas@haven.com'
display_name = 'Donatas Gedgaudas'
email = 'donatas.gedgaudas@haven.com'
comment = 'Senior Data Engineer'
default_role = haven_data_transform_RupamPathak
default_warehouse = haven_data_transform_warehouse_xsmall;

ALTER USER DonatasGedgaudas SET default_role =  haven_data_transform_DonatasGedgaudas;
ALTER USER SantoshNair SET default_role =  haven_data_transform_SantoshNair;

use ROLE securityadmin;

GRANT ROLE haven_data_transform TO ROLE haven_data_transform_DonatasGedgaudas;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_DonatasGedgaudas;
GRANT ROLE haven_data_transform_DonatasGedgaudas TO USER DonatasGedgaudas;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_DonatasGedgaudas;
GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_DonatasGedgaudas;
GRANT ROLE haven_data_integrate_DonatasGedgaudas TO USER DonatasGedgaudas;

USE ROLE accountadmin;

SHOW USERS LIKE 'daniel%';

USE ROLE useradmin;

CREATE ROLE haven_data_transform_danielcarter;

USE ROLE securityadmin;

GRANT ROLE haven_data_transform TO ROLE haven_data_transform_danielcarter;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_danielcarter;
GRANT ROLE haven_data_transform_danielcarter TO USER danielcarter;

-- 15/07/2024

-- Andrew Dawson
-- andrew.dawson@haven.com
-- Senior Data Engineer

use ROLE useradmin;

create role haven_data_transform_AndrewDawson;
create role haven_data_integrate_AndrewDawson;

create user AndrewDawson
login_name = 'andrew.dawson@haven.com'
display_name = 'Andrew Dawson'
email = 'andrew.dawson@haven.com'
comment = 'Senior Data Engineer'
default_role = haven_data_transform_AndrewDawson
default_warehouse = haven_data_transform_warehouse_xsmall;

use ROLE securityadmin;

GRANT ROLE haven_data_transform TO ROLE haven_data_transform_AndrewDawson;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_AndrewDawson;
GRANT ROLE haven_data_transform_AndrewDawson TO USER AndrewDawson;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_AndrewDawson;
GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_AndrewDawson;
GRANT ROLE haven_data_integrate_AndrewDawson TO USER AndrewDawson;


-- 05/09/2024

-- Sarunas Jatautis  
-- sarunas.jatautis@haven.com
-- Senior Data Engineer

use ROLE useradmin;

create role haven_data_transform_SarunasJatautis;
create role haven_data_integrate_SarunasJatautis;

create user SarunasJatautis
login_name = 'sarunas.jatautis@haven.com'
display_name = 'Sarunas Jatautis'
email = 'sarunas.jatautis@haven.com'
comment = 'Senior Data Engineer'
default_role = haven_data_transform_SarunasJatautis
default_warehouse = haven_data_transform_warehouse_xsmall;

use ROLE securityadmin;

GRANT ROLE haven_data_transform TO ROLE haven_data_transform_SarunasJatautis;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_SarunasJatautis;
GRANT ROLE haven_data_transform_SarunasJatautis TO USER SarunasJatautis;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_SarunasJatautis;
GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_SarunasJatautis;
GRANT ROLE haven_data_integrate_SarunasJatautis TO USER SarunasJatautis;


-- 01/10/2024

USE ROLE useradmin;

CREATE ROLE haven_data_transform_dillonsim;

USE ROLE securityadmin;
GRANT ROLE haven_data_transform TO ROLE haven_data_transform_dillonsim;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_dillonsim;
GRANT ROLE haven_data_transform_dillonsim TO USER dillonsim;


-- 05/11/2025

-- giedrius.valancius
-- giedrius.valancius@bourne-leisure.co.uk
-- Data Engineering

use ROLE useradmin;

create user giedriusvalancius
login_name = 'giedrius.valancius@bourne-leisure.co.uk'
display_name = 'Giedrius Valancius'
email = 'giedrius.valancius@bourne-leisure.co.uk'
comment = 'Data Engineering'
default_role = haven_dbt_development
default_warehouse = haven_HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL
TYPE = person;

use ROLE securityadmin;

GRANT ROLE haven_dbt_development TO USER giedriusvalancius;
GRANT ROLE haven_data_engineering TO USER giedriusvalancius;

-- 
-- 
-- 

use ROLE useradmin;

create user 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = haven_dbt_development
default_warehouse = haven_HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL
TYPE = person;

use ROLE securityadmin;

GRANT ROLE haven_data_transform TO ROLE haven_data_transform_;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_;
GRANT ROLE haven_data_transform_ TO USER ;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_;
GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_;
GRANT ROLE haven_data_integrate_ TO USER ;


