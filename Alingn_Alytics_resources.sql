use role dba;

use schema snowflake.account_usage;

select * from query_history limit 10;

show warehouses like '%align%';

select * from query_history
where warehouse_name in ('ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE', 'ALIGNALYTICS_PRICING_DATA_WAREHOUSE', 'ALIGNALYTICS_SNOWPARK_ML_WAREHOUSE')
and start_time between '2024-09-01' and '2024-09-30'
order by start_time;

select * from query_history
where warehouse_name in ('ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE', 'ALIGNALYTICS_PRICING_DATA_WAREHOUSE', 'ALIGNALYTICS_SNOWPARK_ML_WAREHOUSE')
and start_time between '2024-10-01' and '2024-10-31'
order by start_time;

select * from query_history
where warehouse_name in ('ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE', 'ALIGNALYTICS_PRICING_DATA_WAREHOUSE', 'ALIGNALYTICS_SNOWPARK_ML_WAREHOUSE')
and start_time between '2024-11-01' and '2024-11-30'
order by start_time;

select * from query_history
where warehouse_name in ('ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE', 'ALIGNALYTICS_PRICING_DATA_WAREHOUSE', 'ALIGNALYTICS_SNOWPARK_ML_WAREHOUSE')
and start_time between '2024-12-01' and '2024-12-31'
order by start_time;

select * from query_history
where warehouse_name in ('ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE', 'ALIGNALYTICS_PRICING_DATA_WAREHOUSE', 'ALIGNALYTICS_SNOWPARK_ML_WAREHOUSE')
and start_time between '2025-01-01' and '2025-01-31'
order by start_time;


