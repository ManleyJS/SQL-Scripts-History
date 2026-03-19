use role sysadmin;

create warehouse streamlit_file_upload_application_warehouse_xsmall with warehouse_size = 'xsmall' warehouse_type = 'standard' 
	auto_suspend = 60 auto_resume = true min_cluster_count = 1 max_cluster_count = 4 scaling_policy = 'standard';

use role useradmin;

create role _streamlit_file_upload_application_warehouse_xsmall__operator;
create role _streamlit_file_upload_application_warehouse_xsmall__usage;
create role _streamlit_file_upload_application_warehouse_xsmall__monitor;

use role securityadmin;

grant usage, monitor on warehouse streamlit_file_upload_application_warehouse_xsmall to role _streamlit_file_upload_application_warehouse_xsmall__usage;
grant role _streamlit_file_upload_application_warehouse_xsmall__usage to role _streamlit_file_upload_application_warehouse_xsmall__operator;
grant operate, modify on warehouse streamlit_file_upload_application_warehouse_xsmall to role _streamlit_file_upload_application_warehouse_xsmall__operator;
grant monitor on warehouse streamlit_file_upload_application_warehouse_xsmall to role _streamlit_file_upload_application_warehouse_xsmall__monitor;

GRANT ROLE _streamlit_file_upload_application_warehouse_xsmall__usage TO ROLE STREAMLIT_FILE_UPLOAD_APPLICATION;

-- 17/12/2025
-- Add multicluster medium

use role sysadmin;

create warehouse streamlit_file_upload_application_warehouse_medium with warehouse_size = 'medium' warehouse_type = 'standard' 
	auto_suspend = 60 auto_resume = true min_cluster_count = 1 max_cluster_count = 4 scaling_policy = 'standard';

use role useradmin;

create role _streamlit_file_upload_application_warehouse_medium__operator;
create role _streamlit_file_upload_application_warehouse_medium__usage;
create role _streamlit_file_upload_application_warehouse_medium__monitor;

use role securityadmin;

grant usage, monitor on warehouse streamlit_file_upload_application_warehouse_medium to role _streamlit_file_upload_application_warehouse_medium__usage;
grant role _streamlit_file_upload_application_warehouse_medium__usage to role _streamlit_file_upload_application_warehouse_medium__operator;
grant operate, modify on warehouse streamlit_file_upload_application_warehouse_medium to role _streamlit_file_upload_application_warehouse_medium__operator;
grant monitor on warehouse streamlit_file_upload_application_warehouse_medium to role _streamlit_file_upload_application_warehouse_medium__monitor;

GRANT ROLE _streamlit_file_upload_application_warehouse_medium__usage TO ROLE STREAMLIT_FILE_UPLOAD_APPLICATION;


-- 19/12/2025

-- streamlit_file_upload_application_dev
-- arn:aws:iam::328265102953:role/blg-streamlit-file-upload-app-dev-data-role
-- s3: blg-streamlit-file-upload-app-dev-s3
-- BD78472_SFCRole=2_oHvKRwLsp0wSzzhZ1Da9D9sRXVg6

use ROLE accountadmin;

CREATE OR REPLACE STORAGE INTEGRATION blg_streamlit_file_upload_application_dev_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::328265102953:role/blg-streamlit-file-upload-app-dev-data-role'
  STORAGE_AWS_EXTERNAL_ID = 'BD78472_SFCRole=2_oHvKRwLsp0wSzzhZ1Da9D9sRXVg6'
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('s3://blg-streamlit-file-upload-app-dev-s3/')
;

use ROLE securityadmin;

GRANT USAGE ON integration blg_streamlit_file_upload_application_dev_integration TO ROLE dba;
GRANT USAGE ON integration blg_streamlit_file_upload_application_dev_integration TO ROLE streamlit_file_upload_application_dev;

use ROLE dba;

use SCHEMA training.training;

CREATE STAGE training.training.file_uploads_dev_stage
    STORAGE_INTEGRATION = blg_streamlit_file_upload_application_dev_integration
    URL = 's3://blg-streamlit-file-upload-app-dev-s3/';

ls @training.training.file_uploads_dev_stage;

-- production version

-- streamlit_file_upload_application
-- arn:aws:iam::328265102953:role/blg-streamlit-file-upload-app-prod-data-role
-- s3: blg-streamlit-file-upload-app-prod-s3

use ROLE accountadmin;

CREATE OR REPLACE STORAGE INTEGRATION blg_streamlit_file_upload_application_prod_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::328265102953:role/blg-streamlit-file-upload-app-prod-data-role'
  STORAGE_AWS_EXTERNAL_ID = 'BD78472_SFCRole=2_oHvKRwLsp0wSzzhZ1Da9D9sRXVg6'
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('s3://blg-streamlit-file-upload-app-prod-s3/')
;

use ROLE securityadmin;

GRANT USAGE ON integration blg_streamlit_file_upload_application_prod_integration TO ROLE dba;
GRANT USAGE ON integration blg_streamlit_file_upload_application_prod_integration TO ROLE streamlit_file_upload_application;

use ROLE dba;

use SCHEMA training.training;

CREATE STAGE training.training.file_uploads_prod_stage
    STORAGE_INTEGRATION = blg_streamlit_file_upload_application_prod_integration
    URL = 's3://blg-streamlit-file-upload-app-prod-s3/';

ls @training.training.file_uploads_prod_stage;

-- From Snowsight

grant role _haven_master__streamlits__usage to role STREAMLIT_FILE_UPLOAD_APPLICATION;

show grants to role STREAMLIT_FILE_UPLOAD_APPLICATION;

grant create stage on schema haven_master.streamlits to role streamlit_file_upload_application;

GRANT ROLE _HAVEN_MASTER__STREAMLITS__USAGE to role HAVEN_PERFORMANCE_MARKETING;

grant role HAVEN_PERFORMANCE_MARKETING to user sarunasjatautis;


-- 22/01/2026

use ROLE securityadmin;

SHOW roles LIKE '%file_upload%;'

Grant ROLE _HAVEN_STAGING_DEV__REVENUE_MANAGEMENT_FILE_UPLOADS__creator TO ROLE STREAMLIT_FILE_UPLOAD_APPLICATION_DEV;

GRANT USAGE ON streamlit HAVEN_MASTER_DEV.STREAMLITS.FILE_UPLOAD_STREAMLIT_APP TO role HAVEN_REVENUE_MANAGEMENT_DEV;
GRANT USAGE ON streamlit HAVEN_MASTER.STREAMLITS.FILE_UPLOAD_STREAMLIT_APP TO role HAVEN_REVENUE_MANAGEMENT;

GRANT ROLE _haven_master_dev__streamlits__usage TO ROLE HAVEN_REVENUE_MANAGEMENT_DEV;
GRANT ROLE _haven_master__streamlits__usage TO ROLE HAVEN_REVENUE_MANAGEMENT;
