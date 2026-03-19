-- 23/10/2025

use role dba;

use schema snowflake.account_usage;

select user_name, is_success, max(event_timestamp)  from login_history 
where FIRST_AUTHENTICATION_FACTOR = 'PASSWORD'
and event_timestamp > '2025-10-01'
group by user_name, is_success
order by 3;

use role useradmin;

alter user AA_ANALYTICS_SERVICE_ACCOUNT unset password;
alter user HAVEN_AMPLITUDE_INTEGRATION unset password;
alter user HAVEN_QUALTRICS_DATALOAD unset password;
alter user HAVEN_BATCH_DATALOAD unset password;

alter user AA_ANALYTICS_SERVICE_ACCOUNT set type = SERVICE;
alter user HAVEN_AMPLITUDE_INTEGRATION set type = SERVICE;
alter user HAVEN_QUALTRICS_DATALOAD set type = SERVICE;
alter user HAVEN_BATCH_DATALOAD set type = SERVICE;

alter user HAVEN_DATA_SCIENCE_PIPELINE set type = service;
alter user HAVEN_STREAMLIT_DEV_SERVICE_ACCOUNT set type = service;
alter user HAVEN_TRANSACTIONS_MANAGEMENT_SIGMA_SERVICE_ACCOUNT set type = service;
alter user HAVEN_HOLIDAYS_SUPPORT_SIGMA_SERVICE_ACCOUNT set type = service;
alter user HAVEN_STREAMLIT_APPLICATION_DEPLOYMENT_ACCOUNT_DEV set type = service;
alter user HAVEN_PARK_DATABASE_SERVICE_ACCOUNT set type = service;
alter user HAVEN_STREAMLIT_APPLICATION_DEPLOYMENT_ACCOUNT set type = service;
alter user HAVEN_PARK_DATABASE_DEV_SERVICE_ACCOUNT set type = service;
alter user HAVEN_PROCUREMENT_SIGMA_SERVICE_ACCOUNT set type = service;
alter user HAVEN_BLOOMREACH_INTEGRATION_DEV_SERVICE_ACCOUNT set type = service;


alter user IANCOLEMAN set type = person;
alter user ABBIEJOHNSON set type = person;
alter user JAYGOULD set type = person;
alter user ASHWINISHARMA set type = person;
alter user COURTNEYBARRON set type = person;
alter user RICHARDJOLLY set type = person;
alter user MAYURVAGHASIA set type = person;
alter user CHRISTIANHADDRELL set type = person;
alter user HUANYU set type = person;
alter user JOHNFITZGERALD set type = person;
alter user BALINTNEMETH set type = person;
alter user PETERNEMETH set type = person;
alter user DOVYDASSTEPONAVICIUS set type = person;
alter user RJUDDIN set type = person;
alter user HABIBKAGHAS set type = person;


alter user RANSONGD set type = person;
alter user MANLEYJS set type = person;
alter user MANLEYJ set type = person;