USE ROLE sysadmin;

CREATE WAREHOUSE datadog_monitor_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _datadog_monitor_warehouse_xsmall__operator;
create role _datadog_monitor_warehouse_xsmall__usage;

-- Create a new role intended to monitor Snowflake usage.
create role DATADOG_monitor;

-- Create a user, skip this step if you are using an existing user.
create user DATADOG_monitor
LOGIN_NAME = DATADOG.monitor
password = '<REDACTED>'
default_warehouse = datadog_monitor_warehouse_xsmall
default_role = DATADOG_monitor
default_namespace = SNOWFLAKE.ACCOUNT_USAGE;


USE ROLE securityadmin;

grant usage, monitor on warehouse datadog_monitor_warehouse_xsmall to role _datadog_monitor_warehouse_xsmall__usage;
grant role _datadog_monitor_warehouse_xsmall__usage to role _datadog_monitor_warehouse_xsmall__operator;
grant operate, modify on warehouse datadog_monitor_warehouse_xsmall to role _datadog_monitor_warehouse_xsmall__operator;

GRANT role _datadog_monitor_warehouse_xsmall__usage TO ROLE datadog_monitor;
grant imported privileges on database SNOWFLAKE to role datadog_monitor;

grant role DATADOG_monitor to user datadog_monitor;

USE ROLE dba;
SHOW GRANTS TO ROLE datadog_monitor;

SHOW ROLES LIKE '%haven_master%';

USE ROLE securityadmin;

GRANT ROLE _HAVEN_MASTER__COMMON__READER TO ROLE datadog_monitor;
GRANT ROLE _HAVEN_MASTER__EVENT_LOG__READER TO ROLE datadog_monitor;
GRANT ROLE _HAVEN_MASTER__FIVETRAN_LOGS__READER TO ROLE datadog_monitor;
GRANT ROLE _HAVEN_MASTER__FIVETRAN_METADATA__READER TO ROLE datadog_monitor;

GRANT ROLE datadog_monitor TO ROLE dba;
USE ROLE dba;
USE ROLE datadog_monitor;
SHOW WAREHOUSES;

USE WAREHOUSE datadog_monitor_warehouse_xsmall;

SELECT * FROM HAVEN_MASTER.EVENT_LOG.EVENT_LOG_PRODUCTION_VIEW 
WHERE timestamp > CURRENT_TIMESTAMP() - INTERVAL '2 HOURS' ;

SELECT 'identity' as task_name, current_timestamp() as task_execution, count(*) FROM HAVEN_MASTER.COMMON.identity_mismatched_count;

SELECT * FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY LIMIT 10;

SELECT database_name, SCHEMA_NAME, WAREHOUSE_NAME, ROLE_NAME, avg(TOTAL_ELAPSED_TIME)/1000 AS average_query_time, count(*) AS total_number_of_queries
FROM snowflake.ACCOUNT_USAGE.QUERY_HISTORY 
WHERE START_TIME > CURRENT_TIMESTAMP() - INTERVAL '24 HOURS' 
AND DATABASE_NAME IS NOT null
GROUP BY 1, 2, 3, 4 ORDER BY 1, 2, 3, 4;

USE ROLE accountadmin;

SHOW ROLES LIKE '%snowflake%';

USE ROLE securityadmin;

grant imported privileges on database SNOWFLAKE to role DATADOG_monitor;

USE DATABASE snowflake;

USE SCHEMA account_usage;

grant database role OBJECT_VIEWER to ROLE DATADOG_monitor;
grant database role USAGE_VIEWER to ROLE DATADOG_monitor;
grant database role GOVERNANCE_VIEWER to ROLE DATADOG_monitor;
grant database role SECURITY_VIEWER to ROLE DATADOG_monitor;

-- Grant ORGANIZATION_USAGE_VIEWER to the new role. Do this if you wish to collect Snowflake organization usage metrics.
grant database role ORGANIZATION_USAGE_VIEWER to ROLE DATADOG_monitor;
-- Grant ORGANIZATION_BILLING_VIEWER to the new role. Do this if you wish to collect Snowflake cost data.

grant database role ORGANIZATION_BILLING_VIEWER to role DATADOG_monitor;

-- Grant usage on the database, schema, and table of the event table.

grant usage on database  to role DATADOG:
grant usage on schema <EVENT_TABLE_DATABASE>.<EVENT_TABLE_SCHEMA> to role DATADOG;
grant select on table <EVENT_TABLE_DATABASE>.<EVENT_TABLE_SCHEMA>.<EVENT_TABLE_NAME> to role DATADOG:

USE ROLE securityadmin;

grant select on event table haven_master.event_log.logging_events to role datadog_monitor;

USE ROLE datadog_monitor;

USE WAREHOUSE datadog_monitor_warehouse_xsmall;

SELECT top 5 * FROM HAVEN_MASTER.EVENT_LOG.LOGGING_EVENTS; 

USE ROLE useradmin;

ALTER USER datadog_monitor
SET RSA_PUBLIC_KEY = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4U0hJT8vGBv5nFHjlFYU
ctYJbLqiMCD5WFzDa/yuuMRmDZqGTobQHyFIr3gQ371qYCn2KJHUhybMUfIbiWPo
BZYTySqRd6/4UXAD50UNTWh8+OfAgygEwWCT1QFaP6DN/QchdWHHYfgzhgQkn4it
LbWd2TIU/Die7o69gMpoglMYPVLs9/Skoct44wVKdtY89fXQCYdeGRGT7kfk6aBP
dz6HR5Lk84jPBzvTeTpGhQv6h52bXEITfR38T8a/XwdUYbYGVKQW73/MzkFuSbK3
KlMdNYYx0NdMCI+LHGddmXB/I4+c/Ds0y7wxHRxXobzwT2UvJXoAGZzXEy9itAmr
UQIDAQAB';

USE ROLE accountadmin;
ALTER USER 
