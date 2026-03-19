use role accountadmin;

create storage integration blg_havdevserv_blapi_s3_technet_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::317065479423:role/blg-dev-snowflake-blapi-role-technet'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=v6z3Fnp8h7s1AlDpCXsuTfgJukexVK'
  storage_allowed_locations = ('s3://blg-dev-blapi-s3-technet/');
 
DESC integration blg_havdevserv_blapi_s3_technet_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_havdevserv_blapi_s3_technet_integration TO ROLE dba;
GRANT USAGE ON integration blg_havdevserv_blapi_s3_technet_integration TO ROLE HAVEN_DATA_TRANSFORM;
GRANT USAGE ON integration blg_service_wrn_dev_egress_data_integration TO ROLE 


USE ROLE accountadmin;

SHOW integrations;

alter storage integration blg_havdevserv_blapi_s3_technet_integration
SET storage_aws_role_arn = 'arn:aws:iam::317065479423:role/blg-dev-snowflake-blapi-role-technet'
storage_allowed_locations = ('s3://blg-dev-blapi-s3-technet/');

create storage integration blg_havprodserv_blapi_s3_technet_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/blg-pricing-and-availability-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=v6z3Fnp8h7s1AlDpCXsuTfgJukexVK'
  storage_allowed_locations = ('s3://blg-pricing-and-availability/');

USE ROLE securityadmin;

GRANT USAGE ON integration blg_havdevserv_blapi_s3_technet_integration TO ROLE dba;
GRANT USAGE ON integration blg_havdevserv_blapi_s3_technet_integration TO ROLE HAVEN_DATA_TRANSFORM;
GRANT USAGE ON integration blg_havprodserv_blapi_s3_technet_integration TO ROLE dba;
GRANT USAGE ON integration blg_havprodserv_blapi_s3_technet_integration TO ROLE HAVEN_DATA_TRANSFORM;
 
 