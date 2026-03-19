use role accountadmin;
show resource monitors;

alter resource monitor bourne_account_resource_monitor
set notify_users = (GARYRANSON, DONOVANRANSOME, JONATHANMANLEY, HAVENDATAALERTS);

alter resource monitor hvr_cdc_resource_monitor
set notify_users = (GARYRANSON, DONOVANRANSOME, JONATHANMANLEY, HAVENDATAALERTS);

use schema snowflake.account_usage;

select * from query_history 
where start_time > '2024-01-01'
and total_elapsed_time > 6000000
order by total_elapsed_time desc;

--6000000
--3600000

use schema training.training;

create table training.training.haven_commercial_queries as
select * from snowflake.account_usage.query_history 
where start_time > '2024-01-01'
and warehouse_id = 14
order by role_name;


select * from query_history limit 10;

select * from query_history
where query_id in ('01b456d6-0203-b90c-0000-aa99fe6581aa', '01b45c85-0203-b90c-0000-aa99feb32cbe');

select query_id, query_text, rows_inserted, query_type, execution_status, start_time, end_time, total_elapsed_time, rows_updated, rows_deleted, rows_unloaded, execution_time from query_history 
where database_name = 'WARNER_RAW'
and schema_name = 'MA_MART'
and role_name = 'WARNER_CDC_DATALOAD'
and start_time > '2024-05-01'
--and query_text like '%D_WRN_CONTACT_RESPONSE%'
and query_text ='truncate "MA_MART"."D_WRN_CONTACT_RESPONSE"'
--and query_text not like '%D_WRN_CONTACT_RESPONSE__B%'
--and query_text = 'truncate "MA_MART"."D_WRN_GUEST"'
order by start_time;


select query_id, query_text, query_type, execution_status, start_time, end_time, total_elapsed_time, rows_inserted, rows_updated, rows_deleted, rows_unloaded, execution_time from query_history 
where database_name = 'HAVEN_RAW'
and schema_name = 'CONSENT_AND_PREFERENCE'
and role_name = 'HAVEN_CDC_DATALOAD'
and start_time > '2024-05-16 15:00'
and lower(query_text) like '%customertopic%'
and lower(query_text) not like '%customertopic__b%'
--and query_text = 'truncate "MA_MART"."D_WRN_GUEST"'
order by start_time;

