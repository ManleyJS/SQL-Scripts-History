-- 16/01/2026

use role accountadmin;

desc network rule ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_RULE;

-- 18.132.130.123,188.214.8.130,195.26.62.57,18.135.204.106

desc network rule ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE;

alter network rule ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE
set VALUE_LIST = ('18.132.130.123', '188.214.8.130', '195.26.62.57', '18.135.204.106');


-- 12/01/2026

use role accountadmin;

ALTER NETWORK RULE ALLOW_DBT_CLOUD_ACCESS_RULE
SET VALUE_LIST = ('3.123.45.39', '3.126.140.248', '3.72.153.148', '213.197.165.26' );

ALTER NETWORK RULE ALLOW_HAVEN_DBT_TRANSFORM_DEV_ACCESS_rule
SET VALUE_LIST = ('52.208.189.216', '84.240.13.98', '213.197.165.26' );

ALTER NETWORK RULE ALLOW_HAVEN_DBT_TRANSFORM_QAT_ACCESS_rule
SET VALUE_LIST = ('52.208.189.216', '84.240.13.98', '213.197.165.26');




-- 18/12/2025

-- 52.18.97.216
-- ETHYCA_FIDES_DATA_DISCOVERY_SERVICE_ACCOUNT

use role accountadmin;

use schema haven_master.common;

CREATE NETWORK RULE ALLOW_ETHYCA_FIDES_DATA_DISCOVERY_SERVICE_ACCOUNT_rule
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('52.18.97.216');

create network policy ETHYCA_FIDES_DATA_DISCOVERY_SERVICE_ACCOUNT_policy
allowed_network_rule_list = ('ALLOW_ETHYCA_FIDES_DATA_DISCOVERY_SERVICE_ACCOUNT_RULE')
comment = 'Policy to restrict access for user ALLOW_ETHYCA_FIDES_DATA_DISCOVERY_SERVICE_ACCOUNT; only connections from the Fides Server (52.18.97.216) are accepted';

alter user ETHYCA_FIDES_DATA_DISCOVERY_SERVICE_ACCOUNT set network_policy = ETHYCA_FIDES_DATA_DISCOVERY_SERVICE_ACCOUNT_policy;




-- 22/10/2025

use role accountadmin;

alter user AA_ANALYTICS_DEV_ENVIRONMENT_SERVICE_ACCOUNT 
set network_policy = ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_POLICY;


-- 21/10/2025

show integrations;

-- Create NETWORK RULE for external access integration

-- https://docs.snowflake.com/en/user-guide/tutorials/dbt-projects-on-snowflake-getting-started-tutorial#create-a-workspace-connected-to-your-git-repository

use role accountadmin;

CREATE OR REPLACE NETWORK RULE dbt_dependencies_network_rule
  MODE = EGRESS
  TYPE = HOST_PORT
  -- Minimal URL allowlist that is required for dbt deps
  VALUE_LIST = (
    'hub.getdbt.com',
    'codeload.github.com'
    );

-- Create EXTERNAL ACCESS INTEGRATION for dbt access to external dbt package locations

CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION dbt_dependencies_external_access_integration
  ALLOWED_NETWORK_RULES = (dbt_dependencies_network_rule)
  ENABLED = TRUE;

-- 20/10/2025

-- 172.215.209.100

use role accountadmin;

use schema haven_master.common;

ALTER NETWORK RULE ALLOW_HAVEN_DBT_TRANSFORM_DEV_ACCESS_rule
SET VALUE_LIST = ('52.208.189.216', '84.240.13.98', '172.215.209.100');


-- 16/10/2025

-- Amplitude user network policy
-- VALUE_LIST = ('3.124.22.25', '18.157.59.125', '18.192.47.195');


use role dba;

use schema snowflake.account_usage;

select 'alter user '||name||' set network_policy = ALLOW_HAVEN_AMPLITUDE_INTEGRATION_policy;' from users
where name in (
'HAVEN_EXPERIENCE_QR_CODES_SERVICE_ACCOUNT', 'HAVEN_SERVICE_STATUS_SERVICE_ACCOUNT', 'HAVEN_ONE_GREAT_TEAM_SERVICE_ACCOUNT', 
'HAVEN_CORNERSTONE_SERVICE_ACCOUNT', 'HAVEN_NEWSROOM_SERVICE_ACCOUNT', 'HAVEN_GUESTS_OWNERS_SERVICE_ACCOUNT'
);

use role accountadmin;

use schema haven_master.common;

alter user HAVEN_NEWSROOM_SERVICE_ACCOUNT set network_policy = ALLOW_HAVEN_AMPLITUDE_INTEGRATION_policy;
alter user HAVEN_CORNERSTONE_SERVICE_ACCOUNT set network_policy = ALLOW_HAVEN_AMPLITUDE_INTEGRATION_policy;
alter user HAVEN_SERVICE_STATUS_SERVICE_ACCOUNT set network_policy = ALLOW_HAVEN_AMPLITUDE_INTEGRATION_policy;
alter user HAVEN_ONE_GREAT_TEAM_SERVICE_ACCOUNT set network_policy = ALLOW_HAVEN_AMPLITUDE_INTEGRATION_policy;
alter user HAVEN_GUESTS_OWNERS_SERVICE_ACCOUNT set network_policy = ALLOW_HAVEN_AMPLITUDE_INTEGRATION_policy;
alter user HAVEN_EXPERIENCE_QR_CODES_SERVICE_ACCOUNT set network_policy = ALLOW_HAVEN_AMPLITUDE_INTEGRATION_policy;

