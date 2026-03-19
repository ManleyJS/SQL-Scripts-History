use role haven_cdc_dataload;
use warehouse bourne_cdc_dataload_xsmall;

use schema haven_raw.seaware;

--01b23a29-0203-60be-0000-aa99e6335c1e
create table _VRES_GRADE_PRICE as select * from VRES_GRADE_PRICE before(statement => '01b23a29-0203-60be-0000-aa99e6335c1e');
create table _BLL_INV_AVAILABILITY as select * from BLL_INV_AVAILABILITY before(statement => '01b239bf-0203-60be-0000-aa99e63164f2');

use role dba;
use warehouse dba_wh;
use schema haven_store.availability;
--01b25398-0203-6374-0000-aa99e75ff5fa
create table _GRADE_PRICE_HISTORY as select * from GRADE_PRICE_HISTORY before(statement => '01b25398-0203-6374-0000-aa99e75ff5fa');

create table _GRADE_PRICE_HISTORY as select * from GRADE_PRICE_HISTORY before(timestamp => 'Tue, 13 Feb 2024 16:00:00'::timestamp);

alter table GRADE_PRICE_HISTORY rename to GRADE_PRICE_HISTORY_pre_timetravel;
alter table _GRADE_PRICE_HISTORY rename to GRADE_PRICE_HISTORY;


use role accountadmin;
use warehouse admin_wh;

select * from snowflake.account_usage.query_history 
where role_name = 'DBA'
and database_name = 'HAVEN_STORE'
and schema_name = 'AVAILABILITY'
--query_text = 'alter schema haven_raw.seaware swap with haven_raw.seaware_swap'
and start_time between '2024-02-13 16:00:00' and '2024-02-13 17:00:00'
and contains(upper(query_text), 'GRADE_PRICE_HISTORY');