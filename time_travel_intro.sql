use role dba;

use schema haven_raw.seaware_rds;

select count(*) from haven_raw.seaware_rds.vcs_log_field at(timestamp => 'Mon, 03 October 2022 11:06:00'::timestamp);


select * from snowflake.account_usage.query_history
where database_name = 'HAVEN_RAW'
and schema_name = 'SEAWARE_RDS'
and upper(query_text) like '%VCS_LOG_FIELD%';