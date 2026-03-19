USE ROLE dba;

USE SCHEMA haven_raw.blueyonder;

SHOW WAREHOUSES LIKE '%batch%';

create or replace file format haven_raw.blueyonder.blueyonder_csv_file_format 
TYPE = CSV 
FIELD_DELIMITER = ',' 
SKIP_HEADER = 1 
NULL_IF = () 
EMPTY_FIELD_AS_NULL = true 
COMPRESSION = NONE 
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
;
 
create or replace stage haven_raw.blueyonder.BLUEYONDER_INTEGRATION_STAGE 
STORAGE_INTEGRATION = BLG_HAVPRODSERV_BLUEYONDER_S3_INTEGRATION_PROD 
URL = 's3://blg-dfs-havprodsrv-blueyonder-s3/' 
ENCRYPTION = (TYPE = 'AWS_SSE_S3');
 
desc stage BLUEYONDER_INTEGRATION_STAGE;

LS @haven_raw.blueyonder.BLUEYONDER_INTEGRATION_STAGE;
 
create TABLE IF NOT EXISTS haven_raw.blueyonder.BLUEYONDER_INVALID_PRICE_REPORT (
	PARK VARCHAR,
	PRODUCT VARCHAR,
	SUBPRODUCT VARCHAR,
	GRADE VARCHAR,
	DURATION VARCHAR,
	BREAK_DATE VARCHAR,
	ITEM_CODE VARCHAR,
	ERROR_MESSAGE VARCHAR
);
 
create TABLE IF NOT EXISTS haven_raw.blueyonder.BLUEYONDER_PRICE_OVERRIDE_REPORT (
	PARK VARCHAR,
	PRODUCT VARCHAR,
	SUBPRODUCT VARCHAR,
	GRADE VARCHAR,
	DURATION VARCHAR,
	BREAK_DATE VARCHAR,
	ITEM_CODE VARCHAR,
	REC_PRICE_FINAL FLOAT,
	PRICE FLOAT,
	PRICE_OVERRIDE FLOAT,
	AUDIT_OVERRIDE_USER VARCHAR,
	AUDIT_OVERRIDE_DATE VARCHAR,
	PRICE_OVERRIDE_PARENT VARCHAR,
	AUDIT_OVERRIDE_PARENT_USER VARCHAR,
	AUDIT_OVERRIDE_PARENT_DATE VARCHAR,
	REC_PRICE_CAPPED BOOLEAN
);

show tasks;
 
create or replace task blueyonder_invalid_price_report
schedule = 'USING CRON 0 8 * * * UTC'
warehouse = BOURNE_BATCH_DATALOAD_XSMALL
as 
    copy into dbt_nvelaga.BLUEYONDER_INVALID_PRICE_REPORT
    from
        (
            select
                $1 PARK,
                $2 PRODUCT,
                $3 SUBPRODUCT,
                $4 GRADE,
                $5 DURATION,
                $6 BREAK_DATE,
                $7 ITEM_CODE,
                $8 ERROR_MESSAGE
            from
                @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/BREAK_INVALID_PRICE_REPORT
        ) FILE_FORMAT= blueyonder_csv_file_format;          

alter task blueyonder_invalid_price_report resume;    
 
create or replace task blueyonder_price_override_report
schedule = 'USING CRON 0 8 * * * UTC'
warehouse = BOURNE_BATCH_DATALOAD_XSMALL
as 
    copy into dbt_nvelaga.BLUEYONDER_PRICE_OVERRIDE_REPORT
    from
        (
            select
                $1 PARK,
                $2 PRODUCT,
                $3 SUBPRODUCT,
                $4 GRADE,
                $5 DURATION,
                $6 BREAK_DATE,
                $7 ITEM_CODE,
                $8::FLOAT REC_PRICE_FINAL,
                $9::FLOAT PRICE,
                $10::FLOAT PRICE_OVERRIDE,
                $11 AUDIT_OVERRIDE_USER,
                $12 AUDIT_OVERRIDE_DATE,
                $13 PRICE_OVERRIDE_PARENT,
                $14 AUDIT_OVERRIDE_PARENT_USER,
                $15 AUDIT_OVERRIDE_PARENT_DATE,
                $16::BOOLEAN REC_PRICE_CAPPED
            from
                @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/BREAK_REPORT
        ) FILE_FORMAT= blueyonder_csv_file_format; 

alter task blueyonder_price_override_report resume;

USE SCHEMA haven_base.blueyonder;

SHOW TABLES;
SHOW VIEWS;
CREATE VIEW HAVEN_BASE.BLUEYONDER.BLUEYONDER_INVALID_PRICE_REPORT
( PARK, PRODUCT, SUBPRODUCT, GRADE, DURATION, BREAK_DATE, ITEM_CODE, ERROR_MESSAGE )
AS SELECT PARK, PRODUCT, SUBPRODUCT, GRADE, DURATION, BREAK_DATE, ITEM_CODE, ERROR_MESSAGE
FROM HAVEN_RAW.BLUEYONDER.BLUEYONDER_INVALID_PRICE_REPORT;


