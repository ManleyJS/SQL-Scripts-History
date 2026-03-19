USE ROLE dba;

USE SCHEMA haven_raw.google_integration;
USE ROLE haven_batch_dataload;
USE WAREHOUSE bourne_batch_dataload_Xsmall;

SELECT max(date(partitiontime)) FROM p_productgroup;
SELECT max(date(partitiontime)) FROM p_productgroupstats;

SELECT count(*) FROM p_productgroup;

SHOW TABLES LIKE 'sa360_%_stage';

SELECT min(date("date")), min(date(partitiontime)), max(date("date")), max(date(partitiontime)) FROM SA360_P_ACCOUNTFLOODLIGHTANDDEVICESTATS_STAGE LIMIT 10;

USE ROLE sysadmin;
ALTER WAREHOUSE bourne_batch_dataload_Xsmall SET warehouse_size = medium;
USE ROLE sysadmin;
ALTER WAREHOUSE bourne_batch_dataload_Xsmall SET warehouse_size = xsmall;