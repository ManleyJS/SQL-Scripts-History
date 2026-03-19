-- arn:aws:iam::753707732315:role/blg-prod-snowflake-rms-scoring-role
-- s3://haven-prod-sales-integrationsapplications-pricing/
-- BD78472_SFCRole=2_m2dS0a9nISUVCODZZrbKokRHsY41
-- BD78472_SFCRole=73lh0MSBf1XIiZ6YvJMqmiBcTQBX

use ROLE accountadmin;

show integrations;

create storage integration haven_prod_sales_integrations_applications_pricing_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::753707732315:role/blg-prod-snowflake-rms-scoring-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=73lh0MSBf1XIiZ6YvJMqmiBcTQBX'
  storage_allowed_locations = ('s3://haven-prod-sales-integrationsapplications-pricing/');


DESC integration haven_prod_sales_integrations_applications_pricing_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration haven_prod_sales_integrations_applications_pricing_integration TO ROLE dba;

use ROLE dba;

use SCHEMA training.training;

create STAGE training.training.haven_prod_sales_integrations_applications_pricing_stage
  STORAGE_INTEGRATION = haven_prod_sales_integrations_applications_pricing_integration
  URL = 's3://haven-prod-sales-integrationsapplications-pricing/'
;

ls @training.training.haven_prod_sales_integrations_applications_pricing_stage;

-- 17/07/2025

-- rebuilding intwegration to align with the required names

use ROLE accountadmin;

show integrations;

drop storage integration haven_prod_sales_integrations_applications_pricing_integration;

create storage integration blg_prod_rms_scoring_s3_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::753707732315:role/blg-prod-snowflake-rms-scoring-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=73lh0MSBf1XIiZ6YvJMqmiBcTQBX'
  storage_allowed_locations = ('s3://haven-prod-sales-integrationsapplications-pricing/');


DESC integration blg_prod_rms_scoring_s3_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_prod_rms_scoring_s3_integration TO ROLE dba;

use ROLE dba;

use SCHEMA training.training;

drop STAGE training.training.haven_prod_sales_integrations_applications_pricing_stage;

create STAGE training.training.blg_prod_rms_scoring_s3_stage
  STORAGE_INTEGRATION = blg_prod_rms_scoring_s3_integration
  URL = 's3://haven-prod-sales-integrationsapplications-pricing/'
;

ls @training.training.blg_prod_rms_scoring_s3_stage;

use SCHEMA haven_pipeline.cyhh_pricing_pilot;

create or replace file format haven_pipeline_qat.cyhh_pricing_pilot.blg_dev_rms_cyhh_pricing_s3_file_format
TYPE = CSV
VALIDATE_UTF8 = true,
SKIP_BLANK_LINES = false,
REPLACE_INVALID_CHARACTERS = false,
EMPTY_FIELD_AS_NULL = true,
SKIP_BYTE_ORDER_MARK = true,
ENCODING = UTF8,
MULTI_LINE = TRUE
--skip_header = 1
compression = none;


show file formats;

create or replace stage HAVEN_PIPELINE.CYHH_PRICING_PILOT.BLG_PROD_RMS_CYHH_PRICING_S3_STAGE
  STORAGE_INTEGRATION = blg_prod_rms_scoring_s3_integration
  URL = 's3://haven-prod-sales-integrationsapplications-pricing/'
  file_format = HAVEN_PIPELINE.CYHH_PRICING_PILOT.BLG_PROD_RMS_CYHH_PRICING_S3_FILE_FORMAT 
  ENCRYPTION = (TYPE='AWS_SSE_S3');

ls @HAVEN_PIPELINE.CYHH_PRICING_PILOT.BLG_PROD_RMS_CYHH_PRICING_S3_STAGE;