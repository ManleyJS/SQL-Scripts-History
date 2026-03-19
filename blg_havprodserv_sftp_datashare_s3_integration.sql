use ROLE accountadmin;

-- role Arn: arn:aws:iam::445123880475:role/blg-havprodserv-snowflake-sftp-datashare-role
-- S3-bucket: blg-havprodserv-sftp-datashare
-- External Id: BD78472_SFCRole=2_W087NnaOFqFAPWB2UJKh/0fKdA4=

create storage integration blg_havprodserv_sftp_datashare_s3_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::445123880475:role/blg-havprodserv-snowflake-marketing-bucket-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=2_W087NnaOFqFAPWB2UJKh/0fKdA4='
  storage_allowed_locations = ('s3://blg-havprodserv-sftp-datashare/');

DESC integration blg_havprodserv_sftp_datashare_s3_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_havprodserv_sftp_datashare_s3_integration TO ROLE dba;
GRANT USAGE ON integration blg_havprodserv_sftp_datashare_s3_integration TO ROLE HAVEN_DATA_TRANSFORM;

USE ROLE dba;
