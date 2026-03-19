use role sysadmin;

CREATE WAREHOUSE haven_zonal_discovery_warehouse_xs WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE sysadmin;
CREATE DATABASE haven_zonal_discovery;

USE ROLE useradmin;

CREATE ROLE _haven_zonal_discovery__usage;
CREATE ROLE _haven_zonal_discovery__schema;
create role _haven_zonal_discovery_warehouse_xs__warehouse__operator;
create role _haven_zonal_discovery_warehouse_xs__warehouse__usage;

CREATE ROLE haven_zonal_discovery;
CREATE ROLE haven_zonal_discovery_thomloveridge;
CREATE ROLE haven_zonal_discovery_gregpugh;

create user gregpugh
login_name = 'greg.pugh@bourne-leisure.co.uk'
display_name = 'Greg.Pugh'
email = 'greg.pugh@bourne-leisure.co.uk'
comment = 'Haven Digital Zonal Discovery'
default_role = haven_zonal_discovery_gregpugh;

create user thomloveridge
login_name = 'thom.loveridge@bourne-leisure.co.uk'
display_name = 'Thom Loveridge'
email = 'thom.loveridge@bourne-leisure.co.uk'
comment = 'Haven Digital Zonal Discovery'
default_role = haven_zonal_discovery_thomloveridge;


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_zonal_discovery_warehouse_xs to role _haven_zonal_discovery_warehouse_xs__warehouse__usage;
grant role _haven_zonal_discovery_warehouse_xs__warehouse__usage to role _haven_zonal_discovery_warehouse_xs__warehouse__operator;
grant operate, modify on warehouse haven_zonal_discovery_warehouse_xs to role _haven_zonal_discovery_warehouse_xs__warehouse__operator;
GRANT ROLE _haven_zonal_discovery_warehouse_xs__warehouse__usage TO ROLE haven_zonal_discovery;

GRANT USAGE ON DATABASE haven_zonal_discovery TO ROLE _haven_zonal_discovery__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_zonal_discovery TO ROLE _haven_zonal_discovery__usage;
GRANT SELECT ON future TABLES IN DATABASE haven_zonal_discovery TO ROLE _haven_zonal_discovery__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_zonal_discovery TO ROLE _haven_zonal_discovery__usage;
GRANT SELECT ON all VIEWS IN DATABASE haven_zonal_discovery TO ROLE _haven_zonal_discovery__usage;
GRANT ROLE _haven_zonal_discovery__usage TO ROLE _haven_zonal_discovery__schema;
GRANT CREATE SCHEMA ON DATABASE haven_zonal_discovery TO ROLE _haven_zonal_discovery__schema;

GRANT ROLE _haven_zonal_discovery__usage TO ROLE haven_zonal_discovery;
GRANT ROLE _bourne_base__aztec__reader TO ROLE haven_zonal_discovery;
GRANT ROLE _bourne_base__aztecactivitymanagement__reader TO ROLE haven_zonal_discovery;
GRANT ROLE _bourne_base__kmsreporting__reader TO ROLE haven_zonal_discovery;
GRANT ROLE _bourne_base__zbsdata__reader TO ROLE haven_zonal_discovery;

GRANT ROLE haven_zonal_discovery TO ROLE  haven_zonal_discovery_thomloveridge;
GRANT ROLE haven_zonal_discovery TO ROLE  haven_zonal_discovery_gregpugh;
GRANT ROLE _haven_zonal_discovery__schema  TO ROLE  haven_zonal_discovery_thomloveridge;
GRANT ROLE _haven_zonal_discovery__schema TO ROLE  haven_zonal_discovery_gregpugh;

USE ROLE useradmin;
create user haven_zonal_discovery_test
login_name = 'haven.zonal.discovery.test'
password = '<REDACTED>'
display_name = 'Zonal Discovery Test'
comment = 'Haven Digital Zonal Discovery'
default_role = haven_zonal_discovery_testuser
DEFAULT_WAREHOUSE = haven_zonal_discovery_warehouse_xs;

CREATE ROLE haven_zonal_discovery_testuser;

