USE ROLE dba;

USE DATABASE haven_master;
USE SCHEMA event_log;
SHOW TABLES;

SHOW SCHEMAS;

CREATE VIEW event_log_production_view as
with
    c_base as (
        select
            le.resource_attributes:"snow.database.name"::string database_name,
            le.resource_attributes:"snow.executable.name"::string executable_name,
            le.resource_attributes:"snow.executable.type"::string executable_type,
            le.*
        from
            haven_master.event_log.logging_events le
    )
select
    aa.database_name,
    -- aa.executable_name,
    -- aa.executable_type,
    aa.timestamp,
    aa.start_timestamp,
    aa.observed_timestamp,
    aa.resource_attributes,
    aa.scope,
    aa.scope_attributes,
    aa.record_type,
    aa.record,
    aa.record_attributes,
    aa.value
from
    c_base aa 
where
    database_name in ('HAVEN_STORE', 'HAVEN_PIPELINE')
--order by 
--    observed_timestamp desc
   ;
   
 SELECT * FROM event_log_production_view;
 
USE ROLE dba;

SHOW SCHEMAS;
USE SCHEMA haven_master.common;

CREATE OR REPLACE VIEW identity_mismatched_count AS
with taba (hid, new_email, old_email, identity_type, updated_ts, row_num) 
as (select hid, "TO", "FROM", type, timestamp,
row_number() over (partition by hid order by timestamp desc)
from haven_raw.IDENTITY.hid_audit 
where type = 'email'
and timestamp >= dateadd(day, -7, current_date())
)
select taba.*
from haven_raw.IDENTITY.hid_to_email tabb
inner join taba
    on taba.hid = tabb.hid
    and taba.new_email != tabb.email
    and row_num = 1
    ;    

   
   SELECT task_name, TASK_EXECUTION, 
FROM HAVEN_MASTER.COMMON.identity_mismatched_count