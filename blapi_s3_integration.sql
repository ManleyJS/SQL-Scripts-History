use role accountadmin;

desc integration blg_sandbox_blapi_s3_integration_sandbox;

create storage integration blg_sandbox_blapi_s3_integration_sandbox
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::317065479423:role/blg-sandbox-snowflake-blapi-role'
  enabled = true
  storage_allowed_locations = ('s3://blg-sandbox-blapi-s3/')
  STORAGE_AWS_EXTERNAL_ID ;


create storage integration blg_sandbox_qualtrics_s3_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-qualtrics-role'
  enabled = true
  storage_allowed_locations = ('s3://blg-havdevserv-qualtrics-data-s3/');
  
  desc integration blg_sandbox_qualtrics_s3_integration;

use role securityadmin;

grant role _haven_pipeline__survey__creator to role haven_dbt_pipeline;
grant usage on integration blg_sandbox_qualtrics_s3_integration to role haven_dbt_pipeline;

use role sysadmin;
show warehouses like 'bourne%';

use role useradmin;

create role haven_blapi_pricing_integration;

create user haven_blapi_pricing_integration
login_name = haven.blapi.pricing.integration
password = 'm6rJnHhJdC44GwA4'
display_name = 'Haven BLAPI Pricing Integration Service Account'
comment = 'Haven BLAPI Pricing Integration Service Account'
default_role = haven_blapi_pricing_integration
DEFAULT_WAREHOUSE = BOURNE_BATCH_DATALOAD_XSMALL;

use role securityadmin;

show roles like '_bourne_batch_datal%';
grant role _BOURNE_BATCH_DATALOAD__WAREHOUSE__USAGE to role haven_blapi_pricing_integration;
grant role _haven_raw__blapi_pricing__creator to role haven_blapi_pricing_integration;
grant usage on integration blg_sandbox_blapi_s3_integration_sandbox to role dba;
grant usage on integration blg_sandbox_blapi_s3_integration_sandbox to role haven_blapi_pricing_integration;

grant role haven_blapi_pricing_integration to user santoshnair;