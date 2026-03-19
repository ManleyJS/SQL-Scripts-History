use role dba;

use schema snowflake.account_usage;

SHOW PARAMETERS LIKE '%STATEMENT_TIMEOUT_IN_SECONDS%' FOR WAREHOUSE dba_wh;

select (172800 / 60) / 60;

ALTER WAREHOUSE <warehouse_name> SET STATEMENT_TIMEOUT_IN_SECONDS = 172800;

select * from query_history limit 10;

select total_elapsed_time /1000 as total_time_seconds, compilation_time, execution_time, queued_overload_time, queued_provisioning_time, queued_repair_time, transaction_blocked_time, execution_status, start_time, role_name, user_name, warehouse_name, query_text
from query_history
where start_time > '2025-01-01'
and execution_time > 7200000
order by execution_time desc;

select 172797972 / 1000;

use role securityadmin;

grant create dynamic table on schema haven_raw.blapi_pricing to role _haven_raw__blapi_pricing__creator;

use role dba;

select total_elapsed_time /1000 as total_time_seconds, compilation_time, execution_time, queued_overload_time, queued_provisioning_time, queued_repair_time, 
transaction_blocked_time, execution_status, start_time, end_time, role_name, user_name, warehouse_name, query_text
from snowflake.account_usage.query_history
where start_time > '2025-01-01'
and execution_time > 7200000
order by execution_time desc;

