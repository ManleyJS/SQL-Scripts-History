use role dba;

use database haven_raw;

use schema SEAWARE_ETLEAP;

select *
from table(information_schema.copy_history(TABLE_NAME=>'RES_HEADER', START_TIME=> DATEADD(hours, -6, CURRENT_TIMESTAMP())));

select * from snowflake.account_usage.copy_history
where table_catalog_name = 'HAVEN_RAW'
and table_schema_name = 'SEAWARE_ETLEAP'
and table_name like '%RES_HEADER%'
and last_load_time > '2025-06-17';

select * from snowflake.account_usage.query_history
where role_name = 'HAVEN_ETLEAP_DATALOAD'
and start_time > '2025-06-18 09:00:00'
and query_type in ('UPDATE', 'INSERT', 'UPDATE', 'MERGE')
order by start_time;

select * from snowflake.account_usage.tables
where table_catalog = 'HAVEN_RAW'
and table_schema = 'SEAWARE_ETLEAP'
and DELETED is NULL
ORDER BY TABLE_NAME;


select table_name, last_altered, row_count, bytes from snowflake.account_usage.tables AT(TIMESTAMP => DATEADD(hours, -2, CURRENT_TIMESTAMP()))
where table_catalog = 'HAVEN_RAW'
and table_schema = 'SEAWARE_ETLEAP'
and table_name = 'RES_HEADER'
and DELETED is NULL
union
select table_name, last_altered, row_count, bytes from snowflake.account_usage.tables
where table_catalog = 'HAVEN_RAW'
and table_schema = 'SEAWARE_ETLEAP'
and table_name = 'RES_HEADER'
and DELETED is NULL
;

select table_name, last_altered, row_count, bytes from snowflake.account_usage.tables AT(TIMESTAMP => DATEADD(minutes, -30, CURRENT_TIMESTAMP()))
where table_catalog = 'HAVEN_RAW'
and table_schema = 'SEAWARE_ETLEAP'
and table_name = 'RES_HEADER'
and DELETED is NULL
union
select table_name, last_altered, row_count, bytes from snowflake.account_usage.tables
where table_catalog = 'HAVEN_RAW'
and table_schema = 'SEAWARE_ETLEAP'
and table_name = 'RES_HEADER'
and DELETED is NULL
;

select current_warehouse();
select table_name, last_altered from snowflake.account_usage.tables
where table_catalog = 'HAVEN_RAW'
and table_schema = 'SEAWARE_ETLEAP'
and DELETED is NULL
ORDER BY TABLE_NAME;

select * from snowflake.account_usage.columns limit 50;

with column_aggregates as (
select table_catalog, table_schema, table_name, column_name, ordinal_position
from snowflake.account_usage.columns
where table_catalog = 'HAVEN_RAW'
union all
select table_catalog, table_schema, table_name, column_name, ordinal_position
from snowflake.account_usage.columns AT(TIMESTAMP => DATEADD(minutes, -60, CURRENT_TIMESTAMP()))
where table_catalog = 'HAVEN_RAW')
select table_catalog, table_schema, table_name, column_name, ordinal_position
from column_aggregates
group by 1,2,3,4,5
having count(*) = 1
order by table_catalog, table_schema, table_name, column_name, ordinal_position;

select * from snowflake.account_usage.columns
where table_catalog = 'HAVEN_RAW'
and TABLE_SCHEMA = 'AMPLITUDE'
and table_name = 'STAGING_EVENT_100000957_109094308_308975145';

select * from snowflake.account_usage.tables
where table_catalog = 'HAVEN_RAW'
and TABLE_SCHEMA = 'AMPLITUDE'
and table_name = 'STAGING_EVENT_100000957_109094308_308975145';

with table_aggregate as (
select table_catalog, table_schema, table_name, last_altered, row_count, bytes from snowflake.account_usage.tables AT(TIMESTAMP => DATEADD(minutes, -60, CURRENT_TIMESTAMP()))
where table_catalog = 'HAVEN_RAW'
and DELETED is NULL
union all
select table_catalog, table_schema, table_name, last_altered, row_count, bytes from snowflake.account_usage.tables
where table_catalog = 'HAVEN_RAW'
and DELETED is NULL)
select table_catalog, table_schema, table_name, last_altered, row_count, bytes from table_aggregate
group by table_catalog, table_schema, table_name, last_altered, row_count, bytes
having count(*) = 2
order by table_catalog, table_schema, table_name
;


select table_name, last_altered, row_count, bytes from snowflake.account_usage.tables AT(TIMESTAMP => DATEADD(minutes, -30, CURRENT_TIMESTAMP())) where table_catalog = 'HAVEN_RAW' and table_schema = 'PLOT_RDS_TEST' and table_name = 'PITCH_INSPECTIONS' and DELETED is NULL union select table_name, last_altered, row_count, bytes from snowflake.account_usage.tables where table_catalog = 'HAVEN_RAW' and table_schema = 'PLOT_RDS_TEST' and table_name = 'PITCH_INSPECTIONS' and DELETED is NULL;