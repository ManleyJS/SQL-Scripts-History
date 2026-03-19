use role haven_batch_dataload;

use schema haven_raw.blueyonder;

show stages;

ls @BLUEYONDER_INTEGRATION_STAGE;

ls @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports;

SELECT t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10 
FROM @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/archive/grade_expansion t 
limit 100;

select max(t.$6)
FROM @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports t 
where t.$6 != 'B';

-- 99.99999975

create or replace table grade_expansion_report_history (
Park	varchar(),
Date date,	
DOA	varchar(),
Childgrade	varchar(),
A	Decimal(16,10),
B	Decimal(16,10),
ParentGrade varchar()
);

desc stage BLUEYONDER_INTEGRATION_STAGE;

copy into grade_expansion_report_history
from @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports
file_format = (skip_header = 1)
--validation_mode = return_all_errors
;

alter table grade_expansion_report rename to grade_expansion_report_history;

create or replace table grade_expansion_report (
Park	varchar(),
Date date,	
DOA	varchar(),
Childgrade	varchar(),
A	Decimal(16,10),
B	Decimal(16,10),
ParentGrade varchar()
);

ls @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports;

copy into grade_expansion_report
from @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports/GRADE_EXPANSION_20250730203000.csv.gz
file_format = (skip_header = 1)
--validation_mode = return_all_errors
;

select max(date) from grade_expansion_report limit 10;

ls @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports;

copy files into @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/archive/grade_expansion/ from @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports ;

ls @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports;
ls @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/archive;

-- fe205472613a6f83caadf8e01c609894

rm @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports/GRADE_EXPANSION_;

use warehouse bourne_batch_dataload_xsmall;

set sql_delimiter='/';

CREATE OR REPLACE TASK haven_raw.blueyonder.load_grade_expansion_data
  warehouse = bourne_batch_dataload_xsmall
  schedule = 'USING CRON 00 20 * * * UTC'
  AS
    BEGIN
        insert into haven_raw.blueyonder.grade_expansion_report_history select * from haven_raw.blueyonder.grade_expansion_report;
        truncate table haven_raw.blueyonder.grade_expansion_report;
        copy into haven_raw.blueyonder.grade_expansion_report from @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports file_format = (skip_header = 1);
        copy files into @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/archive/grade_expansion/ from @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports ;
        rm @BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports;
 
    END;/
;

set sql_delimiter=';';

use role securityadmin;

grant role taskadmin to role haven_batch_dataload;

use role haven_batch_dataload;

alter task haven_raw.blueyonder.load_grade_expansion_data resume;

SELECT *
  FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY(
    SCHEDULED_TIME_RANGE_START=>DATEADD('day',-2,current_timestamp()),
    RESULT_LIMIT => 10,
    TASK_NAME=>'load_grade_expansion_data'));

select * from haven_master.common.query_history
where query_id = '01bdda0c-0107-11f4-00aa-99019971aacf';

select *
from table(information_schema.copy_history(TABLE_NAME=>'GRADE_EXPANSION_REPORT', START_TIME=> DATEADD(days, -1, CURRENT_TIMESTAMP())));

