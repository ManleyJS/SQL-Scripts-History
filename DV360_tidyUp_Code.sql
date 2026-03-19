USE ROLE haven_batch_dataload;
USE WAREHOUSE bourne_batch_dataload_xsmall;
USE SCHEMA haven_raw.google_integration;

SHOW TABLES LIKE 'DV%';
SELECT count(*) FROM DV360_STANDARD_DAILY_stage;


DROP Table HAVEN_RAW.GOOGLE_INTEGRATION.DV360_standard_daily_STAGE;

call load_avro_data_file('DV360_unique_reach_monthly', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'DV360_Tables/unique_reach_monthly/2023-07-11/');
create table HAVEN_RAW.GOOGLE_INTEGRATION.DV360_unique_reach_monthly ( EXPORT_DATE, EXPORT_TIMESTAMP, ADVERTISER_ID, ADVERTISER, COUNTRY_CODE, AGE, GENDER, MONTH, CLICKS, IMPRESSIONS, AUDIENCE_VIEWABLE_IMPRESSIONS, UNIQUE_REACH_IMPRESSION_REACH, UNIQUE_REACH_VIEWABLE_IMPRESSION_REACH ) as select DATE("export_date") AS "export_date", DATE("export_timestamp") AS "export_timestamp", "advertiser_id", "advertiser", "country_code", "age", "gender", "month", "clicks", "impressions", "audience_viewable_impressions", "unique_reach_impression_reach", "unique_reach_viewable_impression_reach" from HAVEN_RAW.GOOGLE_INTEGRATION.DV360_unique_reach_monthly_stage order by "export_date" ASC;
DROP Table HAVEN_RAW.GOOGLE_INTEGRATION.DV360_unique_reach_monthly_STAGE;


call load_avro_data_file('DV360_unique_reach_weekly', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'DV360_Tables/unique_reach_weekly/2023-07-11/');
create table HAVEN_RAW.GOOGLE_INTEGRATION.DV360_unique_reach_weekly ( START_DATE, STOP_DATE, EXPORT_DATE, EXPORT_TIMESTAMP, ADVERTISER_ID, ADVERTISER, COUNTRY_CODE, AGE, GENDER, CLICKS, IMPRESSIONS, AUDIENCE_VIEWABLE_IMPRESSIONS, UNIQUE_REACH_IMPRESSION_REACH, UNIQUE_REACH_VIEWABLE_IMPRESSION_REACH ) as select DATE("start_date") AS "start_date", DATE("stop_date") AS "stop_date", DATE("export_date") AS "export_date", DATE("export_timestamp") AS "export_timestamp", "advertiser_id", "advertiser", "country_code", "age", "gender", "clicks", "impressions", "audience_viewable_impressions", "unique_reach_impression_reach", "unique_reach_viewable_impression_reach" from HAVEN_RAW.GOOGLE_INTEGRATION.DV360_unique_reach_weekly_stage order by "export_date" ASC;
DROP Table HAVEN_RAW.GOOGLE_INTEGRATION.DV360_unique_reach_weekly_STAGE;

call load_avro_data_file('DV360_youtube_daily', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'DV360_Tables/youtube_daily/2023-07-11/');
create table HAVEN_RAW.GOOGLE_INTEGRATION.DV360_youtube_daily ( EXPORT_DATE, ADVERTISER_ID, ADVERTISER, ADVERTISER_CURRENCY, TRUEVIEW_AD_GROUP, YOUTUBE_AD_GROUP_ID, DATE, INSERTION_ORDER, INSERTION_ORDER_ID, LINE_ITEM, LINE_ITEM_TYPE, LINE_ITEM_ID, TRUEVIEW_AD, TRUEVIEW_AD_ID, IMPRESSIONS, YOUTUBE_VIEWS, MEDIA_COST_ADVERTISER_CURRENCY, CLICKS, RICH_MEDIA_VIDEO_FIRST_QUARTILE_COMPLETES, RICH_MEDIA_VIDEO_MIDPOINTS, RICH_MEDIA_VIDEO_THIRD_QUARTILE_COMPLETES, RICH_MEDIA_VIDEO_COMPLETIONS, TOTAL_MEDIA_COST_ADVERTISER_CURRENCY, WATCH_TIME, VIEW_RATE, REVENUE_ADVERTISER_CURRENCY ) as select DATE("export_date") AS "export_date", "advertiser_id", "advertiser", "advertiser_currency", "trueview_ad_group", "youtube_ad_group_id", DATE("date") AS "date", "insertion_order", "insertion_order_id", "line_item", "line_item_type", "line_item_id", "trueview_ad", "trueview_ad_id", "impressions", "youtube_views", "media_cost_advertiser_currency", "clicks", "rich_media_video_first_quartile_completes", "rich_media_video_midpoints", "rich_media_video_third_quartile_completes", "rich_media_video_completions", "total_media_cost_advertiser_currency", "watch_time", "view_rate", "revenue_advertiser_currency" from HAVEN_RAW.GOOGLE_INTEGRATION.DV360_youtube_daily_stage order by "date" ASC;
DROP Table HAVEN_RAW.GOOGLE_INTEGRATION.DV360_youtube_daily_STAGE;

