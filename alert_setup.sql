use role useradmin;

drop user HavenDataAlerts;

CREATE USER HavenDataAlerts
login_name = 'haven.data.alerts'
password = 'xacdfd2345al!;asers=l3w'
display_name = 'Haven Data Alerts'
email = 'haven-data-alerts@haven.com'
comment = 'Haven Data Alerts'
;


use role orgadmin;

show accounts;

use role accountadmin;

show integrations;

describe security integration AZURE_AD_INTEGRATION;
describe security integration tableau_server;
describe security integration dbt_cloud_sso_integration;


select SYSTEM$SHOW_OAUTH_CLIENT_SECRETS('DBT_CLOUD_SSO_INTEGRATION');

{
"OAUTH_CLIENT_SECRET_2":"aNhMWAEdwSIL1aaUycDodwuUkTCWboEPyEEGq8HcQ+w=",
"OAUTH_CLIENT_SECRET":"0S7INy8WYovyFi8TkWFr9KDgRoxKxZkq7bS8BFETFQs=",
"OAUTH_CLIENT_ID":"BR7tUEgtYerPMTbFtx0DUyjdgZ8="};


use role haven_cdc_dataload;


select * from haven_raw.consent_and_preference.customertopic at (timestamp=>'2024-05-16 00:40:00'::timestamp)
where havenid = 'CHS1DZJ2LVQQ';

use role useradmin;

show users like 'haven%';

create role create_alerts_role;

use role accountadmin;

grant execute alert on account to role create_alerts_role;
grant execute managed alert on account to role create_alerts_role;
grant execute managed alert on account to role dba;

grant role create_alerts_role to role datadog_monitor;

grant create alert on schema haven_master.common to role create_alerts_role;

use role accountadmin;

use role datadog_monitor;

create notification integration snowflake_alerts_integration
type = email
enabled = true;

CALL SYSTEM$SEND_EMAIL(
'snowflake_alerts_integration',
'jonathan.manley@bourne-leisure.co.uk',
'test message',
'test message');

grant ownership on integration snowflake_alerts_integration to role create_alerts_role;

use role datadog_monitor;
CALL SYSTEM$SEND_EMAIL(
'snowflake_alerts_integration',
'jonathan.manley@bourne-leisure.co.uk',
'test message',
'test message');


select * from haven_master.common.identity_mismatched_count;

create or replace alert haven_master.common.identity_data_comparison_alert
  warehouse = datadog_monitor_warehouse_xsmall
  schedule = 'USING CRON 0 * * * * UTC'
  IF (EXISTS (
  select * from haven_master.common.identity_mismatched_count
  ))
  THEN CALL SYSTEM$SEND_EMAIL(
  'snowflake_alerts_integration',
  'haven-data-alerts@haven.com, jonathan.manley@bourne-leisure.co.uk',
  'Identity Integration Row Count Mismatch',
  'The query on view haven_master.common.identity_mismatched_count was expected to return an empty set but found invalid records'
  );

alter alert haven_master.common.identity_data_comparison_alert resume;


select current_timestamp();

drop alert haven_master.common.test_alert_statement;

create or replace alert haven_master.common.test_alert_statement
  warehouse = datadog_monitor_warehouse_xsmall
--  schedule = 'USING CRON 30 * * * * UTC'
  schedule = '1 MINUTE'
  IF (EXISTS (
  select current_timestamp()
  ))
  THEN CALL SYSTEM$SEND_EMAIL(
  'snowflake_alerts_integration',
  'haven-data-alerts@haven.com, jonathan.manley@bourne-leisure.co.uk',
  'Test of Snowflake Alert',
  'Snowflake Alert Test'
  );
);
  
alter alert haven_master.common.test_alert_statement resume;

show alerts;
select current_timestamp();

SELECT *
FROM
  TABLE(INFORMATION_SCHEMA.ALERT_HISTORY(
    SCHEDULED_TIME_RANGE_START
      =>dateadd('hour',-1,current_timestamp())))
ORDER BY SCHEDULED_TIME DESC;

use role datadog_monitor;
use warehouse datadog_monitor_warehouse_xsmall;
use schema haven_master.common;

select * from haven_master.common.identity_mismatched_count;

use role accountadmin;

select system$whitelist();

show views;

use role dba;

use warehouse dba_wh;

select * from identity_mismatched_count;
select * from haven_raw.identity.hid_to_email where hid = 'QYHPRCPMGJF6';
select * from haven_raw.identity.hid_audit where hid = 'QYHPRCPMGJF6';

select * from haven_raw.identity.hid_audit where "TO" like '%bambrough%';
