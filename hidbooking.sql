USE ROLE dba;
USE DATABASE haven_raw;
SHOW SCHEMAS;

USE ROLE securityadmin;

GRANT ROLE _haven_raw__blapi_hid__creator TO ROLE haven_batch_dataload; 

USE ROLE haven_batch_dataload;

USE SCHEMA haven_raw.blapi_hid;

CREATE TABLE HidBooking (
Hid varchar,
ResId int,
AccessLevel int,
LastModifiedDate timestamp, 
Unclaimed boolean);

USE ROLE dba;

CREATE VIEW haven_base.blapi_hid.hidbooking 
( HID, RESID, ACCESSLEVEL, LASTMODIFIEDDATE, UNCLAIMED )
AS SELECT HID, RESID, ACCESSLEVEL, LASTMODIFIEDDATE, UNCLAIMED
FROM HAVEN_RAW.BLAPI_HID.HIDBOOKING;

USE SCHEMA haven_base.blapi_hid;

SELECT * FROM HIDBOOKING ;


