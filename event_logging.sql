use role sysadmin;

create database haven_master;

use role accountadmin;

create event table haven_master.event_log.logging_events;

describe table haven_master.event_log.logging_events;

ALTER ACCOUNT SET EVENT_TABLE = haven_master.event_log.logging_events;

SHOW PARAMETERS LIKE 'event_table' IN ACCOUNT;

select * from haven_master.event_log.logging_events;

show roles like 'haven_data_transform_%';

use role haven_data_transform_jonathanmanley;

use database haven_data_transform;

create schema JM_Work;

use schema jm_work;

CREATE TABLE INGESTED_DATA (RECORD_CONTENT VARCHAR(8000));

INSERT OVERWRITE INTO INGESTED_DATA 
VALUES 
('{"address":{"city":"Stevensfort","postalcode":"20033","state":"DC","street_address":"7782 Joshua Light Apt. 700"},"days":7,"email":null,"emergency_contact":{"name":"Kenneth Johnson","phone":"4898198640"},"expiration_time":"2023-06-01","name":"Sheri Willis","phone":null,"purchase_time":"2023-05-03T00:39:03.336008","resort":"Keystone","rfid":"0x900c64ee735e0cfb79d6ebe9","txid":"7879eed0-6b7d-4666-9aa4-b621c8700cb0"}'),
('{"address":null,"days":6,"email":null,"emergency_contact":{"name":"Richard Baker","phone":"+1-066-728-0674x58901"},"expiration_time":"2023-06-01","name":"Justin Kline","phone":"427.341.0127x88491","purchase_time":"2023-05-03T00:39:03.337206","resort":"Mt. Brighton","rfid":"0xa89366883c123def28bb5bc2","txid":"7360fb86-d8e5-49f2-84e7-6523a16436d4"}'),
('{"address":{"city":"South Brian","postalcode":"91326","state":"CA","street_address":"29292 Robert Vista"},"days":3,"email":"anorton@example.com","emergency_contact":{"name":"Brandon Bell","phone":"(301)980-2816"},"expiration_time":"2023-06-01","name":"Shawn Odom","phone":null,"purchase_time":"2023-05-03T00:39:03.338081","resort":"Vail","rfid":"0xef842c51f91d222650f2607b","txid":"2c9dc120-7b3e-40a2-b98e-752ef5b846c1"}'),
('{"address":{"city":"Lake Kelliside","postalcode":"89778","state":"NV","street_address":"3538 Stephen Radial Suite 641"},"days":5,"email":null,"emergency_contact":null,"expiration_time":"2023-06-01","name":"Laura Jackson","phone":"(192)056-6335x9992","purchase_time":"2023-05-03T00:39:03.338656","resort":"Beaver Creek","rfid":"0x9c87ef9b5ede02fceb94eba6","txid":"e42b560a-5bb9-44be-880a-70f567c14e32"}'),
('{"address":{"city":"South Michellechester","postalcode":"82973","state":"WY","street_address":"7260 David Course Suite 940"},"days":2,"email":null,"emergency_contact":null,"expiration_time":"2023-06-01","name":"Richard Scott","phone":"(377)858-9835x5216","purchase_time":"2023-05-03T00:39:03.339163","resort":"Hotham","rfid":"0x7cfb5f086e84415cf64e9d2b","txid":"6e9750be-e2cf-4e32-bc53-798e96337485"}'),
('{"address":null,"days":6,"email":null,"emergency_contact":{"name":"Brent Gomez","phone":"264-763-2415x20510"},"expiration_time":"2023-06-01","name":"Eric Strong","phone":"+1-475-801-2535x7782","purchase_time":"2023-05-03T00:39:03.339882","resort":"Wilmot","rfid":"0x4516ff404053dd288171c1b","txid":"af31d533-aa1d-4848-a11e-63d04ef3dfab"}'),
('{"address":{"city":"Williamsmouth","postalcode":"98151","state":"WA","street_address":"699 Samuel Trail Suite 056"},"days":3,"email":"bobby00@example.net","emergency_contact":{"name":"Jordan Sanchez","phone":"001-156-388-8421x98000"},"expiration_time":"2023-06-01","name":"Alexander Miller","phone":null,"purchase_time":"2023-05-03T00:39:03.340469","resort":"Mad River","rfid":"0xfc1c56ce8c455d6d033fe1c3","txid":"9f9452e2-6bee-4fa8-99ae-989bf2fb1c9a"}'),
('{"address":{"city":"Lake Jasonburgh","postalcode":"36522","state":"AL","street_address":"357 Woods Orchard Apt. 959"},"days":7,"email":"devon97@example.org","emergency_contact":{"name":"Michelle Mclean","phone":"+1-435-562-5415x97948"},"expiration_time":"2023-06-01","name":"Adam Moran","phone":"179.550.3610","purchase_time":"2023-05-03T00:39:03.341006","resort":"Vail","rfid":"0x9842c7f98423fa6ea5952d21","txid":"d76e6e16-d229-49e7-a77c-41bf576293a3"}'),
('{"address":{"city":"New Keith","postalcode":"27821","state":"NC","street_address":"70002 Gregory Cliffs"},"days":4,"email":"james21@example.com","emergency_contact":null,"expiration_time":"2023-06-01","name":"Sherri Campbell","phone":"001-253-932-0292","purchase_time":"2023-05-03T00:39:03.341508","resort":"Wildcat","rfid":"0xcbd00a5fb3e9b13e3eaede54","txid":"d916c199-8adf-4954-b73e-3aa87d69a498"}'),
('{"address":null,"days":3,"email":null,"emergency_contact":null,"expiration_time":"2023-06-01","name":"Jose Vasquez","phone":"001-094-284-1277","purchase_time":"2023-05-03T00:39:03.342005","resort":"Roundtop","rfid":"0xc5b3a84179fc30bd890d90a8","txid":"2e74fd7e-cffe-4a05-b81b-5a5fe1c8f86b"}'),
('{\"txid\":\"74553eec-32a7-42f6-8955-22c315b6cce3\",\"rfid\":\"0xf5cf736859282ae92873bab8\",'),
('{\"txid\":\"74553eec-32a7-42f6-8955-22c315b6cce3\",\"rfid\":\"0xf5cf736859282ae92873bab8\",\"resort\":\"Wilmot\",\"purchase_time\":\"2023-02-29T04:55:21.397493\",\"expiration_time\":\"2023-06-01\",\"days\":7,\"name\":\"Thomas Perry\",\"address\":null,\"phone\":\"909-865-2364x00638\",\"email\":null,\"emergency_contact\":{\"name\":\"Amber Sanchez\",\"phone\":\"993.904.9224x55225\"}}\n');