alter user haven_amplitude_integration set network_policy = ALLOW_HAVEN_AMPLITUDE_INTEGRATION_policy;


-- 'HAVEN_EXPERIENCE_QR_CODES_SERVICE_ACCOUNT', 'HAVEN_SERVICE_STATUS_SERVICE_ACCOUNT', 'HAVEN_ONE_GREAT_TEAM_SERVICE_ACCOUNT', 
--  'HAVEN_CORNERSTONE_SERVICE_ACCOUNT', 'HAVEN_NEWSROOM_SERVICE_ACCOUNT', 'HAVEN_GUESTS_OWNERS_SERVICE_ACCOUNT'

select * from login_history
where user_name in (
'HAVEN_EXPERIENCE_QR_CODES_SERVICE_ACCOUNT', 'HAVEN_SERVICE_STATUS_SERVICE_ACCOUNT', 'HAVEN_ONE_GREAT_TEAM_SERVICE_ACCOUNT', 
'HAVEN_CORNERSTONE_SERVICE_ACCOUNT', 'HAVEN_NEWSROOM_SERVICE_ACCOUNT', 'HAVEN_GUESTS_OWNERS_SERVICE_ACCOUNT'
)
and client_ip not in ('3.124.22.25', '18.157.59.125', '18.192.47.195')
order by user_name, event_timestamp desc;


-- 14/09/2025

show accounts;

SELECT CURRENT_ORGANIZATION_NAME() || '-' || CURRENT_ACCOUNT_NAME();

-- HAVEN_DBT_TRANSFORM_DEV

use role accountadmin;

use schema haven_master.common;

CREATE NETWORK RULE ALLOW_HAVEN_DBT_TRANSFORM_DEV_ACCESS_rule
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('52.208.189.216', '84.240.13.98');

create network policy ALLOW_HAVEN_DBT_TRANSFORM_DEV_policy
allowed_network_rule_list = ('ALLOW_HAVEN_DBT_TRANSFORM_DEV_ACCESS_RULE')
comment = 'Policy to restrict haven dbt transform dev user access; only connections from Git (52.208.189.216) and Sarunas Jatautis (84.240.13.98) are accepted';

alter user HAVEN_DBT_TRANSFORM_DEV set network_policy = ALLOW_HAVEN_DBT_TRANSFORM_DEV_policy;

-- HAVEN_DBT_TRANSFORM_QAT

use role accountadmin;

use schema haven_master.common;

CREATE NETWORK RULE ALLOW_HAVEN_DBT_TRANSFORM_QAT_ACCESS_rule
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('52.208.189.216', '84.240.13.98');

create network policy ALLOW_HAVEN_DBT_TRANSFORM_QAT_policy
allowed_network_rule_list = ('ALLOW_HAVEN_DBT_TRANSFORM_QAT_ACCESS_RULE')
comment = 'Policy to restrict haven dbt transform qat user access; only connections from Git (52.208.189.216) and Sarunas Jatautis (84.240.13.98) are accepted';

alter user HAVEN_DBT_TRANSFORM_QAT set network_policy = ALLOW_HAVEN_DBT_TRANSFORM_QAT_policy;

-- HAVEN_DBT_TRANSFORM_PROD

use role accountadmin;

use schema haven_master.common;

CREATE NETWORK RULE ALLOW_HAVEN_DBT_TRANSFORM_PROD_ACCESS_rule
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('52.208.189.216', '84.240.13.98');

create network policy ALLOW_HAVEN_DBT_TRANSFORM_PROD_policy
allowed_network_rule_list = ('ALLOW_HAVEN_DBT_TRANSFORM_PROD_ACCESS_RULE')
comment = 'Policy to restrict haven dbt transform prod user access; only connections from Git (52.208.189.216) and Sarunas Jatautis (84.240.13.98) are accepted';

alter user HAVEN_DBT_TRANSFORM_PROD set network_policy = ALLOW_HAVEN_DBT_TRANSFORM_PROD_policy;

-- HAVEN_QUALTRICS_DATALOAD

use role accountadmin;

use schema haven_master.common;

CREATE NETWORK RULE ALLOW_HAVEN_QUALTRICS_DATALOAD_ACCESS_rule
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('54.217.246.193');

create network policy ALLOW_HAVEN_QUALTRICS_DATALOAD_policy
allowed_network_rule_list = ('ALLOW_HAVEN_QUALTRICS_DATALOAD_ACCESS_RULE')
comment = 'Policy to restrict haven qualtrics user so only IP address 54.217.246.193 sourced connectionsw are accepted';

alter user HAVEN_QUALTRICS_DATALOAD set network_policy = ALLOW_HAVEN_QUALTRICS_DATALOAD_policy;

use role useradmin;
alter user HAVEN_PIPELINE_TRANSFORM_UAT set disabled = true;
alter user HAVEN_DBT_TRANSFORM_TEST set disabled = true;
alter user HAVEN_DBT_TRANSFORM_UAT set disabled = true;


