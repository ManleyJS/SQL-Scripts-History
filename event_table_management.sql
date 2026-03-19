-- 16/09/2025
-- Align Alytics and AA DBT development event table access

use ROLE dba;

call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'event_data');

use ROLE accountadmin;

create event table haven_store_aa_dev.event_data.align_alytics_events;
alter database haven_store_aa_dev set event_table = haven_store_aa_dev.event_data.align_alytics_events;
alter database haven_staging_aa_dev set event_table = haven_store_aa_dev.event_data.align_alytics_events;
alter database haven_pipeline_aa_dev set event_table = haven_store_aa_dev.event_data.align_alytics_events;

use role securityadmin;

grant role _haven_data_science_dev__event_data__reader to role haven_dbt_development_align_alytics;
grant role _haven_data_science_dev__event_data__reader to role haven_dbt_transform_align_alytics_dev;

grant select on event table haven_data_science_dev.event_data.data_science_events to role haven_dbt_development_align_alytics;
grant select on event table haven_data_science_dev.event_data.data_science_events to role haven_dbt_transform_align_alytics_dev;


-- 18/09/2025
-- haven_data_science event tables
-- DEV

use ROLE dba;

call haven_master.procedures.schema_role_creation('haven_data_science_dev', 'event_data');

use ROLE accountadmin;

create event table haven_data_science_dev.event_data.data_science_events;
alter database haven_data_science_dev set event_table = haven_data_science_dev.event_data.data_science_events;

use role securityadmin;

grant role _haven_data_science_dev__event_data__reader to role haven_data_science_dev;

grant select on event table haven_data_science_dev.event_data.data_science_events to role haven_data_science_dev;


-- PROD

use ROLE dba;

call haven_master.procedures.schema_role_creation('haven_data_science', 'event_data');

use ROLE accountadmin;

create event table haven_data_science.event_data.data_science_events;
alter database haven_data_science set event_table = haven_data_science.event_data.data_science_events;

use role securityadmin;

grant role _haven_data_science__event_data__reader to role haven_data_science;

grant select on event table haven_data_science.event_data.data_science_events to role haven_data_science;

-- 19/09/2025
-- Add in production event table

use ROLE dba;

call haven_master.procedures.schema_role_creation('haven_store', 'event_data');

use ROLE accountadmin;

create event table haven_store.event_data.event_log;
alter database haven_store set event_table = haven_store.event_data.event_log;
alter database haven_pipeline set event_table = haven_store.event_data.event_log;
alter database haven_staging set event_table = haven_store.event_data.event_log;

use role securityadmin;

grant role _haven_store__event_data__reader to role haven_dbt_transform;

grant select on event table haven_store.event_data.event_log to role haven_dbt_transform;

