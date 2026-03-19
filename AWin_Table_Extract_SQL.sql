EXPORT DATA OPTIONS (uri = 'gs://gcs-snowflake-integration/Awin_Tables/publister/publisher_*', format='AVRO', compression='SNAPPY', overwrite=true) 
AS (SELECT advertiserId, advertiserName, publisherId, publisherName, region, impressions, clicks, pendingNo, pendingValue, pendingComm, confirmedNo, confirmedValue, confirmedComm, bonusNo, bonusValue, bonusComm, totalNo, totalValue, totalComm, declinedNo, declinedValue, declinedComm, `date` as DATE
FROM `digital-trading-1274`.Awin_Tables.publisher);

EXPORT DATA OPTIONS (uri = 'gs://gcs-snowflake-integration/Awin_Tables/transaction/transaction_*', format='AVRO', compression='SNAPPY', overwrite=true) 
AS (
SELECT `date` as DATE, id, url, advertiser_id, publisher_id, site_name, click_device, transaction_device, customer_country, commission_amount, sales_amount, click_date_str, transaction_date_str, click_date, transaction_date, order_ref, commission_group_id, commission_group_code, commission_group_name, network_fee_amount
FROM `digital-trading-1274`.Awin_Tables.`transaction`);


EXPORT DATA OPTIONS (uri = 'gs://gcs-snowflake-integration/Search_console_Tables/queries__haven/queries_haven_*', format='AVRO', compression='SNAPPY', overwrite=true) 
AS (
SELECT start_date, end_date, device, query, clicks, impressions, avg_position, export_date
FROM `digital-trading-1274`.Search_Console_Tables.queries__haven);

EXPORT DATA OPTIONS (uri = 'gs://gcs-snowflake-integration/Search_console_Tables/queries_by_page__haven/queries_by_page__haven_*', format='AVRO', compression='SNAPPY', overwrite=true) 
AS (
SELECT start_date, end_date, device, query, page, clicks, impressions, avg_position, export_date
FROM `digital-trading-1274`.Search_Console_Tables.queries_by_page__haven);


EXPORT DATA OPTIONS (uri = 'gs://gcs-snowflake-integration/Smartly_Tables/creative/creative_*', format='AVRO', compression='SNAPPY', overwrite=true) 
AS (
SELECT export_date, account_id, account_name, ad_id, creative_id, creative_type, creative_name, headline, body, call_to_action_type, creative_preview, creative_preview_800x800, landing_page, Impressions
FROM `digital-trading-1274`.Smartly_Tables.creative);

EXPORT DATA OPTIONS (uri = 'gs://gcs-snowflake-integration/SEOmonitor_Tables/keywords/keywords_*', format='AVRO', compression='SNAPPY', overwrite=true) 
AS (
SELECT date_export, `date`, site_id, keyword_id, visits, bounces, conversions, conversions_value, goals, goals_value, conversions_goals, conversions_goals_value, `position`, position_trend, position_mobile, position_trend_mobile, visibility_impact_desktop, visibility_impact_mobile, group_name, revenue_value, keyword, average_search_volume, average_cpc, yoy, date_added, landing_page, landing_page_mobile, top_10_difficulty, est_additional_visits, est_additional_revenue, est_adwords_cost, total_results
FROM `digital-trading-1274`.SEOmonitor_Tables.keywords);

EXPORT DATA OPTIONS (uri = 'gs://gcs-snowflake-integration/SEOmonitor_Tables/rank/rank_*', format='AVRO', compression='SNAPPY', overwrite=true) 
AS (
SELECT date_export, `date`, site_id, keyword_id, keyword_name, `position`, position_mobile
FROM `digital-trading-1274`.SEOmonitor_Tables.`rank`);

