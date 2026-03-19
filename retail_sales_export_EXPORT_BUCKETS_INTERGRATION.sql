use role accountadmin;

create storage integration blg_havdevserv_retail_sales_export_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-retail-sales-export-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=81qt0n9nQvWo2s88c1a53iYSSvhaiL'
  storage_allowed_locations = ('s3://blg-havdevserv-retail-sales-export/');
 
DESC integration blg_havdevserv_retail_sales_export_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_havdevserv_retail_sales_export_integration TO ROLE dba;
GRANT USAGE ON integration blg_havdevserv_retail_sales_export_integration TO ROLE haven_data_transform;
GRANT USAGE ON integration blg_havdevserv_retail_sales_export_integration TO ROLE haven_dbt_transform;


