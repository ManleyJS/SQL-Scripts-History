use role accountadmin;

use schema snowflake.account_usage;

show views;


select * from warehouse_metering_history limit 20;


select * from warehouse_metering_history limit 200;

select * from query_history limit 20;

SELECT account_name,
  ROUND(SUM(usage_in_currency), 2) as usage_in_currency
FROM snowflake.organization_usage.usage_in_currency_daily
WHERE usage_date > DATEADD(month,-1,CURRENT_TIMESTAMP())
GROUP BY 1
ORDER BY 2 desc;

select to_date(start_time) as start_date, warehouse_name, sum(credits_used) as total_used, sum(credits_used_compute) as compute_use, sum(credits_used_cloud_services) as cloud_services
from warehouse_metering_history
group by to_date(start_time), 2
order by to_date(start_time), 2;

select extract(year from start_time) as start_year, extract(month from start_time) as start_month, warehouse_name, sum(credits_used) as total_used, sum(credits_used_compute) as compute_use, sum(credits_used_cloud_services) as cloud_services
from warehouse_metering_history
group by extract(year from start_time), extract(month from start_time), 3
order by extract(year from start_time), extract(month from start_time), 3
;

select min(start_time) from warehouse_metering_history;

select distinct name from metering_history;

select to_date(start_time), warehouse_name, role_name, sum(execution_time)
from query_history
where warehouse_name = 'BOURNE_CDC_DATALOAD_XSMALL'
group by to_date(start_time), warehouse_name, role_name
order by to_date(start_time), warehouse_name, role_name;

WITH
warehouse_sizes AS (
    SELECT 'X-Small' AS warehouse_size, 1 AS credits_per_hour UNION ALL
    SELECT 'Small' AS warehouse_size, 2 AS credits_per_hour UNION ALL
    SELECT 'Medium'  AS warehouse_size, 4 AS credits_per_hour UNION ALL
    SELECT 'Large' AS warehouse_size, 8 AS credits_per_hour UNION ALL
    SELECT 'X-Large' AS warehouse_size, 16 AS credits_per_hour UNION ALL
    SELECT '2X-Large' AS warehouse_size, 32 AS credits_per_hour UNION ALL
    SELECT '3X-Large' AS warehouse_size, 64 AS credits_per_hour UNION ALL
    SELECT '4X-Large' AS warehouse_size, 128 AS credits_per_hour
)
SELECT
    qh.query_id,
    qh.query_text,
    qh.execution_time/(1000*60*60)*wh.credits_per_hour AS query_cost
FROM snowflake.account_usage.query_history AS qh
INNER JOIN warehouse_sizes AS wh
    ON qh.warehouse_size=wh.warehouse_size
WHERE
    start_time >= CURRENT_DATE - 30
and
    warehouse_name in ('WARNER_APS_CDC_WAREHOUSE_XSMALL', 'WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XLARGE', 'WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL');

show warehouses like 'warner_%';

WITH
warehouse_sizes AS (
    SELECT 'X-Small' AS warehouse_size, 1 AS credits_per_hour UNION ALL
    SELECT 'Small' AS warehouse_size, 2 AS credits_per_hour UNION ALL
    SELECT 'Medium'  AS warehouse_size, 4 AS credits_per_hour UNION ALL
    SELECT 'Large' AS warehouse_size, 8 AS credits_per_hour UNION ALL
    SELECT 'X-Large' AS warehouse_size, 16 AS credits_per_hour UNION ALL
    SELECT '2X-Large' AS warehouse_size, 32 AS credits_per_hour UNION ALL
    SELECT '3X-Large' AS warehouse_size, 64 AS credits_per_hour UNION ALL
    SELECT '4X-Large' AS warehouse_size, 128 AS credits_per_hour
)
create table training.training.warehouse_usage_by_role as SELECT
    extract(year from qh.start_time), extract(month from qh.start_time),
    qh.warehouse_name, qh.role_name,
    sum(qh.execution_time/(1000*60*60)*wh.credits_per_hour) AS total_credits
FROM snowflake.account_usage.query_history AS qh
INNER JOIN warehouse_sizes AS wh
    ON qh.warehouse_size=wh.warehouse_size
