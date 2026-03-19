-- 16/07/2025

use role dba;

show roles like '%_cyhh_reporting_pitch_bookings_by_price_%';

use role haven_schema_setup;

drop role _HAVEN_STORE_DEV__CYHH_REPORTING_PITCH_BOOKINGS_BY_PRICE__CREATOR;
drop role _HAVEN_STORE_DEV__CYHH_REPORTING_PITCH_BOOKINGS_BY_PRICE__OWNER;
drop role _HAVEN_STORE_DEV__CYHH_REPORTING_PITCH_BOOKINGS_BY_PRICE__READER;
drop role _HAVEN_STORE_DEV__CYHH_REPORTING_PITCH_BOOKINGS_BY_PRICE__USAGE;
drop role _HAVEN_STORE_DEV__CYHH_REPORTING_PITCH_BOOKINGS_BY_PRICE__WRITER;

drop role _HAVEN_STORE_QAT__CYHH_REPORTING_PITCH_BOOKINGS_BY_PRICE__CREATOR;
drop role _HAVEN_STORE_QAT__CYHH_REPORTING_PITCH_BOOKINGS_BY_PRICE__OWNER;
drop role _HAVEN_STORE_QAT__CYHH_REPORTING_PITCH_BOOKINGS_BY_PRICE__READER;
drop role _HAVEN_STORE_QAT__CYHH_REPORTING_PITCH_BOOKINGS_BY_PRICE__USAGE;
drop role _HAVEN_STORE_QAT__CYHH_REPORTING_PITCH_BOOKINGS_BY_PRICE__WRITER;

use role sysadmin;

drop schema haven_store_dev.cyhh_pricing_config;
drop schema haven_store_qat.cyhh_pricing_config;

alter schema haven_store_dev.cyhh_reporting_pitch_bookings_by_price rename to haven_store_dev.cyhh_pricing_config;
alter schema haven_store_qat.cyhh_reporting_pitch_bookings_by_price rename to haven_store_qat.cyhh_pricing_config;

use role dba;

call haven_master.procedures.schema_role_creation('haven_store_dev', 'cyhh_pricing_config');
call haven_master.procedures.schema_role_creation('haven_store_qat', 'cyhh_pricing_config');

use schema haven_store_qat.cyhh_pricing_config;

show tables;

show file formats;


use schema haven_pipeline_qat.cyhh_pricing_pilot;

show schemas;

show stages;

show file formats;

create or replace file format haven_pipeline_qat.cyhh_pricing_pilot.blg_dev_rms_cyhh_pricing_s3_file_format
TYPE = CSV
VALIDATE_UTF8 = true,
SKIP_BLANK_LINES = false,
REPLACE_INVALID_CHARACTERS = false,
EMPTY_FIELD_AS_NULL = true,
SKIP_BYTE_ORDER_MARK = true,
ENCODING = UTF8,
MULTI_LINE = true;


create or replace stage haven_pipeline_qat.cyhh_pricing_pilot.blg_dev_rms_cyhh_pricing_s3_stage
  STORAGE_INTEGRATION = blg_dev_rms_scoring_s3_integration
  URL = 's3://haven-dev-sales-integrationsapplications-pricing/'
  file_format = haven_pipeline_qat.cyhh_pricing_pilot.blg_dev_rms_cyhh_pricing_s3_file_format
  ENCRYPTION = (TYPE='AWS_SSE_S3');

  ls @haven_pipeline_qat.cyhh_pricing_pilot.blg_dev_rms_cyhh_pricing_s3_stage;

-- 17/07/2025

use role dba;

use schema haven_store.cyhh_pricing_config;

