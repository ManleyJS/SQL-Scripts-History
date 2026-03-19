use role accountadmin;

create storage integration blg_service_wrn_dev_egress_data_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::992382594712:role/warner-dev-snowpipe-s3-read-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=Jt9yGS9goPhBnJptlaLf7NkZzVwSHr'
  storage_allowed_locations = ('s3://tf-service-wrn-dev-egress-data/');
 
DESC integration blg_service_wrn_dev_egress_data_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_service_wrn_dev_egress_data_integration TO ROLE dba;
GRANT USAGE ON integration blg_service_wrn_dev_egress_data_integration TO ROLE WARNER_TERRAFORM_TRANSFORM_DEV;
GRANT USAGE ON integration blg_service_wrn_dev_egress_data_integration TO ROLE 



