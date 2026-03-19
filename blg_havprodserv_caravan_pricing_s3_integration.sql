use ROLE accountadmin;

-- snowflake role arn- arn:aws:iam::328265102953:role/blg-rms-caravan-pricing-data-role
-- external_id: BD78472_SFCRole=2_qTpsGH1Gp3uiK3ZR1EgHvKT2eowy 
-- Integration Name: blg_havprodserv_caravan_pricing_s3_integration
-- blg-rms-caravan-pricing-s3

create storage integration blg_havprodserv_caravan_pricing_s3_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/blg-rms-caravan-pricing-data-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=2_qTpsGH1Gp3uiK3ZR1EgHvKT2eowy'
  storage_allowed_locations = ('s3://blg-rms-caravan-pricing-s3/');

use ROLE securityadmin;

GRANT USAGE ON integration blg_havprodserv_caravan_pricing_s3_integration TO ROLE dba;
GRANT USAGE ON integration blg_havprodserv_caravan_pricing_s3_integration TO ROLE haven_dbt_development;