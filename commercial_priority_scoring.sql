
use ROLE dba;

use SCHEMA haven_pipeline.COMMERCIAL_PRIORITY_SCORING;

use schema COMMERCIAL_PRIORITY_SCORING;

 
create or replace file format haven_pipeline.COMMERCIAL_PRIORITY_SCORING.haven_commercial_priority_scoring_rms_csv_file_format
    TYPE = CSV 
    FIELD_DELIMITER = ',' 
    SKIP_HEADER = 1 
    NULL_IF = () 
    EMPTY_FIELD_AS_NULL = true 
    COMPRESSION = NONE 
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
;
 
create or replace stage haven_pipeline.COMMERCIAL_PRIORITY_SCORING.haven_commercial_priority_scoring_rms_stage
  STORAGE_INTEGRATION = blg_prod_rms_scoring_s3_integration
  URL = 's3://haven-prod-sales-integrationsapplications-pricing/'
  file_format = haven_commercial_priority_scoring_rms_csv_file_format 
  ENCRYPTION = (TYPE='AWS_SSE_S3')
;