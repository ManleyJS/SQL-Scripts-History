show grants on schema haven_raw.seaware_clone_03102022;

select distinct data_type from haven_raw.INFORMATION_SCHEMA.COLUMNS;


select distinct(is_auto) from haven_base.seaware.res_wtl_request;

select table_name from haven_base.information_schema.views where startswith(table_name, 'RES_');

select distinct(request_type) from haven_base.seaware.res_wtl_request where request_type is not null limit 100;

select * from haven_base.seaware.res_wtl_request  limit 100;

select * from haven_base.INFORMATION_SCHEMA.COLUMNS where table_schema = 'SEAWARE'
and startswith(table_name, 'RES_') 
and startswith(data_type, 'TIMESTAMP')
order by table_name, ordinal_position;

use schema warner_base.aztec;

SELECT TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_CATALOG = 'WARNER_BASE' AND TABLE_SCHEMA = 'AZTEC' AND NOT ENDSWITH(TABLE_NAME, '__B') AND NOT STARTSWITH(TABLE_NAME, 'HVR_ST') AND DATA_TYPE IN ('TEXT', 'DATE', 'NUMBER', 'TIMESTAMP_TZ', 'TIMESTAMP_NTZ', 'TIMESTAMP_LTZ') AND STARTSWITH(TABLE_NAME, 'RES_') ORDER BY TABLE_NAME, ORDINAL_POSITION;


use schema haven_base.zbsdata_retail;

show masking policies;

use role securityadmin;

grant role _haven_raw__dig_bookings__creator to role haven_cdc_dataload;
grant role _haven_raw__dig_payments__creator to role haven_cdc_dataload;
grant role _haven_raw__dig_capacity__creator to role haven_cdc_dataload;
grant role _haven_raw__dig_pricing__creator to role haven_cdc_dataload;
grant role _haven_raw__bookings__creator to role haven_cdc_dataload;


show grants to role haven_activities_reporting;
grant role _HAVEN_ACTIVITIES_REPORTING__WAREHOUSE__USAGE to user oliviathompson;
revoke role _HAVEN_ACTIVITIES_REPORTING__WAREHOUSE__USAGE from user oliviathompson;

show grants to role haven_commercial;
show grants to role _HAVEN_COMMERCIAL__WAREHOUSE__USAGE;

show grants to user gregpugh;

use role dba;

select max(updated_at) from butlins_raw.zendesk.tickets_raw;

select * from snowflake.account_usage.query_history where query_text like '%gcp_snowflake_storage%';

show grants to role haven_batch_dataload;