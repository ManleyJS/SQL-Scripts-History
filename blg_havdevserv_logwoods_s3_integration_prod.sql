use role accountadmin;

create storage integration blg_havdevserv_logwoods_s3_integration_prod
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/blg-dfs-havprodsrv-logwoods-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=j4R1VtyRgxZUCxOqMYVHbA5l76sPJY'
  storage_allowed_locations = ('s3://blg-dfs-havprodsrv-logwoods-s3/');
 
DESC integration blg_havdevserv_logwoods_s3_integration_prod;

use role securityadmin;

grant usage on integration blg_havdevserv_logwoods_s3_integration_prod to role dba;
grant usage on integration blg_havdevserv_logwoods_s3_integration_prod to role haven_batch_dataload;
GRANT ROLE _haven_raw__wetherspoons__creator TO ROLE haven_batch_dataload;

use role dba;

USE ROLE haven_batch_dataload;
USE SCHEMA haven_raw.wetherspoons;

CREATE OR REPLACE FILE FORMAT haven_raw.wetherspoons.wetherspoons_integration_file_format
TYPE = CSV
FIELD_DELIMITER = '|'
COMPRESSION = GZIP
RECORD_DELIMITER = '\n'
ESCAPE = '\\'
ESCAPE_UNENCLOSED_FIELD = NONE
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
REPLACE_INVALID_CHARACTERS = TRUE
SKIP_HEADER = 1
DATE_FORMAT = 'DDMMYYYY'
TIME_FORMAT = 'HH24:MI'
;


SELECT CURRENT_TIME();

CREATE OR REPLACE STAGE haven_raw.wetherspoons.wetherspoons_integration_stage
FILE_FORMAT = haven_raw.wetherspoons.wetherspoons_integration_file_format
storage_integration = blg_havdevserv_logwoods_s3_integration_prod
URL = 's3://blg-dfs-havprodsrv-logwoods-s3/';

LS @haven_raw.wetherspoons.wetherspoons_integration_stage;

CREATE OR REPLACE TABLE haven_raw.wetherspoons.drink_orders (
Site_Id int,
Order_Date date,
ORDER_Time time,
Aztec_Check_No bigint,
Item_Name varchar(),
Bumped_time_seconds int,
Expo_time_seconds int
);

CREATE OR REPLACE TABLE haven_raw.wetherspoons.food_orders (
Site_Id int,
Order_Date date,
ORDER_Time time,
Aztec_Check_No bigint,
Item_Name varchar(),
Bumped_time_seconds int,
Expo_time_seconds int
)
;

USE WAREHOUSE bourne_batch_dataload_xsmall;

TRUNCATE TABLE haven_raw.wetherspoons.drink_orders;

COPY INTO haven_raw.wetherspoons.drink_orders
FROM @haven_raw.wetherspoons.wetherspoons_integration_stage/Drink_Orders_20240602.gz;

SELECT * FROM haven_raw.wetherspoons.DRINK_ORDERS LIMIT 10;

SELECT order_date, to_timestamp_ltz(order_time, 'hh24:mi'), time(order_time),
FROM drink_orders
ORDER BY order_time;

COPY INTO haven_raw.wetherspoons.food_orders
FROM @haven_raw.wetherspoons.wetherspoons_integration_stage/Food_Orders_20240602.gz;

SELECT * FROM food_orders;

SHOW PARAMETERS LIKE '%time%';

SELECT CURRENT_TIMESTAMP() ;
SELECT CURRENT_TIME();

USE ROLE haven_batch_dataload;
USE WAREHOUSE bourne_batch_dataload_xsmall;
USE SCHEMA haven_raw.wethersppons;
SELECT order_date, order_time, concat(order_date, ' ', order_time)::TIMESTAMP_NTZ 
FROM haven_raw.wetherspoons.drink_orders;

SELECT order_date, order_time FROM haven_raw.wetherspoons.drink_orders;

SELECT order_date, order_time::time, concat(order_date, ' ', order_time::time)::TIMESTAMP_NTZ 
FROM haven_raw.wetherspoons.drink_orders;

USE ROLE dba;
USE WAREHOUSE dba_wh;

USE SCHEMA haven_base.wetherspoons;

CREATE VIEW HAVEN_BASE.WETHERSPOONS.DRINK_ORDERS
( SITE_ID, ORDER_DATE, ORDER_TIME, AZTEC_CHECK_NO, ITEM_NAME, BUMPED_TIME_SECONDS, EXPO_TIME_SECONDS )
AS SELECT SITE_ID, ORDER_DATE, ORDER_TIME, AZTEC_CHECK_NO, ITEM_NAME, BUMPED_TIME_SECONDS, EXPO_TIME_SECONDS
FROM HAVEN_RAW.WETHERSPOONS.DRINK_ORDERS;

CREATE VIEW HAVEN_BASE.WETHERSPOONS.FOOD_ORDERS
( SITE_ID, ORDER_DATE, ORDER_TIME, AZTEC_CHECK_NO, ITEM_NAME, BUMPED_TIME_SECONDS, EXPO_TIME_SECONDS )
AS SELECT SITE_ID, ORDER_DATE, ORDER_TIME, AZTEC_CHECK_NO, ITEM_NAME, BUMPED_TIME_SECONDS, EXPO_TIME_SECONDS
FROM HAVEN_RAW.WETHERSPOONS.FOOD_ORDERS;

SELECT * FROM HAVEN_BASE.WETHERSPOONS.FOOD_ORDERS;