-- 13/10/2025
-- Adding rules for haven_batch_dataload

USE ROLE USERADMIN;

alter user haven_batch_dataload
set rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvznD0hoZvptF+fSLFgeA
zdxsQ7D6Ijghx123/ktpQnA/VvZLEeW+P+ThGP+7DAlqTgbOqQSr8yR9cnoIBhcp
SLoQWtEzQ0PyV7+e2o8BtPs/vtysD2pAmpXwp928QRs5KOmXUIvBppUNp7Vv/KOa
e7ZT/FlHlzxamXxHTdfM30um4V60Vl/AZTS0XST5BRfe2tDpy8pcnl4Qv385zj+2
wHHaVpakuLgYBgd+F+iEQRrGHuOj/YTul0YfosBcHEAQKiJUUxyjB48UwQMwfceg
7wblfKyKTVh8aiB4Ybqyha1GvlYf4u4R6+qD4YQZXGHjQn0r6M/wwvT3u+IWohV8
twIDAQAB';

use role haven_batch_dataload;

show warehouses;

USE ROLE ACCOUNTADMIN;

show parameters like 'NETWORK_POLICY' for user HAVEN_BATCH_DATALOAD;

DESC NETWORK POLICY ALLOW_BATCH_USER_ACCESS_POLICY;
DESC NETWORK RULE HAVEN_MASTER.COMMON.ALLOW_BATCH_USER_ACCESS_RULE;

-- 86.151.7.103 
-- Add personal IP address to network rule for testing only

ALTER NETWORK RULE ALLOW_BATCH_USER_ACCESS_rule
set VALUE_LIST = ('54.217.246.193', '86.151.7.103');


use role useradmin;

ALTER USER haven_amplitude_integration SET RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp81/JGZ/Rdg7m89G8WMhX9WfF0NuJJpSedjwtqb/3WeYf0F6uuPGgOydJSdGFAMnmvDypeidyWwmwo/htd0OlJ7TiHKxpVblnJdPBwwiU0JVdZ4Pwirf5F/G8x6ogwHm4+rhMTvGcNGOmkTQg0zfyIDrixj3rv+7bYTZTtREbx8KG2JcGCAFizHKJd+SfFj3AepPYzrigudZgO3VT+sAeW6VAGr/E82g7cm+iagPFB3JqXuZ/eT4UJQq5kEutE4C56lrj6XvwB90dADt+WbBgK7IPUAhHQ2Ze/snZc+xCkaCQOrHmA2ljn3qhoE55s0sCn+0K3fUFrdGUI7py723WwIDAQAB';

ALTER USER haven_amplitude_integration UNSET PASSWORD;

use role accountadmin;

show parameters like 'NETWORK_POLICY' for user haven_amplitude_integration;

-- We need to set a network policy for the amplitude user

select * from snowflake.account_usage.login_history
where user_name = 'HAVEN_AMPLITUDE_INTEGRATION'
order by event_timestamp desc;

-- IP addresses to add to network rule
-- '3.124.22.25', '18.157.59.125', '18.192.47.195'

use role accountadmin;

use schema haven_master.common;

CREATE NETWORK RULE ALLOW_HAVEN_AMPLITUDE_INTEGRATION_ACCESS_rule
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('3.124.22.25', '18.157.59.125', '18.192.47.195');

create network policy ALLOW_HAVEN_AMPLITUDE_INTEGRATION_policy
allowed_network_rule_list = ('ALLOW_HAVEN_AMPLITUDE_INTEGRATION_ACCESS_RULE')
comment = 'Policy to restrict Amplitude Integration user access; only connections from Amplitude are accepted';

alter user haven_amplitude_integration set network_policy = ALLOW_HAVEN_AMPLITUDE_INTEGRATION_policy;


-- Disable user haven_cdc_dataload

use role accountadmin;

select * from snowflake.account_usage.login_history
where user_name = 'HAVEN_CDC_DATALOAD'
order by event_timestamp desc;

use role useradmin;

ALTER USER haven_cdc_dataload UNSET PASSWORD;
ALTER USER haven_cdc_dataload Set disabled = true;

-- HISTORY OF WORK


USE ROLE ACCOUNTADMIN;
--CREATE ROLE cortex_user_role;
--GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE cortex_user_role;
--GRANT ROLE cortex_user_role TO USER some_user;

use schema snowflake.account_usage;

select * from snowflake.account_usage.users where has_password;
alter user commercialtest set disabled = true;

select * from sessions where user_name = 'FIVETRANTESTINTEGRATION';

select * from access_history where user_name = 'FIVETRANTESTINTEGRATION';

select * from external_access_history limit 20;

select * from login_history where user_name = 'FIVETRANTESTINTEGRATION' 
order by event_timestamp desc;

alter user FIVETRANTESTINTEGRATION set disabled = true;

select * from login_history 
where client_ip != '54.217.246.193' 
and event_timestamp > '2024-06-01'
and first_authentication_factor != 'OAUTH_ACCESS_TOKEN'
order by event_timestamp desc;

