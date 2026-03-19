USE ROLE accountadmin;

SHOW USERS LIKE 'yogen%';


use ROLE useradmin;

--kevin.judge@bourne-leisure.co.uk
--Kevin Judge
create user KevinJudge
login_name = 'kevin.judge@bourne-leisure.co.uk'
display_name = 'Kevin Judge'
email = 'kevin.judge@bourne-leisure.co.uk'
comment = 'Warner Technology Director'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--nigel.nyatsanza@bourne-leisure.co.uk
--Nigel Nyatsanza
create user NigelNyatsanza
login_name = 'nigel.nyatsanza@bourne-leisure.co.uk'
display_name = 'Nigel Nyatsanza'
email = 'nigel.nyatsanza@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--sanda.ikegulu@bourne-leisure.co.uk
--Sanda Ikegulu

USE ROLE useradmin;
DROP USER sandaIkegulu;

create user SandraIkegulu
login_name = 'sandra.ikegulu@bourne-leisure.co.uk'
display_name = 'Sandra Ikegulu'
email = 'sandra.ikegulu@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--vishal.jakhar@bourne-leisure.co.uk
--Vishal Jakhar
create user VishalJakhar
login_name = 'vishal.jakhar@bourne-leisure.co.uk'
display_name = 'Vishal Jakhar'
email = 'vishal.jakhar@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--pawan.kumar@bourne-leisure.co.uk
--Pawan Kumar
create user PawanKumar
login_name = 'pawan.kumar@bourne-leisure.co.uk'
display_name = 'Pawan Kumar'
email = 'pawan.kumar@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--von.branton@bourne-leisure.co.uk
--Von Branton
create user VonBranton
login_name = 'von.branton@bourne-leisure.co.uk'
display_name = 'Von Branton'
email = 'von.branton@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

USE ROLE securityadmin;
grant role warner_data_management to user KevinJudge;
grant role warner_data_management to user NigelNyatsanza;
grant role warner_data_management to user SandraIkegulu;
grant role warner_data_management to user VishalJakhar;
grant role warner_data_management to user PawanKumar;
grant role warner_data_management to user VonBranton;

USE ROLE useradmin;
--Paul.Sammon@bourne-leisure.co.uk
--Paul Sammon
create user PaulSammon
login_name = 'Paul.Sammon@bourne-leisure.co.uk'
display_name = 'Paul Sammon'
email = 'Paul.Sammon@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--Emma.Price@bourne-leisure.co.uk
--Emma Price

create user EmmaPrice
login_name = 'Emma.Price@bourne-leisure.co.uk'
display_name = 'Emma Price'
email = 'Emma.Price@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

USE ROLE securityadmin;
grant role warner_data_management to user PaulSammon;
grant role warner_data_management to user EmmaPrice;


USE ROLE useradmin;
--sunilshinde@bourne-leisure.co.uk
--Sunil Shinde
DROP user SunilShinde;
drop user DionFragkoulis;

create user SunilShinde
login_name = 'sunil.shinde@bourne-leisure.co.uk'
display_name = 'Sunil Shinde'
email = 'sunil.shinde@bourne-leisure.co.uk'
comment = 'Warner Data Modeller - Morson'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--dion.fragkoulis@bourne-leisure.co.uk
--dion.fragkoulis@bourne-leisure.co.uk
--Dion Fragkoulis

USE ROLE useradmin;

create user DionFragkoulis
login_name = 'dion.fragkoulis@bourne-leisure.co.uk'
display_name = 'Dion Fragkoulis'
email = 'dion.fragkoulis@bourne-leisure.co.uk'
comment = 'IT contractor - Morson'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

USE ROLE securityadmin;
grant role warner_data_management to user SunilShinde;
grant role warner_data_INTEGRATE to user SunilShinde;
grant role warner_data_management to user DionFragkoulis;

SHOW USERS LIKE 'Dion%';
SHOW USERS LIKE 'Sunil%';


USE ROLE useradmin;
-- Naren Patel 
-- Naren.Patel@bourne-leisure.co.uk

create user NarenPatel
login_name = 'Naren.Patel@bourne-leisure.co.uk'
display_name = 'Naren Patel'
email = 'Naren.Patel@bourne-leisure.co.uk'
comment = 'Business Analyst - Data'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

USE ROLE securityadmin;
grant role warner_data_management to user NarenPatel;

--
--
--

-- 17/09/2024

USE ROLE useradmin;

--  
-- 
--

create user 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

USE ROLE securityadmin;
grant role warner_data_management to user ;


-- 17/09/2024

USE ROLE useradmin;

-- gyorgyracz 
-- gyorgy.racz@bourne-leisure.co.uk
-- Data Migration Project Manager

create USER GyorgyRacz 
login_name = 'gyorgy.racz@bourne-leisure.co.uk'
display_name = 'Gyorgy Racz'
email = 'gyorgy.racz@bourne-leisure.co.uk'
comment = 'Data Migration Project Manager'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

USE ROLE securityadmin;
grant role warner_data_management to user GyorgyRacz;