CREATE OR REPLACE TABLE LIFT_TICKETS (
TXID varchar(255), RFID varchar(255), RESORT varchar(255), 
PURCHASE_TIME datetime, EXPIRATION_TIME date, DAYS number, NAME varchar(255), 
ADDRESS variant, PHONE varchar(255), EMAIL varchar(255), EMERGENCY_CONTACT variant);

CREATE OR REPLACE FUNCTION TRY_PARSE_TICKET(data string)
returns table (txid varchar, rfid varchar, resort varchar, purchase_time timestamp, expiration_time timestamp, days int, name varchar, address variant, phone varchar, email varchar, emergency_contact variant)
language python
runtime_version=3.8
handler='Parser'
as $$
import json
from datetime import datetime

class Parser:
    def __init__(self):
        pass

    def process(self, data):
        try:
            d = json.loads(data)
        except json.decoder.JSONDecodeError:
            return
        try:
            purchase_time = datetime.strptime(d['purchase_time'], "%Y-%m-%dT%H:%M:%S.%f")
            expiration_time = datetime.strptime(d['expiration_time'], "%Y-%m-%d")
        except ValueError:
            return

        yield (d['txid'], d['rfid'], d['resort'], purchase_time, expiration_time, d['days'], d['name'], d['address'], d['phone'], d['email'], d['emergency_contact'])

    def end_partition(self):
        pass
$$;

SELECT * FROM INGESTED_DATA;

SELECT t.* FROM INGESTED_DATA, TABLE(TRY_PARSE_TICKET(RECORD_CONTENT)) as t;

