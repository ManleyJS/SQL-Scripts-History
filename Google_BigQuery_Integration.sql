use database haven_raw;
use schema bigquery;
use warehouse bourne_batch_dataload_xsmall;

use role haven_batch_dataload;

insert into haven_raw.bigquery.ga_sessions
(GEONETWORK, SESSION_TOTALS, VISITNUMBER, CHANNELGROUPING, VISITORID, PRIVACYINFO, CLIENTID, VISITID, CUSTOMDIMENSIONS, USERID, DEVICE, FULLVISITORID, VISITSTARTTIME, SESSION_DATE, SOCIALENGAGEMENTTYPE, SESSION_HITS, TRAFFICSOURCE )
SELECT "geoNetwork", "totals", "visitNumber", "channelGrouping", "visitorId", "privacyInfo", "clientId", "visitId", "customDimensions", "userId", "device", "fullVisitorId", "visitStartTime", "date", "socialEngagementType", "hits", "trafficSource"
FROM HAVEN_RAW.BIGQUERY.GA_SESSIONS_stage
order by "date";

-- HAVEN_RAW.BIGQUERY.STAGE_01A_SESSIONS_BY_DATE_WITH_FLAGS definition

create or replace TABLE HAVEN_RAW.BIGQUERY.SESSIONS_BY_DATE_WITH_FLAGS (
	newVisits NUMBER(38,0),
	isTrueDirect BOOLEAN,
	referralPath VARCHAR(16777216),
	source VARCHAR(16777216),
	medium VARCHAR(16777216),
	campaign VARCHAR(16777216),
	adContent VARCHAR(16777216),
	session_date VARCHAR(16777216),
	fullVisitorId VARCHAR(16777216),
	visitId NUMBER(38,0),
	visitNumber NUMBER(38,0),
	visitStartTime NUMBER(38,0),
	pageviews NUMBER(38,0),
	timeOnSite NUMBER(38,0),
	bounces NUMBER(38,0),
	flag_touring_bookings NUMBER(38,0),
	flag_ownership NUMBER(38,0),
	flag_ownership_search NUMBER(38,0),
	flag_ownership_home_details NUMBER(38,0),
	flag_activities_bookings NUMBER(38,0),
	flag_post_booking NUMBER(38,0),
	flag_touring_search NUMBER(38,0),
	flag_touring_checkout_extras NUMBER(38,0),
	flag_touring_checkout_identity NUMBER(38,0),
	flag_touring_checkout_guest_details NUMBER(38,0),
	flag_touring_checkout_payment_options NUMBER(38,0),
	flag_touring_checkout_payment_details NUMBER(38,0),
	flag_touring_checkout_booking_confirmation NUMBER(38,0),
	flag_discover_food_drink NUMBER(38,0),
	flag_discover NUMBER(38,0),
	flag_support NUMBER(38,0),
	flag_support_arrival_info NUMBER(38,0),
	flag_my_account NUMBER(38,0),
	flag_help_centre NUMBER(38,0),
	flag_about_us NUMBER(38,0),
	flag_covid NUMBER(38,0),
	flag_hols_checkout_extras NUMBER(38,0),
	flag_hols_checkout_identity NUMBER(38,0),
	flag_hols_checkout_guest_details NUMBER(38,0),
	flag_hols_checkout_payment_options NUMBER(38,0),
	flag_hols_checkout_payment_details NUMBER(38,0),
	flag_hols_checkout_booking_confirmation NUMBER(38,0),
	flag_hols_bookings NUMBER(38,0),
	flag_touring_session NUMBER(38,0),
	session_keyword VARCHAR(16777216),
	landing_page VARCHAR(16777216),
	deviceCategory VARCHAR(16777216),
	browser VARCHAR(16777216),
	browserSize VARCHAR(16777216),
	browserVersion VARCHAR(16777216),
	operatingSystem VARCHAR(16777216),
	operatingSystemVersion VARCHAR(16777216),
	country VARCHAR(16777216),
	latitude VARCHAR(16777216),
	longitude VARCHAR(16777216),
	flag_transactional NUMBER(38,0),
	flag_hols_search NUMBER(38,0),
	flag_hols_curated_search NUMBER(38,0)
);


-- HAVEN_RAW.BIGQUERY.STAGE_02_EVENTS_BY_DATE definition