CREATE VIEW HAVEN_BASE.BLUEYONDER.BLUEYONDER_PRICE_OVERRIDE_REPORT
( PARK, PRODUCT, SUBPRODUCT, GRADE, DURATION, BREAK_DATE, ITEM_CODE, REC_PRICE_FINAL, PRICE, PRICE_OVERRIDE, AUDIT_OVERRIDE_USER, AUDIT_OVERRIDE_DATE, PRICE_OVERRIDE_PARENT, AUDIT_OVERRIDE_PARENT_USER, AUDIT_OVERRIDE_PARENT_DATE, REC_PRICE_CAPPED )
AS SELECT PARK, PRODUCT, SUBPRODUCT, GRADE, DURATION, BREAK_DATE, ITEM_CODE, REC_PRICE_FINAL, PRICE, PRICE_OVERRIDE, AUDIT_OVERRIDE_USER, AUDIT_OVERRIDE_DATE, PRICE_OVERRIDE_PARENT, AUDIT_OVERRIDE_PARENT_USER, AUDIT_OVERRIDE_PARENT_DATE, REC_PRICE_CAPPED
FROM HAVEN_RAW.BLUEYONDER.BLUEYONDER_PRICE_OVERRIDE_REPORT;
 
SHOW VIEWS;

-- 20/08/2024

USE ROLE dba;

USE SCHEMA haven_raw.blueyonder;

create or replace task haven_raw.blueyonder.blueyonder_invalid_price_report
schedule = 'USING CRON 0 8 * * * UTC'
warehouse = haven_data_transform_warehouse_xsmall
as 
    copy into HAVEN_RAW.BLUEYONDER.BLUEYONDER_INVALID_PRICE_REPORT
    from
        (
            select
                $1 PARK,
                $2 PRODUCT,
                $3 SUBPRODUCT,
                $4 GRADE,
                $5 DURATION,
                $6 BREAK_DATE,
                $7 ITEM_CODE,
                $8 ERROR_MESSAGE
            from
                @HAVEN_RAW.BLUEYONDER.BLUEYONDER_INTEGRATION_STAGE/pricing_reports/BREAK_INVALID_PRICE_REPORT
        ) FILE_FORMAT= blueyonder_csv_file_format;          
 
alter task blueyonder_invalid_price_report resume;   
 
 
create or replace task haven_raw.blueyonder.blueyonder_price_override_report
schedule = 'USING CRON 0 8 * * * UTC'
warehouse = haven_data_transform_warehouse_xsmall
as 
    copy into HAVEN_RAW.BLUEYONDER.BLUEYONDER_PRICE_OVERRIDE_REPORT
    from
        (
            select
                $1 PARK,
                $2 PRODUCT,
                $3 SUBPRODUCT,
                $4 GRADE,
                $5 DURATION,
                $6 BREAK_DATE,
                $7 ITEM_CODE,
                $8::FLOAT REC_PRICE_FINAL,
                $9::FLOAT PRICE,
                $10::FLOAT PRICE_OVERRIDE,
                $11 AUDIT_OVERRIDE_USER,
                $12 AUDIT_OVERRIDE_DATE,
                $13 PRICE_OVERRIDE_PARENT,
                $14 AUDIT_OVERRIDE_PARENT_USER,
                $15 AUDIT_OVERRIDE_PARENT_DATE,
                $16::BOOLEAN REC_PRICE_CAPPED
            from
                @HAVEN_RAW.BLUEYONDER.BLUEYONDER_INTEGRATION_STAGE/pricing_reports/BREAK_REPORT
        ) FILE_FORMAT= blueyonder_csv_file_format; 

alter task blueyonder_price_override_report resume;  

-- 23/08/2024

use ROLE dba;
use database HAVEN_RAW;
use schema BLUEYONDER;

show tables;

create or replace TABLE BLUEYONDER_INVALID_PRICE_REPORT (
      PARK VARCHAR,
      PRODUCT VARCHAR,
      SUBPRODUCT VARCHAR,
      GRADE VARCHAR,
      DURATION VARCHAR,
      BREAK_DATE VARCHAR,
      ITEM_CODE VARCHAR,
      ERROR_MESSAGE VARCHAR,
    LOADED_TIMESTAMP TIMESTAMP_NTZ(9) 
);


