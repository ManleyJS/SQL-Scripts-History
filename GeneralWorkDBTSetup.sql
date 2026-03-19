USE ROLE accountadmin;

SHOW GRANTS TO USER haven_dbt_TRANSFORM;
SHOW GRANTS TO role haven_dbt_TRANSFORM;

use role sysadmin;
create database if not exists haven_store_uat clone haven_store;

create database if not exists haven_pipeline_uat clone haven_pipeline;

use role useradmin;

--create user havendbt_transform_uat

use role haven_commercial;

use role securityadmin;

use role haven_data_transform; 

use role securityadmin;

show roles like '_haven_store%';

show grants to role _haven_store__usage;


use role sysadmin;
use database haven_store_uat;

revoke usage on database haven_store_uat from database role align_alytics;

show grants on database haven_pipeline_uat;

USE ROLE useradmin;
CREATE ROLE _haven_store_uat__usage;
CREATE ROLE _haven_store_uat__schema;
CREATE ROLE _haven_pipeline_uat__usage;
CREATE ROLE _haven_pipeline_uat__schema;

USE ROLE securityadmin;
GRANT USAGE ON DATABASE haven_store_uat TO ROLE _haven_store_uat__usage;
GRANT USAGE ON DATABASE haven_pipeline_uat TO ROLE _haven_pipeline_uat__usage;

GRANT ROLE _haven_pipeline_uat__usage TO ROLE haven_data_transform;

USE ROLE haven_data_transform;