create or replace TABLE HAVEN_RAW.BIGQUERY.EVENTS_BY_DATE (
	event VARCHAR(16777216),
	event_date VARCHAR(16777216),
	fullVisitorId VARCHAR(16777216),
	visitId NUMBER(38,0),
	event_timestamp_raw VARCHAR(16777216),
	duration VARCHAR(16777216),
	arrival_date VARCHAR(16777216),
	weeks_to_arrival VARCHAR(16777216),
	guests_adults VARCHAR(16777216),
	guests_children VARCHAR(16777216),
	cs_filter_bedrooms VARCHAR(16777216),
	cs_filter_manufacturer VARCHAR(16777216),
	cs_list_number_of_results VARCHAR(16777216),
	valid_search_result_views NUMBER(38,0),
	contentGroup_page_referrer VARCHAR(16777216),
	hol_booking_id VARCHAR(16777216),
	Revenue FLOAT,
	cs_visit_date VARCHAR(16777216),
	cs_visit_time VARCHAR(16777216),
	cs_enquiry_id VARCHAR(16777216),
	cs_filter_price VARCHAR(16777216),
	timestamp_readable VARCHAR(16777216),
	pagePath VARCHAR(16777216),
	friendly_page_name VARCHAR(16777216),
	num_results VARCHAR(16777216),
	holiday_type VARCHAR(16777216),
	contentGroup_page_type_subtype VARCHAR(16777216),
	contentGroup_page_full_url VARCHAR(16777216),
	contentGroup_page_friendly_name VARCHAR(16777216),
	contentGroup_page_type VARCHAR(16777216),
	guests_infants VARCHAR(16777216),
	guests_dogs VARCHAR(16777216),
	guests_total VARCHAR(16777216),
	guest_new_repeat VARCHAR(16777216),
	holiday_package VARCHAR(16777216),
	park_country VARCHAR(16777216),
	park_region VARCHAR(16777216),
	park_name VARCHAR(16777216),
	park_code VARCHAR(16777216)
);

-- HAVEN_RAW.BIGQUERY.STAGE_03_HOLIDAY_ECOM definition

create or replace TABLE HAVEN_RAW.BIGQUERY.HOLIDAY_ECOM (
	sort_order VARCHAR(16777216),
	filter_package_type VARCHAR(16777216),
	filter_bedrooms VARCHAR(16777216),
	filter_accom_type VARCHAR(16777216),
	product_list_name VARCHAR(16777216),
	product_list_position NUMBER(38,0),
	product_category VARCHAR(16777216),
	holiday_date VARCHAR(16777216),
	device_category VARCHAR(16777216),
	operating_system VARCHAR(16777216),
	browser VARCHAR(16777216),
	holiday_type VARCHAR(16777216),
	search_park_country VARCHAR(16777216),
	search_weeks_to_arrival VARCHAR(16777216),
	search_num_adults NUMBER(38,0),
	search_num_children NUMBER(38,0),
	search_num_infants NUMBER(38,0),
	search_num_dogs NUMBER(38,0),
	search_num_guests NUMBER(38,0),
	search_num_under_16s NUMBER(38,0),
	product_park_name VARCHAR(16777216),
	product_park_code VARCHAR(16777216),
	product_grade VARCHAR(16777216),
	product_bedrooms VARCHAR(16777216),
	product_sleeps VARCHAR(16777216),
	product_offer_flag VARCHAR(16777216),
	search_year_period VARCHAR(16777216),
	search_arrival_date VARCHAR(16777216),
	search_arrival_month VARCHAR(16777216),
	search_arrival_year VARCHAR(16777216),
	search_arrival_year_flag VARCHAR(16777216),
	search_arrival_day_of_week VARCHAR(16777216),
	search_days_to_arrival VARCHAR(16777216),
	product_pre_discount_price FLOAT,
	product_discount_amount FLOAT,
	product_grade_code VARCHAR(16777216),
	product_package_type VARCHAR(16777216),
	product_impressions NUMBER(38,0),
	product_more_details NUMBER(38,0),
	product_clicks NUMBER(38,0),
	product_name VARCHAR(16777216),
	product_variant VARCHAR(16777216),
	product_id VARCHAR(16777216),
	product_price FLOAT,
	product_price_band VARCHAR(16777216),
	product_park_country VARCHAR(16777216),
	product_park_region VARCHAR(16777216),
	search_park_region VARCHAR(16777216),
	search_park_name VARCHAR(16777216),
	search_park_code VARCHAR(16777216),
	search_duration VARCHAR(16777216),
	search_duration_top VARCHAR(16777216),
	search_party_comp VARCHAR(16777216),
	search_package_id VARCHAR(16777216),
	search_period VARCHAR(16777216)
);

