use role dba;
use database haven_store;
use schema ma_mart;

alter table MA_HAVEN_ANALYTICS_MART rename to MA_HAVEN_ANALYTICS_MART_save;
alter table MA_HAVEN_ANALYTICS_PIT_MART rename to MA_HAVEN_ANALYTICS_PIT_MART_save;

use role haven_batch_dataload;
use warehouse bourne_batch_dataload_xsmall;
create table MA_HAVEN_ANALYTICS_MART as select * from MA_HAVEN_ANALYTICS_MART_save;
create table MA_HAVEN_ANALYTICS_PIT_MART as select * from MA_HAVEN_ANALYTICS_PIT_MART_save;

use role dba;
drop table MA_HAVEN_ANALYTICS_MART_save;
drop table MA_HAVEN_ANALYTICS_PIT_MART_save;

use role haven_revenue_management;



use role securityadmin;
grant role _haven_raw__google_analytics__reader to role haven_batch_dataload;

use role haven_batch_dataload;
use database haven_raw;
use schema bigquery;


-- HAVEN_RAW.GOOGLE_ANALYTICS.GA_SESSION_168513829_STAGE definition

drop table HAVEN_RAW.BIGQUERY.GA_SESSION;

create or replace TABLE HAVEN_RAW.BIGQUERY.GA_SESSION (
	geoNetwork VARIANT,
	session_totals VARIANT,
	visitNumber NUMBER(38,0),
	channelGrouping VARCHAR(16777216),
	visitorId NUMBER(38,0),
	privacyInfo VARIANT,
	clientId VARCHAR(16777216),
	visitId NUMBER(38,0),
	customDimensions ARRAY NOT NULL,
	userId VARCHAR(16777216),
	device VARIANT,
	fullVisitorId VARCHAR(16777216),
	visitStartTime NUMBER(38,0),
	session_date VARCHAR(16777216),
	socialEngagementType VARCHAR(16777216),
	session_hits ARRAY NOT NULL,
	trafficSource VARIANT
);

insert into haven_raw.bigquery.ga_session select * from haven_raw.google_analytics.ga_session_168513829_stage 
order by "date";

select "date", count(*) from haven_raw.google_analytics.ga_session_168513829_stage
group by 1 order by 1 desc;
