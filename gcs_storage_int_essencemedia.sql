USE ROLE accountadmin;

SHOW integrations;

DROP integration gcs_storage_int_essencemedia;

create storage integration gcs_blg_target_essencemedia_integration
  type = external_stage
  storage_provider = gcs
  enabled = true
  storage_allowed_locations = ('gcs://ext-haven-snowflake/GA4');

 DESC integration gcs_blg_target_essencemedia_integration;
 
-- htvjzbnoqi@sfc-ie-1-ugt.iam.gserviceaccount.com

USE ROLE securityadmin;

GRANT USAGE ON integration gcs_blg_target_essencemedia_integration TO ROLE dba;
GRANT USAGE ON integration gcs_blg_target_essencemedia_integration TO ROLE haven_data_transform;
