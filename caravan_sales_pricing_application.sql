use ROLE dba;

use database haven_raw;
use schema caravan_sales_pricing_application;

-- csv file format
create or replace file format haven_raw.caravan_sales_pricing_application.BLG_RMS_CARAVAN_PRICING_APP_FILE_FORMAT 
type = CSV 
FIELD_OPTIONALLY_ENCLOSED_BY = '"' 
SKIP_HEADER = 1;

-- external stage 
create or replace stage haven_raw.caravan_sales_pricing_application.BLG_RMS_CARAVAN_PRICING_APP_EXT_STAGE 
url = 's3://blg-rms-caravan-pricing-s3/' 
storage_integration = BLG_HAVPRODSERV_CARAVAN_PRICING_S3_INTEGRATION 
file_format = BLG_RMS_CARAVAN_PRICING_APP_FILE_FORMAT;



-- external table 
CREATE or REPLACE EXTERNAL TABLE haven_raw.caravan_sales_pricing_application.RMS_CARAVAN_PRICING_APP_EXT_TABLE 
LOCATION = @BLG_RMS_CARAVAN_PRICING_APP_EXT_STAGE 
FILE_FORMAT = BLG_RMS_CARAVAN_PRICING_APP_FILE_FORMAT 
AUTO_REFRESH = true;


use database haven_base;
use schema caravan_sales_pricing_application;

create or replace view haven_base.caravan_sales_pricing_application.CSPA_BASE_PRICING as
select
    value:c1::number YEAR,
    value:c2::string NEW_USED,
    value:c3::string TIER,
    value:c4::string GRADE,
    value:c5::string GBB,
    value:c6::number MIN_WIDTH,
    value:c7::number MIN_LENGTH,
    value:c8::number BEDS,
    value:c9::number VALUE,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    haven_raw.caravan_sales_pricing_application.RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_base_pricing%';

create or replace view haven_base.caravan_sales_pricing_application.CSPA_BEDS_DIFFS as
select
    value:c1::number BEDS_DIFF,
    value:c2::number GBP_DIFF,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    haven_raw.caravan_sales_pricing_application.RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_beds_diffs%';

create or replace view haven_base.caravan_sales_pricing_application.CSPA_GBB as
select
    value:c1::string MAKE,
    value:c2::string MODEL,
    value:c3::number YEAR_MADE,
    value:c4::number LENGTH,
    value:c5::number WIDTH,
    value:c6::number BEDS,
    value:c7::string VAN_GRADE,
    value:c8::string PRICING_GRADE,
    value:c9::string TIERING,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    haven_raw.caravan_sales_pricing_application.RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_gbb%';
    
create or replace view haven_base.caravan_sales_pricing_application.CSPA_LENGTH_DIFFS as
select
    value:c1::number LEN_DIFF,
    value:c2::number GBP_DIFF,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    haven_raw.caravan_sales_pricing_application.RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_length_diffs%';
    
create or replace view haven_base.caravan_sales_pricing_application.CSPA_PARK_TIERS as
select
    value:c1::string PARK,
    value:c2::string PRICE_TIER,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    haven_raw.caravan_sales_pricing_application.RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_park_tiers%';

create or replace view haven_base.caravan_sales_pricing_application.CSPA_USED_DIFFS as
select
    value:c1::string VAN_VERSION,
    value:c2::string GRADE,
    value:c3::string STT_FROM,
    value:c4::string STT_TO,
    value:c5::number YEAR_DIFF,
    value:c6::number GBP_DIFF,
    value:c7::float PCT_DIFF,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    haven_raw.caravan_sales_pricing_application.RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_used_diffs%';
    
create or replace view haven_base.caravan_sales_pricing_application.CSPA_USER_ACCOUNTS as
select
    to_timestamp(value:c1::string, 'DD/MM/YYYY HH24:MI') REG_TIMESTAMP,
    value:c2::string ROLE,
    value:c3::string USERNAME,
    value:c4::string PASSWORD_HASH,
    value:c5::string PASSWORD_SALT,
    value:c6::string UID,
    value:c7::string APPROVED,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    haven_raw.caravan_sales_pricing_application.RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_user_accounts%';

