USE ROLE dba;
use database haven_pipeline;
use schema retail_sales;

SHOW STAGES;
 
create or replace file format retail_csv_file_format_slimchickens 
TYPE = CSV 
FIELD_DELIMITER = ',' 
SKIP_HEADER = 1 
NULL_IF = () 
EMPTY_FIELD_AS_NULL = true 
COMPRESSION = NONE 
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
;

create or replace stage RETAIL_STAGE_SLIMCHICKENS
  STORAGE_INTEGRATION = BLG_HAVDEVSERV_RETAIL_SALES_EXPORT_INTEGRATION
  URL = 's3://blg-havdevserv-retail-sales-export/'
  file_format = retail_csv_file_format_slimchickens 
  ENCRYPTION = (TYPE='AWS_SSE_S3')
;
 
