use role securityadmin;

revoke usage on integration GCS_BLG_TARGET_ESSENCEMEDIA_INTEGRATION from role haven_data_transform;

use role dba;

use database haven_pipeline;

use schema essencemedia;

drop file format haven_pipeline.essencemedia.essencemedia_file_format ;

create or replace file format haven_pipeline.essencemedia.essencemedia_csv_file_format 
  TYPE = CSV
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  NULL_IF = ()
  EMPTY_FIELD_AS_NULL = true
  COMPRESSION = NONE 
FIELD_OPTIONALLY_ENCLOSED_BY  = '"'
;
 
 
create or replace stage ESSENCEMEDIA_stage
  STORAGE_INTEGRATION = GCS_BLG_TARGET_ESSENCEMEDIA_INTEGRATION
  URL = 'gcs://ext-haven-snowflake/GA4'
  file_format = haven_pipeline.essencemedia.essencemedia_csv_file_format 
;

use role securityadmin;

grant role _haven_pipeline__essencemedia__reader to role haven_data_transform;

use role haven_data_transform;

