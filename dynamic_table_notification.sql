-- 30/01/2026

use role haven_dbt_transform;

select * from HAVEN_STORE.RMS_PRICER.FCT_HOLIDAY_BOOKINGS_PRORATED_STREAM limit 10;

use role dba;

show grants to role haven_dbt_transform;

use role securityadmin;
use role dba;
grant select on stream HAVEN_STORE.RMS_PRICER.FCT_HOLIDAY_BOOKINGS_STREAM to role _haven_store__rms_pricer__reader;

grant select on future streams in schema HAVEN_STORE.RMS_PRICER to role _haven_store__rms_pricer__reader;


show streams in account;

use schema haven_store.rms_pricer;

desc stream FCT_HOLIDAY_BOOKINGS_PRORATED_STREAM;

select get_ddl('stream', 'FCT_HOLIDAY_BOOKINGS_PRORATED_STREAM');

-- FCT_HOLIDAY_BOOKINGS_STREAM


select get_ddl('stream', 'FCT_HOLIDAY_BOOKINGS_STREAM');

use role dba;

create or replace stream HAVEN_STORE.RMS_PRICER.FCT_HOLIDAY_BOOKINGS_PRORATED_STREAM 
on table HAVEN_STORE.HOLIDAY.FCT_HOLIDAY_BOOKINGS_PRORATED
SHOW_INITIAL_ROWS = TRUE;


select * from HAVEN_STORE.RMS_PRICER.FCT_HOLIDAY_BOOKINGS_PRORATED_STREAM;

create or replace stream HAVEN_STORE.RMS_PRICER.FCT_HOLIDAY_BOOKINGS_STREAM 
on table HAVEN_STORE.HOLIDAY.FCT_HOLIDAY_BOOKINGS
SHOW_INITIAL_ROWS = TRUE;

drop stream HAVEN_STORE.RMS_PRICER.FCT_HOLIDAY_BOOKINGS_STREAM;

use schema haven_store.holiday;

select * from HAVEN_STORE.RMS_PRICER.FCT_HOLIDAY_BOOKINGS_STREAM; 


show tables;

show grants on table FCT_HOLIDAY_BOOKINGS_PRORATED;

select * from snowflake.account_usage.query_history
where role_name = 'DBA'
and start_time between '2025-11-25 09:00:00' and '2025-11-25 10:00:00'
order by start_time;

-- 16/01/2026

use role dba;

use database haven_work;

use schema stream_test;

show streams in account;

drop stream TEST_INPUT__STREAM;

show tables;


-- 15/01/2026

show tasks;

alter task haven_master_dev.notifications.TASK_MONITOR_SNOWFLAKE suspend;

use role dba;

use schema haven_master_dev.notifications;

show tables;

show procedures;

SELECT
    execution_id,
    execution_start_timestamp,
    execution_status,
    error_message,
    output_result,
    additional_details
  FROM monitoring_execution_audit
  WHERE execution_start_timestamp >= DATEADD('hour', -1, CURRENT_TIMESTAMP())
    AND procedure_name = 'sp_orchestrate_monitoring'
  ORDER BY execution_start_timestamp DESC
  LIMIT 1;


select current_role();

use role accountadmin;

show integrations;

use role dba;

show secrets in account;

use role accountadmin;

use database haven_master;
use schema notifications;

drop secret SNOWFLAKE_NOTIFICATION_DEVELOPMENT_SECRET;
drop network rule snowflake_notification_development_network_rule;
drop integration snowflake_notification_development_integration;

use schema training.dynamic_table_notifications;

show tables;

alter dynamic table TEST_EVENT_NOTIFICATION__DYNAMIC suspend;
alter dynamic table TEST_EVENT_NOTIFICATION__DYNAMIC resume;

SELECT
  name, database_name, schema_name, scheduling_state, target_lag_type, target_lag_sec, 
  FROM TABLE (INFORMATION_SCHEMA.DYNAMIC_TABLES ())
--where scheduling_state:state::string != 'ACTIVE'
ORDER BY name;

select * from training.dynamic_table_notifications.test_event_notification__dynamic ;

select null * null;

create or replace dynamic table training.dynamic_table_notifications.test_event_notification__dynamic 
( id, item_count, unit_price, total_price) 
target_lag = '20 minute' refresh_mode = AUTO initialize = ON_CREATE warehouse = DBA_WH
as select id, item_count, item_price, (item_count * item_price)
from test_event_notification;

select * from training.dynamic_table_notifications.test_event_notification__dynamic ;

insert into test_event_notification
values 
(11, 8, 5.75),
(12, 2, 19.99),
(13, 1, 81.71),
(14, 1, 99.99),
(15, 5, 30.51),
(16, 20, 0.15),
(17, 5, 11.99),
(18, 5, 4.50),
(19, 8, 4.98),
(20, 8, 1.99);

SELECT * FROM TABLE (INFORMATION_SCHEMA.dynamic_table_refresh_history () ) ORDER BY data_timestamp desc;

show streams in account;
select * from table(RESULT_SCAN(LAST_QUERY_ID())) where "stale" = true;


-- 09/01/2026
use role dba;

SELECT * FROM TABLE (INFORMATION_SCHEMA.dynamic_table_refresh_history () ) ORDER BY data_timestamp desc;

use schema training.training;

SELECT top 1 STATE, STATE_CODE, STATE_MESSAGE FROM TABLE (INFORMATION_SCHEMA.dynamic_table_refresh_history () ) ORDER BY data_timestamp desc;

SELECT
  name, database_name, schema_name, scheduling_state, target_lag_type, target_lag_sec, 
  FROM TABLE (INFORMATION_SCHEMA.DYNAMIC_TABLES ())
