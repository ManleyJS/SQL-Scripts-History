use ROLE accountadmin;


CREATE OR REPLACE STORAGE INTEGRATION aws_breakfree_sun_newspaper_s3_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::975946486606:role/Haven-Snowflake-role'
  STORAGE_AWS_EXTERNAL_ID = 'BD78472_SFCRole=2_HoiLv+/o8XBR+4+Jpd62qhBvEX4='
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('s3://haven-snowflake/')
;

ALTER storage integration aws_breakfree_sun_newspaper_s3_integration
set STORAGE_ALLOWED_LOCATIONS = ('s3://haven-snowflake/incoming/')
;

DESC integration aws_breakfree_sun_newspaper_s3_integration;

GRANT USAGE ON integration aws_breakfree_sun_newspaper_s3_integration TO ROLE dba;

-- STORAGE_AWS_IAM_USER_ARN: arn:aws:iam::270302263326:user/m5a8-s-iest2078
-- STORAGE_AWS_EXTERNAL_ID: BD78472_SFCRole=2_HoiLv+/o8XBR+4+Jpd62qhBvEX4=
-- STORAGE_AWS_EXTERNAL_ID: BD78472_SFCRole=2_HoiLv+/o8XBR+4+Jpd62qhBvEX4=
-- Let us know when ready and we can run a test to make sure it is all good. 

use ROLE dba;

use SCHEMA training.training;

show stages;

DROP STAGE deleteme;
DROP STAGE delete_stage;

create OR replace stage training.training.deleteme
    STORAGE_INTEGRATION = aws_breakfree_sun_newspaper_s3_integration
    URL = 's3://haven-snowflake/incoming/'
    ;

ls @training.training.deleteme/;

SHOW tables;

SELECT * from timestamp_test;

copy INTO @training.training.deleteme
FROM timestamp_test;

rm @training.training.deleteme/data_0_0_0.csv.gz;

use ROLE dba;

use SCHEMA training.training;

ls @breakfree_sun;

ls @deleteme;

rm @deleteme/breakfree_daily_20251215134019.csv.gz;

rm @deleteme/breakfreebreakfree_daily_20251215134019.csv.gz;

copy files INTO @deleteme/breakfree/ 
FROM @breakfree_sun/breakfree/breakfree_daily_20251215134019.csv.gz;

ls @deleteme;

copy files INTO @deleteme/sun/ 
FROM @breakfree_sun/sun/sun_daily_20251215134019.csv.gz

-- 16/11/2025

use ROLE dba;

use SCHEMA training.training;

create OR replace stage training.training.sun_uat_stage
    STORAGE_INTEGRATION = aws_breakfree_sun_newspaper_s3_integration
    URL = 's3://haven-snowflake/incoming/uat/sun/'
    ;

rm @deleteme/;

ls @sun_uat_stage;

ls @deleteme;

copy files INTO @sun_uat_stage 
FROM @breakfree_sun/sun/sun_daily_20251215134019.csv.gz


create OR replace stage training.training.breakfree_uat_stage
    STORAGE_INTEGRATION = aws_breakfree_sun_newspaper_s3_integration
    URL = 's3://haven-snowflake/incoming/uat/breakfree/'
    ;

ls @breakfree_uat_stage;

copy files INTO @breakfree_uat_stage 
FROM @breakfree_sun/breakfree/breakfree_daily_20251215134019.csv.gz;

ls @breakfree_uat_stage;

ls @deleteme;

-- 16/12/2025

use ROLE dba;

use SCHEMA haven_pipeline_qat.retail_sales;

create file format if not exists haven_pipeline_qat.retail_sales.blg_datashare_s3_breakfree_csv_file_format
	TYPE = CSV
    FIELD_DELIMITER = ','
	SKIP_HEADER = 1
   	NULL_IF = ()
   	EMPTY_FIELD_AS_NULL = true
   	COMPRESSION = NONE
   	FIELD_OPTIONALLY_ENCLOSED_BY  = '"';

CREATE STAGE IF NOT EXISTS haven_pipeline_qat.retail_sales.retail_stage_sun
    STORAGE_INTEGRATION = aws_breakfree_sun_newspaper_s3_integration
    URL = 's3://haven-snowflake/incoming/uat/sun/'
    file_format = haven_pipeline_qat.retail_sales.blg_datashare_s3_breakfree_csv_file_format;

