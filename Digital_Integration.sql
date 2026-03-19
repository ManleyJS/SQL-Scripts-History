use role accountadmin;

show integrations;

create or replace storage integration aws_s3_digital_ownership_integration_dev
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::083208432960:role/dev-ownership-snowflake-rw'
  enabled = true
  storage_allowed_locations = ('s3://haven-dev-ownership-owners-lettings-prices/', 's3://haven-dev-ownership-owners-van-allocations/');

create or replace storage integration aws_s3_digital_ownership_integration_staging
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::083208432960:role/staging-ownership-snowflake-rw'
  enabled = true
  storage_allowed_locations = ('s3://haven-staging-ownership-owners-lettings-prices/', 's3://haven-staging-ownership-owners-van-allocations/');

create or replace storage integration aws_s3_digital_ownership_integration_prod
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::753707732315:role/prod-ownership-snowflake-rw'
  enabled = true
  storage_allowed_locations = ('s3://haven-prod-ownership-owners-lettings-prices/', 's3://haven-prod-ownership-owners-van-allocations/');
 
create or replace storage integration aws_s3_digital_experience_arrivals_integration_dev
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::083208432960:role/dev-experience-arrivals-sync-snowflake'
  enabled = true
  storage_allowed_locations = ('s3://haven-dev-experience-arrivals-sync/');

create or replace storage integration aws_s3_digital_experience_arrivals_integration_prod
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::753707732315:role/prod-experience-arrivals-sync-snowflake'
  enabled = true
  storage_allowed_locations = ('s3://haven-prod-experience-arrivals-sync/');

desc integration aws_s3_digital_ownership_integration_dev;
desc integration aws_s3_digital_ownership_integration_staging;
desc integration aws_s3_digital_ownership_integration_prod;
desc integration aws_s3_digital_experience_arrivals_integration_dev;
desc integration aws_s3_digital_experience_arrivals_integration_prod;

grant usage on integration aws_s3_digital_ownership_integration_dev to role dba;
grant usage on integration aws_s3_digital_ownership_integration_dev to role sysadmin;
grant usage on integration aws_s3_digital_ownership_integration_dev to role data_engineering;
 
grant usage on integration aws_s3_digital_ownership_integration_staging to role dba;
grant usage on integration aws_s3_digital_ownership_integration_staging to role sysadmin;
grant usage on integration aws_s3_digital_ownership_integration_staging to role data_engineering;

grant usage on integration aws_s3_digital_ownership_integration_prod to role dba;
grant usage on integration aws_s3_digital_ownership_integration_prod to role sysadmin;
grant usage on integration aws_s3_digital_ownership_integration_prod to role data_engineering;

grant usage on integration aws_s3_digital_ownership_integration_prod to role dba;
grant usage on integration aws_s3_digital_ownership_integration_prod to role sysadmin;
grant usage on integration aws_s3_digital_ownership_integration_prod to role data_engineering;


grant usage on integration aws_s3_digital_experience_arrivals_integration_dev to role dba;
grant usage on integration aws_s3_digital_experience_arrivals_integration_dev to role sysadmin;
grant usage on integration aws_s3_digital_experience_arrivals_integration_dev to role data_engineering;

grant usage on integration aws_s3_digital_experience_arrivals_integration_prod to role dba;
grant usage on integration aws_s3_digital_experience_arrivals_integration_prod to role sysadmin;
grant usage on integration aws_s3_digital_experience_arrivals_integration_prod to role data_engineering;

use role dba;

-- list @haven_store.digital.s3_digital_extract;

use schema training.citibike;

show stages;

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
 
create or replace stage training.citibike.digital_ownership_integration_prices_dev  
    url='s3://haven-dev-ownership-owners-lettings-prices/'
    storage_integration = aws_s3_digital_ownership_integration_dev
    ;
    
create or replace stage training.citibike.digital_ownership_integration_allocations_dev  
    url='s3://haven-dev-ownership-owners-van-allocations/'
    storage_integration = aws_s3_digital_ownership_integration_dev
    ;

create or replace stage training.citibike.digital_ownership_integration_prices_staging  
    url='s3://haven-staging-ownership-owners-lettings-prices/'
    storage_integration = aws_s3_digital_ownership_integration_staging
    ;
    
create or replace stage training.citibike.digital_ownership_integration_allocations_staging  
    url='s3://haven-staging-ownership-owners-van-allocations/'
    storage_integration = aws_s3_digital_ownership_integration_staging
    ;

create or replace stage training.citibike.digital_ownership_integration_prices_prod  
    url='s3://haven-prod-ownership-owners-lettings-prices/'
    storage_integration = aws_s3_digital_ownership_integration_prod
    ;
    
create or replace stage training.citibike.digital_ownership_integration_allocations_prod  
    url='s3://haven-prod-ownership-owners-van-allocations/'
    storage_integration = aws_s3_digital_ownership_integration_prod
    ;

create or replace stage training.citibike.digital_ownership_integration_allocations_prod  
    url='s3://haven-prod-ownership-owners-van-allocations/'
    storage_integration = aws_s3_digital_ownership_integration_prod
    ;
   
   
create or replace stage training.citibike.digital_ownership_integration_staging
    url='s3://staging-ownership-snowflake-rw/'
    storage_integration = aws_s3_digital_ownership_integration_staging
    ;