create or replace view haven_base.caravan_sales_pricing_application.CSPA_WIDTH_DIFFS as
select
    value:c1::number WIDTH_DIFF,
    value:c2::number GBP_DIFF,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    haven_raw.caravan_sales_pricing_application.RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_width_diffs%';   

create or replace view haven_base.caravan_sales_pricing_application.CSPA_YEAR_DIFFS as
select
    value:c1::string VAN_VERSION,
    value:c2::string GRADE,
    value:c3::string STT_FROM,
    value:c4::string STT_TO,
    value:c5::number YEAR_DIFF,
    value:c6::number GBP_DIFF,
    value:c7::float PCT_DIFF,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    haven_raw.caravan_sales_pricing_application.RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_year_diffs%';

-- 16/05/2025

use database haven_store;
use schema caravan_sales_pricing_application;

create or replace TABLE haven_store.caravan_sales_pricing_application.ACTIVE_SUBMISSIONS (
 SUBMISSION_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
 RECORD_IDENTIFIER VARCHAR(255) NOT NULL ,
 TARGET_TABLE VARCHAR(255) NOT NULL ,
 FIELD_NAME VARCHAR(255) NOT NULL ,
 ACTIVE_VALUE VARCHAR(255) NOT NULL ,
 ORIGINAL_VALUE VARCHAR(255) ,
 REFERENCE_LOG_ID NUMBER(38,0) NOT NULL ,
 APPLIED_BY VARCHAR(255) NOT NULL ,
 APPLIED_ROLE VARCHAR(255) NOT NULL , 
 APPLIED_TIMESTAMP TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP(),
 LAST_UPDATED TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP(),
 constraint ACTIVE_RECORD_FIELD_UQ unique (RECORD_IDENTIFIER, TARGET_TABLE, FIELD_NAME),
 constraint ACTIVE_SUBMISSIONS_PK primary key (SUBMISSION_ID)
);


create or replace TABLE haven_store.caravan_sales_pricing_application.AUDIT_LOGS (
 LOG_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
 TIMESTAMP TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP(),
 USERNAME VARCHAR(16777216) NOT NULL,
 USER_ROLE VARCHAR(16777216) NOT NULL,
 TARGET_TABLE VARCHAR(16777216) NOT NULL,
 RECORD_IDENTIFIER VARCHAR(16777216) NOT NULL,
 FIELD_NAME VARCHAR(16777216) NOT NULL,
 OLD_VALUE VARCHAR(16777216),
 NEW_VALUE VARCHAR(16777216),
 CHANGE_TYPE VARCHAR(16777216) NOT NULL,
 STATUS VARCHAR(16777216) DEFAULT 'PENDING',
 APPLIED_TIMESTAMP TIMESTAMP_NTZ(9),
 REFERENCE_LOG_ID NUMBER(38,0),
 constraint AUDIT_LOGS_PK primary key (LOG_ID)
);

use ROLE dba;
--use role haven_dbt_transform;

use SCHEMA haven_store.caravan_sales_pricing_application;

create view haven_store.caravan_sales_pricing_application.CSPA_BASE_PRICING 
( YEAR, NEW_USED, TIER, GRADE, GBB, MIN_WIDTH, MIN_LENGTH, BEDS, VALUE, FILE_NAME, LOADED_TIMESTAMP )
AS SELECT "YEAR", NEW_USED, TIER, GRADE, GBB, MIN_WIDTH, MIN_LENGTH, BEDS, VALUE, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_BASE_PRICING;

create view haven_store.caravan_sales_pricing_application.CSPA_BEDS_DIFFS 
( BEDS_DIFF, GBP_DIFF, FILE_NAME, LOADED_TIMESTAMP )
AS SELECT BEDS_DIFF, GBP_DIFF, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_BEDS_DIFFS;

