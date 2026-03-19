USE ROLE accountadmin;

SHOW RESOURCE MONITORS;

USE ROLE useradmin;
CREATE ROLE _ALIGN_ALYTICS_COMPUTE_MONITOR__resource_monitor__modify;
CREATE ROLE _ALIGN_ALYTICS_COMPUTE_MONITOR__resource_monitor__monitor;
CREATE ROLE _BOURNE_ACCOUNT_RESOURCE_MONITOR__resource_monitor__modify;
CREATE ROLE _BOURNE_ACCOUNT_RESOURCE_MONITOR__resource_monitor__monitor;
CREATE ROLE _HVR_CDC_RESOURCE_MONITOR__resource_monitor__modify;
CREATE ROLE _HVR_CDC_RESOURCE_MONITOR__resource_monitor__monitor;

USE ROLE securityadmin;

GRANT MODIFY ON RESOURCE MONITOR ALIGN_ALYTICS_COMPUTE_MONITOR TO ROLE _ALIGN_ALYTICS_COMPUTE_MONITOR__resource_monitor__modify; 
GRANT MODIFY ON RESOURCE MONITOR BOURNE_ACCOUNT_RESOURCE_MONITOR TO ROLE _BOURNE_ACCOUNT_RESOURCE_MONITOR__resource_monitor__modify;
GRANT MODIFY ON RESOURCE MONITOR HVR_CDC_RESOURCE_MONITOR TO ROLE _HVR_CDC_RESOURCE_MONITOR__resource_monitor__modify; 

GRANT MONITOR ON RESOURCE MONITOR ALIGN_ALYTICS_COMPUTE_MONITOR TO ROLE _ALIGN_ALYTICS_COMPUTE_MONITOR__resource_monitor__monitor; 
GRANT MONITOR ON RESOURCE MONITOR BOURNE_ACCOUNT_RESOURCE_MONITOR TO ROLE _BOURNE_ACCOUNT_RESOURCE_MONITOR__resource_monitor__monitor;
GRANT MONITOR ON RESOURCE MONITOR HVR_CDC_RESOURCE_MONITOR TO ROLE _HVR_CDC_RESOURCE_MONITOR__resource_monitor__monitor;

GRANT ROLE _ALIGN_ALYTICS_COMPUTE_MONITOR__resource_monitor__monitor TO ROLE haven_sre_usage_monitor;
GRANT ROLE _BOURNE_ACCOUNT_RESOURCE_MONITOR__resource_monitor__monitor TO ROLE haven_sre_usage_monitor;
GRANT ROLE _HVR_CDC_RESOURCE_MONITOR__resource_monitor__monitor TO ROLE haven_sre_usage_monitor;

USE ROLE haven_sre_usage_monitor;

SHOW RESOURCE MONITORS;

----- New role for account usage

USE ROLE sysadmin;

CREATE WAREHOUSE restricted_account_usage_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _restricted_account_usage_warehouse_xsmall__operator;
create role _restricted_account_usage_warehouse_xsmall__usage;

create role restricted_account_usage;

USE ROLE securityadmin;

grant usage, monitor on warehouse restricted_account_usage_warehouse_xsmall to role _restricted_account_usage_warehouse_xsmall__usage;
grant role _restricted_account_usage_warehouse_xsmall__usage to role _restricted_account_usage_warehouse_xsmall__operator;
grant operate, modify on warehouse restricted_account_usage_warehouse_xsmall to role _restricted_account_usage_warehouse_xsmall__operator;


GRANT ROLE _restricted_account_usage_warehouse_xsmall__usage TO ROLE restricted_account_usage;
GRANT ROLE _haven_master__common__reader TO ROLE restricted_account_usage;

GRANT ROLE restricted_account_usage TO USER johnpering;

GRANT ROLE restricted_account_usage TO ROLE dba;

USE ROLE dba;

USE SCHEMA haven_master.common;

create view haven_master.common.query_history
as select * from snowflake.account_usage.query_history
where start_time > add_months(current_timestamp, -3)
;

USE ROLE restricted_account_usage;

SELECT * FROM haven_master.common.query_history LIMIT 5;

