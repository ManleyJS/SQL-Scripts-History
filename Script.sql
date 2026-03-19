-- arn:aws:s3:::blg-havprodserv-erpx-fpa-s3
-- arn:aws:iam::445123880475:role/blg-havprodserv-erpx-fpa-send-file-role-lambda
-- BD78472_SFCRole=xW7uSTj3T7gdhf6Mw4ONTbemCXAk

use ROLE accountadmin;


CREATE OR REPLACE STORAGE INTEGRATION blg_havprodserv_fpa_erpx_s3_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::445123880475:role/blg-havprodserv-erpx-fpa-send-file-role-lambda'
  STORAGE_AWS_EXTERNAL_ID = 'BD78472_SFCRole=xW7uSTj3T7gdhf6Mw4ONTbemCXAk'
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('s3://blg-havprodserv-erpx-fpa-s3/')
;

DESC integration blg_havprodserv_fpa_erpx_s3_integration;

use ROLE securityadmin;

GRANT USAGE ON integration blg_havprodserv_fpa_erpx_s3_integration TO ROLE dba;
GRANT USAGE ON integration blg_havprodserv_fpa_erpx_s3_integration TO ROLE haven_batch_dataload;

use ROLE dba;

use SCHEMA haven_pipeline.fpa_erpx;

SHOW stages;

use ROLE securityadmin;

GRANT USAGE ON integration BLG_HAVPRODSERV_ERPX_FPA_S3_INTEGRATION TO ROLE haven_batch_dataload;
REVOKE USAGE ON integration blg_havprodserv_fpa_erpx_s3_integration from ROLE dba;
REVOKE USAGE ON integration blg_havprodserv_fpa_erpx_s3_integration from ROLE haven_batch_dataload;

use ROLE accountadmin;

DROP STORAGE INTEGRATION blg_havprodserv_fpa_erpx_s3_integration;
