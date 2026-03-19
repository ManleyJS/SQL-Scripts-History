USE ROLE useradmin;

create role _bourne_alation__warehouse__usage;
create role _bourne_alation__warehouse__operator;

USE ROLE sysadmin;
create warehouse bourne_alation_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 30 
AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'ECONOMY';

USE ROLE securityadmin;
grant MONITOR, usage on warehouse bourne_alation_xsmall to role _bourne_alation__warehouse__usage;
GRANT MODIFY, OPERATE on warehouse bourne_alation_xsmall TO ROLE _bourne_alation__warehouse__operator;
GRANT ROLE _bourne_alation__warehouse__usage TO ROLE _bourne_alation__warehouse__operator;

USE ROLE useradmin;
CREATE ROLE bourne_raw_alation_catalogue;
CREATE ROLE butlins_raw_alation_catalogue;
CREATE ROLE haven_raw_alation_catalogue;
CREATE ROLE warner_raw_alation_catalogue;

CREATE ROLE bourne_base_alation_catalogue;
CREATE ROLE butlins_base_alation_catalogue;
CREATE ROLE haven_base_alation_catalogue;
CREATE ROLE warner_base_alation_catalogue;

create user haven_raw_alation_catalogue
password = 'AlationRawIngest2021' 
login_name = 'haven.raw.alation.catalogue'
display_name = 'Haven Alation Ingestion'
default_role = haven_raw_alation_catalogue
default_warehouse = bourne_alation_xsmall
default_namespace = haven_raw;

USE ROLE securityadmin;
GRANT ROLE _bourne_alation__warehouse__usage TO ROLE haven_raw_alation_catalogue;
GRANT ROLE _haven_raw__query_log__creator TO ROLE haven_raw_alation_catalogue;
GRANT ROLE _haven_raw__seaware__reader TO ROLE haven_raw_alation_catalogue;

GRANT ROLE haven_raw_alation_catalogue TO USER haven_raw_alation_catalogue;

USE ROLE sysadmin;

CREATE OR REPLACE VIEW HAVEN_RAW.QUERY_LOG.SEAWARE_QUERY_HISTORY AS
SELECT
  START_TIME,
  DATABASE_NAME,
  SCHEMA_NAME,
  WAREHOUSE_NAME,
  ERROR_MESSAGE,
  QUERY_TYPE,
  TRIM(QUERY_TEXT) as QUERY_TEXT,
  QUEUED_PROVISIONING_TIME,
  QUEUED_REPAIR_TIME,
  QUEUED_OVERLOAD_TIME,
  TRANSACTION_BLOCKED_TIME,
  USER_NAME,
  COMPILATION_TIME,
  EXECUTION_TIME,
  QUERY_ID,
  ERROR_CODE,
  SESSION_ID
FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
WHERE USER_NAME = 'HAVEN_CDC_DATALOAD';

GRANT USAGE ON DATABASE <DBNAME> TO ROLE <alation_role>
GRANT USAGE ON SCHEMA <DBNAME>.<SCHEMANAME> TO ROLE <alation_role>
GRANT SELECT ON VIEW <DBNAME>.<SCHEMANAME>.<VIEWNAME> TO ROLE <alation_role>

SELECT  START_TIME AS startTime, ERROR_MESSAGE AS executionError, QUERY_TYPE AS queryType, TRIM(QUERY_TEXT) AS text, 
ROUND((QUEUED_PROVISIONING_TIME + QUEUED_REPAIR_TIME + QUEUED_OVERLOAD_TIME  + TRANSACTION_BLOCKED_TIME)/1000, 3) AS delayTime, 
DATABASE_NAME || '.' || SCHEMA_NAME AS defaultDatabases, USER_NAME AS userName, 
ROUND((COMPILATION_TIME + EXECUTION_TIME + QUEUED_PROVISIONING_TIME + QUEUED_REPAIR_TIME + QUEUED_OVERLOAD_TIME  + TRANSACTION_BLOCKED_TIME)/1000, 3) AS totalCpuTime, 
ROUND(EXECUTION_TIME/1000,3) AS secondsTaken, QUERY_ID AS queryId, ERROR_CODE AS executionErrorCode, 
TRIM(SESSION_ID ||'/' || TO_CHAR(START_TIME,'YYYY-MM-DD HH:MI:SS.SSSSSSSSS') || '/' || USER_NAME) AS sessionId 
FROM query_log.seaware_query_history 
WHERE TRIM(QUERY_TEXT) IS NOT NULL 
AND TRIM(QUERY_TEXT) <> '' 
AND STARTTIME >= ? 
AND STARTTIME < ? LIMIT 100 