USE ROLE sysadmin;

CREATE WAREHOUSE haven_dream_migration_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_dream_migration_warehouse_xsmall__warehouse__operator;
create role _haven_dream_migration_warehouse_xsmall__warehouse__usage;

use role sysadmin;
grant usage, monitor on warehouse haven_dream_migration_warehouse_xsmall to role _haven_dream_migration_warehouse_xsmall__warehouse__usage;
grant operate, modify on warehouse haven_dream_migration_warehouse_xsmall to role _haven_dream_migration_warehouse_xsmall__warehouse__operator;

use role useradmin;
create role haven_dream_migration;

--Holland, Mark�Mark.Holland@bourne-leisure.co.uk
--Morris, Jayne�Jayne.Morris@bourne-leisure.co.uk
--Baycroft, Claire�Claire.Baycroft@bourne-leisure.co.uk


--  Mark.Holland@bourne-leisure.co.uk
create user MarkHolland
login_name = 'Mark.Holland@bourne-leisure.co.uk'
display_name = 'Mark Holland'
email = 'Mark.Holland@bourne-leisure.co.uk'
comment = 'Systems Finance Lead'
default_role = haven_dream_migration
default_warehouse = haven_dream_migration_warehouse_xsmall;

-- Jayne.Morris@bourne-leisure.co.uk
create user JayneMorris
login_name = 'Jayne.Morris@bourne-leisure.co.uk'
display_name = 'JayneMorris'
email = 'Jayne.Morris@bourne-leisure.co.uk'
comment = 'Systems Finance Manager'
default_role = haven_dream_migration
default_warehouse = haven_dream_migration_warehouse_xsmall;

-- Claire.Baycroft@bourne-leisure.co.uk
create user ClaireBaycroft
login_name = 'Claire.Baycroft@bourne-leisure.co.uk'
display_name = 'Claire Baycroft'
email = 'Claire.Baycroft@bourne-leisure.co.uk'
comment = 'Systems Finance Manager'
default_role = haven_dream_migration
default_warehouse = haven_dream_migration_warehouse_xsmall;

use role securityadmin;

grant role _haven_dream_migration_warehouse_xsmall__warehouse__usage to role _haven_dream_migration_warehouse_xsmall__warehouse__operator;
grant role _haven_store__financial_cube__reader to role haven_dream_migration;
GRANT ROLE _haven_base__seaware__reader TO  role haven_dream_migration;
GRANT ROLE _haven_base__plot__reader TO  role haven_dream_migration;
GRANT ROLE _haven_base__aztecactivitymanagement_complex__reader TO  role haven_dream_migration;
GRANT ROLE _haven_base__aztec_complex__reader TO  role haven_dream_migration;
GRANT ROLE _haven_base__aztec_retail__reader TO  role haven_dream_migration;
--GRANT ROLE _haven_base__zonal__reader TO  role haven_dream_migration;
grant role _haven_dream_migration_warehouse_xsmall__warehouse__operator to role haven_dream_migration;

GRANT ROLE haven_dream_migration TO ROLE dba;

GRANT ROLE haven_dream_migration TO USER MarkHolland;
GRANT ROLE haven_dream_migration TO USER JayneMorris;
GRANT ROLE haven_dream_migration TO USER ClaireBaycroft;

-- 15/10/2024

USE ROLE useradmin;

-- lisaarmitage
-- lisa.armitage@bourne-leisure.co.uk
-- Migration consultant

create user lisaarmitage
login_name = 'lisa.armitage@bourne-leisure.co.uk'
display_name = 'Lisa Armitage'
email = 'lisa.armitage@bourne-leisure.co.uk'
comment = 'Migration consultant'
default_role = haven_dream_migration
default_warehouse = haven_dream_migration_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_dream_migration TO USER LisaArmitage;

GRANT ROLE _haven_base__erpx__reader TO ROLE haven_dream_migration; 

SHOW GRANTS of ROLE haven_dream_migration;

-- 17/10/2024

USE ROLE useradmin;

-- Emese Bedocs   
-- emese.bedocs@bourne-leisure.co.uk
-- Bourne Support

create USER EmeseBedocs 
login_name = 'emese.bedocs@bourne-leisure.co.uk'
display_name = 'Emese Bedocs'
email = 'emese.bedocs@bourne-leisure.co.uk'
comment = 'Bourne Support'
default_role = haven_dream_migration
default_warehouse = haven_dream_migration_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_dream_migration TO USER EmeseBedocs;

USE ROLE useradmin;

-- Paul Hoskins
-- paul.hoskins@bourne-leisure.co.uk
-- Bourne Support

create USER PaulHoskins 
login_name = 'paul.hoskins@bourne-leisure.co.uk'
display_name = 'Paul Hoskins'
email = 'paul.hoskins@bourne-leisure.co.uk'
comment = 'Bourne Support'
default_role = haven_dream_migration
default_warehouse = haven_dream_migration_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_dream_migration TO USER PaulHoskins;

SHOW GRANTS OF ROLE haven_dream_migration;


----------------------------

USE ROLE useradmin;

-- 
-- 
-- 

create user 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = haven_dream_migration
default_warehouse = haven_dream_migration_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_dream_migration TO USER ;