create or replace stage training.citibike.digital_experience_arrivals_integration_prod
    url='s3://haven-prod-experience-arrivals-sync/'
    storage_integration = aws_s3_digital_experience_arrivals_integration_prod
    ;

SHOW STAGES;   
   
list @training.citibike.digital_experience_arrivals_integration_dev;
copy into @training.citibike.digital_experience_arrivals_integration_dev/customers.json.gz
  from (SELECT OBJECT_CONSTRUCT(
  	'CustomerID', CUSTOMER_ID,
 	'FirstName', FIRST_NAME,
 	'LastName', LAST_NAME,
 	'FirstOrderData', FIRST_ORDER_DATE,
 	'MostRecentOrderDate', MOST_RECENT_ORDER_DATE,
 	'NumberOfOrders', NUMBER_OF_ORDERS)
 FROM TRAINING.TRAINING.CUSTOMERS)
   FILE_FORMAT = (TYPE = JSON)
   single = true
   max_file_size=24000000;
REMOVE @training.citibike.digital_experience_arrivals_integration_dev/customers.json.gz;


list @training.citibike.digital_experience_arrivals_integration_prod;
copy into @training.citibike.digital_experience_arrivals_integration_prod/customers.json.gz
  from (SELECT OBJECT_CONSTRUCT(
  	'CustomerID', CUSTOMER_ID,
 	'FirstName', FIRST_NAME,
 	'LastName', LAST_NAME,
 	'FirstOrderData', FIRST_ORDER_DATE,
 	'MostRecentOrderDate', MOST_RECENT_ORDER_DATE,
 	'NumberOfOrders', NUMBER_OF_ORDERS)
 FROM TRAINING.TRAINING.CUSTOMERS)
   FILE_FORMAT = (TYPE = JSON)
   single = true
   max_file_size=24000000;
REMOVE @training.citibike.digital_experience_arrivals_integration_prod/customers.json.gz;

  
list @training.citibike.digital_ownership_integration_prices_staging;
list @training.citibike.digital_ownership_integration_allocations_staging;

list @training.citibike.digital_ownership_integration_prices_prod;
list @training.citibike.digital_ownership_integration_allocations_prod;
--drop stage haven_store.digital.facebook_ads_integration;

USE ROLE DBA;

show stages;

copy into @haven_work.facebook.facebook_ads_integration
from haven_work.facebook.px0003_facebook_pricing
overwrite = true ;
 
list @haven_work.facebook.facebook_ads_integration;

list @training.citibike.integration_stage;

copy into @training.citibike.digital_ownership_integration_prices_dev/deleteme.json.gz
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

use role accountadmin;

--arn:aws:iam::756108221014:role/blg-havdevserv-facebook-ads-integration-role-snowflake
--facebook_ads_integration_s3_bucket

--create or replace storage integration aws_s3_engineering_integration
--  type = external_stage
--  storage_provider = s3
--  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/dfp.snowflake.integration.engineering.role'
--  enabled = true
--  storage_allowed_locations = ('s3://aws-blg-integration-raw-s3/');

create or replace storage integration aws_s3_engineering_google_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-google-ads-integration-role-snowflake'
  enabled = true
  storage_allowed_locations = ('s3://blg-havdevserv-google-ads-integration-exports/');

 
show integrations;

desc integration aws_s3_engineering_google_integration;
desc integration aws_blg_engineering_test_integration;
desc integration aws_s3_digital;
desc integration aws_test_integration;

show stages;


 
grant usage on integration aws_s3_engineering_google_integration to role dba;
grant usage on integration aws_s3_engineering_integration to role sysadmin;
grant usage on integration aws_s3_engineering_google_integration to role data_engineering;

USE ROLE data_engineering;

create or replace stage haven_work.facebook.facebook_ads_integration
    url='s3://blg-havdevserv-facebook-ads-integration-exports/'
    storage_integration = aws_s3_engineering_facebook_integration
    ;

use role haven_data_integration;

use role securityadmin;
grant role haven_commercial to role dba;

use role haven_commercial;


ALTER WAREHOUSE "BOURNE_ALATION_XSMALL" SET WAREHOUSE_SIZE = 'SMALL' AUTO_SUSPEND = 30 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'ECONOMY' COMMENT = '';


show roles;

show integrations;
desc integration aws_blg_engineering_test_integration;

show stages;

create or replace storage integration aws_s3_sns_test_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::080261560286:role/aws-blg-s3-sns-integration-test-rol'
  enabled = true
  storage_allowed_locations = ('s3://aws-blg-sns-test-cdc-poc/');

desc integration aws_s3_sns_test_integration;
 
grant usage on integration aws_s3_sns_test_integration to role dba;

use role dba;
use schema training.citibike;
show stages;

create stage training.citibike.aws_s3_sns_test_integration_stage
    url='s3://aws-blg-sns-test-cdc-poc/stg0001/'
    storage_integration = aws_s3_sns_test_integration
    ;

copy into @training.citibike.aws_s3_sns_test_integration_stage/newTestFile.json.gz
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
 'EXT_SELLING_ID', EXT_SELLING_ID) FROM HAVEN_STORE.DIGITAL.VRES_GRADE_PRICE LIMIT 100)
   FILE_FORMAT = (TYPE = JSON)
   single = true
   max_file_size=24000000;