create view haven_store.caravan_sales_pricing_application.CSPA_GBB 
( MAKE, MODEL, YEAR_MADE, "LENGTH", WIDTH, BEDS, VAN_GRADE, PRICING_GRADE, TIERING, FILE_NAME, LOADED_TIMESTAMP )
AS SELECT MAKE, MODEL, YEAR_MADE, "LENGTH", WIDTH, BEDS, VAN_GRADE, PRICING_GRADE, TIERING, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_GBB;

create view haven_store.caravan_sales_pricing_application.CSPA_LENGTH_DIFFS 
( LEN_DIFF, GBP_DIFF, FILE_NAME, LOADED_TIMESTAMP )
AS SELECT LEN_DIFF, GBP_DIFF, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_LENGTH_DIFFS;

create view haven_store.caravan_sales_pricing_application.CSPA_PARK_TIERS 
( PARK, PRICE_TIER, FILE_NAME, LOADED_TIMESTAMP )
AS SELECT PARK, PRICE_TIER, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_PARK_TIERS;

create view haven_store.caravan_sales_pricing_application.CSPA_USED_DIFFS 
( VAN_VERSION, GRADE, STT_FROM, STT_TO, YEAR_DIFF, GBP_DIFF, PCT_DIFF, FILE_NAME, LOADED_TIMESTAMP )
AS SELECT VAN_VERSION, GRADE, STT_FROM, STT_TO, YEAR_DIFF, GBP_DIFF, PCT_DIFF, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_USED_DIFFS;
    
create view haven_store.caravan_sales_pricing_application.CSPA_USER_ACCOUNTS 
( REG_TIMESTAMP, "ROLE", USERNAME, PASSWORD_HASH, PASSWORD_SALT, UID, APPROVED, FILE_NAME, LOADED_TIMESTAMP )
AS SELECT REG_TIMESTAMP, "ROLE", USERNAME, PASSWORD_HASH, PASSWORD_SALT, UID, APPROVED, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_USER_ACCOUNTS;

create view haven_store.caravan_sales_pricing_application.CSPA_WIDTH_DIFFS 
( WIDTH_DIFF, GBP_DIFF, FILE_NAME, LOADED_TIMESTAMP )
AS SELECT WIDTH_DIFF, GBP_DIFF, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_WIDTH_DIFFS;

create view haven_store.caravan_sales_pricing_application.CSPA_YEAR_DIFFS 
( VAN_VERSION, GRADE, STT_FROM, STT_TO, YEAR_DIFF, GBP_DIFF, PCT_DIFF, FILE_NAME, LOADED_TIMESTAMP )
AS SELECT VAN_VERSION, GRADE, STT_FROM, STT_TO, YEAR_DIFF, GBP_DIFF, PCT_DIFF, FILE_NAME, LOADED_TIMESTAMP
FROM HAVEN_BASE.CARAVAN_SALES_PRICING_APPLICATION.CSPA_YEAR_DIFFS;;


show views;

-- set up special role for BI team to view CSPA_GBB object only

use ROLE securityadmin;

REVOKE ROLE _haven_store__caravan_sales_pricing_application__reader FROM ROLE haven_commercial;

use ROLE useradmin;

CREATE ROLE _haven_commercial__haven_store__caravan_sales_pricing_application__reader;

use ROLE securityadmin;

GRANT ROLE _haven_store__caravan_sales_pricing_application__usage TO ROLE _haven_commercial__haven_store__caravan_sales_pricing_application__reader;
GRANT SELECT ON VIEW haven_store.caravan_sales_pricing_application.CSPA_GBB TO ROLE _haven_commercial__haven_store__caravan_sales_pricing_application__reader;
GRANT ROLE _haven_commercial__haven_store__caravan_sales_pricing_application__reader TO ROLE haven_commercial;

use ROLE haven_commercial;

use SCHEMA haven_store.caravan_sales_pricing_application;

show views;

USE warehouse haven_commercial_xsmall;

SELECT * FROM haven_store.caravan_sales_pricing_application.cspa_gbb LIMIT 20;