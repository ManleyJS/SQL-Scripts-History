USE ROLE haven_batch_dataload;
USE SCHEMA haven_raw.google_integration;
USE WAREHOUSE bourne_batch_dataload_xsmall;

call load_avro_data_file('awin_publisher', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'Awin_Tables/publister/');

SELECT "advertiserId", "advertiserName", "publisherId", "pendingComm", "confirmedNo", "clicks", "pendingNo", "pendingValue", "publisherName", "region", "impressions", "confirmedValue", "confirmedComm", "bonusNo", "bonusValue", "bonusComm", "totalNo", "totalValue", "totalComm", "declinedNo", "declinedValue", "declinedComm", 
date("DATE")
FROM awin_publisher_stage LIMIT 100;

SELECT date("DATE"), count(*) 
FROM awin_publisher_stage
GROUP BY 1 ORDER BY 1;

--create or replace table awin_publisher_stage using template (
--select array_agg(object_construct(*))
--from table(infer_schema(location=>'@haven_raw.google_integration.gcs_snowflake_digital_integration_stage/Awin_Tables/publister/',
--file_format=>'digital_avro_load_format')));


CREATE OR REPLACE TABLE HAVEN_RAW.GOOGLE_INTEGRATION.AWIN_PUBLISHER
(advertiserId, advertiserName, publisherId, pendingComm, confirmedNo, clicks, pendingNo, pendingValue, publisherName, region, impressions, confirmedValue, confirmedComm, bonusNo, bonusValue, bonusComm, totalNo, totalValue, totalComm, declinedNo, declinedValue, declinedComm, DATE )
AS SELECT "advertiserId", "advertiserName", "publisherId", "pendingComm", "confirmedNo", "clicks", "pendingNo", "pendingValue", "publisherName", "region", "impressions", "confirmedValue", "confirmedComm", "bonusNo", "bonusValue", "bonusComm", "totalNo", "totalValue", "totalComm", "declinedNo", "declinedValue", "declinedComm", DATE("DATE") AS DATE
FROM HAVEN_RAW.GOOGLE_INTEGRATION.AWIN_PUBLISHER_STAGE
ORDER BY DATE;

SELECT date, count(*) FROM HAVEN_RAW.GOOGLE_INTEGRATION.AWIN_PUBLISHER
GROUP BY 1 ORDER BY 1;

DROP TABLE HAVEN_RAW.GOOGLE_INTEGRATION.AWIN_PUBLISHER_STAGE;

call load_avro_data_file('awin_transaction', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'Awin_Tables/transaction/');

CREATE OR REPLACE TABLE HAVEN_RAW.GOOGLE_INTEGRATION.AWIN_TRANSACTION
( customer_country, commission_amount, advertiser_id, publisher_id, order_ref, commission_group_id, commission_group_code, click_date, transaction_date, DATE, id, url, sales_amount, click_date_str, transaction_date_str, site_name, click_device, transaction_device, commission_group_name, network_fee_amount )
AS SELECT "customer_country", "commission_amount", "advertiser_id", "publisher_id", "order_ref", "commission_group_id", "commission_group_code", "click_date", "transaction_date", DATE("DATE") AS DATE, "id", "url", "sales_amount", "click_date_str", "transaction_date_str", "site_name", "click_device", "transaction_device", "commission_group_name", "network_fee_amount"
FROM HAVEN_RAW.GOOGLE_INTEGRATION.AWIN_TRANSACTION_STAGE
ORDER BY DATE;

SELECT date, count(*) FROM HAVEN_RAW.GOOGLE_INTEGRATION.AWIN_TRANSACTION
GROUP BY 1 ORDER BY 1;

DROP TABLE HAVEN_RAW.GOOGLE_INTEGRATION.AWIN_TRANSACTION_STAGE;

USE ROLE haven_batch_dataload;
USE SCHEMA haven_raw.google_integration;
USE WAREHOUSE bourne_batch_dataload_xsmall;

call load_avro_data_file('search_console_queries__haven', 
'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 
'Search_console_Tables/queries__haven/');