use role sysadmin;
alter warehouse bourne_batch_dataload_xsmall set warehouse_size = 'MEDIUM';

use role haven_batch_dataload;

insert into HAVEN_RAW.BIGQUERY.SESSIONS_BY_DATE_WITH_FLAGS 
(NEWVISITS, ISTRUEDIRECT, REFERRALPATH, "SOURCE", MEDIUM, CAMPAIGN, ADCONTENT, SESSION_DATE, FULLVISITORID, VISITID, VISITNUMBER, VISITSTARTTIME, PAGEVIEWS, TIMEONSITE, BOUNCES, FLAG_TOURING_BOOKINGS, FLAG_OWNERSHIP, FLAG_OWNERSHIP_SEARCH, FLAG_OWNERSHIP_HOME_DETAILS, FLAG_ACTIVITIES_BOOKINGS, FLAG_POST_BOOKING, FLAG_TOURING_SEARCH, FLAG_TOURING_CHECKOUT_EXTRAS, FLAG_TOURING_CHECKOUT_IDENTITY, FLAG_TOURING_CHECKOUT_GUEST_DETAILS, FLAG_TOURING_CHECKOUT_PAYMENT_OPTIONS, FLAG_TOURING_CHECKOUT_PAYMENT_DETAILS, FLAG_TOURING_CHECKOUT_BOOKING_CONFIRMATION, FLAG_DISCOVER_FOOD_DRINK, FLAG_DISCOVER, FLAG_SUPPORT, FLAG_SUPPORT_ARRIVAL_INFO, FLAG_MY_ACCOUNT, FLAG_HELP_CENTRE, FLAG_ABOUT_US, FLAG_COVID, FLAG_HOLS_CHECKOUT_EXTRAS, FLAG_HOLS_CHECKOUT_IDENTITY, FLAG_HOLS_CHECKOUT_GUEST_DETAILS, FLAG_HOLS_CHECKOUT_PAYMENT_OPTIONS, FLAG_HOLS_CHECKOUT_PAYMENT_DETAILS, FLAG_HOLS_CHECKOUT_BOOKING_CONFIRMATION, FLAG_HOLS_BOOKINGS, FLAG_TOURING_SESSION, SESSION_KEYWORD, LANDING_PAGE, DEVICECATEGORY, BROWSER, BROWSERSIZE, BROWSERVERSION, OPERATINGSYSTEM, OPERATINGSYSTEMVERSION, COUNTRY, LATITUDE, LONGITUDE, FLAG_TRANSACTIONAL, FLAG_HOLS_SEARCH, FLAG_HOLS_CURATED_SEARCH)
SELECT "newVisits", "isTrueDirect", "referralPath", "source", "medium", "campaign", "adContent", "date", "fullVisitorId", "visitId", "visitNumber", "visitStartTime", "pageviews", "timeOnSite", "bounces", "flag_touring_bookings", "flag_ownership", "flag_ownership_search", "flag_ownership_home_details", "flag_activities_bookings", "flag_post_booking", "flag_touring_search", "flag_touring_checkout_extras", "flag_touring_checkout_identity", "flag_touring_checkout_guest_details", "flag_touring_checkout_payment_options", "flag_touring_checkout_payment_details", "flag_touring_checkout_booking_confirmation", "flag_discover_food_drink", "flag_discover", "flag_support", "flag_support_arrival_info", "flag_my_account", "flag_help_centre", "flag_about_us", "flag_covid", "flag_hols_checkout_extras", "flag_hols_checkout_identity", "flag_hols_checkout_guest_details", "flag_hols_checkout_payment_options", "flag_hols_checkout_payment_details", "flag_hols_checkout_booking_confirmation", "flag_hols_bookings", "flag_touring_session", "keyword", "landing_page", "deviceCategory", "browser", "browserSize", "browserVersion", "operatingSystem", "operatingSystemVersion", "country", "latitude", "longitude", "flag_transactional", "flag_hols_search", "flag_hols_curated_search"
FROM HAVEN_RAW.BIGQUERY.STAGE_01A_SESSIONS_BY_DATE_WITH_FLAGS
order by "date";

