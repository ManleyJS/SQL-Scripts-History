use role accountadmin;

-- arn:aws:iam::753707732315:role/shared-caravan-imagery-snowflake-access
-- bucket name - haven-prod-holidaysales-shared-caravan-imagery

create or replace storage integration aws_s3_shared_caravan_imagery
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::753707732315:role/shared-caravan-imagery-snowflake-access'
  enabled = true
  storage_allowed_locations = ('s3://haven-prod-holidaysales-shared-caravan-imagery/');
 
show integrations;

desc integration aws_s3_shared_caravan_imagery;

use role securityadmin;
grant usage on integration aws_s3_shared_caravan_imagery to role dba;

USE ROLE dba;

USE SCHEMA training.training;

create or replace stage training.training.aws_s3_shared_caravan_imagery_stage 
    url='s3://haven-prod-holidaysales-shared-caravan-imagery/'
    storage_integration = aws_s3_shared_caravan_imagery
    ;

LS @aws_s3_shared_caravan_imagery_stage;

CREATE TABLE training.training.caravan_images (
fileNAME varchar(),
van_id varchar(),
filesize integer,
md5hash varchar(),
last_modified varchar());

SELECT count(*) FROM TRAINING.TRAINING.caravan_images;

SELECT * FROM training.training.caravan_images LIMIT 10;

grant usage on integration aws_s3_digital_integration to role haven_batch_dataload;

RM @%caravan_images;


s3://haven-prod-holidaysales-shared-caravan-imagery/assets/caravan-images/114ekDpxbmd/2160x1080/R5v9KMx65zT.jpeg
