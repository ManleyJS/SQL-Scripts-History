USE ROLE useradmin;

-- Dillon Sim
-- Dillon.Sim@haven.com
CREATE ROLE haven_commercial_DillonSim;

CREATE USER DillonSim
login_name = 'Dillon.Sim@haven.com'
display_name = 'Dillon Sim'
email = 'Dillon.Sim@haven.com'
comment = 'Process Improvement Analyst'
default_role = haven_commercial_DillonSim
default_warehouse = haven_commercial_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_commercial TO ROLE haven_commercial_DillonSim;
GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_DillonSim;
GRANT ROLE haven_commercial_DillonSim TO USER DillonSim;

USE ROLE useradmin;

-- Vaughn Medhurst
-- vaughn.medhurst@haven.com
CREATE ROLE haven_commercial_VaughnMedhurst;

CREATE USER VaughnMedhurst
login_name = 'vaughn.medhurst@haven.com'
display_name = 'Vaughn Medhurst'
email = 'vaughn.medhurst@haven.com'
comment = 'Haven Revenue Manager'
default_role = haven_commercial_VaughnMedhurst
default_warehouse = haven_commercial_xsmall;

ALTER USER VaughnMedhurst
SET default_role = haven_commercial_VaughnMedhurst,
default_warehouse = haven_commercial_xsmall;

USE ROLE securityadmin;
SHOW GRANTS TO USER VaughnMedhurst;
GRANT ROLE haven_commercial TO ROLE haven_commercial_VaughnMedhurst;
GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_VaughnMedhurst;
GRANT ROLE haven_commercial_VaughnMedhurst TO USER VaughnMedhurst;

USE ROLE useradmin;

-- Darius Tinca 
--darius.tinca@haven.com
--Revenue Operations Analyst

CREATE ROLE haven_revenue_management_DariusTinca;

CREATE USER DariusTinca
login_name = 'darius.tinca@haven.com'
display_name = 'Darius Tinca'
email = 'darius.tinca@haven.com'
comment = 'Revenue Operations Analyst'
default_role = haven_revenue_management_DariusTinca
default_warehouse = HAVEN_REVENUE_MANAGEMENT_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE haven_revenue_management TO ROLE haven_revenue_management_DariusTinca;
GRANT ROLE _haven_revenue_management__schema TO ROLE haven_revenue_management_DariusTinca;
GRANT ROLE haven_revenue_management_DariusTinca TO USER DariusTinca;

-- 11/06/2024

USE ROLE useradmin;
-- Owen Goddard
-- owen.goddard@haven.com
-- Revenue Operations Analyst

CREATE ROLE haven_revenue_management_OwenGoddard;

CREATE USER OwenGoddard
login_name = 'owen.goddard@haven.com'
display_name = 'Owen Goddard'
email = 'owen.goddard@haven.com'
comment = 'Revenue Operations Analyst'
default_role = haven_revenue_management_OwenGoddard
default_warehouse = HAVEN_REVENUE_MANAGEMENT_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE haven_revenue_management TO ROLE haven_revenue_management_OwenGoddard;
GRANT ROLE _haven_revenue_management__schema TO ROLE haven_revenue_management_OwenGoddard;
GRANT ROLE haven_revenue_management_OwenGoddard TO USER OwenGoddard;

-- 09/04/2025

USE ROLE useradmin;

-- Abbie Johnson
-- abbie.johnstone@haven.com
-- Caravan Stock & Pricing Manager

CREATE ROLE haven_revenue_management_AbbieJohnson;

CREATE USER AbbieJohnson
login_name = 'abbie.johnstone@haven.com'
display_name = 'Abbie Johnson'
email = 'abbie.johnstone@haven.com'
comment = 'Caravan Stock & Pricing Manager'
default_role = haven_revenue_management_AbbieJohnson
default_warehouse = HAVEN_REVENUE_MANAGEMENT_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE haven_revenue_management TO ROLE haven_revenue_management_AbbieJohnson;
GRANT ROLE _haven_revenue_management__schema TO ROLE haven_revenue_management_AbbieJohnson;
GRANT ROLE haven_revenue_management_AbbieJohnson TO USER AbbieJohnson;

-- 28/05/2025

use ROLE useradmin;

CREATE ROLE _haven_revenue_managment__haven_base__hit_admin__reader;

use ROLE securityadmin;

GRANT ROLE _haven_base__hit_admin__usage TO ROLE _haven_revenue_managment__haven_base__hit_admin__reader;
GRANT SELECT ON VIEW haven_base.hit_admin.VRES_CYHH_PITCH_COST TO ROLE _haven_revenue_managment__haven_base__hit_admin__reader;
GRANT ROLE _haven_revenue_managment__haven_base__hit_admin__reader TO ROLE haven_revenue_management;

use ROLE haven_revenue_management;

show databases;

use DATABASE haven_base;

show schemas;

use SCHEMA hit_admin;

show tables;
show views;

-- 

USE ROLE useradmin;

-- 
-- 
-- 

CREATE ROLE haven_revenue_management_;

CREATE USER 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = haven_revenue_management_
default_warehouse = HAVEN_REVENUE_MANAGEMENT_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE haven_revenue_management TO ROLE haven_revenue_management_d;
GRANT ROLE _haven_revenue_management__schema TO ROLE haven_revenue_management_;
GRANT ROLE haven_revenue_management_ TO USER ;




