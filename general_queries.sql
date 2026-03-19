list @~/worksheet_data;
select "name" FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()));

show grants to role haven_commercial_harrybillimore;

show grants to role _haven_commercial__schema;

select table_name, column_name, data_type from haven_raw.information_schema.columns
where column_name like '%ID'
and table_schema = 'SEAWARE';

select * from haven_base.seaware.res_header
where res_id is not null
and length(res_id) > 0
limit 100;

show grants of role haven_commercial;

use database haven_store;
use schema commercial;
use role dba;

select arrival_DATE, count(*) from searches_and_bookings_summary
group by 1 order by 1;;


select "DATE" from haven_raw.bigquery.target_01_searches_and_bookings_summary;


select * from HAVEN_STORE.COMMERCIAL.SEARCHES_AND_BOOKINGS_SUMMARY limit 100;

select birthday, count(*) from haven_base.seaware.client
group by 1 order by 1;

describe table haven_raw.seaware.client;

select * from haven_raw.seaware.client where birthday is not null limit 100;

show grants to user robcummins;
show grants to role warner_commercial;

show grants to user gregpugh;
show grants to role haven_zonal_discovery;

describe table haven_raw.seaware.acc_batch_header;


"HAVEN_RAW"."DIG_ARRIVALS"."TRANSPORTATION"use role bourne_governance;

select schema_name from haven_base.information_schema.schemata;

select table_name from haven_base.information_schema.tables where table_schema = 'BIGQUERY';

select table_schema, table_name from haven_base.information_schema.tables 
group by 1, 2 order by 1, 2;

use role haven_commercial;

use role dba;
use warehouse dba_wh;

create or replace masking policy _haven_base__seaware__birthdate as (columnValue string) returns string -> case
                 when is_role_in_session('_haven_base__seaware__birthdate_all') then cast(columnValue as string)
                 when is_role_in_session('_haven_base__seaware__birthdate_year') then
					cast(coalesce(datediff(year, to_timestamp_ntz(columnValue), current_date), 0) as string)
				when is_role_in_session('_haven_base__seaware__birthdate_range') then
					(case when datediff(year, to_timestamp_ntz(columnValue), current_date) between 0 and 9 then '0-9'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 10 and 19 then '10-19'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 20 and 29 then '20-29'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 30 and 39 then '30-39'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 40 and 49 then '40-49'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 50 and 59 then '50-59'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 60 and 69 then '60-69'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 70 and 79 then '70-79'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 80 and 89 then '80-89'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 90 and 99 then '90-99'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) > 100 then '100+'" \
					else 'not set' end)
                     				when is_role_in_session('_haven_base__seaware__birthdate_nochild') then
					(case when datediff(year, to_timestamp_ntz(columnValue), current_date) between 0 and 17 then 'Not Set'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 18 and 29 then 'youth'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 30 and 39 then '30-39'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 40 and 49 then '40-49'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 50 and 59 then '50-59'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 60 and 69 then '60-69'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 70 and 79 then '70-79'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 80 and 89 then '80-89'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 90 and 99 then '90-99'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) > 100 then '100+'" \
					else 'not set' end)

                 else '##########' END

grant role _haven_base__seaware__birthdate_range to role haven_commercial;


use role dba;
use role sysadmin;
select SYSTEM$CANCEL_QUERY('01a8ae3e-0202-15fb-0000-aa9993409222');

select query_text, user_name, execution_status, error_code, error_message, start_time, end_time, total_elapsed_time, execution_time, transaction_blocked_time, bytes_scanned, queued_provisioning_time, queued_repair_time, queued_overload_time, credits_used_cloud_services
from snowflake.account_usage.query_history where warehouse_name = 'HAVEN_COMMERCIAL_XSMALL' and start_time > '2022-12-01'
order by total_elapsed_time desc;

select "ACCOUNT NUMBER" from "HAVEN_RAW"."AZTEC_RETAIL"."ACCOUNTNUMBERASSIGNED" limit 10;

select schema_name from haven_base.information_schema.schemata;

