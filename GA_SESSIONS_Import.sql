use role haven_batch_dataload;

use database haven_raw;
use schema google_integration;

--create or replace table ga_sessions_20200502 using template ( select array_agg(object_construct(*)) from table( infer_schema(location=>'@haven_raw.bigquery.gcs_bigquery_integration_stage/158196269/ga_sessions_20200502/20200502', file_format=>'haven_raw.bigquery.gcs_avro_integration_format')));

--copy into ga_sessions_20200502 from @haven_raw.bigquery.gcs_bigquery_integration_stage/158196269/ga_sessions_20200502/20200502 file_format = haven_raw.bigquery.gcs_avro_integration_format match_by_column_name = case_insensitive;

--select * from ga_sessions_20200502;

desc table ga_sessions_careers;

--drop table ga_sessions_careers;

--create table ga_sessions_careers like ga_sessions_haven_www;

--create or replace table ga_sessions_careers like ga_sessions_haven_www;
--create or replace table GA_SESSIONS_HAVEN_OWNERS like ga_sessions_haven_www;
--create or replace table GA_SESSIONS_HAVEN_WWW_ROLLUP like ga_sessions_haven_www;
--create or replace table GA_SESSIONS_CARAVAN_SALES like ga_sessions_haven_www;
--create or replace table GA_SESSIONS_HAVEN_WWW_DESKTOP like ga_sessions_haven_www;
--create or replace table GA_SESSIONS_HAVEN_WWW_MOBILE like ga_sessions_haven_www;
--create or replace table GA_SESSIONS_HAVEN_GUEST_APP like ga_sessions_haven_www;
--create or replace table GA_SESSIONS_HAVEN_TEAM_APP like ga_sessions_haven_www;
--create or replace table GA_SESSIONS_HAVEN_EXPERIENCE_ADMIN_TOOL like ga_sessions_haven_www;
--create or replace table GA_SESSIONS_HAVEN_NEWSROOM like ga_sessions_haven_www;

--INSERT INTO ga_sessions_careers ( visitorId, visitNumber, visitId, visitStartTime, date, totals, trafficSource, device, geoNetwork, customDimensions, hits, fullVisitorId, userId, clientId, channelGrouping, socialEngagementType)
--SELECT "visitorId", "visitNumber", "visitId", "visitStartTime", "date", "totals", "trafficSource", "device", "geoNetwork", "customDimensions", "hits", "fullVisitorId", "userId", "clientId", "channelGrouping", "socialEngagementType" from haven_raw.google_integration.ga_sessions_20200502;

--truncate table ga_sessions_careers;

use role dba;

use schema haven_store.align_alytics;

show views;

select view_definition from information_schema.views
where table_schema = 'ALIGN_ALYTICS';

show grants to role haven_data_transform_narayanavelaga;
show grants to role haven_data_transform;

use role haven_data_transform;
use role _haven_store__align_alytics__owner;