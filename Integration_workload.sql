use role accountadmin;
--arn:aws:iam::623436517610:role/shared-holidaysales-search-input-bucket-rw
--arn:aws:iam::328265102953:role/df-activities-snowflake-rol
--BD78472_SFCRole=2_9Umtq0Sj+oUkKPOUAb/N5yYgrEk=

SHOW integrations;

create or replace storage integration aws_s3_digital_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/df-activities-snowflake-rol'
  enabled = true
  storage_allowed_locations = ('s3://aws-blg-digital-raw-s3/');
 
-- DEV Bucket:
-- Region: eu-west-1
-- Bucket: arn:aws:s3:::blg-havdevserv-bloomreach-exports-s3
--  Role: arn:aws:iam::756108221014:role/blg-havdevserv-crm-exports-snowflake-role

create storage integration aws_blg_havdevserv_bloomreach_exports_s3
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-crm-exports-snowflake-role'
  enabled = true
  storage_allowed_locations = ('s3://blg-havdevserv-bloomreach-exports-s3/');
 
desc integration aws_blg_havdevserv_bloomreach_exports_s3;

use role securityadmin;
grant usage on integration aws_blg_havdevserv_bloomreach_exports_s3 to role dba;
grant usage on integration aws_blg_havdevserv_bloomreach_exports_s3 to role haven_batch_dataload;

USE ROLE haven_batch_dataload;

USE DATABASE haven_raw;
USE SCHEMA bloomreach;

create or replace stage haven_raw.BLOOMREACH.aws_blg_havdevserv_bloomreach_exports_s3_stage
    url='s3://blg-havdevserv-bloomreach-exports-s3/'
    storage_integration = aws_blg_havdevserv_bloomreach_exports_s3
    ;
 

 --PROD Bucket:
--Region: eu-west-1
--Bucket: arn:aws:s3:::blg-havprodserv-bloomreach-exports-s3
--Role: arn:aws:iam::445123880475:role/blg-havprodserv-crm-exports-snowflake-role

USE ROLE accountadmin;
create storage integration aws_blg_havprodserv_bloomreach_exports_s3
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::445123880475:role/blg-havprodserv-crm-exports-snowflake-role'
  enabled = true
  storage_allowed_locations = ('s3://blg-havprodserv-bloomreach-exports-s3/');

 DESC integration aws_blg_havprodserv_bloomreach_exports_s3;
 
use role securityadmin;
grant usage on integration aws_blg_havprodserv_bloomreach_exports_s3 to role dba;
grant usage on integration aws_blg_havprodserv_bloomreach_exports_s3 to role haven_batch_dataload;


USE ROLE haven_batch_dataload;

USE DATABASE haven_raw;
USE SCHEMA bloomreach;

SHOW STAGES;

create or replace stage haven_raw.BLOOMREACH.aws_blg_havprodserv_bloomreach_exports_s3_stage
    url='s3://blg-havprodserv-bloomreach-exports-s3/'
    storage_integration = aws_blg_havprodserv_bloomreach_exports_s3
    ;

ls @haven_raw.BLOOMREACH.aws_blg_havprodserv_bloomreach_exports_s3_stage/;
ls @haven_raw.BLOOMREACH.aws_blg_havdevserv_bloomreach_exports_s3_stage/;

drop stage haven_work.public.test_activities_stage;

use role dba;
 
create or replace stage haven_work.public.test_activities_stage
    url='s3://aws-blg-digital-raw-s3/activities/'
    storage_integration = aws_s3_digital_integration
    ;
 
list @test_activities_stage;

USE ROLE DBA;

show stages;

list @haven_store.digital.s3_digital_extract;

use schema training.citibike;

create or replace file format training.citibike.integration_format
  type = csv
  compression = gzip
  field_delimiter = ','
  FIELD_OPTIONALLY_ENCLOSED_BY='"'
  EMPTY_FIELD_AS_NULL=TRUE
  NULL_IF=() 
  TIMESTAMP_FORMAT="DD/MM/YYYY HH24:MI:SS"
  ESCAPE_UNENCLOSED_FIELD=NONE
  ENCODING='UTF-8'
  ESCAPE=NONE;
 
 
 create or replace stage training.citibike.integration_stage 
    url='s3://aws-blg-integration-raw-s3/'
    storage_integration = aws_s3_engineering_integration
    ;
    
 USE ROLE DBA;

show stages;

