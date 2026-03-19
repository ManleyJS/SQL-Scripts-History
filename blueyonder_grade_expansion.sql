use schema COMMERCIAL_PRIORITY_SCORING;
 
 
create or replace file format haven_commercial_priority_scoring_rms_csv_file_format
    TYPE = CSV 
    FIELD_DELIMITER = ',' 
    SKIP_HEADER = 1 
    NULL_IF = () 
    EMPTY_FIELD_AS_NULL = true 
    COMPRESSION = NONE 
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
;
 
create or replace stage haven_commercial_priority_scoring_rms_stage
  STORAGE_INTEGRATION = blg_prod_rms_scoring_s3_integration
  URL = 's3://haven-prod-sales-integrationsapplications-pricing/'
  file_format = csv_format_commercial_priority_scoring 
  ENCRYPTION = (TYPE='AWS_SSE_S3')
;

use role dba;

use schema haven_raw.blueyonder;

show stages;

ls @BLG_RMS_STATIC_DATA_EXT_STAGE; 


use role accountadmin;

show streamlits in account;

use role securityadmin;

grant role haven_revenue_management_dariustinca to user dillonsim;

use role dba;
use schema haven_raw.blueyonder;
use warehouse HAVEN_DATA_TRANSFORM_WAREHOUSE_XSMALL;


show tasks;

select get_ddl('task', 'BLUEYONDER_PRICE_OVERRIDE_REPORT');

create or replace task BLUEYONDER_PRICE_OVERRIDE_REPORT
	warehouse=HAVEN_DATA_TRANSFORM_WAREHOUSE_XSMALL
	schedule='USING CRON 0 8 * * * UTC'
	as copy into dbt_nvelaga.BLUEYONDER_PRICE_OVERRIDE_REPORT
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
show tables;        

select get_ddl('table', 'BLUEYONDER_PRICE_OVERRIDE_REPORT');

show stages;

ls @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports/;

show pipes;

select get_ddl('pipe', 'PIPE_PRICE_OVERRIDE_REPORT');

-- HAVEN_BASE.BLUEYONDER.PRICE_BREAKPRICECHG_REPORT

alter pipe haven_raw.blueyonder.PIPE_PRICE_OVERRIDE_REPORT set PIPE_EXECUTION_PAUSED = true;

alter table HAVEN_raw.BLUEYONDER.PRICE_OVERRIDE_REPORT rename to HAVEN_raw.BLUEYONDER.PRICE_BREAKPRICECHG_REPORT;

create or replace pipe PIPE_PRICE_OVERRIDE_REPORT auto_ingest=true as copy into haven_raw.blueyonder.PRICE_BREAKPRICECHG_REPORT
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
                sysdate() as LOADED_TIMESTAMP,
                metadata$filename as FILE_NAME
            from
                @haven_raw.blueyonder.PRICING_REPORTS_INTEGRATION_STAGE/pricing_reports/BREAK_REPORT
-- @haven_data_transform.dbt_nvelaga_dbt_blueyonder.PRICING_REPORTS_INTEGRATION_STAGE/pricing_reports/BREAK_REPORT
        ) 
        FILE_FORMAT= haven_raw.blueyonder.csv_file_format;

alter pipe haven_raw.blueyonder.PIPE_PRICE_OVERRIDE_REPORT set PIPE_EXECUTION_PAUSED = false;
        
use schema haven_base.blueyonder;

show views;

select get_ddl('view', 'PRICE_BREAKPRICECHG_REPORT');

create or replace view PRICE_BREAKPRICECHG_REPORT(
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
	LOADED_TIMESTAMP,
	FILE_NAME
) as select 
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
    LOADED_TIMESTAMP,
    FILE_NAME
from HAVEN_RAW.BLUEYONDER.PRICE_BREAKPRICECHG_REPORT;

select * from PRICE_BREAKPRICECHG_REPORT limit 10;


use schema haven_raw.blueyonder;

ls @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports/;

select distinct metadata$filename
from @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/archive/;

select distinct split(metadata$filename, '_')
from @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/archive/;


select distinct max(substr(split_part(metadata$filename, '_', 6), 1, 8)) 
from @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/archive/;



