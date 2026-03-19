use role accountadmin;

-- arn:aws:s3:::blg-dev-eight-by-eight-s3
-- arn:aws:iam::756108221014:role/blg-dev-snowflake-eight-by-eight-role
-- BD78472_SFCRole=2_gJm7uXg3KUeiGBtkW2qBjLMwAsp=

CREATE STORAGE INTEGRATION blg_dev_eight_by_eight_s3_integration                                              
  TYPE = EXTERNAL_STAGE                                                                                               
  STORAGE_PROVIDER = 'S3'                                                                                             
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-eight-by-eight-role'               
  STORAGE_AWS_EXTERNAL_ID = 'BD78472_SFCRole=2_gJm7uXg3KUeiGBtkW2qBjLMwAsp='                                          
  ENABLED = TRUE                                                                                                      
  STORAGE_ALLOWED_LOCATIONS = ('s3://blg-havdevserv-eight-by-eight-s3/')                                                                      ;                                                                                                                     
                                                                                                                      
use ROLE securityadmin;

GRANT USAGE ON integration blg_dev_eight_by_eight_s3_integration TO ROLE dba;
GRANT USAGE ON integration blg_dev_eight_by_eight_s3_integration TO ROLE haven_batch_dataload;

use role dba;

use schema training.training;

create or replace stage training.training.test_dev_eight_by_eight_stage
    url='s3://blg-havdevserv-eight-by-eight-s3/'
    storage_integration = blg_dev_eight_by_eight_s3_integration
    ;

ls @training.training.test_dev_eight_by_eight_stage;

create stage delete_stage;

copy files into @delete_stage/ 
from @training.training.test_dev_eight_by_eight_stage/metadata/3bf64a15-df5c-4789-8aa7-83cc53e648c3.json
detailed_output = true;

ls @delete_stage;

copy files into @training.training.test_dev_eight_by_eight_stage/delete/
from @delete_stage/3bf64a15-df5c-4789-8aa7-83cc53e648c3.json
detailed_output = true;

ls @training.training.test_dev_eight_by_eight_stage/delete/;