WHERE
    start_time >= CURRENT_DATE - 30
group by 1, 2, 3, 4
order by 1, 2, 3, 4;    

-- 15/01/2025


--- where warehouse_name in ('ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE', 'ALIGNALYTICS_PRICING_DATA_WAREHOUSE', 'ALIGNALYTICS_SNOWPARK_ML_WAREHOUSE')

select extract(year from start_time) as start_year, extract(month from start_time) as start_month, warehouse_name, sum(credits_used) as total_used, sum(credits_used_compute) as compute_use, sum(credits_used_cloud_services) as cloud_services
from warehouse_metering_history
where warehouse_name in ('ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE', 'ALIGNALYTICS_PRICING_DATA_WAREHOUSE', 'ALIGNALYTICS_SNOWPARK_ML_WAREHOUSE')
group by extract(year from start_time), extract(month from start_time), 3
order by extract(year from start_time), extract(month from start_time), 3
;

select min(start_time) from warehouse_metering_history;

select distinct name from metering_history;

select to_date(start_time) as start_date, warehouse_name, role_name, sum(execution_time)
from query_history
where warehouse_name in ('ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE', 'ALIGNALYTICS_PRICING_DATA_WAREHOUSE', 'ALIGNALYTICS_SNOWPARK_ML_WAREHOUSE')
group by 1,2,3
order by 1,2,3;


select to_date(start_time) from query_history limit 20;


WITH
warehouse_sizes AS (
    SELECT 'X-Small' AS warehouse_size, 1 AS credits_per_hour UNION ALL
    SELECT 'Small' AS warehouse_size, 2 AS credits_per_hour UNION ALL
    SELECT 'Medium'  AS warehouse_size, 4 AS credits_per_hour UNION ALL
    SELECT 'Large' AS warehouse_size, 8 AS credits_per_hour UNION ALL
    SELECT 'X-Large' AS warehouse_size, 16 AS credits_per_hour UNION ALL
    SELECT '2X-Large' AS warehouse_size, 32 AS credits_per_hour UNION ALL
    SELECT '3X-Large' AS warehouse_size, 64 AS credits_per_hour UNION ALL
    SELECT '4X-Large' AS warehouse_size, 128 AS credits_per_hour
)
SELECT
    qh.query_id,
    qh.query_text,
    qh.execution_time/(1000*60*60)*wh.credits_per_hour AS query_cost
FROM snowflake.account_usage.query_history AS qh
INNER JOIN warehouse_sizes AS wh
    ON qh.warehouse_size=wh.warehouse_size
WHERE
    start_time >= CURRENT_DATE - 30
AND warehouse_name in ('ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE', 'ALIGNALYTICS_PRICING_DATA_WAREHOUSE', 'ALIGNALYTICS_SNOWPARK_ML_WAREHOUSE');


WITH
warehouse_sizes AS (
    SELECT 'X-Small' AS warehouse_size, 1 AS credits_per_hour UNION ALL
    SELECT 'Small' AS warehouse_size, 2 AS credits_per_hour UNION ALL
    SELECT 'Medium'  AS warehouse_size, 4 AS credits_per_hour UNION ALL
    SELECT 'Large' AS warehouse_size, 8 AS credits_per_hour UNION ALL
    SELECT 'X-Large' AS warehouse_size, 16 AS credits_per_hour UNION ALL
    SELECT '2X-Large' AS warehouse_size, 32 AS credits_per_hour UNION ALL
    SELECT '3X-Large' AS warehouse_size, 64 AS credits_per_hour UNION ALL
    SELECT '4X-Large' AS warehouse_size, 128 AS credits_per_hour
)
create table training.training.warehouse_usage_by_role as SELECT
    extract(year from qh.start_time), extract(month from qh.start_time),
    qh.warehouse_name, qh.role_name,
    sum(qh.execution_time/(1000*60*60)*wh.credits_per_hour) AS total_credits
FROM snowflake.account_usage.query_history AS qh
INNER JOIN warehouse_sizes AS wh
    ON qh.warehouse_size=wh.warehouse_size
WHERE
    start_time >= CURRENT_DATE - 30