INSERT into HAVEN_RAW.BIGQUERY.EVENTS_BY_DATE 
(EVENT, EVENT_DATE, FULLVISITORID, VISITID, EVENT_TIMESTAMP_RAW, DURATION, ARRIVAL_DATE, WEEKS_TO_ARRIVAL, GUESTS_ADULTS, GUESTS_CHILDREN, CS_FILTER_BEDROOMS, CS_FILTER_MANUFACTURER, CS_LIST_NUMBER_OF_RESULTS, VALID_SEARCH_RESULT_VIEWS, CONTENTGROUP_PAGE_REFERRER, HOL_BOOKING_ID, REVENUE, CS_VISIT_DATE, CS_VISIT_TIME, CS_ENQUIRY_ID, CS_FILTER_PRICE, TIMESTAMP_READABLE, PAGEPATH, FRIENDLY_PAGE_NAME, NUM_RESULTS, HOLIDAY_TYPE, CONTENTGROUP_PAGE_TYPE_SUBTYPE, CONTENTGROUP_PAGE_FULL_URL, CONTENTGROUP_PAGE_FRIENDLY_NAME, CONTENTGROUP_PAGE_TYPE, GUESTS_INFANTS, GUESTS_DOGS, GUESTS_TOTAL, GUEST_NEW_REPEAT, HOLIDAY_PACKAGE, PARK_COUNTRY, PARK_REGION, PARK_NAME, PARK_CODE)
SELECT "event", "date", "fullVisitorId", "visitId", "timestamp_raw", "duration", "arrival_date", "weeks_to_arrival", "guests_adults", "guests_children", "cs_filter_bedrooms", "cs_filter_manufacturer", "cs_list_number_of_results", "valid_search_result_views", "contentGroup_page_referrer", "hol_booking_id", "Revenue", "cs_visit_date", "cs_visit_time", "cs_enquiry_id", "cs_filter_price", "timestamp_readable", "pagePath", "friendly_page_name", "num_results", "holiday_type", "contentGroup_page_type_subtype", "contentGroup_page_full_url", "contentGroup_page_friendly_name", "contentGroup_page_type", "guests_infants", "guests_dogs", "guests_total", "guest_new_repeat", "holiday_package", "park_country", "park_region", "park_name", "park_code"
FROM HAVEN_RAW.BIGQUERY.STAGE_02_EVENTS_BY_DATE
order by "date";

insert into HAVEN_RAW.BIGQUERY.HOLIDAY_ECOM
(SORT_ORDER, FILTER_PACKAGE_TYPE, FILTER_BEDROOMS, FILTER_ACCOM_TYPE, PRODUCT_LIST_NAME, PRODUCT_LIST_POSITION, PRODUCT_CATEGORY, HOLIDAY_DATE, DEVICE_CATEGORY, OPERATING_SYSTEM, BROWSER, HOLIDAY_TYPE, SEARCH_PARK_COUNTRY, SEARCH_WEEKS_TO_ARRIVAL, SEARCH_NUM_ADULTS, SEARCH_NUM_CHILDREN, SEARCH_NUM_INFANTS, SEARCH_NUM_DOGS, SEARCH_NUM_GUESTS, SEARCH_NUM_UNDER_16S, PRODUCT_PARK_NAME, PRODUCT_PARK_CODE, PRODUCT_GRADE, PRODUCT_BEDROOMS, PRODUCT_SLEEPS, PRODUCT_OFFER_FLAG, SEARCH_YEAR_PERIOD, SEARCH_ARRIVAL_DATE, SEARCH_ARRIVAL_MONTH, SEARCH_ARRIVAL_YEAR, SEARCH_ARRIVAL_YEAR_FLAG, SEARCH_ARRIVAL_DAY_OF_WEEK, SEARCH_DAYS_TO_ARRIVAL, PRODUCT_PRE_DISCOUNT_PRICE, PRODUCT_DISCOUNT_AMOUNT, PRODUCT_GRADE_CODE, PRODUCT_PACKAGE_TYPE, PRODUCT_IMPRESSIONS, PRODUCT_MORE_DETAILS, PRODUCT_CLICKS, PRODUCT_NAME, PRODUCT_VARIANT, PRODUCT_ID, PRODUCT_PRICE, PRODUCT_PRICE_BAND, PRODUCT_PARK_COUNTRY, PRODUCT_PARK_REGION, SEARCH_PARK_REGION, SEARCH_PARK_NAME, SEARCH_PARK_CODE, SEARCH_DURATION, SEARCH_DURATION_TOP, SEARCH_PARTY_COMP, SEARCH_PACKAGE_ID, SEARCH_PERIOD)
SELECT "sort_order", "filter_package_type", "filter_bedrooms", "filter_accom_type", "product_list_name", "product_list_position", "product_category", "date", "device_category", "operating_system", "browser", "holiday_type", "search_park_country", "search_weeks_to_arrival", "search_num_adults", "search_num_children", "search_num_infants", "search_num_dogs", "search_num_guests", "search_num_under_16s", "product_park_name", "product_park_code", "product_grade", "product_bedrooms", "product_sleeps", "product_offer_flag", "search_year_period", "search_arrival_date", "search_arrival_month", "search_arrival_year", "search_arrival_year_flag", "search_arrival_day_of_week", "search_days_to_arrival", "product_pre_discount_price", "product_discount_amount", "product_grade_code", "product_package_type", "product_impressions", "product_more_details", "product_clicks", "product_name", "product_variant", "product_id", "product_price", "product_price_band", "product_park_country", "product_park_region", "search_park_region", "search_park_name", "search_park_code", "search_duration", "search_duration_top", "search_party_comp", "search_package_id", "search_period"
FROM HAVEN_RAW.BIGQUERY.STAGE_03_HOLIDAY_ECOM
order by "date";


