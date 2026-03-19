USE ROLE accountadmin;

show integrations;

DROP storage integration blg_havdevserv_arcades_email_s3_integration;

create or replace storage integration blg_havdevserv_arcades_email_s3_integration_dev 
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-arcade-role'
  enabled = true
  storage_allowed_locations = ('s3://blg-havdevserv-arcades-email-s3/');
 
 create or replace storage integration blg_havprodserv_arcades_email_s3_integration_prod 
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::445123880475:role/blg-havprodserv-snowflake-arcade-role'
  enabled = true
  storage_allowed_locations = ('s3://blg-havprodserv-arcades-email-s3/');

 
 SHOW integrations;

DESC integration blg_havprodserv_arcades_email_s3_integration_prod;

use role securityadmin;

grant usage on integration blg_havprodserv_arcades_email_s3_integration_prod to role dba;
grant usage on integration blg_havprodserv_arcades_email_s3_integration_prod to role haven_arcade_ingestion;
grant usage on integration blg_havprodserv_arcades_email_s3_integration_prod to role haven_data_integrate;

USE role haven_arcade_ingestion;

use schema haven_raw.arcades;

create or replace file format haven_raw.arcades.arcades_email_csv_integration_format
  type = csv
  compression = gzip
  field_delimiter = ','
  FIELD_OPTIONALLY_ENCLOSED_BY='"'
  EMPTY_FIELD_AS_NULL=TRUE
  NULL_IF=() 
  TIMESTAMP_FORMAT="DD/MM/YYYY HH24:MI:SS"
  ESCAPE_UNENCLOSED_FIELD=NONE
  ENCODING='UTF-8'
  ESCAPE=NONE;

create or replace stage haven_raw.arcades.arcades_email_csv_integration_stage_dev
  url = 's3://blg-havdevserv-arcades-email-s3/'
  storage_integration = blg_havdevserv_arcades_email_s3_integration_dev
  file_format = haven_raw.arcades.arcades_email_csv_integration_format
;

ls @haven_raw.arcades.arcades_email_csv_integration_stage_dev;

USE ROLE securityadmin;

GRANT ROLE _haven_raw__arcades__reader TO ROLE haven_data_integrate;
GRANT USAGE ON STAGE haven_raw.arcades.arcades_email_csv_integration_stage_dev TO ROLE _haven_raw__arcades__reader;

USE ROLE haven_data_integrate;
USE SCHEMA haven_raw.arcades;

ls @haven_raw.arcades.arcades_email_csv_integration_stage_dev;

SHOW GRANTS TO ROLE _haven_raw__arcades__reader;

USE ROLE securityadmin;

USE ROLE haven_batch_dataload; 

--USE ROLE haven_commercial;

-- HAVEN_RAW.GOOGLE_INTEGRATION.GA_SESSIONS_20180126 definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.GA_SESSIONS_HAVEN_WWW (
	visitorId NUMBER(38,0),
	visitNumber NUMBER(38,0),
	visitId NUMBER(38,0),
	visitStartTime NUMBER(38,0),
	date VARCHAR(),
	totals VARIANT,
	trafficSource VARIANT,
	device VARIANT,
	geoNetwork VARIANT,
	customDimensions ARRAY NOT NULL,
	hits ARRAY NOT NULL,
	fullVisitorId VARCHAR(),
	userId VARCHAR(),
	channelGrouping VARCHAR(),
	socialEngagementType VARCHAR()
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.GA_SESSIONS_HAVEN_WWW definition

USE ROLE haven_batch_dataload;

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.GA_SESSIONS_HAVEN_WWW (
	GEONETWORK VARIANT,
	TOTALS VARIANT,
	VISITNUMBER NUMBER(38,0),
	CHANNELGROUPING VARCHAR(16777216),
	VISITORID NUMBER(38,0),
	PRIVACYINFO VARIANT,
	CLIENTID VARCHAR(16777216),
	VISITID NUMBER(38,0),
	CUSTOMDIMENSIONS ARRAY NOT NULL,
	USERID VARCHAR(16777216),
	DEVICE VARIANT,
	FULLVISITORID VARCHAR(16777216),
	VISITSTARTTIME NUMBER(38,0),
	DATE VARCHAR(16777216),
	SOCIALENGAGEMENTTYPE VARCHAR(16777216),
	HITS ARRAY NOT NULL,
	TRAFFICSOURCE VARIANT
);

DESC TABLE HAVEN_RAW.GOOGLE_INTEGRATION.GA_SESSIONS_HAVEN_WWW;