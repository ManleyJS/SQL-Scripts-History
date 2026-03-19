use role accountadmin;

create or replace storage integration gcs_snowflake_storage_integration
  type = external_stage
  storage_provider = gcs
  enabled = true
  storage_allowed_locations = ('gcs://gcp_snowflake_storage/', 'gcs://snowflake-1274/')
  ;
  
desc storage integration gcs_snowflake_storage_integration;
  
use role securityadmin;
grant usage on integration gcs_snowflake_storage_integration to role dba;
grant usage on integration gcs_snowflake_storage_integration to role haven_batch_dataload;

use role dba;
use schema haven_raw.google_analytics;

create or replace file format haven_raw.google_analytics.gcs_snowflake_storage_integration_format
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

drop stage test_stage;

create or replace stage haven_raw.google_analytics.gcs_snowflake_storage_integration_stage
  url = 'gcs://gcp_snowflake_storage/'
  storage_integration = gcs_snowflake_storage_integration
  file_format = haven_raw.google_analytics.gcs_snowflake_storage_integration_format
;

ls @gcs_snowflake_storage_integration_stage/168513829/;

create table park_codes (
park_code	STRING,
park_country	STRING,
park_region	STRING,
park_name	STRING);

copy into haven_raw.google_analytics.park_codes
from @gcs_snowflake_storage_integration_stage/park_details;

show stages;

drop table "HAVEN_RAW"."GOOGLE_ANALYTICS"."GA_SESSION_168513829_STAGE";

create or replace procedure haven_raw.google_analytics.load_avro_data_file(TABLENAME VARCHAR, STAGENAME VARCHAR, FILENAME VARCHAR)
returns varchar
language javascript
as
$$

    var fileFormatSQL = "create or replace file format test_avro_load_format type = AVRO";
    
    var spStmt = snowflake.createStatement( {sqlText: fileFormatSQL})
    spStmt.execute()

    var tableCreateSQL = "create or replace table " + TABLENAME + "_stage using template ("
    tableCreateSQL += "select array_agg(object_construct(*)) "
    tableCreateSQL += "from table(infer_schema(location=>'@" + STAGENAME + "/" + FILENAME + "', "
    tableCreateSQL += "file_format=>'test_avro_load_format')))";
    
    var spStmt = snowflake.createStatement( {sqlText: tableCreateSQL})
    spStmt.execute()
    
    var tableCopySQL = "copy into " + TABLENAME + "_stage from @" + STAGENAME + "/" + FILENAME;
    tableCopySQL += " file_format = test_avro_load_format"
    tableCopySQL += " match_by_column_name = case_insensitive";
    
    var spStmt = snowflake.createStatement( {sqlText: tableCopySQL})
    var rs = spStmt.execute()

    rs.next()
    return rs.getColumnValue(1) + " : " + rs.getColumnValue(2) + " : " + rs.getColumnValue(3);
    
$$
;

call load_avro_data_file('GA_SESSION_168513829', 'GCS_SNOWFLAKE_STORAGE_INTEGRATION_STAGE', '168513829/');

select "date", count(*) from GA_SESSION_168513829_STAGE
group by 1 order by 1;

select count(*) from GA_SESSION_168513829_stage;

select zip from haven_base.seaware.cc_client limit 10;

use role dba;

use role securityadmin;

grant role _haven_raw__braintree__creator to role bourne_braintree_dataload;
grant role _haven_raw__create to role bourne_braintree_dataload;

use role dba;
use role sysadmin;
drop schema if exists bourne_raw.zendesk cascade;
drop schema if exists bourne_raw.braintree cascade;

drop schema if exists haven_RAW.aztec cascade;

use role dba;

show databases;