SELECT date("start_date"), count(*) 
FROM HAVEN_RAW.GOOGLE_INTEGRATION.search_console_queries__haven_stage
GROUP BY 1 ORDER BY 1;

create OR REPLACE table HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES__HAVEN
( export_date, impressions, avg_position, device, end_date, query, start_date, clicks )
AS SELECT "export_date", "impressions", "avg_position", "device", "end_date", "query", date("start_date") AS start_date, "clicks"
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES__HAVEN_STAGE
ORDER BY "start_date" ;

SELECT start_date, count(*) 
FROM HAVEN_RAW.GOOGLE_INTEGRATION.search_console_queries__haven
GROUP BY 1 ORDER BY 1;

call load_avro_data_file('search_console_queries_by_page__haven', 
'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 
'Search_console_Tables/queries_by_page__haven/');

SELECT date("start_date"), count(*) 
FROM HAVEN_RAW.GOOGLE_INTEGRATION.search_console_queries_by_page__haven_stage
GROUP BY 1 ORDER BY 1;

DROP TABLE HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES_BY_PAGE__HAVEN;

create OR REPLACE table HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES_BY_PAGE__HAVEN
( export_date, device, clicks, impressions, start_date, end_date, page, query, avg_position )
AS SELECT "export_date", "device", "clicks", "impressions", date("start_date") AS start_date, "end_date", "page", "query", "avg_position"
FROM HAVEN_RAW.GOOGLE_INTEGRATION.search_console_queries_by_page__haven_stage
ORDER BY "start_date" ;

SELECT date(export_date), count(*) 
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES_BY_PAGE__HAVEN
GROUP BY 1 ORDER BY 1;

SELECT date(EXPORT_DATE), DEVICE, CLICKS, IMPRESSIONS, START_DATE, END_DATE, PAGE, QUERY, AVG_POSITION
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES_BY_PAGE__HAVEN
LIMIT 100;

DROP TABLE HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES_HAVEN;
DROP TABLE HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES__HAVEN_STAGE;
DROP TABLE HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES_BY_PAGE__HAVEN_STAGE;
DROP table HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES_HAVEN_STAGE;

call load_avro_data_file('smartly_creative', 
'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 
'Smartly_Tables/creative/');

DROP TABLE HAVEN_RAW.GOOGLE_INTEGRATION.SMARTLY_CREATIVE;

create OR REPLACE table HAVEN_RAW.GOOGLE_INTEGRATION.SMARTLY_CREATIVE
( account_name, Impressions, creative_preview_800x800, landing_page, 
creative_type, creative_name, headline, body, 
export_date, account_id, ad_id, creative_id, call_to_action_type, creative_preview )
AS SELECT "account_name", "Impressions", "creative_preview_800x800", "landing_page", 
"creative_type", "creative_name", "headline", "body", 
date("export_date") AS export_date, "account_id", "ad_id", "creative_id", "call_to_action_type", "creative_preview"
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SMARTLY_CREATIVE_STAGE;

SELECT date("export_date") AS export_date, count(*) 
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SMARTLY_CREATIVE_STAGE
GROUP BY 1 ORDER BY 1;

SELECT export_date, count(*) 
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SMARTLY_CREATIVE
GROUP BY 1 ORDER BY 1;


SELECT * FROM SMARTLY_CREATIVE LIMIT 100;

call load_avro_data_file('SEOmonitor_keywords', 
'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 
'SEOmonitor_Tables/keywords/');

SELECT date("date"), count(*) 
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_KEYWORDS_STAGE
GROUP BY 1 ORDER BY 1;


call load_avro_data_file('SEOmonitor_Rank', 
'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 
'SEOmonitor_Tables/rank/');

SELECT date("date"), count(*) 
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_RANK_STAGE
GROUP BY 1 ORDER BY 1;