list @training.citibike.integration_stage;

  copy into @training.citibike.integration_stage/deleteme.json.gz
  from (SELECT OBJECT_CONSTRUCT('PACKAGE_ID', PACKAGE_ID,
 'GRADE', GRADE,
 'CABINS', CABINS,
 'ASSIGNED_ABS', ASSIGNED_ABS,
 'ASSIGNED_WGT', ASSIGNED_WGT,
 'GTY_WGT', GTY_WGT,
 'GTY_ABS', GTY_ABS,
 'WTL_ABS', WTL_ABS,
 'WTL_WGT', WTL_WGT,
 'AVAIL_PHYS', AVAIL_PHYS,
 'AVAIL_ABS', AVAIL_ABS,
 'AVAIL_WGT', AVAIL_WGT,
 'RESERVE_TOTAL', RESERVE_TOTAL,
 'RESULT', "RESULT",
 'CABIN_CAPACITY', CABIN_CAPACITY,
 'RESERVE_USED', RESERVE_USED,
 'RESERVE_AVAIL', RESERVE_AVAIL,
 'AMOUNT_TOTAL', AMOUNT_TOTAL,
 'AMOUNT_DISCOUNT', AMOUNT_DISCOUNT,
 'AMOUNT_1', AMOUNT_1,
 'AMOUNT_2', AMOUNT_2,
 'AMOUNT_3', AMOUNT_3,
 'AMOUNT_4', AMOUNT_4,
 'AMOUNT_5', AMOUNT_5,
 'AMOUNT_6', AMOUNT_6,
 'AMOUNT_7', AMOUNT_7,
 'AMOUNT_8', AMOUNT_8,
 'AMOUNT_9', AMOUNT_9,
 'AMOUNT_10', AMOUNT_10,
 'CABIN_CATEGORY_RANK', CABIN_CATEGORY_RANK,
 'CABIN_CATEGORY_DESC', CABIN_CATEGORY_DESC,
 'ROLLAWAY', ROLLAWAY,
 'REAL_CABIN_RESULT', REAL_CABIN_RESULT,
 'SHIP_CODE', SHIP_CODE,
 'EFF_DATE', EFF_DATE,
 'DATE_CREATED', DATE_CREATED,
 'ERROR_MESSAGE', ERROR_MESSAGE,
 'ARRIVALDATE', ARRIVALDATE,
 'LENGTH', "LENGTH",
 'PACKAGETYPE', PACKAGETYPE,
 'PROMOTION', PROMOTION,
 'EXT_PACKAGE_ID', EXT_PACKAGE_ID,
 'EXT_SELLING_ID', EXT_SELLING_ID) FROM HAVEN_STORE.DIGITAL.VRES_GRADE_PRICE)
   FILE_FORMAT = (TYPE = JSON)
   single = true
   max_file_size=24000000;

show stages;

use role accountadmin;
--arn:aws:iam::623436517610:role/shared-holidaysales-search-input-bucket-rw


-- bucket ARN: arn:aws:s3:::blg-havprodserv-google-ads-integration-exports
-- role ARN: arn:aws:iam::445123880475:role/blg-havprodserv-google-ads-integration-role-snowflake

create or replace storage integration aws_s3_engineering_integration_dev
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-exports-role-snowflake'
  enabled = true
  storage_allowed_locations = ('s3://blg-havdevserv-snowflake-exports-s3/');

create or replace storage integration aws_s3_engineering_integration_prod
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::445123880475:role/blg-havprodserv-snowflake-exports-role-snowflake'
  enabled = true
  storage_allowed_locations = ('s3://blg-havprodserv-snowflake-exports-s3/');

 
desc integration aws_s3_engineering_integration_prod;
 
grant usage on integration aws_s3_engineering_integration_dev to role dba;
 
grant usage on integration aws_s3_engineering_integration_prod to role dba;
 
USE ROLE DBA;

show stages;

use database haven_store;
use schema integration;

create or replace stage haven_store.integration.PX0003_FACEBOOK__DEV__AWS_S3
    url='s3://blg-havdevserv-snowflake-exports-s3/facebook-ads-integration'
    storage_integration = aws_s3_engineering_integration_dev
    ;

create or replace stage haven_store.integration.PX0003_FACEBOOK__PROD__AWS_S3
    url='s3://blg-havprodserv-snowflake-exports-s3/facebook-ads-integration'
    storage_integration = aws_s3_engineering_integration_prod
    ;

use role useradmin;

create role _haven_store__integration__PX0003_FACEBOOK__DEV__AWS_S3;
create role _haven_store__integration__PX0003_FACEBOOK__PROD__AWS_S3;

use role securityadmin;

grant usage on stage haven_store.integration.PX0003_FACEBOOK__DEV__AWS_S3 to role _haven_store__integration__PX0003_FACEBOOK__DEV__AWS_S3;
grant usage on stage haven_store.integration.PX0003_FACEBOOK__PROD__AWS_S3 to role _haven_store__integration__PX0003_FACEBOOK__PROD__AWS_S3;

grant role _haven_store__integration__PX0003_FACEBOOK__DEV__AWS_S3 to role haven_data_integration;
grant role _haven_store__integration__PX0003_FACEBOOK__PROD__AWS_S3 to role haven_data_integration;

