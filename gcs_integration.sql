USE DATABASE haven_raw;
USE SCHEMA bigquery;
USE ROLE dba;
USE ROLE haven_batch_dataload;

SHOW STAGES;

DROP STAGE haven_raw.bigquery.gcs_bigquery_integration_stage;
DROP FILE format haven_raw.bigquery.gcs_csv_integration_format;

create or replace file format haven_raw.bigquery.gcs_csv_integration_format
  type = csv
  compression = gzip
  field_delimiter = ','
  FIELD_OPTIONALLY_ENCLOSED_BY='"'
  EMPTY_FIELD_AS_NULL=TRUE
  NULL_IF=() 
  TIMESTAMP_FORMAT="YYYY-MM-DD HH24:MI:SS.FF6 UTC"
  ESCAPE_UNENCLOSED_FIELD=NONE
  ENCODING='UTF-8'
  ESCAPE=NONE;

 ALTER SESSION SET timestamp_output_format = 'YYYY-MM-DD HH24:MI:SS.FF6 UTC';
 SELECT current_timestamp();
 
 create or replace stage haven_raw.bigquery.gcs_bigquery_integration_stage
  url = 'gcs://gcp_snowflake_storage/'
  storage_integration = gcs_snowflake_storage_integration
  file_format = haven_raw.bigquery.gcs_csv_integration_format
;

ls @haven_raw.bigquery.gcs_bigquery_integration_stage/hav001_tables/2022-10-30/;

USE ROLE dba;
SELECT st.$36 FROM @haven_raw.bigquery.gcs_bigquery_integration_stage/hav001_tables/2022-10-30/ st LIMIT 10;

USE ROLE dba;
SELECT * FROM haven_store.COMMERCIAL.SESSIONS_BY_DATE  WHERE SESSION_DATE  > '2022-10-20';
SELECT * FROM haven_raw.bigquery.HAV001_TABLES01_SESSIONS_BY_DATE WHERE "DATE"  > '2022-10-20';