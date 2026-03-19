USE ROLE useradmin;
CREATE ROLE haven_arcade_ingestion;

create user haven_arcade_ingestion
login_name = 'haven.arcade.ingestion'
password = '<REDACTED>'
display_name = 'Haven Arcade Ingestion'
comment = 'Haven Arcade Ingestion'
default_role = haven_arcade_ingestion
default_warehouse = bourne_batch_dataload_xsmall;

SHOW ROLES LIKE '%bourne_batch_dataload%';

GRANT ROLE _bourne_batch_dataload__warehouse__usage TO ROLE haven_arcade_ingestion;
GRANT ROLE _haven_raw__arcades__creator TO ROLE haven_arcade_ingestion;
GRANT ROLE haven_arcade_ingestion TO USER haven_arcade_ingestion;

GRANT ROLE haven_arcade_ingestion TO ROLE dba;

USE SCHEMA haven_raw.arcades;

USE ROLE haven_arcade_ingestion;

CREATE OR REPLACE TABLE haven_raw.arcades.historic_collections (
SiteShort varchar(),
Region varchar(),
StockCode varchar(),
SubPos varchar(),
Venue varchar(),
ColStatus varchar(),
PoP varchar(),
Jackpot varchar(),
INCREMENT1 varchar(),
Incr2 varchar(),
MeterCode varchar(),
TypeShort varchar(),
ModelShort varchar(),
Date varchar(),
Week varchar(),
CIB varchar(),
Refill varchar(),
Refund varchar(),
Float varchar(),
Meter1 varchar(),
Meter2 varchar(),
Meter3 varchar(),
Meter4 varchar(),
Meter5 varchar(),
Meter6 varchar(),
Meter7 varchar(),
Meter8 varchar(),
Meter9 varchar(),
Meter10 varchar(),
Meter11 varchar(),
Meter12 varchar(),
Meter13 varchar(),
PrvMeter1 varchar(),
PrvMeter2 varchar(),
PrvMeter3 varchar(),
PrvMeter4 varchar(),
PrvMeter5 varchar(),
PrvMeter6 varchar(),
PrvMeter7 varchar(),
PrvMeter8 varchar(),
PrvMeter9 varchar(),
PrvMeter10 varchar(),
PrvMeter11 varchar(),
PrvMeter12 varchar(),
PrvMeter13 varchar(),
Days varchar()
);

USE warehouse bourne_batch_dataload_xsmall;
SELECT count(*) FROM HISTORIC_COLLECTIONS ;

SELECT * FROM HISTORIC_COLLECTIONS LIMIT 100;
USE ROLE securityadmin;

revoke ROLE _haven_raw__arcades__reader from ROLE haven_data_integrate;
grant ROLE _haven_base__arcades__reader to ROLE haven_data_integrate;

USE ROLE dba;

USE SCHEMA haven_base.arcades;

CREATE OR REPLACE VIEW	HAVEN_BASE.ARCADES.HISTORIC_COLLECTIONS
( SITESHORT, REGION, STOCKCODE, SUBPOS, VENUE, COLSTATUS, POP, JACKPOT, increment1, INCR2, METERCODE, TYPESHORT, MODELSHORT, DATE, WEEK, CIB, REFILL, REFUND, "FLOAT", METER1, METER2, METER3, METER4, METER5, METER6, METER7, METER8, METER9, METER10, METER11, METER12, METER13, PRVMETER1, PRVMETER2, PRVMETER3, PRVMETER4, PRVMETER5, PRVMETER6, PRVMETER7, PRVMETER8, PRVMETER9, PRVMETER10, PRVMETER11, PRVMETER12, PRVMETER13, DAYS )
AS SELECT SITESHORT, REGION, STOCKCODE, SUBPOS, VENUE, COLSTATUS, POP, JACKPOT, increment1, INCR2, METERCODE, TYPESHORT, MODELSHORT, to_date(date, 'DD/MM/YYYY HH:MI:SS') AS DATE, WEEK, CIB, REFILL, REFUND, "FLOAT", METER1, METER2, METER3, METER4, METER5, METER6, METER7, METER8, METER9, METER10, METER11, METER12, METER13, PRVMETER1, PRVMETER2, PRVMETER3, PRVMETER4, PRVMETER5, PRVMETER6, PRVMETER7, PRVMETER8, PRVMETER9, PRVMETER10, PRVMETER11, PRVMETER12, PRVMETER13, DAYS
FROM HAVEN_RAW.ARCADES.HISTORIC_COLLECTIONS;

USE ROLE securityadmin;

SELECT min((date)), max((date)) FROM HAVEN_BASE.ARCADES.HISTORIC_COLLECTIONS;

GRANT ROLE _haven_base__arcades__reader TO ROLE haven_data_transform;


use ROLE dba;

select date, count(*) FROM haven_raw.ARCADES.HISTORIC_COLLECTIONS 
GROUP BY 1 ORDER BY 1;

SELECT date, to_date(date, 'DD/MM/YYYY HH:MI:SS') FROM  haven_base.ARCADES.HISTORIC_COLLECTIONS LIMIT 100;


create table haven_raw.arcades.HavenCols220101to231022 (
SiteShort varchar(),
Region varchar(),
StockCode varchar(),
SubPos varchar(),
Venue varchar(),
ColStatus varchar(),
PoP varchar(),
Jackpot varchar(),
Increment1 varchar(),
Incr2 varchar(),
MeterCode varchar(),
TypeShort varchar(),
ModelCode varchar(),
ModelShort varchar(),
Date varchar(),
Week varchar(),
CIB varchar(),
Refill varchar(),
Refund varchar(),
Float varchar(),
Meter1 varchar(),
Meter2 varchar(),
Meter3 varchar(),
Meter4 varchar(),
Meter5 varchar(),
Meter6 varchar(),
Meter7 varchar(),
Meter8 varchar(),
Meter9 varchar(),
Meter10 varchar(),
Meter11 varchar(),
Meter12 varchar(),
Meter13 varchar(),
PrvMeter1 varchar(),
PrvMeter2 varchar(),
PrvMeter3 varchar(),
PrvMeter4 varchar(),
PrvMeter5 varchar(),
PrvMeter6 varchar(),
PrvMeter7 varchar(),
PrvMeter8 varchar(),
PrvMeter9 varchar(),
PrvMeter10 varchar(),
PrvMeter11 varchar(),
PrvMeter12 varchar(),
PrvMeter13 varchar(),
Days varchar());