USE ROLE securityadmin;
GRANT ROLE haven_zonal_discovery TO ROLE  haven_zonal_discovery_testuser;
REVOKE ROLE _haven_identity__schema FROM ROLE haven_zonal_discovery_testuser;
GRANT ROLE _haven_zonal_discovery__schema  TO ROLE  haven_zonal_discovery_testuser;
GRANT ROLE haven_zonal_discovery_testuser TO USER haven_zonal_discovery_test;

GRANT ROLE haven_zonal_discovery_gregpugh TO USER gregpugh;

GRANT ROLE haven_zonal_discovery_thomloveridge TO USER thomloveridge;

revoke ROLE _bourne_base__aztec__reader from ROLE haven_zonal_discovery;
revoke ROLE _bourne_base__aztecactivitymanagement__reader from ROLE haven_zonal_discovery;
revoke ROLE _bourne_base__kmsreporting__reader from ROLE haven_zonal_discovery;
revoke ROLE _bourne_base__zbsdata__reader from ROLE haven_zonal_discovery;

GRANT ROLE _haven_store__zbsdata_complex__reader TO ROLE haven_zonal_discovery;
GRANT ROLE _haven_store__zbsdata_retail__reader TO ROLE haven_zonal_discovery;


USE ROLE useradmin;

CREATE ROLE haven_zonal_discovery_MuhammadTalha;

-- muhammad.talha@haven.com
-- Muhammad Talha

create user MuhammadTalha
login_name = 'muhammad.talha@haven.com'
display_name = 'Muhammad Talha'
email = 'muhammad.talha@haven.com'
comment = 'Lead Engineer'
default_warehouse = haven_zonal_discovery_warehouse_xs
default_role = haven_zonal_discovery_MuhammadTalha;


USE ROLE securityadmin;
GRANT ROLE haven_zonal_discovery TO ROLE  haven_zonal_discovery_MuhammadTalha;
GRANT ROLE _haven_zonal_discovery__schema  TO ROLE  haven_zonal_discovery_MuhammadTalha;

GRANT ROLE _haven_base__dig_fb_table_booking__reader TO ROLE haven_zonal_discovery;

GRANT ROLE haven_zonal_discovery_MuhammadTalha to USER MuhammadTalha;

USE ROLE haven_zonal_discovery_testuser;

USE ROLE securityadmin;

SHOW GRANTS TO USER thomloveridge;

SHOW GRANTS TO ROLE haven_zonal_discovery;


USE ROLE useradmin;

create user evabell
login_name = 'eva.bell@haven.com'
display_name = 'Eva Bell'
email = 'eva.bell@haven.com'
comment = 'Product Analyst'
default_warehouse = haven_commercial_xsmall 
default_role = haven_commercail;
ALTER USER evabell SET default_role = haven_commercial;

USE ROLE securityadmin;
GRANT ROLE haven_commercial TO USER evabell;

USE ROLE useradmin;
create user maxymaxwell
login_name = 'maxy.maxwell@haven.com'
display_name = 'Maxy Maxwell'
email = 'maxy.maxwell@haven.com'
comment = 'Senior Engineer'
default_warehouse = haven_zonal_discovery_warehouse_xs  
default_role = haven_zonal_discovery_maxymaxwell;

CREATE ROLE haven_zonal_discovery_maxymaxwell;

USE ROLE securityadmin;
GRANT ROLE haven_zonal_discovery TO ROLE  haven_zonal_discovery_maxymaxwell;
REVOKE ROLE _haven_identity__schema FROM ROLE haven_zonal_discovery_maxymaxwell;
GRANT ROLE haven_zonal_discovery_maxymaxwell TO USER maxymaxwell;

USE ROLE securityadmin;
GRANT ROLE haven_zonal_discovery TO ROLE dba;

REVOKE ROLE _haven_store__zbsdata_retail__reader FROM ROLE haven_zonal_discovery;
REVOKE ROLE _haven_store__zbsdata_complex__reader FROM ROLE haven_zonal_discovery;

USE ROLE dba;
USE ROLE haven_zonal_discovery;

