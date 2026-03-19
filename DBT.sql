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

show grants on database haven_store_uat;