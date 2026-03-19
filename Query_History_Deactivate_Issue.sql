use role accountadmin;

use schema snowflake.account_usage;

select * from query_history limit 10;

select * from query_history
where database_name = 'HAVEN_RAW'
and schema_name = 'SEAWARE'
and role_name = 'HAVEN_CDC_DATALOAD'
and start_time between '2024-02-09 08:34:00' and '2024-02-09 09:00:00'
--and execution_status = 'FAIL'
--and contains(query_tag, 'hub_version=6.1.0/18')
and contains(query_tag, 'hub_version=6.1.0/43')
--and query_type = 'DROP'
order by start_time;

select query_text, execution_status, start_time, end_time, error_message, query_tag from query_history
where database_name = 'HAVEN_RAW'
and schema_name = 'SEAWARE'
and role_name = 'HAVEN_CDC_DATALOAD'
and start_time between '2024-02-09 08:35:00' and '2024-02-09 09:00:00'
--and execution_status = 'FAIL'
--and contains(query_tag, 'hub_version=6.1.0/18')
and contains(query_tag, 'hub_version=6.1.0/43')
--and query_type = 'DROP'
--and error_code = '002003'
order by start_time;

