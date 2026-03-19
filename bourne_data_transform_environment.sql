use role sysadmin;

create database if not exists bourne_store_uat clone bourne_store;

create database bourne_data_transform;

use role useradmin;

create role _bourne_data_transform__usage;
create role _bourne_data_transform__schema;

use role securityadmin;

GRANT USAGE ON DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT ROLE _bourne_data_transform__usage TO ROLE _bourne_data_transform__schema;
GRANT CREATE SCHEMA ON DATABASE bourne_data_transform TO ROLE _bourne_data_transform__schema;
GRANT SELECT ON future TABLES IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT SELECT ON future VIEWS IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT SELECT ON all VIEWS IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT USAGE ON future STAGES IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;
GRANT USAGE ON ALL FILE FORMATS IN DATABASE bourne_data_transform TO ROLE _bourne_data_transform__usage;


USE ROLE useradmin;



