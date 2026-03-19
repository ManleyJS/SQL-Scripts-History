use role accountadmin;

create storage integration aws_s3_finance_cube_dev_rds_integration    
type = external_stage    
storage_provider = s3    
storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-finance-cube-snowflake-role'    
enabled = true    
storage_aws_external_id = 'BD78472_SFCRole=2_R130GO2Hyescmb2p9Z0pD0G8tEGg';
storage_allowed_locations = ('s3://blg-havdevserv-finance-cube-dev-rds-integration');

alter storage integration aws_s3_finance_cube_dev_rds_integration
set storage_aws_external_id = 'BD78472_SFCRole=2_R130GO2Hyescmb2p9Z0pD0G8tEGg';

desc integration aws_s3_finance_cube_dev_rds_integration;

grant usage on integration aws_s3_finance_cube_dev_rds_integration to role dba;
grant usage on integration aws_s3_finance_cube_dev_rds_integration to role haven_data_transform;

use role dba;

use warehouse dba_wh;

use schema haven_pipeline.finance_cube_erpx;


create or replace file format csv_file_format_fin_cube_erpx     
TYPE = CSV     
FIELD_DELIMITER = ','     
NULL_IF = ()    
COMPRESSION = NONE     
FIELD_OPTIONALLY_ENCLOSED_BY = '"';

create or replace stage finance_cube_erpx_stage  
STORAGE_INTEGRATION = aws_s3_finance_cube_dev_rds_integration 
URL = 's3://blg-havdevserv-finance-cube-dev-rds-integration/'  
file_format = csv_file_format_fin_cube_erpx   
ENCRYPTION = (TYPE='AWS_SSE_S3'); 

ls @finance_cube_erpx_stage;

drop stage finance_cube_erpx_stage;
drop file format csv_file_format_fin_cube_erpx;

drop integration aws_s3_finance_cube_dev_rds_integration;

-- 16/10/2024

use role accountadmin;

-- blg-havprodserv-finance-cube-prod-rds-integration
-- arn:aws:iam::445123880475:role/blg-havprodsrv-finance-cube-snowflake-role
-- BD78472_SFCRole=2_5x3mYgQMLcDLOBBH8zH0tJt16quq

create storage integration aws_s3_finance_cube_prod_rds_integration    
type = external_stage    
storage_provider = s3    
storage_aws_role_arn = 'arn:aws:iam::445123880475:role/blg-havprodsrv-finance-cube-snowflake-role'    
enabled = true    
storage_aws_external_id = 'BD78472_SFCRole=2_5x3mYgQMLcDLOBBH8zH0tJt16quq'
storage_allowed_locations = ('s3://blg-havprodserv-finance-cube-prod-rds-integration');

alter storage integration aws_s3_finance_cube_prod_rds_integration    
SET storage_aws_role_arn = 'arn:aws:iam::445123880475:role/blg-havprodserv-finance-cube-snowflake-role';    


desc integration aws_s3_finance_cube_prod_rds_integration;

grant usage on integration aws_s3_finance_cube_prod_rds_integration to role dba;
grant usage on integration aws_s3_finance_cube_prod_rds_integration to role haven_data_transform;

USE ROLE DBA;

use schema haven_pipeline.finance_cube_erpx;

create or replace stage finance_cube_erpx_stage  
STORAGE_INTEGRATION = aws_s3_finance_cube_prod_rds_integration  
URL = 's3://blg-havprodserv-finance-cube-prod-rds-integration'  
file_format = csv_file_format_fin_cube_erpx   
ENCRYPTION = (TYPE='AWS_SSE_S3');

LS @finance_cube_erpx_stage;

USE SCHEMA training.training;

create or replace stage TRAINING.TRAINiNG.finance_cube_erpx_stage  
STORAGE_INTEGRATION = aws_s3_finance_cube_prod_rds_integration 
URL = 's3://blg-havprodserv-finance-cube-prod-rds-integration/'  
ENCRYPTION = (TYPE='AWS_SSE_S3'); 

ls @finance_cube_erpx_stage;




