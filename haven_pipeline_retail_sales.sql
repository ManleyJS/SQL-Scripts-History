use role dba;

use schema haven_pipeline.retail_sales;

create or replace file format haven_pipeline.retail_sales.retail_csv_file_format_chopstix
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1
NULL_IF = ()
EMPTY_FIELD_AS_NULL = true
COMPRESSION = NONE
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
;
 
create or replace stage haven_pipeline.retail_sales.RETAIL_STAGE_CHOPSTIX
STORAGE_INTEGRATION = HAVEN_CHOPSTIX_AZURE_INTEGRATION
URL = 'azure://cpxstorage.blob.core.windows.net/havendatacpx'
FILE_FORMAT = haven_pipeline.retail_sales.retail_csv_file_format_chopstix
;

use role haven_data_transform;


use role haven_dbt_transform;

use role HAVEN_DATA_TRANSFORM;

use role dba;

use role haven_dbt_transform;