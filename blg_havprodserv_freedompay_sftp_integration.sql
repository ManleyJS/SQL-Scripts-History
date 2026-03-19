use role accountadmin;

create storage integration blg_havprodserv_freedompay_sftp_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/blg-dfs-havprodsrv-freedompay-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=iw1kPAHvIA5zYRLTHmg4d7eV12F3kj'
  storage_allowed_locations = ('s3://blg-dfs-havdevsrv-freedompay-s3/');
 
ALTER integration blg_havprodserv_freedompay_sftp_integration
SET storage_allowed_locations = ('s3://blg-dfs-havdevsrv-freedompay-s3/admin/');
 
DESC integration blg_havprodserv_freedompay_sftp_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_havprodserv_freedompay_sftp_integration TO ROLE dba;
--GRANT USAGE ON integration blg_havprodserv_freedompay_sftp_integration TO ROLE HAVEN_DATA_TRANSFORM;
--GRANT USAGE ON integration blg_havprodserv_freedompay_sftp_integration TO ROLE

USE ROLE dba;

USE SCHEMA training.training;

CREATE OR REPLACE STAGE training.training.freedompay_stage
storage_integration =  blg_havprodserv_freedompay_sftp_integration
url = 's3://blg-dfs-havdevsrv-freedompay-s3/admin/';

ls @training.training.freedompay_stage;

-- 06/02/2025

USE ROLE accountadmin;

-- arn:aws:iam::328265102953:role/blg-dfs-havprodsrv-freedompay-prod-role
-- BD78472_SFCRole=iw1kPAHvIA5zYRLTHmg4d7eV12F3kj
-- blg-dfs-havprdsrv-freedompay-s3

create OR REPLACE storage integration blg_havprodserv_freedompay_sftp_production_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/blg-dfs-havprodsrv-freedompay-prod-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=iw1kPAHvIA5zYRLTHmg4d7eV12F3kj'
  storage_allowed_locations = ('s3://blg-dfs-havprdsrv-freedompay-s3/admin/decrypt/');

DESC integration blg_havprodserv_freedompay_sftp_production_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_havprodserv_freedompay_sftp_production_integration TO ROLE dba;


USE ROLE dba;

USE SCHEMA haven_raw.freedompay;

CREATE OR REPLACE FILE FORMAT haven_raw.freedompay.blg_havprodserv_freedompay_sftp_production_fileformat
type=csv
compression=none
skip_header=1
field_delimiter='|';

CREATE OR REPLACE STAGE haven_raw.freedompay.blg_havprodserv_freedompay_sftp_production_stage
storage_integration =  blg_havprodserv_freedompay_sftp_production_integration
file_format = haven_raw.freedompay.blg_havprodserv_freedompay_sftp_production_fileformat
url = 's3://blg-dfs-havprdsrv-freedompay-s3/admin/decrypt/';

CREATE OR REPLACE PIPE haven_raw.freedompay.blg_havprodserv_freedompay_sftp_production_pipe
  AUTO_INGEST = TRUE
  AS
    COPY INTO haven_raw.freedompay.card_transactions
      FROM @haven_raw.freedompay.blg_havprodserv_freedompay_sftp_production_stage
		on_error = CONTINUE;

SHOW pipes;

SELECT system$pipe_status('BLG_HAVPRODSERV_FREEDOMPAY_SFTP_PRODUCTION_PIPE');

LS @haven_raw.freedompay.blg_havprodserv_freedompay_sftp_production_stage;

SHOW TABLES;

USE ROLE haven_batch_dataload;

TRUNCATE TABLE card_transactions;

SHOW WAREHOUSES;

USE WAREHOUSE BOURNE_BATCH_DATALOAD_XSMALL;

LS @haven_raw.freedompay.blg_havprodserv_freedompay_sftp_production_stage;

copy into CARD_TRANSACTIONS from @haven_raw.freedompay.blg_havprodserv_freedompay_sftp_production_stage
on_error = CONTINUE;



SELECT count(*) FROM card_transactions;