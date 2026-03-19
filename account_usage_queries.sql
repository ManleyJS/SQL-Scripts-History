-- 04/11/2025

use role dba;

use schema snowflake.account_usage;

select * from query_history
where user_name = 'DANGRAINGER'
and start_time between '2025-11-04 06:00:20' and '2025-11-04 13:00:00'
order by start_time;


-- 24/10/2025

use role dba;

use schema snowflake.account_usage;

select * from query_history
where execution_status = 'FAIL'
and start_time > '2025-10-24 08:00:00'
order by start_time;

-- 23/10/2025

use role dba;

use schema snowflake.account_usage;

select user_name, is_success, max(event_timestamp)  from login_history 
where FIRST_AUTHENTICATION_FACTOR = 'PASSWORD'
and event_timestamp > '2025-10-01'
group by user_name, is_success
order by 3;

select * from query_history
where user_name = 'HAVEN_BATCH_DATALOAD'
and start_time between '2025-10-23 06:00:20' and '2025-10-23 06:20:00'
order by start_time;

select * from users
where type = 'LEGACY_SERVICE'
and deleted_on is null;

select * from users
where deleted_on is null
and disabled = 'false'
order by type;



-- 22/10/2025

select * from query_history
where role_name = 'HAVEN_DBT_TRANSFORM_PROD'
and execution_status = 'FAIL'
and start_time > '2025-10-22 14:00:00'
order by start_time;

use role securityadmin;

show grants to role haven_dbt_transform;

grant role _met_office_postcode_data__usage to role haven_dbt_transform;

use role dba;

-- 22/10/2025

-- 01bfe0ad-0207-e16a-00aa-9901aa314a1f

select * from snowflake.account_usage.query_history
where query_id = '01bfe0ad-0207-e16a-00aa-9901aa314a1f';



-- 21/10/2025

-- haven_dbt_development_align_alytics

use schema snowflake.account_usage;

select * from login_history
where user_name = 'AA_ANALYTICS_SERVICE_ACCOUNT'
and event_timestamp > '2025-10-21 14:00'
order by event_timestamp;

select * from query_history
where user_name = 'AA_ANALYTICS_SERVICE_ACCOUNT'
and start_time > '2025-10-21 14:00'
order by start_time;


-- 20/10/2025

use role accountadmin;

grant usage on event table haven_store.event_data.event_data to role dba;

use role dba;

use schema haven_store.event_data;

show tables;

select resource_attributes, resource_attributes:"db.user" from haven_store.event_data.event_log limit 10;

select * from haven_store.event_data.event_log
where not startswith(resource_attributes:"snow.executable.name", 'FRESHSALES_SALES_LEADS');

use role securityadmin;


grant role haven_data_science_dev to user jadenorth;

use role dba;

select * from query_history
where user_name = 'FRASERTARBET'
and start_time > '2025-10-20 09:00:00';


use role dba;

select * 
from login_history
where contains(user_name, 'TRANSFORM')
and is_success = 'NO'
and event_timestamp > '2025-10-20';

-- 17/10/2025

use role dba;

select * from query_history
where execution_status = 'FAIL'
and error_code = '003001'
and start_time > '2025-10-17 11:00:00';


-- 15/10/2025

use role dba;

use schema snowflake.account_usage;

select * from query_history
where execution_status = 'FAIL'
and start_time > '2025-10-17 01:00:00'
--and error_code = '003001'
and contains(upper(error_message), 'STG_RETAIL_CHOPSTIX')
order by start_time;

select * 
from login_history
where user_name = 'HAVEN_GUESTS_OWNERS_SERVICE_ACCOUNT';

USE ROLE USERADMIN;

SHOW USERS LIKE 'HAVEN_GUESTS_OWNERS_SERVICE_ACCOUNT';

use role dba;

select * from login_history
where user_name = 'HAVEN_ONE_GREAT_TEAM_SERVICE_ACCOUNT'
and event_timestamp > '2025-10-13'
order by event_timestamp desc;


-- 14/10/2025

use role dba;

use schema snowflake.account_usage;

select * from login_history
where user_name = 'HAVEN_AMPLITUDE_INTEGRATION'
and event_timestamp > '2025-10-13'
order by event_timestamp desc;


-- 13/10/2025

use role dba;

use schema snowflake.account_usage;

select name, created_on, login_name, has_password, comment, last_success_login, default_secondary_role, type 
from users 
where type != 'SNOWFLAKE_SERVICE'
and deleted_on is null
and disabled = FALSE;

select * from login_history limit 10;

select * from login_history
where user_name = 'HAVEN_AMPLITUDE_INTEGRATION'
and event_timestamp > '2025-10-13'
order by event_timestamp desc;

select * from query_history
where user_name = 'HAVEN_AMPLITUDE_INTEGRATION'
and start_time > '2025-10-13'
order by start_time desc;


-- historic queries



use role dba;

use schema snowflake.account_usage;

select * from query_history
where user_name = 'DILLONSIM'
and start_time between '2025-09-29 10:00:00' and '2025-09-29 16:00:00'
order by start_time;


select * from query_history
where user_name = 'DILLONSIM'
and start_time between '2025-09-29 10:00:00' and '2025-09-29 16:00:00'
and execution_status = 'FAIL'
order by start_time;

use role dba;

use schema snowflake.account_usage;

select * from metering_daily_history limit 10;

select service_type, count(*) 
from metering_history
group by 1 order by 1;

select * from snowpark_container_services_history limit 10;


select compute_pool_name, count(*)
from snowpark_container_services_history
group by 1 order by 1;

select * 
from snowpark_container_services_history 
where compute_pool_name like 'HAVEN_DBT_TRANSFORM_DEV_COMPUTE_POOL_%'
order by start_time;

-- 10/10/2025
-- check AA DEV Account login history

USE SCHEMA SNOWFLAKE.ACCOUNT_USAGE;

select *
from login_history 
where user_name = 'AA_ANALYTICS_DEV_SERVICE_ACCOUNT'
-- and event_timestamp >= '2025-10-10'
and is_success = 'NO'

order by event_timestamp desc;
limit 10;