--where scheduling_state:state::string != 'ACTIVE'
ORDER BY name;

SELECT
  scheduling_state, object_insert(scheduling_state, 
  'name', name::string, 'schema', schema_name::string, 'database', database_name::string,
  'latest_timestamp', latest_data_timestamp::timestamp, 
  'last_refresh_state', last_completed_refresh_state::string,
  'last_refresh_state_code', last_completed_refresh_state_code::string,
  'last_refresh_state_message', last_completed_refresh_state_message::string,
  'scheduling_state', scheduling_state::object)
  FROM TABLE (INFORMATION_SCHEMA.DYNAMIC_TABLES ())
  where scheduling_state:state::string != 'ACTIVE'
ORDER BY name;

SELECT
  *
  FROM TABLE (INFORMATION_SCHEMA.DYNAMIC_TABLES ())
--  where scheduling_state:state::string != 'ACTIVE'
ORDER BY name;

SELECT
  array_cat(name, parse_json(scheduling_state))
  FROM TABLE (INFORMATION_SCHEMA.DYNAMIC_TABLES ())
  where scheduling_state:state::string != 'ACTIVE'
ORDER BY name;

SELECT
  parse_json(name)
  FROM TABLE (INFORMATION_SCHEMA.DYNAMIC_TABLES ())
  where scheduling_state:state::string != 'ACTIVE'
ORDER BY name;

SELECT
  scheduling_state, object_construct('name', name::string, 'schema', schema_name::string, 'database', database_name::string,
  'latest_timestamp', latest_data_timestamp::timestamp, 
  'last_refresh_state', last_completed_refresh_state::string,
  'last_refresh_state_code', last_completed_refresh_state_code::string,
  'last_refresh_state_message', last_completed_refresh_state_message::string,
  'scheduling_state', scheduling_state::object)
  FROM TABLE (INFORMATION_SCHEMA.DYNAMIC_TABLES ())
  where scheduling_state:state::string != 'ACTIVE'
ORDER BY name;

SELECT
  *
  FROM TABLE (INFORMATION_SCHEMA.DYNAMIC_TABLES ())
order by name;


SELECT * FROM haven_master.event_LOG.LOGGING_EVENTS
      WHERE
        resource_attributes:"snow.executable.type" = 'DYNAMIC_TABLE' AND
        record_type='EVENT' AND
        value:"state"='ERROR';



    -- "https://bourneleisureltd.webhook.office.com/webhookb2/db201ef6-05af-4835-a96a-3648512f7ae3@6bec8931-53ed-4238-a6a8-495fa78471d5/IncomingWebhook/5210770a2e2d469c8ec913051d65c62c/40000c2d-2092-489f-bb75-7502bf55736f/V2xfzf1wSXp110gkIzXBf56BIS-OmON3VDJAgcxnMflzo1"

use warehouse dba_wh;

use database training;

create schema dynamic_table_notifications;

use schema dynamic_table_notifications;

select get_ddl('table', 'HAVEN_RAW.BLAPI_PRICING.PRICING_AND_AVAILABILITY__DYNAMIC');

create table test_event_notification (id int, item_count int, item_price decimal (7,2));

insert into test_event_notification
values 
(1, 10, 50.25),
(2, 7, 9.99),
(3, 13, 8.17),
(4, 1, 179.99),
(5, 2, 230.11),
(6, 1, 5.99),
(7, 1, 6.99),
(8, 3, 1.50),
(9, 5, 1.98),
(10, 9, 0.99)
;

select * from test_event_notification;

create or replace dynamic table training.dynamic_table_notifications.test_event_notification__dynamic 
( id, item_count, unit_price, total_price) 
target_lag = '20 minute' refresh_mode = AUTO initialize = ON_CREATE warehouse = DBA_WH
as select id, item_count, item_price, (item_count * item_price)
from test_event_notification;

select * from training.dynamic_table_notifications.test_event_notification__dynamic ;

insert into test_event_notification
values 
(11, 8, 5.75),
(12, 2, 19.99),
(13, 1, 81.71),
(14, 1, 99.99),
(15, 5, 30.51),
(16, 20, 0.15),
(17, 5, 11.99),
(18, 5, 4.50),
(19, 8, 4.98),
(20, 8, 1.99);

SELECT * FROM TABLE (INFORMATION_SCHEMA.dynamic_table_refresh_history () ) ORDER BY data_timestamp desc;

show roles like '%alert%';

show grants of role CREATE_ALERTS_ROLE;

use role securityadmin;

grant role CREATE_ALERTS_ROLE to role dba;

use role dba;

alter dynamic table training.dynamic_table_notifications.test_event_notification__dynamic set change_tracking = true;

SELECT * FROM haven_master.event_log.logging_events
      WHERE
        resource_attributes:"snow.executable.type" = 'DYNAMIC_TABLE'
--        AND record_type='EVENT' 
        AND value:state::string != 'SUCCEEDED'
        and observed_timestamp > '2025-12-16'
ORDER BY OBSERVED_TIMESTAMP
;



  SELECT ARRAY_AGG(
    OBJECT_CONSTRUCT(
      'name', name::STRING,
      'schema', schema_name::STRING,
      'database', database_name::STRING,
      'latest_timestamp', latest_data_timestamp::TIMESTAMP,
      'last_refresh_state', last_completed_refresh_state::STRING,
      'last_refresh_state_code', last_completed_refresh_state_code::STRING,
      'last_refresh_state_message', last_completed_refresh_state_message::STRING,
      'scheduling_state', scheduling_state::OBJECT
    )
  ) 
  FROM TABLE(INFORMATION_SCHEMA.DYNAMIC_TABLES())
  WHERE scheduling_state:state::STRING != 'ACTIVE'
  ORDER BY name;
