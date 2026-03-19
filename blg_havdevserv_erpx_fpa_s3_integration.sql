use role accountadmin;

create storage integration blg_havdevserv_erpx_fpa_s3_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::317065479423:role/blg-havdevserv-snowflake-erpx-fpa-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=2_pA3a4J3Qzzq17dqzISPM53wkUUP5'
  storage_allowed_locations = ('s3://blg-havdevserv-erpx-fpa-s3/');
 
DESC integration blg_havdevserv_erpx_fpa_s3_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_havdevserv_erpx_fpa_s3_integration TO ROLE dba;
GRANT USAGE ON integration blg_havdevserv_erpx_fpa_s3_integration TO ROLE HAVEN_DATA_TRANSFORM;

SHOW integrations;