CREATE OR REPLACE TABLE HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_KEYWORDS
( visibility_impact_desktop, visibility_impact_mobile, group_name, revenue_value, 
visits, bounces, conversions, conversions_value, goals, goals_value, conversions_goals, 
conversions_goals_value, est_additional_visits, est_additional_revenue, est_adwords_cost, 
total_results, date_export, date, site_id, keyword_id, date_added, landing_page, landing_page_mobile, top_10_difficulty, keyword, average_search_volume, average_cpc, yoy, position, position_trend, position_mobile, position_trend_mobile )
AS SELECT "visibility_impact_desktop", "visibility_impact_mobile", "group_name", "revenue_value", 
"visits", "bounces", "conversions", "conversions_value", "goals", "goals_value", "conversions_goals", 
"conversions_goals_value", "est_additional_visits", "est_additional_revenue", "est_adwords_cost", 
"total_results", "date_export", DATE("date"), "site_id", "keyword_id", "date_added", "landing_page", "landing_page_mobile", "top_10_difficulty", "keyword", "average_search_volume", "average_cpc", "yoy", "position", "position_trend", "position_mobile", "position_trend_mobile"
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_KEYWORDS_STAGE
ORDER BY "date";

CREATE OR REPLACE TABLE HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_RANK
( date_export, date, site_id, position_mobile, position, keyword_id, keyword_name )
AS SELECT "date_export", date("date"), "site_id", "position_mobile", "position", "keyword_id", "keyword_name"
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_RANK_STAGE
ORDER BY "date";

DROP TABLE HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_KEYWORDS_STAGE;
DROP TABLE HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_RANK_STAGE;

DROP TABLE HAVEN_RAW.GOOGLE_INTEGRATION.SMARTLY_CREATIVE_STAGE ;

USE ROLE dba;


SELECT ADVERTISERID, ADVERTISERNAME, PUBLISHERID, PENDINGCOMM, CONFIRMEDNO, CLICKS, PENDINGNO, PENDINGVALUE, PUBLISHERNAME, REGION, IMPRESSIONS, CONFIRMEDVALUE, CONFIRMEDCOMM, BONUSNO, BONUSVALUE, BONUSCOMM, TOTALNO, TOTALVALUE, TOTALCOMM, DECLINEDNO, DECLINEDVALUE, DECLINEDCOMM, "DATE"
FROM HAVEN_BASE.GOOGLE_INTEGRATION.AWIN_PUBLISHER
LIMIT 100;

SELECT EXPORT_DATE, IMPRESSIONS, AVG_POSITION, DEVICE, END_DATE, QUERY, START_DATE, CLICKS
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES__HAVEN;
SELECT EXPORT_DATE, DEVICE, CLICKS, IMPRESSIONS, START_DATE, END_DATE, PAGE, QUERY, AVG_POSITION
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEARCH_CONSOLE_QUERIES_BY_PAGE__HAVEN;
SELECT VISIBILITY_IMPACT_DESKTOP, VISIBILITY_IMPACT_MOBILE, GROUP_NAME, REVENUE_VALUE, VISITS, BOUNCES, CONVERSIONS, CONVERSIONS_VALUE, GOALS, GOALS_VALUE, CONVERSIONS_GOALS, CONVERSIONS_GOALS_VALUE, EST_ADDITIONAL_VISITS, EST_ADDITIONAL_REVENUE, EST_ADWORDS_COST, TOTAL_RESULTS, DATE_EXPORT, "DATE", SITE_ID, KEYWORD_ID, DATE_ADDED, LANDING_PAGE, LANDING_PAGE_MOBILE, TOP_10_DIFFICULTY, KEYWORD, AVERAGE_SEARCH_VOLUME, AVERAGE_CPC, YOY, "POSITION", POSITION_TREND, POSITION_MOBILE, POSITION_TREND_MOBILE
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_KEYWORDS;
SELECT DATE_EXPORT, "DATE", SITE_ID, POSITION_MOBILE, "POSITION", KEYWORD_ID, KEYWORD_NAME
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SEOMONITOR_RANK;
SELECT ACCOUNT_NAME, IMPRESSIONS, CREATIVE_PREVIEW_800X800, LANDING_PAGE, CREATIVE_TYPE, CREATIVE_NAME, HEADLINE, BODY, EXPORT_DATE, ACCOUNT_ID, AD_ID, CREATIVE_ID, CALL_TO_ACTION_TYPE, CREATIVE_PREVIEW
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SMARTLY_CREATIVE;