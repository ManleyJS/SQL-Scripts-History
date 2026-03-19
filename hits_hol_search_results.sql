use role haven_batch_dataload;
use database haven_raw;
use schema bigquery;
use warehouse bourne_batch_dataload_xsmall;

create TABLE HAVEN_RAW.BIGQUERY.HITS_HOL_SEARCH_RESULTS (
	arrival_date VARCHAR(16777216),
	arrival_month VARCHAR(16777216),
	arrival_year VARCHAR(16777216),
	arrival_year_flag VARCHAR(16777216),
	valid_search_result_views_no_results NUMBER(38,0),
	valid_search_result_views_w_results NUMBER(38,0),
	park_country VARCHAR(16777216),
	park_region VARCHAR(16777216),
	park_name VARCHAR(16777216),
	park_code VARCHAR(16777216),
	duration VARCHAR(16777216),
	total_search_result_views NUMBER(38,0),
	valid_search_result_views NUMBER(38,0),
	invalid_search_result_views NUMBER(38,0),
	HITS_HOL_SEARCH_date VARCHAR(16777216),
	num_results_grouped VARCHAR(16777216),
	holiday_type VARCHAR(16777216),
	arrival_day_of_week VARCHAR(16777216),
	days_to_arrival VARCHAR(16777216),
	weeks_to_arrival VARCHAR(16777216),
	duration_grouped VARCHAR(16777216),
	period VARCHAR(16777216),
	year_period VARCHAR(16777216)
);


insert into HAVEN_RAW.BIGQUERY.HITS_HOL_SEARCH_RESULTS
(ARRIVAL_DATE, ARRIVAL_MONTH, ARRIVAL_YEAR, ARRIVAL_YEAR_FLAG, VALID_SEARCH_RESULT_VIEWS_NO_RESULTS, VALID_SEARCH_RESULT_VIEWS_W_RESULTS, PARK_COUNTRY, PARK_REGION, PARK_NAME, PARK_CODE, DURATION, TOTAL_SEARCH_RESULT_VIEWS, VALID_SEARCH_RESULT_VIEWS, INVALID_SEARCH_RESULT_VIEWS, HITS_HOL_SEARCH_DATE, NUM_RESULTS_GROUPED, HOLIDAY_TYPE, ARRIVAL_DAY_OF_WEEK, DAYS_TO_ARRIVAL, WEEKS_TO_ARRIVAL, DURATION_GROUPED, PERIOD, YEAR_PERIOD)
SELECT "arrival_date", "arrival_month", "arrival_year", "arrival_year_flag", "valid_search_result_views_no_results", "valid_search_result_views_w_results", "park_country", "park_region", "park_name", "park_code", "duration", "total_search_result_views", "valid_search_result_views", "invalid_search_result_views", "date", "num_results_grouped", "holiday_type", "arrival_day_of_week", "days_to_arrival", "weeks_to_arrival", "duration_grouped", "period", "year_period"
FROM HAVEN_RAW.BIGQUERY.STAGE_HITS_HOL_SEARCH_RESULTS
order by "date";
