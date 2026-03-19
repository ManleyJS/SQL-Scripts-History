use role accountadmin;

create storage integration blg_prod_pricer_revenue_management_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::753707732315:role/blg-prod-snowflake-by-pricer-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=2_PVho0FoXj4tN9dVA46IW0iPXN7eD'
  storage_allowed_locations = ('s3://haven-prod-foundation-blueyonder-pricer/');
 
DESC integration blg_prod_pricer_revenue_management_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_prod_pricer_revenue_management_integration TO ROLE dba;

--GRANT USAGE ON integration blg_prod_pricer_revenue_management_integration TO ROLE HAVEN_DATA_TRANSFORM;
--GRANT USAGE ON integration blg_prod_pricer_revenue_management_integration TO ROLE 

USE ROLE dba;

USE SCHEMA training.training;

CREATE STAGE blg_prod_pricer_revenue_management_uploads_stage
storage_integration =  blg_prod_pricer_revenue_management_integration
url = 's3://haven-prod-foundation-blueyonder-pricer/uploads';

LS @blg_prod_pricer_revenue_management_uploads_stage;

CREATE STAGE blg_prod_pricer_revenue_management_stage
storage_integration =  blg_prod_pricer_revenue_management_integration
url = 's3://haven-prod-foundation-blueyonder-pricer';

ls @blg_prod_pricer_revenue_management_stage;

USE ROLE dba;

USE SCHEMA haven_pipeline.blueyonder;

CREATE STAGE haven_pipeline.blueyonder.pricer_revenue_management_uploads_stage
storage_integration =  blg_prod_pricer_revenue_management_integration
url = 's3://haven-prod-foundation-blueyonder-pricer/uploads';

-- 25/11/2024

use role accountadmin;

create storage integration blg_dev_pricer_revenue_management_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::083208432960:role/blg-dev-snowflake-by-pricer-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=2_PVho0FoXj4tN9dVA46IW0iPXN7eD'
  storage_allowed_locations = ('s3://haven-dev-foundation-blueyonder-pricer/');
 
DESC integration blg_dev_pricer_revenue_management_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_dev_pricer_revenue_management_integration TO ROLE dba;

GRANT USAGE ON integration blg_dev_pricer_revenue_management_integration TO ROLE HAVEN_DATA_TRANSFORM;

USE ROLE dba;

CREATE STAGE training.training.pricer_revenue_management_dev_stage
storage_integration =  blg_dev_pricer_revenue_management_integration
url = 's3://haven-dev-foundation-blueyonder-pricer';

LS @training.training.pricer_revenue_management_dev_stage;


-- into production

use role dba;

use database haven_pipeline;
use schema blueyonder;
 
create or replace file format haven_pipeline.blueyonder.csv_file_format_pricer 
    TYPE = CSV 
    FIELD_DELIMITER = ',' 
    SKIP_HEADER = 1 
    NULL_IF = () 
    EMPTY_FIELD_AS_NULL = true 
    COMPRESSION = NONE 
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
;
 
create or replace stage haven_pipeline.blueyonder.seaware_stage_pricer
  STORAGE_INTEGRATION = blg_prod_pricer_revenue_management_integration
  URL = 's3://haven-prod-foundation-blueyonder-pricer/'
  file_format = csv_file_format_pricer 
  ENCRYPTION = (TYPE='AWS_SSE_S3');
  
 LS @haven_pipeline.blueyonder.seaware_stage_pricer/upload/;