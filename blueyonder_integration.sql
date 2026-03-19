use role accountadmin;

create storage integration blg_havdevserv_blueyonder_s3_integration_dev
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/blg-dfs-havdevsrv-blueyonder-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=430L7d2fP2n9KsOFFPcWxRuzTcTq'
  storage_allowed_locations = ('s3://blg-dfs-havdevsrv-blueyonder-s3/');
 
DESC integration blg_havdevserv_blueyonder_s3_integration_dev;

use role securityadmin;

grant usage on integration blg_havdevserv_blueyonder_s3_integration_dev to role dba;

use role dba;

use schema training.training;

SELECT * FROM TESTTABLE LIMIT 10;

create or replace stage blueyonder_s3_test_stage
  STORAGE_INTEGRATION = blg_havdevserv_blueyonder_s3_integration_dev
  URL = 's3://blg-dfs-havdevsrv-blueyonder-s3/'

ls @blueyonder_s3_test_stage;

select T.$1 FROM @blueyonder_s3_test_stage t; 
  
copy INTO @blueyonder_s3_test_stage/snowflake_dump 
FROM TESTTABLE
file_format = (TYPE=csv)
single = true
max_file_size = 32000000;

ls @blueyonder_s3_test_stage;

RM @blueyonder_s3_test_stage;

USE ROLE accountadmin;

create storage integration blg_havprodserv_blueyonder_s3_integration_prod
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/blg-dfs-havprodsrv-blueyonder-role'
  enabled = true
  storage_aws_external_id = 'BD78472_SFCRole=2_w9DdAoWVe2tTO4uxbYjE773WH0Hl'
  storage_allowed_locations = ('s3://blg-dfs-havprodsrv-blueyonder-s3/');

DESC integration blg_havprodserv_blueyonder_s3_integration_prod;

use role securityadmin;

grant usage on integration blg_havprodserv_blueyonder_s3_integration_prod to role dba;


use role dba;

use schema training.training;

create or replace stage blueyonder_s3_prod_stage
  STORAGE_INTEGRATION = blg_havprodserv_blueyonder_s3_integration_prod
  URL = 's3://blg-dfs-havprodsrv-blueyonder-s3/'

ls @blueyonder_s3_prod_stage;

select T.$1 FROM @blueyonder_s3_prod_stage t; 

copy INTO @blueyonder_s3_prod_stage/snowflake_dump 
FROM TESTTABLE
file_format = (TYPE=csv)
single = true
max_file_size = 32000000;
 
ls @blueyonder_s3_prod_stage;

RM @blueyonder_s3_prod_stage;