create table haven_store.cyhh_pricing_config.decision_matrix clone haven_revenue_management.ds_dev.decision_matrix;
create table haven_store.cyhh_pricing_config.decision_matrix_pg1 clone haven_revenue_management.ds_dev.decision_matrix_pg1;
create table haven_store.cyhh_pricing_config.pricer_wait_days clone haven_revenue_management.ds_dev.pricer_wait_days;
create table haven_store.cyhh_pricing_config.decision_matrix_rule_translation clone haven_revenue_management.ds_dev.decision_matrix_rule_translation;
create table haven_store.cyhh_pricing_config.decision_wait_rules clone haven_revenue_management.ds_dev.decision_wait_rules;
create table haven_store.cyhh_pricing_config.CYHH_2024_BREAK_DATES clone haven_revenue_management.ds_dev.CYHH_2024_BREAK_DATES;
create table haven_store.cyhh_pricing_config.cyhh_current_price_step clone haven_revenue_management.ds_dev.cyhh_current_price_step;
create table haven_store.cyhh_pricing_config.cyhh_price_change_freq clone haven_revenue_management.ds_dev.cyhh_price_change_freq;
create table haven_store.cyhh_pricing_config.cyhh_price_history clone haven_revenue_management.ds_dev.cyhh_price_history;
create table haven_store.cyhh_pricing_config.cyhh_period_pricing_ladders clone haven_revenue_management.ds_dev.cyhh_period_pricing_ladders;
create table haven_store.cyhh_pricing_config.cyhh_break_to_period clone haven_revenue_management.ds_dev.cyhh_break_to_period;
create table haven_store.cyhh_pricing_config.cyhh_2023_price_changes clone haven_revenue_management.ds_dev.cyhh_2023_price_changes;
create table haven_store.cyhh_pricing_config.cyhh_p1_park_price_split clone haven_revenue_management.ds_dev.cyhh_p1_park_price_split;
create table haven_store.cyhh_pricing_config.CYHH_P7_PARK_PRICE_SPLIT clone haven_revenue_management.ds_dev.CYHH_P7_PARK_PRICE_SPLIT;
create table haven_store.cyhh_pricing_config.CYHH_PARK_ENTRY_PRICE_SPLIT clone haven_revenue_management.ds_dev.CYHH_PARK_ENTRY_PRICE_SPLIT;
create table haven_store.cyhh_pricing_config.CYHH_XMAS_SPECIAL_BREAKS clone haven_revenue_management.ds_dev.CYHH_XMAS_SPECIAL_BREAKS;

use database HAVEN_PIPELINE;

use schema CYHH_PRICING_PILOT;

show schemas;

select get_ddl('file_format', 'HAVEN_PIPELINE_QAT.CYHH_PRICING_PILOT.BLG_DEV_RMS_CYHH_PRICING_S3_FILE_FORMAT');

CREATE OR REPLACE FILE FORMAT HAVEN_PIPELINE.CYHH_PRICING_PILOT.BLG_PROD_RMS_CYHH_PRICING_S3_FILE_FORMAT
SKIP_HEADER = 1
;

create or replace stage HAVEN_PIPELINE.CYHH_PRICING_PILOT.BLG_PROD_RMS_CYHH_PRICING_S3_STAGE
  STORAGE_INTEGRATION = blg_prod_rms_scoring_s3_integration
  URL = 's3://haven-prod-sales-integrationsapplications-pricing/'
  file_format = HAVEN_PIPELINE.CYHH_PRICING_PILOT.BLG_PROD_RMS_CYHH_PRICING_S3_FILE_FORMAT 
  ENCRYPTION = (TYPE='AWS_SSE_S3');


use role accountadmin;

show integrations like '%rms%';


-- external id: BD78472_SFCRole=73lh0MSBf1XIiZ6YvJMqmiBcTQBX
-- snowflake_user_arn = "arn:aws:iam::270302263326:user/m5a8-s-iest2078"
-- rms_scoring_instance_arn = "arn:aws:iam::753707732315:role/blg-prod-snowflake-rms-scoring-role"
-- bucket: "arn:aws:s3:::haven-prod-sales-integrationsapplications-pricing"