use role dba;
use database haven_base;
SELECT TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_CATALOG = 'HAVEN_BASE' AND TABLE_SCHEMA = 'ACTIVITIES' 
AND NOT ENDSWITH(TABLE_NAME, '__B') 
AND NOT STARTSWITH(TABLE_NAME, 'HVR_ST') 
AND DATA_TYPE IN ('TEXT', 'DATE', 'NUMBER', 'TIMESTAMP_TZ', 'TIMESTAMP_NTZ', 'TIMESTAMP_LTZ', 'VARIANT', 'ARRAY') 
AND CONTAINS(TABLE_NAME, 'ACCOUNTNUMBERASSIGNED') ORDER BY TABLE_NAME, ORDINAL_POSITION;

show roles like 'haven_zonal%';
show grants to role haven_zonal_discovery;

show grants on role _haven_base__zonal__reader;

show grants to role warner_commercial;

use role accountadmin;

use role securityadmin;

show roles like 'data_%';

grant role _haven_base__dig_activities__reader to role data_engineering;
grant role _haven_base__dig_bookings__reader to role data_engineering;
grant role _haven_base__dig_capacity__reader to role data_engineering;
grant role _haven_base__dig_payments__reader to role data_engineering;
grant role _haven_base__dig_pricing__reader to role data_engineering;


select to_char(id) from haven_raw.dig_activities.activities limit 10;
select uuid_string(to_char(id), '') from haven_raw.dig_activities.activities limit 100;

use database training;
use schema training;

create table unknown_guest clone haven_raw.activities.unknown_guest;

use role dba;

use role haven_cdc_dataload;

create table haven_raw.dig_activities.deleteme clone haven_raw.activities.unknown_guest;

show roles like '_haven_raw__activ%';

use role securityadmin;

grant role _haven_raw__dig_arrivals__creator to role haven_cdc_dataload;
grant role _haven_raw__dig_transportation__creator to role haven_cdc_dataload;

drop table haven_raw.dig_activities.deleteme;

select id from haven_raw.dig_arrivals.caravan where code = 'AGE' order by number;

use database haven_raw;
use schema dig_arrivals;

truncate table "HAVEN_RAW"."DIG_ARRIVALS"."CARAVAN";
truncate table "HAVEN_RAW"."DIG_ARRIVALS"."ARRIVAL";
truncate table "HAVEN_RAW"."DIG_ARRIVALS"."MIGRATIONS";
truncate table "HAVEN_RAW"."DIG_ARRIVALS"."TRANSPORTATION";
truncate table "HAVEN_RAW"."DIG_ARRIVALS"."TYPEORM_METADATA";


use database training;
use schema training;

create table client clone haven_raw.seaware.client;

select * from client;

use database haven_raw;
use schema dig_bookings;

select * from admission limit 20;

use role accountadmin;

show users like '%thom%';

SELECT
1 AS PRIORSEASON, BUDGETS, BKFIRMDATE, SUM(PR_NETTBILLING) AS TARIFF, SUM(PR_UNITWEEKS) AS WEEKS
FROM dbo.spg_trawler_publish
WHERE Budgets = 0
AND BKFIRMDATE >= '2021-19-12'
AND BKFIRMDATE <= '2022-08-01'
AND PRIORSEASON = 0
--AND SEASON = '23'
AND TOURING = 0
GROUP BY PRIORSEASON, BUDGETS, BKFIRMDATE;

use role dba;

select company, count(*) from "HAVEN_STORE"."COMPETITOR"."SITES"
group by 1 order by 1;

SELECT max(extracted_date) FROM "HAVEN_RAW"."COMPETITOR"."PARKDEAN_DETAILS";

use role securityadmin;

show users like 'thom%';
grant role _warner_store__ma_mart__creator to role warner_cdc_dataload;
grant role haven_commercial to user thomloveridge;
use role useradmin;
alter user thomloveridge set default_role = haven_commercial;
use role securityadmin;
show grants to user thomloveridge;
revoke role haven_zonal_discovery_thomLoveridge from user thomloveridge;

