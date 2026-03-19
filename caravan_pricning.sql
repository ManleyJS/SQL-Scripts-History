use database haven_raw;
use schema caravan_pricing_app;

-- csv file format
create or replace file format BLG_RMS_CARAVAN_PRICING_APP_FILE_FORMAT 
type = CSV 
FIELD_OPTIONALLY_ENCLOSED_BY = '"' 
SKIP_HEADER = 1;

-- external stage 
create or replace stage BLG_RMS_CARAVAN_PRICING_APP_EXT_STAGE 
url = 's3://blg-rms-caravan-pricing-s3/' 
storage_integration = BLG_HAVPRODSERV_CARAVAN_PRICING_S3_INTEGRATION 
file_format = BLG_RMS_CARAVAN_PRICING_APP_FILE_FORMAT;



-- external table 
CREATE or REPLACE EXTERNAL TABLE RMS_CARAVAN_PRICING_APP_EXT_TABLE 
LOCATION = @BLG_RMS_CARAVAN_PRICING_APP_EXT_STAGE 
FILE_FORMAT = BLG_RMS_CARAVAN_PRICING_APP_FILE_FORMAT 
AUTO_REFRESH = true;


use database haven_base;
use schema caravan_pricing_app;

create or replace view CSPA_BASE_PRICING as
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
    RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_base_pricing%';

create or replace view CSPA_BEDS_DIFFS as
select
    value:c1::number BEDS_DIFF,
    value:c2::number GBP_DIFF,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_beds_diffs%';

create or replace view CSPA_GBB as
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
    RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_gbb%';
    
create or replace view CSPA_LENGTH_DIFFS as
select
    value:c1::number LEN_DIFF,
    value:c2::number GBP_DIFF,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_length_diffs%';
    
create or replace view CSPA_PARK_TIERS as
select
    value:c1::string PARK,
    value:c2::string PRICE_TIER,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_park_tiers%';

create or replace view CSPA_USED_DIFFS as
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
    RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_used_diffs%';
    
create or replace view CSPA_USER_ACCOUNTS as
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
    RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_user_accounts%';

create or replace view CSPA_WIDTH_DIFFS as
select
    value:c1::number WIDTH_DIFF,
    value:c2::number GBP_DIFF,
    metadata$filename file_name,
    try_to_timestamp(
        replace(split_part(file_name, '_', -1), '.csv', ''),
        'YYYYMMDDHHMI'
    ) as loaded_timestamp
from
    RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_width_diffs%';   

create or replace view CSPA_YEAR_DIFFS as
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
    RMS_CARAVAN_PRICING_APP_EXT_TABLE
where
    file_name like 'cspa_year_diffs%';


use database <tbc>;
use schema <tbc>;

create or replace TABLE ACTIVE_SUBMISSIONS (
 SUBMISSION_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
 RECORD_IDENTIFIER VARCHAR(255) NOT NULL COMMENT,
 TARGET_TABLE VARCHAR(255) NOT NULL COMMENT,
 FIELD_NAME VARCHAR(255) NOT NULL COMMENT,
 ACTIVE_VALUE VARCHAR(255) NOT NULL COMMENT,
 ORIGINAL_VALUE VARCHAR(255) COMMENT,
 REFERENCE_LOG_ID NUMBER(38,0) NOT NULL COMMENT,
 APPLIED_BY VARCHAR(255) NOT NULL COMMENT,
 APPLIED_ROLE VARCHAR(255) NOT NULL COMMENT
 APPLIED_TIMESTAMP TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP(),
 LAST_UPDATED TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP(),
 constraint ACTIVE_RECORD_FIELD_UQ unique (RECORD_IDENTIFIER, TARGET_TABLE, FIELD_NAME),
 constraint ACTIVE_SUBMISSIONS_PK primary key (SUBMISSION_ID)
);


create or replace TABLE AUDIT_LOGS (
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