use role dba;

use warehouse dba_wh;

use schema training.training;

ls @blueyonder_s3_test_stage;
ls @blueyonder_s3_prod_stage;

copy INTO @blueyonder_s3_prod_stage/snowflake_dump 
FROM TESTTABLE
file_format = (TYPE=csv)
single = true
max_file_size = 32000000;

RM @blueyonder_s3_prod_stage;