use role haven_data_integration;
use database haven_store;
use schema integration;


 copy into @haven_store.integration.PX0003_FACEBOOK__PROD__AWS_S3/deleteme.csv from information_schema.databases;
  
 use role dba;
 
 use role accountadmin;
 show integrations;
 --arn:aws:iam::270302263326:user/m5a8-s-iest2078
 --arn:aws:iam::270302263326:user/m5a8-s-iest2078
 describe integration aws_s3_engineering_facebook_integration;

select SYSTEM$WHITELIST();

create or replace storage integration aws_s3_skuuudle_client
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::151451382902:role/2220504_user_role_access'
  enabled = true
  storage_allowed_locations = ('s3://skuuudle-client-2220504/');

show integrations;

desc integration aws_s3_skuuudle_client;

use role securityadmin;
grant usage on integration aws_s3_skuuudle_client to role dba;
grant usage on integration aws_s3_skuuudle_client to role haven_batch_dataload;

use role dba;
 
create or replace stage training.training.test_skuuudle_client
    url='s3://skuuudle-client-2220504/'
    storage_integration = aws_s3_skuuudle_client
    ;

use role dba;
list @training.training.test_skuuudle_client;

create or replace FILE FORMAT training.training.myformat TYPE = 'csv' FIELD_DELIMITER = ',' 
FIELD_OPTIONALLY_ENCLOSED_BY = '"' compression = GZIP skip_header = 1;

select t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10,
t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20,
t.$21, t.$22, t.$23
from @training.training.test_skuuudle_client/HavenAssortmentData2023-03-24.csv.gz 
(file_format => 'training.training.myformat') t
limit 500;


select COUNT(*) from
@training.training.test_skuuudle_client/HavenAssortmentData2023-03-31.csv.gz
(file_format => 'training.training.myformat') t;

select distinct t.$17 from
@training.training.test_skuuudle_client/HavenAssortmentData2023-03-31.csv.gz 
(file_format => 'training.training.myformat') t
;

show grants to role haven_batch_dataload;

use database haven_store;
use schema competitor;

create or replace table skuuudle_competitor_evaluation
(
Site	varchar(),
Check_In_Date varchar(),	
Nights	integer,
Product_ID	varchar(),
Property_Name	varchar(),
Property_Type	varchar(),
Booking_Type	varchar(),
Available	boolean,
Rate	float,
Promo_Price float	,
Promo_Text	varchar(),
Product_URL	varchar(),
Park	varchar(),
Location	varchar(),
Heating	varchar(),
Beds	integer,
Sleeps	integer,
Pets_Allowed	boolean,
Remaining_Inventory	 integer,
Details	varchar(),
Haven_Park_Name	varchar(),
Haven_Post_Code	varchar(),
Extracted_Date varchar());

copy into haven_store.competitor.skuuudle_competitor_evaluation
from @training.training.test_skuuudle_client/HavenAssortmentData2023-03-31.csv.gz
file_format = (format_name = 'training.training.myformat');

use role dba;
select get_ddl('table', 'skuuudle_competitor_evaluation');

use role accountadmin;
select * from snowflake.account_usage.tags;
select get_ddl('tag', 'haven_work.public.gdr_test');


show roles like 'haven_identity%';

use role securityadmin;
grant role haven_identity_management to role dba;

use role dba;

use role haven_identity_management;

show grants to role haven_identity_management_testuser;

use role accountadmin;

use role securityadmin;
grant role _haven_raw__dig_arrivals_transportation__creator to role haven_cdc_dataload;

use database haven_store;
use schema competitor;

select * from skuuudle_competitor_evaluation limit 1000;

select distinct type from competitor_sync;
select distinct booking_type from skuuudle_competitor_evaluation;

select * from haven_base.seaware.bll_inv_availability limit 1000;
select * from haven_store.availability.inventory_availability_history order by snapshot_timestamp desc limit 1000;

show parameters;

use role useradmin;
alter user COMMERCIALTEST set week_start = 1;

select * from "HAVEN_BASE"."DIG_ACTIVITIES"."TIMESLOTS" where zamactivityid = 388 order by zamstarts desc;

select * from "HAVEN_RAW"."DIG_ARRIVALS"."ARRIVAL" where hvr_IS_DELETED = FALSE;

use role securityadmin;

grant role _haven_raw__amplitude__reader to role haven_data_integrate;
grant role _haven_base__amplitude__reader to role haven_data_transform;

use role dba;
--"HAVEN_RAW"."AMPLITUDE"."EVENTS_100000957_ORIGINAL"

select get_ddl('table', 'HAVEN_RAW.AMPLITUDE.EVENTS_100000957_ORIGINAL');

use role bourne_accountadmin;

show users like 'SO%';

show grants to user sophiehoye;
use role haven_strategic_projects;

use role dba;

use role securityadmin;
grant role haven_data_explorer to role dba;

use role haven_data_explorer;


show streams;