select user_name, client_ip, first_authentication_factor, error_code, error_message, count(*)
from login_history 
where first_authentication_factor = 'PASSWORD'
and client_ip != '54.217.246.193' 
--and error_code != 390100
group by 1, 2, 3, 4, 5
order by 1, 2, 3, 4, 5
;


select * from snowflake.account_usage.login_history 
where user_name = 'HAVEN_BATCH_DATALOAD'
--and client_ip != '54.217.246.193'  
and event_timestamp > '2025-04-20'
order by event_timestamp desc;

select * from snowflake.account_usage.login_history 
where user_name = 'HAVEN_ETLEAP_DATALOAD'
--and client_ip != '54.217.246.193'  
and event_timestamp > '2025-04-20'
order by event_timestamp desc;



select user_name, client_ip, count(*)
from login_history 
where first_authentication_factor = 'PASSWORD'
--and client_ip != '54.217.246.193' 
and error_code is null
group by 1, 2
order by 1, 2, 3 desc
;

select * from login_history 
where client_ip in ('34.246.62.141', '34.246.62.203')
--and event_timestamp > '2024-06-01'
--and first_authentication_factor != 'OAUTH_ACCESS_TOKEN'
order by event_timestamp desc;

select * from login_history 
where user_name like '%TABLEAU%'
--client_ip in ('34.246.62.141', '34.246.62.203')
--and event_timestamp > '2024-06-01'
--and first_authentication_factor != 'OAUTH_ACCESS_TOKEN'
order by event_timestamp desc;

--34.246.62.141 
--34.246.62.203

select * 
from login_history 
where first_authentication_factor = 'PASSWORD'
and client_ip != '54.217.246.193' 
and user_name like '%_CDC_%'
order by user_name, event_timestamp desc;


select * 
from snowflake.account_usage.login_history 
where first_authentication_factor = 'PASSWORD'
and client_ip != '54.217.246.193' 
and user_name like '%_CDC_%'
order by user_name, event_timestamp desc;

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

drop network rule ALLOW_BATCH_USER_ACCESS;

CREATE NETWORK RULE ALLOW_BATCH_USER_ACCESS_rule
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('54.217.246.193');

create network policy ALLOW_BATCH_USER_ACCESS_policy
allowed_network_rule_list = ('ALLOW_BATCH_USER_ACCESS_RULE')
comment = 'Polciy to restrict batch user access; only connections from data foundation AWS account accepted';

desc network policy ALLOW_BATCH_USER_ACCESS_policy;

SHOW NETWORK RULES IN ACCOUNT;

SHOW NETWORK POLICIES IN ACCOUNT;

show parameters like 'NETWORK_POLICY' for user haven_cdc_dataload;

describe network policy ALLOW_HAVEN_CDC_USER_ACCESS_POLICY;

select * from snowflake.account_usage.login_history 
where user_name = 'HAVEN_CDC_DATALOAD'
and client_ip != '54.217.246.193'  
order by event_timestamp desc;

desc user haven_batch_dataload;
desc user haven_cdc_dataload;

alter user haven_batch_dataload set network_policy = ALLOW_BATCH_USER_ACCESS_policy;
alter user haven_batch_dataload unset network_policy;

select * from snowflake.account_usage.login_history
where user_name = 'HAVEN_BATCH_DATALOAD'
order by event_timestamp desc
limit 20;

-- 19/06/2024

use role accountadmin;

SHOW NETWORK RULES IN ACCOUNT;

SHOW NETWORK POLICIES IN ACCOUNT;

CREATE NETWORK RULE ALLOW_HAVEN_CDC_USER_ACCESS_rule
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('54.217.246.193');

create network policy ALLOW_HAVEN_CDC_USER_ACCESS_policy
allowed_network_rule_list = ('ALLOW_HAVEN_CDC_USER_ACCESS_RULE')
comment = 'Polciy to restrict hAVEN cdc user access; only connections from data foundation AWS account accepted';

alter user haven_CDC_dataload set network_policy = ALLOW_HAVEN_CDC_USER_ACCESS_policy;

use role dba;

select * from login_history 
where event_timestamp > '2024-06-01'
--and first_authentication_factor != 'OAUTH_ACCESS_TOKEN'
and user_name = 'HAVEN_COMMERCIAL_TABLEAU_SERVICE'
order by event_timestamp desc;

select * from snowflake.account_usage.login_history 
where client_ip = '45.146.178.153'  
order by event_timestamp desc;

-- Tableau cloud service account

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

CREATE NETWORK RULE ALLOW_tableau_service_ACCESS_rule
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('45.146.178.153', '18.134.84.240', '18.134.84.241');

create network policy ALLOW_Tableau_service_ACCESS_policy
allowed_network_rule_list = ('ALLOW_TABLEAU_SERVICE_ACCESS_RULE')
comment = 'Policy to restrict Tableau service account access; only connections from Tableau cloud and AD authentication service accepted';

alter user HAVEN_COMMERCIAL_TABLEAU_SERVICE set network_policy = ALLOW_Tableau_service_ACCESS_policy;
alter user HAVEN_ACTIVITIES_REPORTING_TABLEAU_SERVICE set network_policy = ALLOW_Tableau_service_ACCESS_policy;

-- AA service account network rules

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

