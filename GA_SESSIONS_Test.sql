use role bourne_accountadmin;

select * from snowflake.account_usage.query_history
where role_name = 'HAVEN_BATCH_DATALOAD'
and query_text like '%AVRO%';

use role haven_batch_dataload;
use warehouse bourne_batch_dataload_xsmall;

SELECT export_date, count(*) 
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SMARTLY_CREATIVE
GROUP BY 1 ORDER BY 1;

use role dba;

SELECT ADVERTISERID, ADVERTISERNAME, PUBLISHERID, PENDINGCOMM, CONFIRMEDNO, CLICKS, PENDINGNO, PENDINGVALUE, PUBLISHERNAME, REGION, IMPRESSIONS, CONFIRMEDVALUE, CONFIRMEDCOMM, BONUSNO, BONUSVALUE, BONUSCOMM, TOTALNO, TOTALVALUE, TOTALCOMM, DECLINEDNO, DECLINEDVALUE, DECLINEDCOMM, DATE
FROM HAVEN_BASE.GOOGLE_INTEGRATION.AWIN_PUBLISHER
LIMIT 100;

SELECT EXPORT_DATE, IMPRESSIONS, AVG_POSITION, DEVICE, END_DATE, QUERY, START_DATE, CLICKS
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES__HAVEN
limit 100;

SELECT EXPORT_DATE, DEVICE, CLICKS, IMPRESSIONS, START_DATE, END_DATE, PAGE, QUERY, AVG_POSITION
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES_BY_PAGE__HAVEN
limit 100;

SELECT VISIBILITY_IMPACT_DESKTOP, VISIBILITY_IMPACT_MOBILE, GROUP_NAME, REVENUE_VALUE, VISITS, BOUNCES, CONVERSIONS, CONVERSIONS_VALUE, GOALS, GOALS_VALUE, CONVERSIONS_GOALS, CONVERSIONS_GOALS_VALUE, EST_ADDITIONAL_VISITS, EST_ADDITIONAL_REVENUE, EST_ADWORDS_COST, TOTAL_RESULTS, DATE_EXPORT, DATE, SITE_ID, KEYWORD_ID, DATE_ADDED, LANDING_PAGE, LANDING_PAGE_MOBILE, TOP_10_DIFFICULTY, KEYWORD, AVERAGE_SEARCH_VOLUME, AVERAGE_CPC, YOY, "POSITION", POSITION_TREND, POSITION_MOBILE, POSITION_TREND_MOBILE
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_KEYWORDS
limit 100;

SELECT DATE_EXPORT, DATE, SITE_ID, POSITION_MOBILE, "POSITION", KEYWORD_ID, KEYWORD_NAME
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_RANK
limit 100;

select date, count(*) 
from HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_RANK
group by 1 order by 1;


select date, count(*) 
from HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_KEYWORDS
group by 1 order by 1;


SELECT ACCOUNT_NAME, IMPRESSIONS, CREATIVE_PREVIEW_800X800, LANDING_PAGE, CREATIVE_TYPE, CREATIVE_NAME, HEADLINE, BODY, EXPORT_DATE, ACCOUNT_ID, AD_ID, CREATIVE_ID, CALL_TO_ACTION_TYPE, CREATIVE_PREVIEW
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SMARTLY_CREATIVE
limit 100;

use schema haven_raw.bigquery;

select session_date, count(*)
from ga_sessions
group by 1 order by 1;


use schema google_integration;

--drop table ga_sessions_haven_www;

use role haven_batch_dataload;

--create or replace table ga_sessions_haven_www like bigquery.ga_sessions;

create table ga_sessions_careers like bigquery.ga_sessions_;
create table GA_SESSIONS_HAVEN_OWNERS like bigquery.ga_sessions;
create table GA_SESSIONS_HAVEN_WWW_ROLLUP like bigquery.ga_sessions;
create table GA_SESSIONS_CARAVAN_SALES like bigquery.ga_sessions;
create table GA_SESSIONS_HAVEN_WWW_DESKTOP like bigquery.ga_sessions;
create table GA_SESSIONS_HAVEN_WWW_MOBILE like bigquery.ga_sessions;
create table GA_SESSIONS_HAVEN_GUEST_APP like bigquery.ga_sessions;
create table GA_SESSIONS_HAVEN_TEAM_APP like bigquery.ga_sessions;
create table GA_SESSIONS_HAVEN_EXPERIENCE_ADMIN_TOOL like bigquery.ga_sessions;
create table GA_SESSIONS_HAVEN_NEWSROOM like bigquery.ga_sessions;

ls @haven_raw.bigquery.gcs_bigquery_integration_stage/ga_sessions_;

select session_totals from bigquery.ga_sessions limit 5;

create or replace table ga_sessions_20180125 using template ( select array_agg(object_construct(*)) from table( infer_schema(location=>'@haven_raw.bigquery.gcs_bigquery_integration_stage/ga_sessions_20180125/20180125', file_format=>'haven_raw.bigquery.gcs_avro_integration_format')));

desc table ga_sessions_20180125;

drop table ga_sessions_20180125;



INSERT INTO ga_sessions_haven_www ( visitorId, visitNumber, visitId, visitStartTime, date, totals, trafficSource, device, geoNetwork, customDimensions, hits, fullVisitorId, userId, channelGrouping, socialEngagementType)
SELECT "visitorId", "visitNumber", "visitId", "visitStartTime", "date", "totals", "trafficSource", "device", "geoNetwork", "customDimensions", "hits", "fullVisitorId", "userId", "channelGrouping", "socialEngagementType" from haven_raw.google_integration.ga_sessions_20180126;

use role dba;
use role securityadmin;
grant role warner_cdc_dataload to role dba;


use role warner_cdc_dataload;

use role dba;

use role securityadmin;

grant role haven_stitch_integration to role dba;

use role dba;

use role haven_stitch_integration;
use schema haven_raw.facebook_holiday_sales;

use role securityadmin;

grant role _haven_raw__mariner_swap__creator to role haven_cdc_dataload;
grant role _haven_raw__align_alytics__creator to role haven_batch_dataload;

use role haven_dbt_transform;


drop table HAVEN_STORE.RETAIL.FCT_RETAIL_SALE;
drop table HAVEN_STORE.RETAIL.FCT_RETAIL_SALE_PAYMENT_METHOD;

use role haven_data_transform;

