use role accountadmin;

-- blg-havdevserv-marketing-export-s3
-- arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-marketing-bucket-role
-- BD78472_SFCRole=81qt0n9nQvWo2s88c1a53iYSSvhaiL
-- BD78472_SFCRole=JZxA3jiT74aFF8BRtqV3gPKjYe1K

create storage integration blg_havdevserv_marketing_export_s3_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-marketing-bucket-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=81qt0n9nQvWo2s88c1a53iYSSvhaiL'
  storage_allowed_locations = ('s3://blg-havdevserv-marketing-export-s3/');

ALTER integration blg_havdevserv_marketing_export_s3_integration
SET storage_aws_external_id = 'BD78472_SFCRole=JZxA3jiT74aFF8BRtqV3gPKjYe1K';
 
DESC integration blg_havdevserv_marketing_export_s3_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_havdevserv_marketing_export_s3_integration TO ROLE dba;
GRANT USAGE ON integration blg_havdevserv_marketing_export_s3_integration TO ROLE HAVEN_DATA_TRANSFORM;

USE ROLE dba;

SHOW integrations;

-- 19/03/2025

use role accountadmin;

-- blg-havprodserv-marketing-export-s3
-- arn:aws:iam::445123880475:role/blg-havprodserv-snowflake-marketing-bucket-role
-- BD78472_SFCRole=JZxA3jiT74aFF8BRtqV3gPKjYe1K
-- blg_havprodserv_marketing_export_s3_integration


create storage integration blg_havprodserv_marketing_export_s3_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::445123880475:role/blg-havprodserv-snowflake-marketing-bucket-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=JZxA3jiT74aFF8BRtqV3gPKjYe1K'
  storage_allowed_locations = ('s3://blg-havprodserv-marketing-export-s3/');

DESC integration blg_havprodserv_marketing_export_s3_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_havprodserv_marketing_export_s3_integration TO ROLE dba;
GRANT USAGE ON integration blg_havprodserv_marketing_export_s3_integration TO ROLE HAVEN_DATA_TRANSFORM;

USE ROLE dba;

SHOW integrations;

-- 24/03/2025

use role dba;

use database haven_pipeline;
use schema marketing;

create or replace file format marketing_csv_file_format 
    TYPE = CSV 
    FIELD_DELIMITER = ',' 
    SKIP_HEADER = 1 
    NULL_IF = () 
    EMPTY_FIELD_AS_NULL = true 
    COMPRESSION = NONE 
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
;

create or replace stage snowflake_stage_marketing 
  STORAGE_INTEGRATION = BLG_HAVPRODSERV_MARKETING_EXPORT_S3_INTEGRATION
  URL = 's3://blg-havprodserv-marketing-export-s3/'
  file_format = marketing_csv_file_format 
  ENCRYPTION = (TYPE='AWS_SSE_S3')
;

