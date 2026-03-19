USE ROLE ACCOUNTADMIN;

show integrations like '%info%';

DESC INTEGRATION BLG_HAVDEVSERV_INFOR_S3_INTEGRATION;

-- BLG_HAVDEVSERV_INFOR_S3_INTEGRATION
-- arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-infor-role
-- BD78472_SFCRole=2_+nNMT3NHrVnpce8YX2AkLz7YAG4=
-- s3://blg-havdevserv-infor-s3/

USE ROLE Securityadmin;

GRANT usage ON integration BLG_HAVDEVSERV_INFOR_S3_INTEGRATION TO ROLE dba;
GRANT usage ON integration BLG_HAVDEVSERV_INFOR_S3_INTEGRATION TO ROLE haven_dbt_development;

use ROLE dba;

DESC integration blg_havdevserv_infor_s3_integration;