group by 1, 2, 3, 4
order by 1, 2, 3, 4;    

-- 05/06/2025

select extract(year from start_time) as start_year, extract(month from start_time) as start_month, warehouse_name, sum(credits_used) as total_used, sum(credits_used_compute) as compute_use, sum(credits_used_cloud_services) as cloud_services
from warehouse_metering_history
WHERE warehouse_name in ('WARNER_APS_CDC_WAREHOUSE_XSMALL', 'WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XLARGE', 'WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL')
group by extract(year from start_time), extract(month from start_time), 3
order by extract(year from start_time), extract(month from start_time), 3
;



select extract(year from start_time) as start_year, extract(month from start_time) as start_month, sum(credits_used) as total_used, sum(credits_used_compute) as compute_use, sum(credits_used_cloud_services) as cloud_services
from warehouse_metering_history
WHERE warehouse_name in ('WARNER_APS_CDC_WAREHOUSE_XSMALL', 'WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XLARGE', 'WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL')
group by extract(year from start_time), extract(month from start_time)
order by extract(year from start_time), extract(month from start_time)
;


select extract(year from start_time) as start_year, extract(month from start_time) as start_month, sum(credits_used) as total_used, sum(credits_used_compute) as compute_use, sum(credits_used_cloud_services) as cloud_services
from warehouse_metering_history
WHERE warehouse_name like 'WARNER_%'
group by extract(year from start_time), extract(month from start_time)
order by extract(year from start_time), extract(month from start_time)
;


select concat(extract(year from start_time), '-', extract(month from start_time)) as usage_date, sum(credits_used) as total_used, sum(credits_used_compute) as compute_use, sum(credits_used_cloud_services) as cloud_services
from warehouse_metering_history
WHERE warehouse_name like 'WARNER_%'
group by 1
order by 1
;

select extract(year from start_time) as usage_year, extract(month from start_time) as usage_month, sum(credits_used_compute)::decimal(10,2) as compute_use, sum(credits_used_cloud_services)::decimal(10,2) as cloud_service, sum(credits_used)::decimal(10,2) as total_used, sum(credits_used * 3.13)::decimal(10,2) as total_cost_usd 
from warehouse_metering_history
WHERE warehouse_name like 'WARNER_%'
group by extract(year from start_time), extract(month from start_time)
order by extract(year from start_time), extract(month from start_time)
;

select sum(credits_used_compute)::decimal(10,2) as compute_use, sum(credits_used_cloud_services)::decimal(10,2) as cloud_service, sum(credits_used)::decimal(10,2) as total_used, sum(credits_used * 3.12)::decimal(10,2) as total_cost_usd 
from warehouse_metering_history
WHERE warehouse_name like 'WARNER_%'
;

select * from warehouse_metering_history
limit 5;


select warehouse_name, extract(year from start_time) as usage_year, extract(month from start_time) as usage_month, sum(credits_used_compute)::decimal(10,2) as compute_use, sum(credits_used_cloud_services)::decimal(10,2) as cloud_service, sum(credits_used)::decimal(10,2) as total_used, sum(credits_used * 3.13)::decimal(10,2) as total_cost_usd 
from warehouse_metering_history
WHERE warehouse_name like 'WARNER_%'
group by 1, extract(year from start_time), extract(month from start_time)
order by 1, extract(year from start_time), extract(month from start_time)
;


select warehouse_name, warehouse_id, sum(credits_used) as credits from snowflake.account_usage.warehouse_metering_history where start_time >= TO_TIMESTAMP_LTZ('2024-06-01T00:00:00Z', 'auto') and start_time < TO_TIMESTAMP_LTZ('2025-06-06T00:00:00Z', 'auto') group by 1, 2 order by 3 desc limit 100;


select warehouse_name, warehouse_id, sum(credits_used) as credits from snowflake.account_usage.warehouse_metering_history where start_time >= TO_TIMESTAMP_LTZ('2024-06-01T00:00:00Z', 'auto') and start_time < TO_TIMESTAMP_LTZ('2025-06-06T00:00:00Z', 'auto') 
and warehouse_name like 'WARNER_%'
group by 1, 2 order by 3 desc limit 100;