USE ROLE useradmin;

-- 
-- Alfonso.Delgado@warnerhotels.com
--

create user AlfonsoDelgado
login_name = 'Alfonso.Delgado@warnerhotels.com'
display_name = 'Alfonso Delgado'
email = 'Alfonso.Delgado@warnerhotels.com'
comment = 'Temporary Commercial Contractor'
default_role = warner_bi_team
default_warehouse = WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE warner_bi_team TO USER AlfonsoDelgado;

-- 26/02/2025

-- Robert Cross
-- robert.cross@warnerhotels.com
-- Data Analyst

USE ROLE useradmin;

create user RobertCross
login_name = 'robert.cross@warnerhotels.com'
display_name = 'Robert Cross'
email = 'robert.cross@warnerhotels.com'
comment = 'Data Analyst'
default_role = warner_bi_team
default_warehouse = WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE warner_bi_team TO USER RobertCross;


-- Anuj Dattani 
-- anuj.dattani@warnerhotels.com
-- Data Analyst

USE ROLE useradmin;

create user AnujDattani
login_name = 'anuj.dattani@warnerhotels.com'
display_name = 'Anuj Dattani'
email = 'anuj.dattani@warnerhotels.com'
comment = 'Data Analyst'
default_role = warner_bi_team
default_warehouse = WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE warner_bi_team TO USER AnujDattani;

-- 28/02/2025

-- Sam Allward
-- Sam.Allward@bourne-leisure.co.uk
-- Designer

USE ROLE useradmin;

create user SamAllward
login_name = 'Sam.Allward@bourne-leisure.co.uk'
display_name = 'Sam Allward'
email = 'Sam.Allward@bourne-leisure.co.uk'
comment = 'Designer'
default_role = warner_bi_team
default_warehouse = WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE warner_bi_team TO USER SamAllward;

-- Kate Williams
-- kate.williams@bourne-leisure.co.uk
-- Designer


USE ROLE useradmin;

create USER KateWilliams 
login_name = 'kate.williams@bourne-leisure.co.uk'
display_name = 'Kate Williams'
email = 'kate.williams@bourne-leisure.co.uk'
comment = 'Designer'
default_role = warner_bi_team
default_warehouse = WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE warner_bi_team TO USER KateWilliams;

SHOW GRANTS TO ROLE warner_bi_team;

-- 05/03/2025

USE ROLE useradmin;

alter USER KateWilliams 
SET login_name = 'kate.williams@warnerhotels.com',
email = 'kate.williams@warnerhotels.com'

alter user SamAllward
SET login_name = 'Sam.Allward@warnerhotels.com'
email = 'Sam.Allward@warnerhotels.com'

--------

-- 
-- 
--

USE ROLE useradmin;

create user 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = warner_bi_team
default_warehouse = WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE warner_bi_team TO USER ;

