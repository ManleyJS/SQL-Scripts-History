use role accountadmin;

create storage integration blg_rms_static_data_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/blg-rms-static-data-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=2_qTpsGH1Gp3uiK3ZR1EgHvKT2eowy'
  storage_allowed_locations = ('s3://blg-rms-data-s3/');
 
DESC integration blg_rms_static_data_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_rms_static_data_integration TO ROLE dba;
GRANT USAGE ON integration blg_rms_static_data_integration TO ROLE HAVEN_DATA_TRANSFORM;

USE ROLE accountadmin;

SHOW integrations;

alter storage integration blg_rms_static_data_integration
SET storage_aws_role_arn = ''
storage_allowed_locations = ('');

create storage integration blg_havprodserv_blapi_s3_technet_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/blg-pricing-and-availability-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=v6z3Fnp8h7s1AlDpCXsuTfgJukexVK'
  storage_allowed_locations = ('s3://blg-pricing-and-availability/');

USE ROLE securityadmin;

GRANT USAGE ON integration blg_rms_static_data_integration TO ROLE dba;
GRANT USAGE ON integration blg_rms_static_data_integration TO ROLE HAVEN_DATA_TRANSFORM;
GRANT USAGE ON integration blg_havprodserv_blapi_s3_technet_integration TO ROLE dba;
GRANT USAGE ON integration blg_havprodserv_blapi_s3_technet_integration TO ROLE HAVEN_DATA_TRANSFORM;
 
 