create or replace TABLE BLUEYONDER_PRICE_OVERRIDE_REPORT (
      PARK VARCHAR,
      PRODUCT VARCHAR,
      SUBPRODUCT VARCHAR,
      GRADE VARCHAR,
      DURATION VARCHAR,
      BREAK_DATE VARCHAR,
      ITEM_CODE VARCHAR,
      REC_PRICE_FINAL FLOAT,
      PRICE FLOAT,
      PRICE_OVERRIDE FLOAT,
      AUDIT_OVERRIDE_USER VARCHAR,
      AUDIT_OVERRIDE_DATE VARCHAR,
      PRICE_OVERRIDE_PARENT VARCHAR,
      AUDIT_OVERRIDE_PARENT_USER VARCHAR,
      AUDIT_OVERRIDE_PARENT_DATE VARCHAR,
      REC_PRICE_CAPPED BOOLEAN,
    LOADED_TIMESTAMP TIMESTAMP_NTZ(9) 
);


create or replace task blueyonder_invalid_price_report
schedule = 'USING CRON 0 8 * * * UTC'
warehouse = haven_data_transform_warehouse_xsmall
as 
    copy into dbt_nvelaga.BLUEYONDER_INVALID_PRICE_REPORT
    from
        (
            select
                $1 PARK,
                $2 PRODUCT,
                $3 SUBPRODUCT,
                $4 GRADE,
                $5 DURATION,
                $6 BREAK_DATE,
                $7 ITEM_CODE,
                $8 ERROR_MESSAGE,
                sysdate() as LOADED_TIMESTAMP
            from
                @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/BREAK_INVALID_PRICE_REPORT
        ) FILE_FORMAT= blueyonder_csv_file_format;          

alter task blueyonder_invalid_price_report resume;    

create or replace task blueyonder_price_override_report
schedule = 'USING CRON 0 8 * * * UTC'
warehouse = haven_data_transform_warehouse_xsmall
as 
    copy into dbt_nvelaga.BLUEYONDER_PRICE_OVERRIDE_REPORT
    from
        (
            select
                $1 PARK,
                $2 PRODUCT,
                $3 SUBPRODUCT,
                $4 GRADE,
                $5 DURATION,
                $6 BREAK_DATE,
                $7 ITEM_CODE,
                $8::FLOAT REC_PRICE_FINAL,
                $9::FLOAT PRICE,
                $10::FLOAT PRICE_OVERRIDE,
                $11 AUDIT_OVERRIDE_USER,
                $12 AUDIT_OVERRIDE_DATE,
                $13 PRICE_OVERRIDE_PARENT,
                $14 AUDIT_OVERRIDE_PARENT_USER,
                $15 AUDIT_OVERRIDE_PARENT_DATE,
                $16::BOOLEAN REC_PRICE_CAPPED,
                sysdate() as LOADED_TIMESTAMP
            from
                @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/BREAK_REPORT
        ) FILE_FORMAT= blueyonder_csv_file_format; 
        
alter task blueyonder_price_override_report resume; 

create or replace view HAVEN_BASE.BLUEYONDER.BLUEYONDER_INVALID_PRICE_REPORT(
      PARK,
      PRODUCT,
      SUBPRODUCT,
      GRADE,
      DURATION,
      BREAK_DATE,
      ITEM_CODE,
      ERROR_MESSAGE,
      LOADED_TIMESTAMP
) as SELECT PARK, PRODUCT, SUBPRODUCT, GRADE, DURATION, BREAK_DATE, ITEM_CODE, ERROR_MESSAGE, LOADED_TIMESTAMP
FROM HAVEN_RAW.BLUEYONDER.BLUEYONDER_INVALID_PRICE_REPORT;

create or replace view HAVEN_BASE.BLUEYONDER.BLUEYONDER_PRICE_OVERRIDE_REPORT(
      PARK,
      PRODUCT,
      SUBPRODUCT,
      GRADE,
      DURATION,
      BREAK_DATE,
      ITEM_CODE,
      REC_PRICE_FINAL,
      PRICE,
      PRICE_OVERRIDE,
      AUDIT_OVERRIDE_USER,
      AUDIT_OVERRIDE_DATE,
      PRICE_OVERRIDE_PARENT,
      AUDIT_OVERRIDE_PARENT_USER,
      AUDIT_OVERRIDE_PARENT_DATE,
      REC_PRICE_CAPPED,
      LOADED_TIMESTAMP
) as SELECT PARK, PRODUCT, SUBPRODUCT, GRADE, DURATION, BREAK_DATE, ITEM_CODE, REC_PRICE_FINAL, PRICE, PRICE_OVERRIDE, AUDIT_OVERRIDE_USER, AUDIT_OVERRIDE_DATE, PRICE_OVERRIDE_PARENT, AUDIT_OVERRIDE_PARENT_USER, AUDIT_OVERRIDE_PARENT_DATE, REC_PRICE_CAPPED, LOADED_TIMESTAMP
FROM HAVEN_RAW.BLUEYONDER.BLUEYONDER_PRICE_OVERRIDE_REPORT;