CREATE NETWORK RULE ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('18.132.130.123');

create network policy ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE')
comment = 'Policy to restrict Align Alytics service account access; only connections from AA service accepted';

alter user AA_ANALYTICS_SERVICE_ACCOUNT set network_policy = ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_POLICY;

-- set Alation to disabled

alter user ALATION_INTEGRATION set disabled = true;

-- set network rule for bourne batch user

alter user bourne_batch_dataload set network_policy = ALLOW_BATCH_USER_ACCESS_policy;

-- set network rule for bourne cdc dataload user

alter user bourne_CDC_dataload set network_policy = ALLOW_HAVEN_CDC_USER_ACCESS_policy;

-- set group finance test user to disabled

alter user BOURNE_GROUP_FINANCE_TEST set disabled = true;

-- set PWC Finance transformation test user to disabled

alter user BOURNE_PWC_FINANCE_TRANSFORMATION_TEST set disabled = true;

-- set Butlins CDC dataload user to disabled

alter user BUTLINS_CDC_DATALOAD set disabled = true;

-- set Commercial Test user to disabled

alter user COMMERCIALTEST set disabled = true;

-- DBT users network rules

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

CREATE NETWORK RULE ALLOW_DBT_CLOUD_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('3.123.45.39', '3.126.140.248', '3.72.153.148');

create network policy ALLOW_DBT_CLOUD_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_DBT_CLOUD_ACCESS_RULE')
comment = 'Policy to restrict DBT Cloud user access; only connections from DBT Cloud for user will be accepted';

alter user HAVEN_DBT_TRANSFORM_UAT set network_policy = ALLOW_DBT_CLOUD_ACCESS_POLICY;
alter user HAVEN_DBT_TRANSFORM_UAT unset network_policy;
alter user HAVEN_DBT_TRANSFORM_DEV unset network_policy;


alter user HAVEN_DBT_PIPELINE set network_policy = ALLOW_DBT_CLOUD_ACCESS_POLICY;
alter user HAVEN_DBT_PIPELINE_UAT set network_policy = ALLOW_DBT_CLOUD_ACCESS_POLICY;
alter user HAVEN_DBT_TRANSFORM_DEV set network_policy = ALLOW_DBT_CLOUD_ACCESS_POLICY;
alter user HAVEN_DBT_TRANSFORM_PRICER_UAT set network_policy = ALLOW_DBT_CLOUD_ACCESS_POLICY;

alter user HAVEN_DBT_TRANSFORM unset network_policy;
alter user HAVEN_DBT_TRANSFORM set network_policy = ALLOW_DBT_CLOUD_ACCESS_POLICY;

describe user HAVEN_DBT_TRANSFORM_UAT;

-- Check for other service accounts

select user_name, client_ip, max(event_timestamp) as last_connection, count(*) as connection_count
from snowflake.account_usage.login_history 
where first_authentication_factor = 'PASSWORD'
and is_success
--and client_ip != '54.217.246.193' 
--and user_name like '%_CDC_%'
group by user_name, client_ip
order by user_name, client_ip
-- order by user_name, event_timestamp desc
;

select * from snowflake.account_usage.login_history 
where user_name = 'RAVINDERSINGH'
order by event_timestamp desc
;

select user_name, max(event_timestamp) as last_connection, count(*) as connection_count
from snowflake.account_usage.login_history 
where first_authentication_factor = 'PASSWORD'
and user_name like 'WARNER_%'
and is_success
--and client_ip != '54.217.246.193' 
--and user_name like '%_CDC_%'
group by user_name
order by user_name
-- order by user_name, event_timestamp desc
;


select user_name, client_ip, max(event_timestamp) as last_connection, count(*) as connection_count
from snowflake.account_usage.login_history 
--where client_ip in ('77.108.159.172', '82.28.110.213')
group by 1, 2;

-- Braintree

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

CREATE NETWORK RULE ALLOW_FIVETRAN_BRAINTREE_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('3.67.81.32', '3.67.81.33', '3.67.81.34');

alter network rule ALLOW_FIVETRAN_BRAINTREE_ACCESS_RULE
set value_LIST = ('3.67.81.32', '3.67.81.33', '3.67.81.34', '3.67.81.37', '3.67.81.38', '3.67.81.39');

create or replace network policy ALLOW_FIVETRAN_BRAINTREE_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_FIVETRAN_BRAINTREE_ACCESS_RULE')
comment = 'Policy to restrict Braintree user access; only connections from Fivetran for user will be accepted';

alter user BOURNE_BRAINTREE_DATALOAD unset network_policy;
alter user BOURNE_BRAINTREE_DATALOAD set network_policy = ALLOW_FIVETRAN_BRAINTREE_ACCESS_POLICY;

-- Concur

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

CREATE NETWORK RULE ALLOW_FIVETRAN_CONCUR_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('18.168.224.40', '18.168.224.41', '18.168.224.42');

ALTER NETWORK RULE ALLOW_FIVETRAN_CONCUR_ACCESS_RULE
SET VALUE_LIST = ('18.168.224.40', '18.168.224.41', '18.168.224.42', '18.168.224.45', '18.168.224.46', '18.168.224.47');

--18.168.224.45
--34.85.252.27

