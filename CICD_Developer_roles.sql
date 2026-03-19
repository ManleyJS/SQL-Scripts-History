-- set up pricing warehouse

USE ROLE sysadmin;

DROP warehouse haven_dbt_development_rms_pricing_warehouse_xsmall;

CREATE WAREHOUSE haven_dbt_development_rms_pricing_warehouse_medium WITH WAREHOUSE_SIZE = 'MEDIUM' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

ALTER WAREHOUSE HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL
SET MIN_CLUSTER_COUNT = 1,
MAX_CLUSTER_COUNT = 4,
SCALING_POLICY = 'STANDARD';

-- set up users

USE ROLE useradmin;

drop role _haven_dbt_development_pricing_warehouse_xsmall__operator;
DROP role _haven_dbt_development_pricing_warehouse_xsmall__usage;
drop role _haven_dbt_development_rmz_pricing_warehouse_xsmall__usage;
DROP role _haven_dbt_development_rms_pricing_warehouse_xsmall__operator;
DROP role _haven_dbt_development_rms_pricing_warehouse_xsmall__usage;

create role _haven_dbt_development_rms_pricing_warehouse_medium__operator;
create role _haven_dbt_development_rms_pricing_warehouse_medium__usage;


-- Roland Nagy
-- roland.nagy@haven.com
-- Senior Engineer

create user RolandNagy
login_name = 'roland.nagy@haven.com'
display_name = 'Roland Nagy'
email = 'roland.nagy@haven.com'
comment = 'Senior Engineer'
default_role = haven_dbt_development
DEFAULT_WAREHOUSE = HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;



-- Peter Zentai
-- peter.zentai@haven.com
-- Senior Engineer

create USER PeterZentai 
login_name = 'peter.zentai@haven.com'
display_name = 'Peter Zentai'
email = 'peter.zentai@haven.com'
comment = 'Senior Engineer'
default_role = haven_dbt_development
DEFAULT_WAREHOUSE = HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;
 
USE ROLE securityadmin;

grant usage, monitor on warehouse haven_dbt_development_rms_pricing_warehouse_medium to role _haven_dbt_development_rms_pricing_warehouse_medium__usage;
grant role _haven_dbt_development_rms_pricing_warehouse_medium__usage to role _haven_dbt_development_rms_pricing_warehouse_medium__operator;
grant operate, modify on warehouse haven_dbt_development_rms_pricing_warehouse_medium to role _haven_dbt_development_rms_pricing_warehouse_medium__operator;

GRANT ROLE _haven_dbt_development_rms_pricing_warehouse_medium__usage TO ROLE haven_dbt_development;

GRANT ROLE haven_dbt_development TO USER RolandNagy;
GRANT ROLE haven_dbt_development TO USER PeterZentai;

USE ROLE haven_dbt_development;

SHOW WAREHOUSES;

USE DATABASE haven_store_dev;

CREATE SCHEMA test;
DROP SCHEMA test;

SHOW GRANTS TO ROLE haven_dbt_development;

-- 18/02/2025

-- peterszecsi
-- peter.szecsi@haven.com
-- peter.szecsi@bourne-leisure.co.uk
-- Senior Engineer

USE ROLE useradmin;

SHOW USERS LIKE 'peterz%'; 

create USER peterszecsi  
login_name = 'peter.szecsi@bourne-leisure.co.uk'
display_name = 'Peter Szecsi'
email = 'peter.szecsi@bourne-leisure.co.uk'
comment = 'Senior Engineer'
default_role = haven_dbt_development
DEFAULT_WAREHOUSE = HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE haven_dbt_development TO USER peterszecsi;

-- 03/03/2025

-- Change science roles to be data engineering

USE ROLE securityadmin;

REVOKE ROLE haven_dbt_development from USER peterszecsi;
REVOKE ROLE haven_dbt_development from USER RolandNagy;
REVOKE ROLE haven_dbt_development from USER PeterZentai;

GRANT ROLE haven_data_engineering TO USER peterszecsi;
GRANT ROLE haven_data_engineering TO USER RolandNagy;
GRANT ROLE haven_data_engineering TO USER PeterZentai;

-- temporarily set role to pick up old notebooks

USE ROLE securityadmin; 

GRANT ROLE haven_dbt_development TO USER peterszecsi;
GRANT ROLE haven_dbt_development TO USER RolandNagy;
GRANT ROLE haven_dbt_development TO USER PeterZentai;

-- 14/03/2025

-- balintnemeth
-- balint.nemeth@haven.com
-- Data Engineer

USE ROLE useradmin;

create USER  balintnemeth
login_name = 'balint.nemeth@haven.com'
display_name = 'Balint Nemeth'
email = 'balint.nemeth@haven.com'
comment = 'Data Engineer'
default_role = haven_dbt_development
DEFAULT_WAREHOUSE = HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE haven_data_engineering TO USER balintnemeth;

-- 08/05/2025

-- Jade North
-- jade.north@haven.com
-- Junior Engineer


USE ROLE useradmin;

SHOW USERS ;

create USER JadeNorth 
login_name = 'jade.north@haven.com'
display_name = 'Jade North'
email = 'jade.north@haven.com'
comment = 'Junior Engineer'
default_role = haven_dbt_development
DEFAULT_WAREHOUSE = HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;


alter USER JadeNorth 
SET comment = 'Junior Engineer',
default_role = haven_dbt_development,
DEFAULT_WAREHOUSE = HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;



USE ROLE securityadmin;

GRANT ROLE haven_dbt_development TO USER JadeNorth;

-- extra commands
SHOW USERS LIKE 'jadenorth';
show grants TO USER jadenorth;

REVOKE ROLE haven_seaware_product FROM USER jadenorth;


-- 09/05/2025

-- AshwiniSharma
-- Ashwini.Sharma@haven.com
-- Senior Data Engineer

USE ROLE useradmin;


create USER AshwiniSharma 
login_name = 'Ashwini.Sharma@haven.com'
display_name = 'Ashwini Sharma'
email = 'Ashwini.Sharma@haven.com'
comment = 'Senior Data Engineer'
default_role = haven_dbt_development
DEFAULT_WAREHOUSE = HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE haven_dbt_development TO USER AshwiniSharma;
GRANT ROLE haven_data_engineering TO USER AshwiniSharma;



-- 09/06/2025

-- Mayur Vaghasia
-- Mayur.Vaghasia@haven.com
-- 

USE ROLE useradmin;


create USER  MayurVaghasia
login_name = 'Mayur.Vaghasia@haven.com'
display_name = 'Mayur Vaghasia'
email = 'Mayur.Vaghasia@haven.com'
comment = 'Senior Engineer'
default_role = haven_dbt_development
DEFAULT_WAREHOUSE = HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE haven_dbt_development TO USER MayurVaghasia;
GRANT ROLE haven_data_engineering TO USER MayurVaghasia;

-- 07/10/2025

use ROLE securityadmin;

SHOW roles LIKE '%MET%';

SHOW GRANTS TO ROLE _MET_OFFICE_POSTCODE_DATA__USAGE;

GRANT ROLE _MET_OFFICE_POSTCODE_DATA__USAGE TO ROLE haven_dbt_development;


-- New user

-- 
-- 
-- 

USE ROLE useradmin;


create USER  
login_name = ''
display_name = ''
email = ''
comment = 'Senior Engineer'
default_role = haven_dbt_development
DEFAULT_WAREHOUSE = HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;

USE ROLE securityadmin;

GRANT ROLE haven_dbt_development TO USER ;
GRANT ROLE haven_data_engineering TO USER 