use role accountadmin;

show integrations;

create or replace storage integration aws_s3_digital_ownership_integration_dev
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::083208432960:role/dev-ownership-snowflake-rw'
  enabled = true
  storage_allowed_locations = ('s3://dev-ownership-snowflake-rw/');

create or replace storage integration aws_s3_digital_ownership_integration_staging
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::083208432960:role/staging-ownership-snowflake-rw'
  enabled = true
  storage_allowed_locations = ('s3://staging-ownership-snowflake-rw/');

create or replace storage integration aws_s3_digital_ownership_integration_prod
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::753707732315:role/prod-ownership-snowflake-rw'
  enabled = true
  storage_allowed_locations = ('s3://prod-ownership-snowflake-rw/');

desc integration aws_s3_digital_ownership_integration_dev;
desc integration aws_s3_digital_ownership_integration_staging;
desc integration aws_s3_digital_ownership_integration_prod;

use role bourne_accountadmin;

create or replace storage integration aws_s3_digital_experience_arrivals_integration_dev
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::083208432960:role/dev-experience-arrivals-sync-snowflake'
  enabled = true
  storage_allowed_locations = ('s3://haven-dev-experience-arrivals-sync/');

desc integration aws_s3_digital_experience_arrivals_integration_dev;