create network policy ALLOW_FIVETRAN_CONCUR_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_FIVETRAN_CONCUR_ACCESS_RULE')
comment = 'Policy to restrict Concur user access; only connections from Fivetran for user will be accepted';

alter user BOURNE_CONCUR_DATALOAD set network_policy = ALLOW_FIVETRAN_CONCUR_ACCESS_POLICY;

-- Coupa

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

CREATE NETWORK RULE ALLOW_FIVETRAN_COUPA_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('3.67.81.32', '3.67.81.33', '3.67.81.34');

alter NETWORK RULE ALLOW_FIVETRAN_COUPA_ACCESS_RULE
set VALUE_LIST = ('3.67.81.32', '3.67.81.33', '3.67.81.34', '3.67.81.37', '3.67.81.38', '3.67.81.39');

create network policy ALLOW_FIVETRAN_COUPA_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_FIVETRAN_COUPA_ACCESS_RULE')
comment = 'Policy to restrict Coupa user access; only connections from Fivetran for user will be accepted';

alter user BOURNE_COUPA_DATALOAD set network_policy = ALLOW_FIVETRAN_COUPA_ACCESS_POLICY;

-- Datadog

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

CREATE NETWORK RULE ALLOW_DATADOG_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('54.217.246.193');

alter network rule if exists ALLOW_DATADOG_ACCESS_RULE
set VALUE_LIST = ('54.217.246.193/32',
'3.210.147.169/32',
'3.220.254.141/32',
'23.20.198.65/32',
'23.23.216.60/32',
'34.203.1.9/32',
'34.204.83.4/32',
'34.233.140.66/32',
'35.172.176.208/32',
'44.192.28.0/25',
'52.1.33.14/32',
'52.1.61.69/32',
'54.92.248.81/32',
'54.157.36.5/32',
'86.191.182.19/32');

alter network rule if exists ALLOW_DATADOG_ACCESS_RULE
set VALUE_LIST = ('54.217.246.193/32',
'34.0.224.0/24',
'34.107.99.0/24');

create network policy ALLOW_DATADOG_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_DATADOG_ACCESS_RULE')
comment = 'Policy to restrict Datadog user access; only connections from Fivetran for user will be accepted';

alter user DATADOG_MONITOR set network_policy = ALLOW_DATADOG_ACCESS_POLICY;

-- elteap

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

CREATE NETWORK RULE ALLOW_ETLEAP_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('35.180.160.140');

create network policy ALLOW_ETLEAP_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_ETLEAP_ACCESS_RULE')
comment = 'Policy to restrict etleap user access; only connections from Fivetran for user will be accepted';

alter user HAVEN_ETLEAP_DATALOAD set network_policy = ALLOW_ETLEAP_ACCESS_POLICY;

-- Stitch

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

CREATE NETWORK RULE ALLOW_STITCH_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('18.158.16.164', '3.126.102.29', '52.57.235.168');

create network policy ALLOW_STITCH_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_STITCH_ACCESS_RULE')
comment = 'Policy to restrict stitch user access; only connections from Fivetran for user will be accepted';

alter user HAVEN_STITCH_INTEGRATION set network_policy = ALLOW_STITCH_ACCESS_POLICY;

-- Fivetran log integration

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

CREATE NETWORK RULE ALLOW_FIVETRAN_LOG_SERVICE_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('3.67.81.32', '3.67.81.33', '3.67.81.34');

create network policy ALLOW_FIVETRAN_LOG_SERVICE_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_FIVETRAN_LOG_SERVICE_ACCESS_RULE')
comment = 'Policy to restrict fivetran log service user access; only connections from Fivetran for user will be accepted';

alter user HAVEN_FIVETRAN_LOGS_SERVICE_ACCOUNT set network_policy = ALLOW_FIVETRAN_LOG_SERVICE_ACCESS_POLICY;

-- haven qualitrics batch load

alter user HAVEN_QUALTRICS_DATALOAD set network_policy = ALLOW_BATCH_USER_ACCESS_policy;


-- disable users
alter user HAVEN_FIVETRAN_DATALOAD set disabled = true;
alter user HAVEN_ZONAL_DISCOVERY_TEST set disabled = true;

use role sysadmin;

create schema haven_raw.seaware_pre_deletion_snapshot_20240719 clone haven_raw.seaware;

-- 22/07/2024 
-- Checking HAVEN_QUALTRICS_DATALOAD

select user_name, client_ip, max(event_timestamp) as last_connection, count(*) as connection_count
from snowflake.account_usage.login_history 
where user_name = 'HAVEN_QUALTRICS_DATALOAD'
group by user_name, client_ip
order by user_name, client_ip
-- order by user_name, event_timestamp desc
;

select * 
from snowflake.account_usage.login_history 
where client_ip = '54.217.246.193'
and user_name = 'HAVEN_QUALTRICS_DATALOAD'
order by event_timestamp desc
limit 200;


select user_name, first_authentication_factor, client_ip, max(event_timestamp) as last_connection, count(*) as connection_count
from snowflake.account_usage.login_history 
where user_name not like 'WARNER_%'
and first_authentication_factor not in ('OAUTH_ACCESS_TOKEN', 'SAML2_ASSERTION', 'ID_TOKEN')
and is_success
group by user_name, first_authentication_factor, client_ip
order by user_name, first_authentication_factor, client_ip
;


