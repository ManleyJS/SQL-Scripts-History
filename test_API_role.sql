use role useradmin;
create user testapintegration
login_name = 'test.api.integration'
display_name = 'Test API Integration'
password = '<REDACTED>'
comment = 'Training account'
default_warehouse = warner_api_integration_warehouse_xsmall;

alter user testapintegration
set login_name = 'test.api.integration';

use role securityadmin;
grant role warner_api_integration to user testapintegration;

use role accountadmin;
use warehouse admin_wh;
select * from snowflake.account_usage.login_history where user_name = 'SUNILSHARMA'
order by event_timestamp desc;

select * from snowflake.account_usage.login_history where client_ip = '45.146.178.153'
order by event_timestamp desc;


select * from snowflake.account_usage.query_history
where start_time > '2024-09-23'
and upper(query_text) like '%WARNER_API_INTEGRATION%'
order by start_time desc;

use role warner_dbt_transform_dev;

use role warner_api_integration;
