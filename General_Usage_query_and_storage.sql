use role dba;

use schema haven_master.common;

create view haven_master.common.query_history
as select * from snowflake.account_usage.query_history
where start_time > add_months(current_timestamp, -3)
order by start_time;

select add_months(current_timestamp, -1);

show grants of role _haven_master__common__reader;

show grants to role haven_sre



select * from snowflake.account_usage.query_history
where start_time > add_months(current_timestamp, -1)
order by start_time
limit 10;

use schema snowflake.account_usage;

select * from query_history
--where role_name = 'HAVEN_DBT_TRANSFORM'
where start_time between '2024-09-26 00:00:01' and '2024-09-26 18:00:00'
and contains(upper(query_text), 'FCT_RETAIL_SALES')
order by start_time desc;

select table_catalog, 
sum(active_bytes) as active_bytes, 
sum(time_travel_bytes) as time_travel_bytes,
sum(failsafe_bytes) as failsafe_bytes,
sum(retained_for_clone_bytes) as retained_for_clone_bytes,
sum(active_bytes + time_travel_bytes + retained_for_clone_bytes + failsafe_bytes) as total_bytes,
sum(active_bytes + time_travel_bytes + retained_for_clone_bytes + failsafe_bytes) / 1048576  as total_mb,
sum(active_bytes + time_travel_bytes + retained_for_clone_bytes + failsafe_bytes) / 1073741824 as total_gb,
sum(active_bytes + time_travel_bytes + retained_for_clone_bytes + failsafe_bytes) / 1099511627776 as total_tb
from table_storage_metrics
where startswith(table_catalog, 'HAVEN_STORE')
group by 1 order by 1;