CREATE OR REPLACE PROCEDURE TRANSFORM_TICKETS()
RETURNS VARCHAR
AS
BEGIN
    BEGIN TRANSACTION;
    MERGE INTO LIFT_TICKETS USING (
    SELECT t.* FROM INGESTED_DATA, TABLE(TRY_PARSE_TICKET(RECORD_CONTENT)) as t
    ) AS 
    DATA_IN ON DATA_IN.TXID = LIFT_TICKETS.TXID
    WHEN MATCHED THEN UPDATE SET 
        LIFT_TICKETS.RFID = DATA_IN.RFID, 
        LIFT_TICKETS.RESORT = DATA_IN.RESORT, 
        LIFT_TICKETS.PURCHASE_TIME = DATA_IN.PURCHASE_TIME, 
        LIFT_TICKETS.EXPIRATION_TIME = DATA_IN.EXPIRATION_TIME, 
        LIFT_TICKETS.DAYS = DATA_IN.DAYS, 
        LIFT_TICKETS.NAME = DATA_IN.NAME,
        LIFT_TICKETS.ADDRESS = DATA_IN.ADDRESS, 
        LIFT_TICKETS.PHONE = DATA_IN.PHONE, 
        LIFT_TICKETS.EMAIL = DATA_IN.EMAIL, 
        LIFT_TICKETS.EMERGENCY_CONTACT = DATA_IN.EMERGENCY_CONTACT
    WHEN NOT MATCHED THEN INSERT (TXID,RFID,RESORT,PURCHASE_TIME,EXPIRATION_TIME,DAYS,NAME,ADDRESS,PHONE,EMAIL,EMERGENCY_CONTACT) 
    VALUES (DATA_IN.TXID,DATA_IN.RFID,DATA_IN.RESORT,DATA_IN.PURCHASE_TIME,DATA_IN.EXPIRATION_TIME,DATA_IN.DAYS,DATA_IN.NAME,DATA_IN.ADDRESS,DATA_IN.PHONE,DATA_IN.EMAIL,DATA_IN.EMERGENCY_CONTACT);
    TRUNCATE TABLE INGESTED_DATA;
    COMMIT;
    RETURN 'ok';
END;

CALL TRANSFORM_TICKETS();
SELECT COUNT(*) FROM LIFT_TICKETS;
SELECT COUNT(*) FROM INGESTED_DATA;


CREATE OR REPLACE TASK TRANSFORM_TICKETS 
    WAREHOUSE=haven_data_transform_warehouse_xsmall
    SCHEDULE = '10 minute'
    ALLOW_OVERLAPPING_EXECUTION = FALSE
AS
    CALL TRANSFORM_TICKETS();

use role securityadmin;

revoke role tag_admin from role haven_data_transform_jonathanmanley;
grant role taskadmin to role haven_data_transform_jonathanmanley;

use role haven_data_transform_jonathanmanley;

ALTER TASK TRANSFORM_TICKETS RESUME;    

SELECT *
  FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY())
  order by SCHEDULED_TIME DESC;

CREATE OR REPLACE FUNCTION TRY_PARSE_TICKET(data string)
returns table (txid varchar, rfid varchar, resort varchar, purchase_time timestamp, expiration_time timestamp, days int, name varchar, address variant, phone varchar, email varchar, emergency_contact variant)
language python
runtime_version=3.8
handler='Parser'
as $$
import json
import logging
from datetime import datetime

class Parser:
    def __init__(self):
        pass

    def process(self, data):
        try:
            d = json.loads(data)
        except json.decoder.JSONDecodeError:
            logging.warning(f"Bad JSON data: {data} in try_parse_ticket")
            return
        try:
            purchase_time = datetime.strptime(d['purchase_time'], "%Y-%m-%dT%H:%M:%S.%f")
            expiration_time = datetime.strptime(d['expiration_time'], "%Y-%m-%d")
        except ValueError:
            logging.warning(f"Bad DATE value in data: {data} in try_parse_ticket")
            return

        yield (d['txid'], d['rfid'], d['resort'], purchase_time, expiration_time, d['days'], d['name'], d['address'], d['phone'], d['email'], d['emergency_contact'])

    def end_partition(self):
        pass
$$;  

use role useradmin;
create role log_level_admin;
use role securityadmin;
grant modify log level on account to role log_level_admin;
use role accountadmin;
grant modify log level on account to role log_level_admin;
grant modify session log level on account to role log_level_admin;
use role securityadmin;
grant role log_level_admin to role haven_data_transform_jonathanmanley;
grant role log_level_admin to role haven_data_transform_garyranson;

use role haven_data_transform_jonathanmanley;
alter function TRY_PARSE_TICKET(string) set log_level = WARN;


