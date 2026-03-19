use role accountadmin;

show integrations;
show pipes in account;

create or replace storage integration blg_dev_blapi_s3_integration_dev
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::083208432960:role/blg-dev-snowflake-blapi-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=v6z3Fnp8h7s1AlDpCXsuTfgJukexVK'
  storage_allowed_locations = ('s3://blg-dev-blapi-s3/');

use role dba;

use schema haven_raw.matterport_images;

use role haven_batch_dataload;

show stages;

create stage haven_raw.matterport_images.HAVEN_CARAVAN_IMAGES_STAGE
file_format = haven_raw.matterport_images.HAVEN_CARAVAN_IMAGES_FILE_FORMAT;


use schema training.training;

create stage deleteme
url = 's3://blg-dev-blapi-s3'
STORAGE_INTEGRATION = blg_dev_blapi_s3_integration_dev;

ls @deleteme;
  
use role dba;

use schema haven_data_transform.jpp_blapi_pricing;

show pipes;
show stages;