use ROLE dba;

use SCHEMA haven_master.etleap_status;

create OR replace VIEW last_altered_data AS 
select table_schema, table_name, last_altered, last_ddl from snowflake.account_usage.tables
where table_catalog = 'HAVEN_RAW'
and table_schema in ('WORKFORCE_SAM', 'ADTHENA', 'ERPX', 'BRAINTREE_ETLEAP', 'DIG_OWNERSHIP_OWNERS', 'PLOT_RDS_TEST', 'COUPA_ETLEAP', 'TIKTOK_ADS', 'FACEBOOK', 'PLAYSAFE', '
DIG_TEAM_CARD', 'DIG_TEAM_COMMS', 'DIG_FB_EAGLEEYE', 'DIG_ARRIVALS_ETLEAP', 'CONCUR_ETLEAP', 'SEAWARE_ETLEAP', 'DIG_AAC_ONPARKWIFI', 'PLOT_DREAM_ETLEAP', 'JDAADMIN_ETLEAP', 
'MARINER_ETLEAP', 'KMSREPORTING_COMPLEX_ETLEAP', 'ZBSDATA_RETAIL_ETLEAP', 'DIG_BOOKINGS_ETLEAP', 'ZBSDATA_COMPLEX_ETLEAP', 'DIG_PAYMENTS_ETLEAP', 'FRESHSALES', 'ENTRA_ID', 
'ICEBERG_ETLEAP_POC', 'HIT_ADMIN_ETLEAP', 'DIG_VENUE_DISRUPTION', 'DIG_PLAYPASS', 'DIG_ARRIVALS_HOLIDAY_BOOKINGS', 'DIG_ACCEPTANCE_OF_RISK_ETLEAP', 'DIG_ACTIVITIES_ETLEAP', 
'DIG_CAPACITY_ETLEAP', 'DIG_PRICING_ETLEAP', 'CONSENT_AND_PREFERENCE_ETLEAP', 'IDENTITY_ETLEAP', 'DIG_OWNERS_ARRIVALS_ETLEAP', 'DIG_PARK_AREAS', 'DIG_FB_TABLE_BOOKING', 
'DIG_FB_ENTERTAINMENT', 'OWNERSHIP_OWNERS_DEV', 'ICLEAN_ETLEAP')
and DELETED is NULL ORDER BY table_schema, TABLE_NAME;


CREATE TABLE connection_status_history (
connection_type varchar(50),
connection_id varchar(20),
connection_name varchar(250),
active_flag boolean,
connection_status varchar(20),
creation_date timestamp,
connecion_update_mode varchar(20),
connection_update_interval varchar(20),
connecion_replace_mode varchar(20),
connection_replace_interval varchar(20),
connecion_append_mode varchar(20),
connection_append_interval varchar(20),
capture_timestamp timestamp);

CREATE OR replace TABLE pipeline_status_history (
pipeline_id varchar(20),
pipeline_name varchar(200),
pipeline_latency  varchar(20),
paused varchar(10),
pipeline_mode varchar(20),
created_timestamp timestamp,
source_type varchar(20),
source_connection_id varchar(20),
source_object varchar(200),
destination_type varchar(20),
destination_connection_id varchar(20),
primary_key  varchar(200),
automatic_schema_change varchar(10),
destination_schema_name  varchar(50),
destination_table_name  varchar(200),
retain_history_flag varchar(10),
pipeline_schedule_mode  varchar(20),
pipeline_schedule_frequency  varchar(20),
capture_timestamp timestamp
);

ls @%pipeline_status_history;


CREATE OR replace file format etleap_status_file_format
TYPE = csv
compression = gzip
FIELD_OPTIONALLY_ENCLOSED_BY = '"';

copy into pipeline_status_history from @%pipeline_status_history
file_format = (format_name = 'etleap_status_file_format')
--validation_mode = return_errors
;

SELECT count(*) FROM pipeline_status_history;

SELECT * FROM pipeline_status_history;

CREATE OR replace TABLE last_altered_details (
schema_name varchar(100),
table_name varchar(100),
last_dml_change timestamp,
last_ddl_change timestamp,
pipeline_mode varchar(20),
pipeline_change_frequency varchar(50),
pipeline_latency varchar(20),
seconds_since_last_dml varchar(20),
dml_latency_diff varchar(20),
capture_timestamp timestamp
);

ls @%last_altered_details;

SELECT * FROM last_altered_details
ORDER BY schema_name, table_name, capture_timestamp;

SELECT * FROM last_altered_data;