INSERT OVERWRITE INTO INGESTED_DATA 
VALUES
('{\"txid\":\"74553eec-32a7-42f6-8955-22c315b6cce3\",\"rfid\":\"0xf5cf736859282ae92873bab8\",'),
('{\"txid\":\"74553eec-32a7-42f6-8955-22c315b6cce3\",\"rfid\":\"0xf5cf736859282ae92873bab8\",\"resort\":\"Wilmot\",\"purchase_time\":\"2023-02-29T04:55:21.397493\",\"expiration_time\":\"2023-06-01\",\"days\":7,\"name\":\"Thomas Perry\",\"address\":null,\"phone\":\"909-865-2364x00638\",\"email\":null,\"emergency_contact\":{\"name\":\"Amber Sanchez\",\"phone\":\"993.904.9224x55225\"}}\n');

CALL TRANSFORM_TICKETS();

use role securityadmin;

grant role _haven_master__event_log__reader to role haven_data_transform_jonathanmanley;
use role haven_data_transform_jonathanmanley;
use role accountadmin;
select * from haven_master.event_log.logging_events;



use role haven_data_transform_jonathanmanley;
ALTER SESSION SET LOG_LEVEL = INFO;
CREATE OR REPLACE FUNCTION log_trace_data()
RETURNS VARCHAR
LANGUAGE PYTHON
RUNTIME_VERSION = 3.8
HANDLER = 'run'
AS $$
import logging
logger = logging.getLogger("tutorial_logger")

def run():
  logger.info("Logging from Python function.")
  return "SUCCESS"
$$;

SELECT log_trace_data();

use role accountadmin;

SELECT *,
  TIMESTAMP AS time,
  RESOURCE_ATTRIBUTES['snow.executable.name'] as executable,
  RECORD['severity_text'] AS severity,
  VALUE AS message
FROM
  haven_master.event_log.logging_events
WHERE
  RECORD_TYPE = 'LOG'
  AND resource_attributes['db.user'] = 'GARYRANSON';
--  AND SCOPE['name'] = 'tutorial_logger';

SELECT *,
  TIMESTAMP AS time,
  RESOURCE_ATTRIBUTES['snow.executable.name'] as executable,
  RECORD['severity_text'] AS severity,
  VALUE AS message
FROM
  haven_master.event_log.logging_events
WHERE
  RECORD_TYPE = 'LOG'
  AND resource_attributes['db.user'] != 'GARYRANSON';
--  AND SCOPE['name'] = 'tutorial_logger';


select * from haven_master.event_log.logging_events;

use role haven_data_transform_jonathanmanley;

use role securityadmin;
show grants to role _haven_master__usage;
show grants to role _haven_master__event_log__usage;
show grants to role _haven_master__event_log__reader;
show grants of role _haven_master__event_log__reader;

show grants to role _haven_master__event_log__reader;

grant select on all tables in schema haven_master.event_log to role _haven_master__event_log__reader;
grant select on all views in schema haven_master.event_log to role _haven_master__event_log__reader;
grant select on all materialized views in schema haven_master.event_log to role _haven_master__event_log__reader;
grant select on future tables in schema haven_master.event_log to role _haven_master__event_log__reader;
grant select on future views in schema haven_master.event_log to role _haven_master__event_log__reader;
grant select on future materialized views in schema haven_master.event_log to role _haven_master__event_log__reader;
grant read on all stages in schema haven_master.event_log to role _haven_master__event_log__reader;
grant read on future stages in schema haven_master.event_log to role _haven_master__event_log__reader;

grant select on event table haven_master.event_log.logging_events to role log_level_admin;

use role securityadmin;
grant role taskadmin to role haven_data_transform_johnpering;
grant role log_level_admin to role haven_data_transform_johnpering;
grant role _haven_master__event_log__reader to role haven_data_transform_johnpering;

grant role log_level_admin to role dba;
use role dba;

SELECT *,
  TIMESTAMP AS time,
  RESOURCE_ATTRIBUTES['snow.executable.name'] as executable,
  RESOURCE_ATTRIBUTES['snow.session.role.primary.name'] as username,
  RECORD['severity_text'] AS severity,
  VALUE AS message
FROM
  haven_master.event_log.logging_events
WHERE
  RECORD_TYPE = 'LOG'
  AND record['severity_text'] = 'ERROR'
  order by observed_timestamp;
--  AND SCOPE['name'] = 'tutorial_logger';

show grants to role haven_dbt_transform;

show roles like '%haven_pipeline%';
