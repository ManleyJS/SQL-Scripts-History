SELECT CURRENT_ACCOUNT_LOCATOR();

use role accountadmin;

show pipes in account;

SELECT SYSTEM$PIPE_STATUS('HAVEN_RAW.BLUEYONDER.PIPE_INVALID_PRICE_REPORT');
SELECT SYSTEM$PIPE_STATUS('HAVEN_RAW.BLUEYONDER.PIPE_PRICE_OVERRIDE_REPORT');

show stages;

ls @PRICING_REPORTS_INTEGRATION_STAGE/pricing_reports;

use role dba;

use role haven_data_integrate;

use schema haven_raw.blueyonder;

show pipes;

use role securityadmin;

grant monitor on pipes in schema haven_raw.blueyonder to role _haven_raw__blueyonder__reader;

use role dba;

show tables;

show file formats;

create or replace pipe haven_raw.blueyonder.pipe_invalid_price_report auto_ingest=true as
copy into haven_raw.blueyonder.INVALID_PRICE_REPORT
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
                sysdate() as LOADED_TIMESTAMP,
                metadata$filename as FILE_NAME
            from
                @haven_raw.blueyonder.PRICING_REPORTS_INTEGRATION_STAGE/pricing_reports/BREAK_INVALID_PRICE_REPORT
--haven_data_transform.dbt_nvelaga_dbt_blueyonder.PRICING_REPORTS_INTEGRATION_STAGE/pricing_reports/BREAK_INVALID_PRICE_REPORT
        ) 
        FILE_FORMAT= haven_raw.blueyonder.csv_file_format
        ;

create or replace pipe haven_raw.blueyonder.pipe_price_override_report auto_ingest=true as
  copy into haven_raw.blueyonder.PRICE_OVERRIDE_REPORT
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
        FILE_FORMAT= haven_raw.blueyonder.csv_file_format
        ;

alter pipe haven_raw.blueyonder.PIPE_INVALID_PRICE_REPORT refresh;        
alter pipe haven_raw.blueyonder.PIPE_PRICE_OVERRIDE_REPORT refresh;

select max(loaded_timestamp) from PRICE_OVERRIDE_REPORT;
select max(loaded_timestamp) from INVALID_PRICE_REPORT;

desc stage PRICING_REPORTS_INTEGRATION_STAGE;


SELECT SYSTEM$PIPE_STATUS('HAVEN_RAW.BLUEYONDER.PIPE_INVALID_PRICE_REPORT');
SELECT SYSTEM$PIPE_STATUS('HAVEN_RAW.BLUEYONDER.PIPE_PRICE_OVERRIDE_REPORT');

truncate table haven_raw.blueyonder.price_override_report ;
truncate table haven_raw.blueyonder.invalid_price_report  ;
truncate table haven_store_uat.commercial.blueyonder_invalid_price_report_transform;
truncate table haven_store_uat.commercial.blueyonder_price_override_report_transform;

ls @haven_raw.blueyonder.PRICING_REPORTS_INTEGRATION_STAGE/pricing_reports/BREAK_INVALID_PRICE_REPORT;