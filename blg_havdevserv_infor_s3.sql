
--blg_havdevserv_infor_s3_integration
--blg-havdevserv-infor-s3
--arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-infor-role

use ROLE accountadmin;

create storage integration blg_havdevserv_infor_s3_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-infor-role'
  enabled = TRUE
--  storage_aws_external_id = 'BD78472_SFCRole=81qt0n9nQvWo2s88c1a53iYSSvhaiL'
  storage_allowed_locations = ('s3://blg-havdevserv-infor-s3/');

DESC integration blg_havdevserv_infor_s3_integration;

use ROLE securityadmin;

GRANT USAGE ON integration blg_havdevserv_infor_s3_integration TO ROLE dba;