-- 03/03/2025

show network policies;
show network rules;

-- 04/03/2025

-- Add SAS network rule

CREATE NETWORK RULE ALLOW_SAS_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('20.50.100.250');
 
create network policy ALLOW_SAS_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_SAS_ACCESS_RULE')
 
alter user WARNER_SAS_PROD_SERVICE_ACCOUNT set network_policy = ALLOW_SAS_ACCESS_POLICY;


-- 18/07/2025

show users like '%sigma%';

select user_name, client_ip, max(event_timestamp) as last_connection, count(*) as connection_count
from snowflake.account_usage.login_history 
where user_name = 'HAVEN_ON_PARK_REVENUE_SIGMA_SERVICE_ACCOUNT'
group by 1, 2;

show users like '%sigma%';


select user_name, client_ip, max(event_timestamp) as last_connection, count(*) as connection_count
from snowflake.account_usage.login_history 
where user_name in
( 'HAVEN_CARAVAN_SALES_SIGMA_SIGMA_SERVICE_ACCOUNT','HAVEN_FINANCE_SIGMA_SERVICE_ACCOUNT', 'HAVEN_HOLIDAYS_SIGMA_SERVICE_ACCOUNT', 'HAVEN_HOLIDAYS_SUPPORT_SIGMA_SERVICE_ACCOUNT', 'HAVEN_ON_PARK_REVENUE_SIGMA_SERVICE_ACCOUNT', 'HAVEN_PERFORMANCE_MARKETING_SIGMA_SERVICE_ACCOUNT', 
'HAVEN_PROCUREMENT_SIGMA_SERVICE_ACCOUNT', 'SIGMA_DEMO_USER' )
group by 1, 2
order by client_ip;



CREATE NETWORK RULE ALLOW_SIGMA_SERVICE_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('13.43.207.49', '13.43.194.223');

CREATE NETWORK RULE ALLOW_VEEZOO_SERVICE_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('18.158.77.139', '18.168.121.185');

create or replace network policy ALLOW_SIGMA_SERVICE_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_SIGMA_SERVICE_ACCESS_RULE')
comment = 'Policy to restrict sigma users to the sigma service account user access; only connections from Sigma for user will be accepted';

create network policy ALLOW_SIGMA_VEEZOO_SERVICE_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_SIGMA_SERVICE_ACCESS_RULE', 'ALLOW_VEEZOO_SERVICE_ACCESS_RULE')
comment = 'Policy to restrict sigma users to the sigma service account user access; only connections from Sigma for user will be accepted';

ALTER USER HAVEN_CARAVAN_SALES_SIGMA_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_SERVICE_ACCESS_POLICY;
ALTER USER HAVEN_FINANCE_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_SERVICE_ACCESS_POLICY;
ALTER USER HAVEN_HOLIDAYS_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_SERVICE_ACCESS_POLICY;
ALTER USER HAVEN_HOLIDAYS_SUPPORT_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_SERVICE_ACCESS_POLICY;
ALTER USER HAVEN_PERFORMANCE_MARKETING_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_SERVICE_ACCESS_POLICY;
ALTER USER HAVEN_PROCUREMENT_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_SERVICE_ACCESS_POLICY;
ALTER USER SIGMA_DEMO_USER SET NETWORK_POLICY = ALLOW_SIGMA_SERVICE_ACCESS_POLICY;

ALTER USER HAVEN_ON_PARK_REVENUE_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_VEEZOO_SERVICE_ACCESS_POLICY;


-- 21/07/2025

show users like '%sigma%';

select user_name, client_ip, max(event_timestamp) as last_connection, count(*) as connection_count
from snowflake.account_usage.login_history 
where user_name = 'HAVEN_ON_PARK_REVENUE_SIGMA_SERVICE_ACCOUNT'
group by 1, 2;

show users like '%sigma%';


select user_name, client_ip, max(event_timestamp) as last_connection, count(*) as connection_count
from snowflake.account_usage.login_history 
where user_name in
( 'HAVEN_CARAVAN_SALES_SIGMA_SIGMA_SERVICE_ACCOUNT','HAVEN_FINANCE_SIGMA_SERVICE_ACCOUNT', 'HAVEN_HOLIDAYS_SIGMA_SERVICE_ACCOUNT', 'HAVEN_HOLIDAYS_SUPPORT_SIGMA_SERVICE_ACCOUNT', 'HAVEN_ON_PARK_REVENUE_SIGMA_SERVICE_ACCOUNT', 'HAVEN_PERFORMANCE_MARKETING_SIGMA_SERVICE_ACCOUNT', 
'HAVEN_PROCUREMENT_SIGMA_SERVICE_ACCOUNT', 'SIGMA_DEMO_USER' )
group by 1, 2
order by client_ip;



CREATE NETWORK RULE ALLOW_SIGMA_SERVICE_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('13.43.207.49', '13.43.194.223');

CREATE NETWORK RULE ALLOW_VEEZOO_SERVICE_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('18.158.77.139', '18.168.121.185');