create or replace TABLE HAVEN_RAW.BIGQUERY.TRANSACTIONS_BY_DATE (
	transactionId VARCHAR(16777216),
	transaction_date VARCHAR(16777216),
	hit_time NUMBER(38,0),
	fullVisitorId VARCHAR(16777216),
	visitId NUMBER(38,0),
	transactionRevenue FLOAT,
	visitStartTime NUMBER(38,0),
	timestamp_raw VARCHAR(16777216),
	business_area VARCHAR(16777216),
	act_time VARCHAR(16777216),
	park_code VARCHAR(16777216),
	park_name VARCHAR(16777216),
	act_name VARCHAR(16777216),
	act_date VARCHAR(16777216),
	friendly_page_name VARCHAR(16777216),
	guest_type VARCHAR(16777216),
	act_category VARCHAR(16777216),
	holiday_package VARCHAR(16777216),
	guests_total VARCHAR(16777216),
	hol_booking_id VARCHAR(16777216),
	duration VARCHAR(16777216),
	arrival_date VARCHAR(16777216),
	guests_dogs VARCHAR(16777216),
	guests_children VARCHAR(16777216),
	guests_infants VARCHAR(16777216),
	guest_new_repeat VARCHAR(16777216),
	guests_adults VARCHAR(16777216)
);

insert into HAVEN_RAW.BIGQUERY.TRANSACTIONS_BY_DATE 
(TRANSACTIONID, TRANSACTION_DATE, HIT_TIME, FULLVISITORID, VISITID, TRANSACTIONREVENUE, VISITSTARTTIME, TIMESTAMP_RAW, BUSINESS_AREA, ACT_TIME, PARK_CODE, PARK_NAME, ACT_NAME, ACT_DATE, FRIENDLY_PAGE_NAME, GUEST_TYPE, ACT_CATEGORY, HOLIDAY_PACKAGE, GUESTS_TOTAL, HOL_BOOKING_ID, DURATION, ARRIVAL_DATE, GUESTS_DOGS, GUESTS_CHILDREN, GUESTS_INFANTS, GUEST_NEW_REPEAT, GUESTS_ADULTS)
SELECT "transactionId", "date", "hit_time", "fullVisitorId", "visitId", "transactionRevenue", "visitStartTime", "timestamp_raw", "business_area", "act_time", "park_code", "park_name", "act_name", "act_date", "friendly_page_name", "guest_type", "act_category", "holiday_package", "guests_total", "hol_booking_id", "duration", "arrival_date", "guests_dogs", "guests_children", "guests_infants", "guest_new_repeat", "guests_adults"
FROM HAVEN_RAW.BIGQUERY.STAGE_04_TRANSACTIONS_BY_DATE
ORDER BY "date";



