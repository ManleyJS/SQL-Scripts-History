use role accountadmin;

create storage integration blg_havdevserv_snowflake_lettings_data_export_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-lettings-data-export-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=jLlsBbD96Y4n8JPJPdOgFgqMsqaiT4'
  storage_allowed_locations = ('s3://blg-havdevserv-lettings-data/');
 
DESC integration blg_havdevserv_snowflake_lettings_data_export_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_havdevserv_snowflake_lettings_data_export_integration TO ROLE dba;
GRANT USAGE ON integration blg_havdevserv_snowflake_lettings_data_export_integration TO ROLE haven_data_transform;
GRANT USAGE ON integration blg_havdevserv_retail_sales_export_integration TO ROLE haven_dbt_transform;


