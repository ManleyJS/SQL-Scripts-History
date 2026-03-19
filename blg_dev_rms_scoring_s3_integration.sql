--snowflake role arn- arn:aws:iam::083208432960:role/blg-dev-snowflake-rms-scoring-role
--external_id: BD78472_SFCRole=v6z3Fnp8h7s1AlDpCXsuTfgJukexVK 
--Integration Name: blg_dev_rms_scoring_s3_integration
--Bucket Name: haven-dev-sales-integrationsapplications-pricing

use ROLE accountadmin;

create storage integration blg_dev_rms_scoring_s3_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::083208432960:role/blg-dev-snowflake-rms-scoring-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=v6z3Fnp8h7s1AlDpCXsuTfgJukexVK'
  storage_allowed_locations = ('s3://haven-dev-sales-integrationsapplications-pricin/');

alter storage integration blg_dev_rms_scoring_s3_integration
set  storage_allowed_locations = ('s3://haven-dev-sales-integrationsapplications-pricing/');

DESC integration blg_dev_rms_scoring_s3_integration;

use ROLE securityadmin;

GRANT USAGE ON integration blg_dev_rms_scoring_s3_integration TO ROLE dba;
GRANT USAGE ON integration blg_dev_rms_scoring_s3_integration TO ROLE haven_dbt_development;