create or replace TABLE HAVEN_RAW.BIGQUERY.ECOM_ACTION_TYPES (
	product_park_code VARCHAR(16777216),
	fullVisitorId VARCHAR(16777216),
	filter_package_type VARCHAR(16777216),
	transaction_id VARCHAR(16777216),
	filter_accom_type VARCHAR(16777216),
	num_results VARCHAR(16777216),
	results_batch VARCHAR(16777216),
	product_impressions BOOLEAN,
	ecom_action_type VARCHAR(16777216),
	search_num_infants VARCHAR(16777216),
	operating_system VARCHAR(16777216),
	browser VARCHAR(16777216),
	search_num_dogs VARCHAR(16777216),
	search_num_guests VARCHAR(16777216),
	data_layer_event VARCHAR(16777216),
	product_pre_discount_price VARCHAR(16777216),
	product_discount_amount VARCHAR(16777216),
	product_clicks BOOLEAN,
	hol_booking_id VARCHAR(16777216),
	device_category VARCHAR(16777216),
	search_num_under_16s VARCHAR(16777216),
	sort_order VARCHAR(16777216),
	filter_bedrooms VARCHAR(16777216),
	product_arrival_date_string VARCHAR(16777216),
	product_arrival_date VARCHAR(16777216),
	product_id VARCHAR(16777216),
	product_price FLOAT,
	holiday_type VARCHAR(16777216),
	friendly_page_name VARCHAR(16777216),
	search_duration VARCHAR(16777216),
	product_bedrooms VARCHAR(16777216),
	search_num_adults VARCHAR(16777216),
	search_num_children VARCHAR(16777216),
	product_sleeps VARCHAR(16777216),
	product_offer_flag VARCHAR(16777216),
	product_grade_code VARCHAR(16777216),
	product_package_type VARCHAR(16777216),
	product_list_name VARCHAR(16777216),
	visitId NUMBER(38,0),
	action_type_date VARCHAR(16777216),
	timestamp_raw VARCHAR(16777216),
	search_park_name VARCHAR(16777216),
	product_list_position NUMBER(38,0),
	product_variant VARCHAR(16777216),
	search_party_comp VARCHAR(16777216),
	search_package_id VARCHAR(16777216),
	product_duration VARCHAR(16777216),
	product_grade VARCHAR(16777216),
	product_category VARCHAR(16777216),
	product_name VARCHAR(16777216),
	search_park_code VARCHAR(16777216),
	search_arrival_date_string VARCHAR(16777216),
	search_arrival_date VARCHAR(16777216)
);

insert into HAVEN_RAW.BIGQUERY.ECOM_ACTION_TYPES
(PRODUCT_PARK_CODE, FULLVISITORID, FILTER_PACKAGE_TYPE, TRANSACTION_ID, FILTER_ACCOM_TYPE, NUM_RESULTS, RESULTS_BATCH, PRODUCT_IMPRESSIONS, ECOM_ACTION_TYPE, SEARCH_NUM_INFANTS, OPERATING_SYSTEM, BROWSER, SEARCH_NUM_DOGS, SEARCH_NUM_GUESTS, DATA_LAYER_EVENT, PRODUCT_PRE_DISCOUNT_PRICE, PRODUCT_DISCOUNT_AMOUNT, PRODUCT_CLICKS, HOL_BOOKING_ID, DEVICE_CATEGORY, SEARCH_NUM_UNDER_16S, SORT_ORDER, FILTER_BEDROOMS, PRODUCT_ARRIVAL_DATE_STRING, PRODUCT_ARRIVAL_DATE, PRODUCT_ID, PRODUCT_PRICE, HOLIDAY_TYPE, FRIENDLY_PAGE_NAME, SEARCH_DURATION, PRODUCT_BEDROOMS, SEARCH_NUM_ADULTS, SEARCH_NUM_CHILDREN, PRODUCT_SLEEPS, PRODUCT_OFFER_FLAG, PRODUCT_GRADE_CODE, PRODUCT_PACKAGE_TYPE, PRODUCT_LIST_NAME, VISITID, ACTION_TYPE_DATE, TIMESTAMP_RAW, SEARCH_PARK_NAME, PRODUCT_LIST_POSITION, PRODUCT_VARIANT, SEARCH_PARTY_COMP, SEARCH_PACKAGE_ID, PRODUCT_DURATION, PRODUCT_GRADE, PRODUCT_CATEGORY, PRODUCT_NAME, SEARCH_PARK_CODE, SEARCH_ARRIVAL_DATE_STRING, SEARCH_ARRIVAL_DATE)
SELECT "product_park_code", "fullVisitorId", "filter_package_type", "transaction_id", "filter_accom_type", "num_results", "results_batch", "product_impressions", "ecom_action_type", "search_num_infants", "operating_system", "browser", "search_num_dogs", "search_num_guests", "data_layer_event", "product_pre_discount_price", "product_discount_amount", "product_clicks", "hol_booking_id", "device_category", "search_num_under_16s", "sort_order", "filter_bedrooms", "product_arrival_date_string", "product_arrival_date", "product_id", "product_price", "holiday_type", "friendly_page_name", "search_duration", "product_bedrooms", "search_num_adults", "search_num_children", "product_sleeps", "product_offer_flag", "product_grade_code", "product_package_type", "product_list_name", "visitId", "date", "timestamp_raw", "search_park_name", "product_list_position", "product_variant", "search_party_comp", "search_package_id", "product_duration", "product_grade", "product_category", "product_name", "search_park_code", "search_arrival_date_string", "search_arrival_date"
FROM HAVEN_RAW.BIGQUERY.STAGE_11_ECOM_ACTION_TYPES
order by "date";

