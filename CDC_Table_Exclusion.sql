USE ROLE useradmin;

CREATE ROLE haven_store_dataload;

USE ROLE sysadmin;

create warehouse bourne_store_dataload_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 30 
AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'ECONOMY';

create role _bourne_store_dataload__warehouse__usage;
create role _bourne_store_dataload__warehouse__operator;

grant usage on warehouse bourne_store_dataload_xsmall to role _bourne_store_dataload__warehouse__usage;

GRANT ROLE haven_store__jdaprep__creator TO ROLE haven_store_dataload;
GRANT ROLE _bourne_store_dataload__warehouse__usage TO ROLE haven_store_dataload;

SELECT TABLE_NAME, COLUMN_NAME FROM BUTLINS_RAW.INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_CATALOG = 'HAVEN_RAW' AND TABLE_SCHEMA = 'SEAWARE' AND NOT ENDSWITH(TABLE_NAME, '__B')
            AND NOT STARTSWITH(TABLE_NAME, 'HVR_ST')
UNION SELECT TABLE_NAME, COLUMN_NAME FROM HAVEN_RAW.INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_CATALOG = 'HAVEN_RAW' AND TABLE_SCHEMA = 'SEAWARE' AND NOT ENDSWITH(TABLE_NAME, '__B')
            AND NOT STARTSWITH(TABLE_NAME, 'HVR_ST')
UNION SELECT TABLE_NAME, COLUMN_NAME FROM WARNER_RAW.INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_CATALOG = 'HAVEN_RAW' AND TABLE_SCHEMA = 'SEAWARE' AND NOT ENDSWITH(TABLE_NAME, '__B')
            AND NOT STARTSWITH(TABLE_NAME, 'HVR_ST')
ORDER BY TABLE_name, column_name
;
           
SELECT column_name FROM HAVEN_RAW.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_CATALOG = 'HAVEN_RAW' AND TABLE_SCHEMA = 'SEAWARE' AND NOT ENDSWITH(TABLE_NAME, '__B') AND NOT STARTSWITH(TABLE_NAME, 'HVR_ST')
AND COLUMN_name LIKE '%CC%'
GROUP BY column_name
ORDER BY column_name; 

