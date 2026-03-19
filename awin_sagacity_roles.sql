use role accountadmin;

create storage integration blg_havdevserv_seg_s3_integration_dev
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-seg-role'
  enabled = true
  storage_allowed_locations = ('s3://blg-havdevserv-seg-s3/');

create storage integration blg_havprodserv_seg_s3_integration_prod
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::445123880475:role/blg-havprodserv-snowflake-seg-role'
  enabled = true
  storage_allowed_locations = ('s3://blg-havprodserv-seg-s3/');

create storage integration blg_havdevserv_awin_s3_integration_dev
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-awin-role'
  enabled = true
  storage_allowed_locations = ('s3://blg-havdevserv-awin-s3/');

create storage integration blg_havprodserv_awin_s3_integration_prod
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::445123880475:role/blg-havprodserv-snowflake-awin-role'
  enabled = true
  storage_allowed_locations = ('s3://blg-havprodserv-awin-s3/');

  
show integrations;


desc integration blg_havdevserv_seg_s3_integration_dev;
desc integration blg_havprodserv_seg_s3_integration_prod;
desc integration blg_havdevserv_awin_s3_integration_dev;
desc integration blg_havprodserv_awin_s3_integration_prod;

use role securityadmin;
grant usage on integration blg_havdevserv_seg_s3_integration_dev to role dba;
grant usage on integration blg_havprodserv_seg_s3_integration_prod to role dba;
grant usage on integration blg_havdevserv_awin_s3_integration_dev to role dba;
grant usage on integration blg_havprodserv_awin_s3_integration_prod to role dba;

grant usage on integration blg_havdevserv_seg_s3_integration_dev to role haven_dbt_transform_dev;
grant usage on integration blg_havprodserv_seg_s3_integration_prod to role haven_dbt_transform;
grant usage on integration blg_havdevserv_awin_s3_integration_dev to role haven_dbt_transform_dev;
grant usage on integration blg_havprodserv_awin_s3_integration_prod to role haven_dbt_transform;

grant usage on integration blg_havdevserv_seg_s3_integration_dev to role haven_data_transform_narayanavelaga;
grant usage on integration blg_havprodserv_seg_s3_integration_prod to role haven_data_transform_narayanavelaga;
grant usage on integration blg_havdevserv_awin_s3_integration_dev to role haven_data_transform_narayanavelaga;
grant usage on integration blg_havprodserv_awin_s3_integration_prod to role haven_data_transform_narayanavelaga;

  use role dba;

  use schema training.training;

create or replace file format ff_sagacity_csv
type = CSV;  
 
create or replace stage stg_sagacity_sftp
  STORAGE_INTEGRATION = blg_havdevserv_seg_s3_integration_dev
  URL = 's3://blg-havdevserv-seg-s3/'
  file_format = ff_sagacity_csv
;

ls @stg_sagacity_sftp;



grant usage on integration aws_s3_digital_integration to role haven_batch_dataload;

use role securityadmin;

show integrations like 'blg_havdevserv_seg_s3_%';

grant usage on integration blg_havdevserv_awin_s3_integration_dev to role haven_data_transform;
grant usage on integration blg_havdevserv_seg_s3_integration_dev to role haven_data_transform;
grant usage on integration blg_havprodserv_awin_s3_integration_prod to role haven_data_transform;
grant usage on integration blg_havprodserv_seg_s3_integration_prod to role haven_data_transform;

show roles like 'haven_data_%';



USE ROLE useradmin;

SHOW users LIKE '%naray%';

CREATE ROLE haven_awin_integration;
CREATE ROLE haven_sagacity_integration;

USE ROLE securityadmin;

SHOW ROLES LIKE '%task%';

GRANT USAGE on integration blg_havprodserv_awin_s3_integration_prod TO ROLE haven_awin_integration;
GRANT ROLE _haven_raw__awin__creator TO ROLE haven_awin_integration;
GRANT ROLE _BOURNE_BATCH_DATALOAD__WAREHOUSE__USAGE TO ROLE haven_awin_integration;
GRANT ROLE taskadmin TO ROLE haven_awin_integration;
GRANT ROLE haven_awin_integration TO USER NARAYANAVELAGA;

GRANT USAGE on integration blg_havprodserv_seg_s3_integration_prod TO ROLE haven_sagacity_integration;
GRANT ROLE _haven_raw__sagacity__creator TO ROLE haven_sagacity_integration;
GRANT ROLE _BOURNE_BATCH_DATALOAD__WAREHOUSE__USAGE TO ROLE haven_sagacity_integration;
GRANT ROLE taskadmin TO ROLE haven_sagacity_integration;
GRANT ROLE haven_sagacity_integration TO USER NARAYANAVELAGA;

GRANT ROLE haven_awin_integration TO ROLE dba;
GRANT ROLE haven_sagacity_integration TO ROLE dba;