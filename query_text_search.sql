use role dba;

use schema snowflake.account_usage;

select * from query_history
where user_name = 'JONATHANMANLEY'
and role_name = 'DBA'
and contains(query_text, 'LUCY')
and start_time between '2025-05-21' and '2025-05-22'
order by start_time;


SELECT query_text, execution_status, start_time, end_time, error_code FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
WHERE ROLE_NAME = 'HAVEN_DBT_DEVELOPMENT'
AND START_TIME BETWEEN '2025-06-23' AND '2025-06-30'
AND USER_NAME = 'JOSEPHMCDONALD'
AND CONTAINS(LOWER(QUERY_TEXT), 'site_fee_year')
ORDER BY START_TIME DESC;


SELECT query_text, execution_status, start_time, end_time, error_code FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
WHERE ROLE_NAME = 'HAVEN_DBT_DEVELOPMENT'
AND START_TIME BETWEEN '2025-06-23' AND '2025-06-30'
AND USER_NAME = 'JOSEPHMCDONALD'
AND CONTAINS(LOWER(QUERY_TEXT), 'gross')
ORDER BY START_TIME DESC;