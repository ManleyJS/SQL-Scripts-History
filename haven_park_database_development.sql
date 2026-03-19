use ROLE sysadmin;

drop WAREHOUSE haven_park_database_development_warehouse_small;


CREATE WAREHOUSE haven_park_database_development_warehouse_xsmall WITH WAREHOUSE_SIZE = 'SMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

alter WAREHOUSE haven_park_database_development_warehouse_xsmall set WAREHOUSE_SIZE = 'XSMALL';

USE ROLE useradmin;

create role _haven_park_database_development_warehouse_xsmall__operator;
create role _haven_park_database_development_warehouse_xsmall__usage;

drop role _haven_park_database_development_warehouse_small__operator;
drop role _haven_park_database_development_warehouse_small__usage;

CREATE ROLE haven_park_database_development;

-- Frank Carver	
-- Frank.Carver@haven.com
-- Senior Engineer

create USER  FrankCarver
login_name = 'Frank.Carver@haven.com'
display_name = 'Frank Carver'
email = 'Frank.Carver@haven.com'
comment = 'Senior Engineer'
default_warehouse = haven_park_database_development_warehouse_small
default_role = haven_park_database_development
;


-- Peter Nemeth	
-- Peter.Nemeth@haven.com
-- Senior Software Engineer

create USER PeterNemeth 
login_name = 'Peter.Nemeth@haven.com'
display_name = 'Peter Nemeth'
email = 'Peter.Nemeth@haven.com'
comment = 'Senior Software Engineer'
default_warehouse = haven_park_database_development_warehouse_small
default_role = haven_park_database_development
;

alter USER PeterNemeth set
default_warehouse = haven_park_database_development_warehouse_xsmall;

use ROLE securityadmin;

grant usage, monitor on warehouse haven_park_database_development_warehouse_xsmall to role _haven_park_database_development_warehouse_xsmall__usage;
grant role _haven_park_database_development_warehouse_xsmall__usage to role _haven_park_database_development_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_park_database_development_warehouse_xsmall to role _haven_park_database_development_warehouse_xsmall__operator;

GRANT ROLE _haven_park_database_development_warehouse_xsmall__usage TO ROLE haven_park_database_development;

GRANT ROLE _haven_base__dig_activities__reader TO ROLE haven_park_database_development;
GRANT ROLE _haven_base__dig_capacity__reader TO ROLE haven_park_database_development;
GRANT ROLE _haven_base__dig_fb_entertainment__reader TO ROLE haven_park_database_development;
GRANT ROLE _haven_base__dig_pricing__reader TO ROLE haven_park_database_development;
GRANT ROLE _haven_base__dig_venue_disruption__reader TO ROLE haven_park_database_development;

GRANT ROLE haven_park_database_development TO USER FrankCarver;
GRANT ROLE haven_park_database_development TO USER PeterNemeth;
GRANT ROLE haven_park_database_development TO USER jonmoore;


GRANT ROLE haven_park_database_development TO USER donovanransome;
GRANT ROLE haven_park_database_development TO ROLE dba;

use ROLE haven_park_database_development;

show databases;
show warehouses;
show schemas;

-- DovydasSteponavicius
-- Dovydas.Steponavicius@haven.com
-- Senior Software Engineer  

use ROLE useradmin;

create USER  DovydasSteponavicius
login_name = 'Dovydas.Steponavicius@haven.com'
display_name = 'Dovydas Steponavicius'
email = 'Dovydas.Steponavicius@haven.com'
comment = 'Senior Software Engineer'
default_warehouse = haven_park_database_development_warehouse_small
default_role = haven_park_database_development
;

use ROLE securityadmin;

GRANT ROLE haven_park_database_development TO USER DovydasSteponavicius;

-- 21/08/2025
-- adding additional grants to PDB team

use ROLE useradmin;

CREATE ROLE _haven_park_database_development__haven_store__workforce__reader;
CREATE ROLE _haven_park_database_development__haven_store__common__reader;

use ROLE securityadmin;

GRANT ROLE _haven_store__common__usage TO ROLE _haven_park_database_development__haven_store__common__reader;
GRANT SELECT ON TABLE haven_store.common.dim_venue TO ROLE _haven_park_database_development__haven_store__common__reader;

revoke ROLE _haven_store__workforce__usage from ROLE _haven_park_database_development__haven_store__common__reader;
revoke SELECT ON TABLE haven_store.workforce.dim_venues from ROLE _haven_park_database_development__haven_store__common__reader;

