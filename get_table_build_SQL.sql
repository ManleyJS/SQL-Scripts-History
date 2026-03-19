select * from snowflake.account_usage.query_history
where user_name = 'JONATHANMANLEY'
and start_time between '2025-05-21 10:45:00' and '2025-05-21 11:20:00'
and query_type = 'SELECT'
and contains(query_text, 'PROSPECTS')
order by start_time;


select table_name, table_schema, table_catalog, table_type, created, deleted, last_altered, last_ddl, last_ddl_by, row_count from snowflake.account_usage.tables
where table_name = 'BOOKINGS'
and table_schema = 'PROPENSITY_MODEL'
and table_catalog = 'HAVEN_KPMG_ANALYSIS'
order by created desc;

SELECT query_text, query_tag, execution_status, start_time, end_time, error_code FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
WHERE ROLE_NAME = 'HAVEN_KPMG_ANALYSIS'
AND START_TIME BETWEEN '2025-02-06 09:00:00' AND '2025-03-15 09:45:00'
-- AND START_TIME < '2025-03-15 16:12:15'
AND USER_NAME = 'LUCYKEARNEY'
AND QUERY_TYPE IN ('CREATE_TABLE_AS_SELECT', 'CREATE')
AND CONTAINS(QUERY_TEXT, 'HAVEN_KPMG_ANALYSIS.PROPENSITY_MODEL.BOOKINGS')
ORDER BY START_TIME DESC;


-- ALL_HOLIDAYS

-- 27/05/2025

select table_name, table_schema, table_catalog, table_type, created, deleted, last_altered, last_ddl, last_ddl_by, row_count from snowflake.account_usage.tables
where table_name = 'HOLIDAYMAKER'
and table_schema = 'FUZZY_MATCH'
and table_catalog = 'HAVEN_KPMG_ANALYSIS'
order by created desc;

SELECT query_text, query_tag, execution_status, start_time, end_time, error_code FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
WHERE ROLE_NAME = 'HAVEN_KPMG_ANALYSIS'
AND START_TIME BETWEEN '2024-11-14 12:30:00' AND '2025-01-09 09:45:00'
-- AND START_TIME < '2025-03-15 16:12:15'
AND USER_NAME = 'LUCYKEARNEY'
AND QUERY_TYPE IN ('CREATE_TABLE_AS_SELECT', 'CREATE')
AND CONTAINS(QUERY_TEXT, 'HAVEN_KPMG_ANALYSIS.FUZZY_MATCH.HOLIDAYMAKER')
ORDER BY START_TIME DESC;

-- CREATE OR REPLACE TABLE HAVEN_KPMG_ANALYSIS.FUZZY_MATCH.HOLIDAYMAKER AS
-- SELECT * FROM HAVEN_KPMG_ANALYSIS.FUZZY_MATCH.ALL_HOLIDAYMAKER ;
-- 2025-01-08 16:45:24.636 +0000

-- ALL_HOLIDAYMAKER

select table_name, table_schema, table_catalog, table_type, created, deleted, last_altered, last_ddl, last_ddl_by, row_count from snowflake.account_usage.tables
where table_name = 'ALL_HOLIDAYMAKER'
and table_schema = 'FUZZY_MATCH'
and table_catalog = 'HAVEN_KPMG_ANALYSIS'
order by created desc;

SELECT query_text, query_tag, execution_status, start_time, end_time, error_code FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
WHERE ROLE_NAME = 'HAVEN_KPMG_ANALYSIS'
AND START_TIME BETWEEN '2024-11-14 12:30:00' AND '2025-01-09 09:45:00'
-- AND START_TIME < '2025-03-15 16:12:15'
AND USER_NAME = 'LUCYKEARNEY'
AND QUERY_TYPE IN ('CREATE_TABLE_AS_SELECT', 'CREATE')
AND CONTAINS(QUERY_TEXT, 'HAVEN_KPMG_ANALYSIS.FUZZY_MATCH.ALL_HOLIDAYMAKER')
ORDER BY START_TIME DESC;


-- HAVEN_KPMG_ANALYSIS.PROPENSITY_MODEL.ALL_HOLIDAYMAKER_BOOKINGS

select table_name, table_schema, table_catalog, table_type, created, deleted, last_altered, last_ddl, last_ddl_by, row_count from snowflake.account_usage.tables
where table_name = 'ALL_HOLIDAYMAKER_BOOKINGS'
and table_schema = 'PROPENSITY_MODEL'
and table_catalog = 'HAVEN_KPMG_ANALYSIS'
order by created desc;

SELECT query_text, query_tag, execution_status, start_time, end_time, error_code FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
WHERE ROLE_NAME = 'HAVEN_KPMG_ANALYSIS'
AND START_TIME BETWEEN '2024-11-14 12:30:00' AND '2025-01-09 09:45:00'
-- AND START_TIME < '2025-03-15 16:12:15'
AND USER_NAME = 'LUCYKEARNEY'
AND QUERY_TYPE IN ('CREATE_TABLE_AS_SELECT', 'CREATE')
AND CONTAINS(QUERY_TEXT, 'HAVEN_KPMG_ANALYSIS.PROPENSITY_MODEL.ALL_HOLIDAYMAKER_BOOKINGS')
ORDER BY START_TIME DESC;

select get_ddl('view', 'HAVEN_KPMG_ANALYSIS.PROPENSITY_MODEL.ALL_HOLIDAYMAKER_BOOKINGS');


SELECT query_text, query_tag, execution_status, start_time, end_time, error_code 
FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
--WHERE ROLE_NAME = 'HAVEN_KPMG_ANALYSIS'
where START_TIME BETWEEN '2024-10-01 12:30:00' AND '2025-05-01 09:45:00'
-- AND START_TIME < '2025-03-15 16:12:15'
AND USER_NAME = 'DONOVANRANSOME'
--AND QUERY_TYPE IN ('CREATE_TABLE_AS_SELECT', 'CREATE')
AND CONTAINS(QUERY_TEXT, 'HOLIDAYMAKER')
ORDER BY START_TIME DESC;