create or replace TABLE HAVEN_RAW.BIGQUERY.SEARCHES_AND_BOOKINGS_SUMMARY (
	bookings NUMBER(38,0),
	arrival_date VARCHAR(16777216),
	park_code VARCHAR(16777216),
	searches NUMBER(38,0),
	arrival_period VARCHAR(16777216),
	searches_and_bookings_date VARCHAR(16777216),
	holiday_type VARCHAR(16777216)
);

-- HAVEN_RAW.BIGQUERY.STAGE_02_WEEKLY_SUMMARY definition

create or replace TABLE HAVEN_RAW.BIGQUERY.WEEKLY_SUMMARY (
	Arrival_Week VARCHAR(16777216),
	ParkCode VARCHAR(16777216),
	Searches NUMBER(38,0),
	Book_Week VARCHAR(16777216),
	Holiday_Type VARCHAR(16777216),
	Bookings NUMBER(38,0)
);

-- HAVEN_RAW.BIGQUERY.STAGE_03_BOOKING_IDS_BY_CHANNEL definition

create or replace TABLE HAVEN_RAW.BIGQUERY.BOOKING_IDS_BY_CHANNEL (
	booking)id_by_channel_date VARCHAR(16777216),
	channel_level_3 VARCHAR(16777216),
	channel VARCHAR(16777216),
	channel_level_2 VARCHAR(16777216),
	hol_booking_id VARCHAR(16777216),
	revenue FLOAT
);

-- HAVEN_RAW.BIGQUERY.STAGE_05A_PRODUCT_IMPRESSIONS_PERIOD_ONLY_QA definition

create or replace TABLE HAVEN_RAW.BIGQUERY.PRODUCT_IMPRESSIONS_PERIOD_ONLY_QA (
	product_list_name VARCHAR(16777216),
	bookings NUMBER(38,0),
	arrival_period VARCHAR(16777216),
	holiday_type VARCHAR(16777216),
	searches NUMBER(38,0),
	book_week VARCHAR(16777216)
);

-- HAVEN_RAW.BIGQUERY.STAGE_06_PRODUCT_IMPRESSIONS_AND_BOOKINGS_BY_WEEK definition

create or replace TABLE HAVEN_RAW.BIGQUERY.PRODUCT_IMPRESSIONS_AND_BOOKINGS_BY_WEEK (
	book_week VARCHAR(16777216),
	channel VARCHAR(16777216),
	holiday_type VARCHAR(16777216),
	searches NUMBER(38,0),
	arrival_week VARCHAR(16777216),
	product_list_name VARCHAR(16777216),
	bookings NUMBER(38,0),
	park_code VARCHAR(16777216)
);

-- HAVEN_RAW.BIGQUERY.STAGE_07_PRODUCT_IMPRESSIONS_AND_BOOKINGS_BY_PERIOD definition

create or replace TABLE HAVEN_RAW.BIGQUERY.PRODUCT_IMPRESSIONS_AND_BOOKINGS_BY_PERIOD (
	book_week VARCHAR(16777216),
	holiday_type VARCHAR(16777216),
	channel VARCHAR(16777216),
	arrival_period VARCHAR(16777216),
	product_list_name VARCHAR(16777216),
	searches NUMBER(38,0),
	bookings NUMBER(38,0)
);