GRANT ROLE _haven_store__workforce__usage TO ROLE _haven_park_database_development__haven_store__workforce__reader;
GRANT SELECT ON TABLE haven_store.workforce.dim_venues TO ROLE _haven_park_database_development__haven_store__workforce__reader;


GRANT ROLE _haven_park_database_development__haven_store__common__reader TO ROLE haven_park_database_development;
GRANT ROLE _haven_park_database_development__haven_store__workforce__reader TO ROLE haven_park_database_development;

use ROLE dba;

use SCHEMA haven_store.park_database;

CREATE VIEW haven_store.park_database.EPOS_PARK_VENUE_MAP AS SELECT * from  haven_data_engineering.data_science.EPOS_PARK_VENUE_MAP;
CREATE view haven_store.park_database.DIM_VENUES_SAM_ZONAL AS SELECT * from haven_data_engineering.data_science.DIM_VENUES_SAM_ZONAL;

GRANT ROLE _haven_store__park_database__reader TO ROLE haven_park_database_development;

-- Operational data from Worforce (SAM)
select * from haven_store.workforce.dim_venues -- 
;
-- Operational data from Zonal (ePos)
select * from haven_store.common.dim_venue  --
;
-- This is a mapping for data science. The intention is/was to group venues into reporting groups
select * from haven_data_engineering.data_science.EPOS_PARK_VENUE_MAP
;
-- This is a static dataset with mappings between EPOS and SAM 
select * from haven_data_engineering.data_science.DIM_VENUES_SAM_ZONAL

-- 27/08/2025

use ROLE securityadmin;
GRANT SELECT ON TABLE haven_store.workforce.dim_venues TO ROLE _haven_park_database_development__haven_store__workforce__reader;

-- 28/08/2025

use ROLE securityadmin;
GRANT SELECT ON TABLE haven_store.workforce.dim_venues TO ROLE _haven_park_database_development__haven_store__workforce__reader;

-- 04/09/2025

use ROLE useradmin;

create user haven_park_database_dev_service_account
LOGIN_NAME = 'haven.park.database.dev.service.account'
default_warehouse = haven_park_database_development_warehouse_xsmall
default_role = haven_park_database_development
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2jVqiQVueGWTgoi0oLiC
61CAX7lvsbwTRKAfI3rcxfBIWxngNKVrPMQG/uoDwrDXC2Mu47XOZ2EeDdePSYOX
aZHdwSGMMXvFRIswm2m1RwW1SbcP4NWEax1+j15i83Box/uDDdvBuAn9ktVLX1U0
CnffA0Pcw2X8P8Dy9Qe10dLvWGicRQpIOaD7W/GCVSzJmNTeJdyFBamzp1aJx/XX
vlA+EoLru1t7e9BXfEI7CfZDPCu2LKz6AH+HWJKHyIvAkpT9JMj4usC8cyXU01Tl
gPgIT49X8QcgPuruUEGRHkirvSPqWTKA4987r4b/Y5sTQkeB4KIC7KjZ++D+5m22
dwIDAQAB';

create user haven_park_database_service_account
LOGIN_NAME = 'haven.park.database.service.account'
default_warehouse = haven_park_database_development_warehouse_xsmall
default_role = haven_park_database_development
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA65g4D+aCHpkUo/nMENZy
JC6vChpylzd4tcO/6GsGD0K5NGpbCtNCs5eGuO+braA/gu1IW9X/Sm0MYeQlSp7V
W50zkBIWq08mGcN97tZM+d1TkGwCVh+9y5oUU0xcnZLC07zplzTTOxqbfJKaDkhk
VM6n6IsyvesISAt62maSKP5YrPEyELfgxMOnDiKbiBJIZDqZoGwKvPrh79To7uxk
FI/C7Vf27qVK7hyo71gi5aaMRNm28U+hCpcUR0oysqAFXHh/u5vh30KByUGOcE0D
LqBh685QX4dR5msr476M/eRQMq47XjLoRzgM5Vr3izW+/oDGj5eAxEIxlJapEkww
wQIDAQAB';

use ROLE securityadmin;

GRANT ROLE haven_park_database_development TO USER haven_park_database_dev_service_account;
GRANT ROLE haven_park_database_development TO USER haven_park_database_service_account;


-----
-----

create USER  
login_name = ''
display_name = ''
email = ''
comment = ''
default_warehouse = haven_park_database_development_warehouse_small
default_role = haven_park_database_development
;

GRANT ROLE haven_park_database_development TO USER ;

-- 
-- 
-- 
