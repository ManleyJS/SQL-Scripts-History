-- blg-havprodserv-erpx-fpa-s3
-- arn:aws:iam::445123880475:role/blg-havprodserv-snowflake-erpx-fpa-role
-- blg_havprodserv_erpx_fpa_s3_integration


use ROLE accountadmin;

create storage integration blg_havprodserv_erpx_fpa_s3_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::445123880475:role/blg-havprodserv-snowflake-erpx-fpa-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=2_1ncxi2oRYSJ3o1dvTuXIPvvq0Jk='
  storage_allowed_locations = ('s3://blg-havprodserv-erpx-fpa-s3/');

DESC integration blg_havprodserv_erpx_fpa_s3_integration;

use ROLE securityadmin;

GRANT USAGE ON integration blg_havprodserv_erpx_fpa_s3_integration TO ROLE dba;

use role dba;

use schema haven_pipeline.fpa_erpx;

create file format haven_pipeline.fpa_erpx.ERPX_FPA_FILE_FORMAT
TYPE = CSV 
FIELD_DELIMITER = ',' 
NULL_IF = () 
EMPTY_FIELD_AS_NULL = false
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
COMPRESSION = NONE;
 
CREATE STAGE haven_pipeline.fpa_erpx.blg_havprodserv_erpx_fpa_stage
URL = 's3://blg-havprodserv-erpx-fpa-s3/'
STORAGE_INTEGRATION = BLG_HAVPRODSERV_ERPX_FPA_S3_INTEGRATION
FILE_FORMAT = ERPX_FPA_FILE_FORMAT;