create or replace network policy ALLOW_SIGMA_SERVICE_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_SIGMA_SERVICE_ACCESS_RULE')
comment = 'Policy to restrict sigma users to the sigma service account user access; only connections from Sigma for user will be accepted';

create network policy ALLOW_SIGMA_VEEZOO_SERVICE_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_SIGMA_SERVICE_ACCESS_RULE', 'ALLOW_VEEZOO_SERVICE_ACCESS_RULE')
comment = 'Policy to restrict sigma users to the sigma service account user access; only connections from Sigma for user will be accepted';

ALTER USER HAVEN_CARAVAN_SALES_SIGMA_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_VEEZOO_SERVICE_ACCESS_POLICY;
ALTER USER HAVEN_FINANCE_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_VEEZOO_SERVICE_ACCESS_POLICY;
ALTER USER HAVEN_HOLIDAYS_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_VEEZOO_SERVICE_ACCESS_POLICY;
ALTER USER HAVEN_HOLIDAYS_SUPPORT_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_VEEZOO_SERVICE_ACCESS_POLICY;
ALTER USER HAVEN_PERFORMANCE_MARKETING_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_VEEZOO_SERVICE_ACCESS_POLICY;
ALTER USER HAVEN_PROCUREMENT_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_VEEZOO_SERVICE_ACCESS_POLICY;
ALTER USER SIGMA_DEMO_USER SET NETWORK_POLICY = ALLOW_SIGMA_VEEZOO_SERVICE_ACCESS_POLICY;

ALTER USER HAVEN_ON_PARK_REVENUE_SIGMA_SERVICE_ACCOUNT SET NETWORK_POLICY = ALLOW_SIGMA_VEEZOO_SERVICE_ACCESS_POLICY;


-- 15/09/2025
-- Add development server to AA network rule

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

ALTER NETWORK RULE ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE
set VALUE_LIST = ('18.132.130.123', '188.214.8.130');

desc network rule ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE;

-- 25/09/2025

use role accountadmin;

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

show users like 'AA_ANA%';

ALTER NETWORK RULE ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE
set VALUE_LIST = ('18.132.130.123', '188.214.8.130', '195.26.62.57');

desc network rule ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE;

alter user AA_ANALYTICS_DEV_SERVICE_ACCOUNT set network_policy = ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_POLICY;

use role useradmin;


alter user AA_ANALYTICS_DEV_SERVICE_ACCOUNT
set type = service;

alter user AA_ANALYTICS_DEV_SERVICE_ACCOUNT
set default_secondary_roles = ();

desc user AA_ANALYTICS_DEV_SERVICE_ACCOUNT;

show parameters like 'NETWORK_POLICY' for user AA_ANALYTICS_SERVICE_ACCOUNT;

-- 09/10/2025

use role accountadmin;

USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

show users like 'AA_ANA%';

ALTER NETWORK RULE ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE
set VALUE_LIST = ('18.132.130.123', '188.214.8.130', '195.26.62.57', '18.135.204.106');

desc network rule ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE;

alter user AA_ANALYTICS_DEV_SERVICE_ACCOUNT set network_policy = ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_POLICY;

-- 10/10/2025

-- change the setup of the user AA_ANALYTICS_DEV_SERVICE_ACCOUNT

USE ROLE ACCOUNTADMIN;
USE DATABASE HAVEN_MASTER;
USE SCHEMA COMMON;

ALTER NETWORK RULE ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE
set VALUE_LIST = ('18.132.130.123');


CREATE NETWORK RULE ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_RULE
MODE = INGRESS
TYPE = IPV4
VALUE_LIST = ('188.214.8.130', '195.26.62.57', '18.135.204.106');

create network policy ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_POLICY
allowed_network_rule_list = ('ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_RULE')
comment = 'Policy to restrict Align Alytics development service account access; only connections from AA service accepted';

alter user AA_ANALYTICS_DEV_SERVICE_ACCOUNT set network_policy = ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_POLICY;

-- check allocation of network policy to prod user

show parameters like 'NETWORK_POLICY' for user AA_ANALYTICS_SERVICE_ACCOUNT;

-- ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_POLICY

desc network policy ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_POLICY;

-- [{"fullyQualifiedRuleName":"HAVEN_MASTER.COMMON.ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE"}]

desc network rule ALLOW_ALIGN_ALYTICS_SERVICE_ACCESS_RULE;

-- 18.132.130.123

-- check allocation of network policy to dev user

show parameters like 'NETWORK_POLICY' for user AA_ANALYTICS_DEV_SERVICE_ACCOUNT;

-- ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_POLICY

desc network policy ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_POLICY;

-- [{"fullyQualifiedRuleName":"HAVEN_MASTER.COMMON.ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_RULE"}]

desc network rule ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_RULE;

-- 188.214.8.130, 195.26.62.57, 18.135.204.106

-- 13/10/2025

use role accountadmin;

ALTER NETWORK RULE ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_RULE
SET VALUE_LIST = ('18.132.130.123', '188.214.8.130', '195.26.62.57', '18.135.204.106');

desc network rule ALLOW_ALIGN_ALYTICS_DEV_SERVICE_ACCESS_RULE;

-- 18.132.130.123, 188.214.8.130, 195.26.62.57, 18.135.204.106
