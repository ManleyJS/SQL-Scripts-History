use role dba;
select get_ddl('SCHEMA', 'DIG_AAC_ONPARKWIFI');

use database haven_raw;

show schemas;

use schema dig_activities_etleap;

show tables;

use schema haven_base.dig_activities;
select get_ddl('SCHEMA', 'dig_activities');

show views;

select get_ddl('VIEW', 'BATHER_LOAD');

select max(created_datetime)
from bather_load;

select get_ddl('VIEW', 'UNKNOWN_GUEST');

select max(created_datetime)
from unknown_guest;

select get_ddl('VIEW', 'PARK_WEEK');

select max(week_start)
from park_week;

select get_ddl('VIEW', 'NOTIFICATIONTEMPLATES');

select max(createdat)
from notificationtemplates;

drop materialized view BATHER_LOAD;
drop materialized view UNKNOWN_GUEST;
drop materialized view PARK_WEEK;
drop view NOTIFICATIONTEMPLATES;
DROP view sequelizemeta;

use schema dig_arrivals;

drop view TYPEORM_METADATA;
drop view _etleap;

use schema dig_bookings;

show views;

select get_ddl('view', 'ooking');

select * from booking limit 5;

drop view ooking;

create or replace view BOOKING(
	TRANSACTIONID,
	ID,
	BOOKINGFAILUREREASON,
	BOOKINGSTATE,
	BOURNETRANSACTIONID,
	CREATEDAT,
	SOURCE,
	ISDISCOUNTAPPLIED
) as SELECT "TRANSACTIONID", "ID", "BOOKINGFAILUREREASON", "BOOKINGSTATE", "BOURNETRANSACTIONID", "CREATEDAT", "SOURCE", "ISDISCOUNTAPPLIED" FROM "HAVEN_RAW"."DIG_BOOKINGS_ETLEAP"."BOOKING";

drop view _etleap;

use schema dig_capacity;

show views;

drop view SEQUELIZEMETA;
drop view _ETLEAP;

use schema DIG_PAYMENTS;

show views;

drop view _etleap;
select get_ddl('view', 'audit_log_item');
select * from log;

drop view log;

use schema DIG_PRICING;

show views;

drop view SEQUELIZEMETA;
drop view _etleap;

select get_ddl('view', '_discounts');

select max(createdat)
from discounts;

show views;

select * from discounts limit 100;


create or replace view DISCOUNTS(
	ID,
	TYPE,
	VALUE,
	CREATEDAT,
	UPDATEDAT,
	DELETEDAT
) as SELECT "ID", "TYPE", "value", "CREATEDAT", "UPDATEDAT", "DELETEDAT" FROM "HAVEN_RAW"."DIG_PRICING_ETLEAP"."DISCOUNTS";

show views;
drop view 1_discounts;

use schema mariner;

show views;

use schema haven_raw.mariner_etleap;

show tables;


use role securityadmin;

grant role _HAVEN_RAW__KMSREPORTING_COMPLEX_ETLEAP__CREATOR to role haven_etleap_dataload;
grant role _haven_raw__energy_meters__creator to role haven_batch_dataload;

use role dba;

use schema haven_raw.freedompay;

use role haven_batch_dataload;

show stages;

show tables;

use schema haven_raw.energy_meters;

use role dba;

use schema haven_base.seaware;

select get_ddl('view', 'BLL_INV_AVAILABILITY');
select get_ddl('view', 'BLL_INV_CONTRACT');

create or replace view haven_base.seaware.BLL_INV_AVAILABILITY(
	DATE_,
	PARK_CODE,
	GRADE_CODE,
	PRODUCT_TYPE,
	PITCHES,
	NA_ABS,
	HELD,
	RSRV_UA,
	RSRV_OL,
	RSRV_OB,
	ALLOC,
	CAP,
	AVAIL,
	FIRM,
	ASGN_ABS,
	GTY_ABS,
	TIMESTAMP,
	BK,
	OFR,
	RSRV_SP
) as SELECT "DATE_", "PARK_CODE", "GRADE_CODE", "PRODUCT_TYPE", "PITCHES", "NA_ABS", "HELD", "RSRV_UA", "RSRV_OL", "RSRV_OB", "ALLOC", "CAP", "AVAIL", "FIRM", "ASGN_ABS", "GTY_ABS", "TIMESTAMP", "BK", "OFR", "RSRV_SP" FROM "HAVEN_RAW"."SEAWARE_ETLEAP"."BLL_INV_AVAILABILITY";

create or replace view haven_base.seaware.BLL_INV_CONTRACT(
	DATE_,
	PARK_CODE,
	GRADE_CODE,
	PRODUCT_TYPE,
	CONTRACT_TYPE,
	PITCHES,
	NA_ABS,
	HELD,
	ALLOC,
	ASGN_ABS,
	TIMESTAMP
) as SELECT "DATE_", "PARK_CODE", "GRADE_CODE", "PRODUCT_TYPE", "CONTRACT_TYPE", "PITCHES", "NA_ABS", "HELD", "ALLOC", "ASGN_ABS", "TIMESTAMP" FROM "HAVEN_RAW"."SEAWARE_ETLEAP"."BLL_INV_CONTRACT";

use schema haven_raw.coupa_etleap;

show tables;

use role sysadmin;

drop database haven_base_etleap;

use role useradmin;

show roles like '_haven_base_etleap__%';

drop role _HAVEN_BASE_ETLEAP__MARINER_ETLEAP__CREATOR;
drop role _HAVEN_BASE_ETLEAP__MARINER_ETLEAP__OWNER;
drop role _HAVEN_BASE_ETLEAP__MARINER_ETLEAP__READER;
drop role _HAVEN_BASE_ETLEAP__MARINER_ETLEAP__USAGE;
drop role _HAVEN_BASE_ETLEAP__MARINER_ETLEAP__WRITER;
drop role _HAVEN_BASE_ETLEAP__USAGE;
