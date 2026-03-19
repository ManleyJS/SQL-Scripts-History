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

use database haven_store;
use schema competitor;

select * from skuuudle_competitor_evaluation limit 1000;

select distinct type from competitor_sync;
select distinct booking_type from skuuudle_competitor_evaluation;

select * from haven_base.seaware.bll_inv_availability limit 1000;
select * from haven_store.availability.inventory_availability_history order by snapshot_timestamp desc limit 1000;

use role dba;

use database haven_raw;
use schema competitor;

show stages;

SHOW FILE FORMATS;

create or replace FILE FORMAT haven_raw.competitor.myformat TYPE = 'csv' FIELD_DELIMITER = ',' 
FIELD_OPTIONALLY_ENCLOSED_BY = '"' ;


ls @skuuudle_stage/Myholidaycaravan;

select t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9
--,t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20,
--t.$21, t.$22, t.$23
from @skuuudle_stage/Myholidaycaravan/myholidaycaravan_report_2023-05-26.csv 
(file_format => 'haven_raw.competitor.myformat') t

limit 500;

CREATE OR REPLACE TABLE haven_store.competitor.my_holiday_caravan (
Van_model	varchar(150),
Company_name varchar(50), 	
Location_name	varchar(100),
Region	varchar(100),
number_of_Bedrooms varchar(20),	
Model_type	varchar(30),
Price_amount varchar(20),
Van_Dimensions	varchar(20),
van_URL varchar(150));

create or replace FILE FORMAT haven_raw.competitor.myformat TYPE = 'csv' FIELD_DELIMITER = ',' 
FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER=1;

COPY INTO haven_store.competitor.my_holiday_caravan
from @skuuudle_stage/Myholidaycaravan/myholidaycaravan_report_2023-05-26.csv 
file_format = (format_name = 'haven_raw.competitor.myformat');

SELECT * FROM haven_store.competitor.my_holiday_caravan;

select 
--max(LENGTH(t.$1))
--max(LENGTH(t.$2))
--max(LENGTH(t.$3))
--max(LENGTH(t.$4))
--max(LENGTH(t.$5))
--max(LENGTH(t.$6))
--max(LENGTH(t.$7))
--max(LENGTH(t.$8))
max(LENGTH(t.$9))
from @skuuudle_stage/Myholidaycaravan/myholidaycaravan_report_2023-05-26.csv 
(file_format => 'haven_raw.competitor.myformat') T;

--{"TYPE":"CSV","RECORD_DELIMITER":"\n","FIELD_DELIMITER":",","FILE_EXTENSION":null,"SKIP_HEADER":1,"DATE_FORMAT":"AUTO","TIME_FORMAT":"AUTO","TIMESTAMP_FORMAT":"AUTO","BINARY_FORMAT":"HEX","ESCAPE":"NONE","ESCAPE_UNENCLOSED_FIELD":"\\","TRIM_SPACE":false,"FIELD_OPTIONALLY_ENCLOSED_BY":"\"","NULL_IF":["\\N"],"COMPRESSION":"gzip","ERROR_ON_COLUMN_COUNT_MISMATCH":true,"VALIDATE_UTF8":true,"SKIP_BLANK_LINES":false,"REPLACE_INVALID_CHARACTERS":false,"EMPTY_FIELD_AS_NULL":true,"SKIP_BYTE_ORDER_MARK":true,"ENCODING":"UTF8"}
