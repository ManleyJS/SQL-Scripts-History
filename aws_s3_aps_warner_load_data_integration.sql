use role bourne_accountadmin;

create or replace storage integration aws_s3_aps_warner_load_data_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::541161938971:role/warner_snowpipe_s3_read_role'
  enabled = true
  storage_allowed_locations = ('s3://aps-warner-load-data/');

desc integration aws_s3_aps_warner_load_data_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration aws_s3_aps_warner_load_data_integration TO ROLE dba;
GRANT USAGE ON integration aws_s3_aps_warner_load_data_integration TO ROLE warner_base_dbt_dev;
GRANT USAGE ON integration aws_s3_aps_warner_load_data_integration TO ROLE warner_base_dbt_sit;
GRANT USAGE ON integration aws_s3_aps_warner_load_data_integration TO ROLE warner_base_terraform_dev;
GRANT USAGE ON integration aws_s3_aps_warner_load_data_integration TO ROLE warner_base_terraform_sit;