CREATE STAGE IF NOT EXISTS haven_pipeline_qat.retail_sales.retail_stage_breakfree
    STORAGE_INTEGRATION = aws_breakfree_sun_newspaper_s3_integration
    URL = 's3://haven-snowflake/incoming/uat/breakfree/'
    file_format = haven_pipeline_qat.retail_sales.blg_datashare_s3_breakfree_csv_file_format;

SHOW stages;

use SCHEMA haven_pipeline.retail_sales;

create file format if not exists haven_pipeline.retail_sales.blg_datashare_s3_breakfree_csv_file_format
	TYPE = CSV
    FIELD_DELIMITER = ','
	SKIP_HEADER = 1
   	NULL_IF = ()
   	EMPTY_FIELD_AS_NULL = true
   	COMPRESSION = NONE
   	FIELD_OPTIONALLY_ENCLOSED_BY  = '"';

CREATE STAGE IF NOT EXISTS haven_pipeline.retail_sales.retail_stage_sun
    STORAGE_INTEGRATION = aws_breakfree_sun_newspaper_s3_integration
    URL = 's3://haven-snowflake/incoming/prod/sun/'
    file_format = haven_pipeline.retail_sales.blg_datashare_s3_breakfree_csv_file_format;

CREATE STAGE IF NOT EXISTS haven_pipeline.retail_sales.retail_stage_breakfree
    STORAGE_INTEGRATION = aws_breakfree_sun_newspaper_s3_integration
    URL = 's3://haven-snowflake/incoming/prod/breakfree/'
    file_format = haven_pipeline.retail_sales.blg_datashare_s3_breakfree_csv_file_format;

SHOW stages;

-- 16/12/2025 - redo stages to combine into a single envrionment stage

use ROLE dba;

use SCHEMA haven_pipeline_qat.retail_sales;

DROP STAGE haven_pipeline_qat.retail_sales.retail_stage_sun;
DROP STAGE haven_pipeline_qat.retail_sales.retail_stage_breakfree;

CREATE STAGE IF NOT EXISTS haven_pipeline_qat.retail_sales.aws_breakfree_sun_newspaper_s3_stage
    STORAGE_INTEGRATION = aws_breakfree_sun_newspaper_s3_integration
    URL = 's3://haven-snowflake/incoming/uat/'
    file_format = haven_pipeline_qat.retail_sales.blg_datashare_s3_breakfree_csv_file_format;

ALTER STAGE haven_pipeline_qat.retail_sales.aws_breakfree_sun_newspaper_s3_stage
SET DIRECTORY = (ENABLE = TRUE, AUTO_REFRESH = TRUE);

ALTER STAGE haven_pipeline_qat.retail_sales.aws_breakfree_sun_newspaper_s3_stage refresh;

SELECT 
    RELATIVE_PATH, 
    SIZE as bytes,
    LAST_MODIFIED,
    FILE_URL
FROM DIRECTORY( @haven_pipeline_qat.retail_sales.aws_breakfree_sun_newspaper_s3_stage );

ls @haven_pipeline_qat.retail_sales.aws_breakfree_sun_newspaper_s3_stage;

use SCHEMA haven_pipeline.retail_sales;

DROP STAGE haven_pipeline.retail_sales.retail_stage_sun;
DROP STAGE haven_pipeline.retail_sales.retail_stage_breakfree;

CREATE STAGE IF NOT EXISTS haven_pipeline.retail_sales.aws_breakfree_sun_newspaper_s3_stage
    STORAGE_INTEGRATION = aws_breakfree_sun_newspaper_s3_integration
    URL = 's3://haven-snowflake/incoming/prod/'
    file_format = haven_pipeline.retail_sales.blg_datashare_s3_breakfree_csv_file_format;

-- 05/01/2026

use ROLE dba;

use SCHEMA haven_pipeline_qat.retail_sales;

create file format if not exists haven_pipeline_qat.retail_sales.blg_datashare_s3_breakfree_json_file_format
  TYPE = JSON
  COMPRESSION = NONE;

use SCHEMA haven_pipeline.retail_sales;

create file format if not exists haven_pipeline.retail_sales.blg_datashare_s3_breakfree_json_file_format
  TYPE = JSON
  COMPRESSION = NONE;

