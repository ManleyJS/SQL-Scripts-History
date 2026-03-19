use ROLE dba;

use SCHEMA training.training;

SHOW tables;

DESC TABLE client;

SELECT last_name, count(*)
FROM client
WHERE STARTSWITH(LAST_NAME , 'Ma')
GROUP BY 1 ORDER BY 2 desc;

SELECT * FROM client LIMIT 100;

SELECT * FROM haven_store.EVENT_DATA.EVENT_LOG el LIMIT 20;

CREATE TABLE event_row_access_mapping (
role_name varchar,
executable_name varchar,
allowed_flag varchar
);

INSERT INTO event_row_access_mapping 
VALUES
('TEST_ROLE_RETL', 'FRESHSALES_RETL', 'TRUE'),
('TEST_ROLE_LEADS', 'FRESHSALES_SALES_LEADS', 'TRUE');

USE ROLE USERADMIN;
CREATE ROLE TEST_ROLE_RETL;
CREATE ROLE TEST_ROLE_LEADS;

USE ROLE SECURITYADMIN;

GRANT ROLE TEST_ROLE_RETL TO ROLE DBA;
GRANT ROLE TEST_ROLE_LEADS TO ROLE DBA;

GRANT ROLE _haven_store__event_data__reader TO ROLE TEST_ROLE_RETL;
GRANT ROLE _haven_store__event_data__reader TO ROLE TEST_ROLE_LEADS;

GRANT USAGE ON warehouse dba_wh TO ROLE TEST_ROLE_RETL;
GRANT USAGE ON warehouse dba_wh TO ROLE TEST_ROLE_LEADS;


grant select on event table haven_store.event_data.event_log to role TEST_ROLE_RETL;
grant select on event table haven_store.event_data.event_log to role TEST_ROLE_LEADS;

use ROLE TEST_ROLE_RETL;

SELECT * FROM haven_store.EVENT_DATA.EVENT_LOG el LIMIT 20;

use ROLE accountadmin;
SELECT * FROM SNOWFLAKE.telemetry.events LIMIT 100;

use ROLE dba;

use schema haven_staging.revenue_management_output;

SHOW tables;
