use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;

call haven_master.procedures.schema_role_creation('haven_pipeline', 'papajohns');

use ROLE dba;
use warehouse dba_wh;
use database haven_pipeline;
use SCHEMA papajohns;

create or replace schema papajohns;


CREATE STORAGE INTEGRATION blg_havprodserv_sftp_datashare_s3_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::445123880475:role/blg-havprodserv-snowflake-sftp-datashare-role'
  STORAGE_AWS_EXTERNAL_ID = 'BD78472_SFCRole=2_W087NnaOFqFAPWB2UJKh/0fKdA4='
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('*')
;

use ROLE accountadmin;

ALTER STORAGE INTEGRATION blg_havprodserv_sftp_datashare_s3_integration
SET STORAGE_ALLOWED_LOCATIONS = ('s3://blg-havprodserv-sftp-datashare/')

GRANT USAGE ON integration blg_havprodserv_sftp_datashare_s3_integration TO ROLE dba;

use ROLE dba;
 
  create file format if not exists haven_pipeline.papajohns.blg_havprodserv_sftp_datashare_s3_papajohns_csv_file_format
    TYPE = CSV
    FIELD_DELIMITER = ','
    SKIP_HEADER = 1
    NULL_IF = ()
    EMPTY_FIELD_AS_NULL = true
    COMPRESSION = NONE 
    FIELD_OPTIONALLY_ENCLOSED_BY  = '"';
 
create stage if not exists haven_pipeline.papajohns.blg_havprodserv_sftp_datashare_s3_papajohns_stage
    STORAGE_INTEGRATION = blg_havprodserv_sftp_datashare_s3_integration
    URL = 's3://blg_havprodserv_sftp_datashare/'
    file_format = blg_havprodserv_sftp_datashare_s3_papajohns_csv_file_format
    ENCRYPTION = (TYPE='AWS_SSE_S3')
    ;

alter stage haven_pipeline.papajohns.blg_havprodserv_sftp_datashare_s3_papajohns_stage
SET URL = 's3://blg-havprodserv-sftp-datashare/'

ls @haven_pipeline.papajohns.blg_havprodserv_sftp_datashare_s3_papajohns_stage;


use ROLE securityadmin;

REVOKE ROLE _haven_pipeline__papajohns__reader FROM ROLE haven_dbt_pipeline;
GRANT ROLE _haven_pipeline__papajohns__creator TO ROLE haven_dbt_pipeline;


use ROLE haven_dbt_pipeline;

use SCHEMA haven_pipeline.papajohns;

SHOW stages;

ls @haven_pipeline.papajohns.blg_havprodserv_sftp_datashare_s3_papajohns_stage;

use ROLE securityadmin;

