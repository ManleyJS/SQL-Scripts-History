use role dba;

use database haven_data_science_dev;

show schemas;
use schema haven_data_science_dev.data_science;

show stages;


grant ownership on stage haven_data_science_dev.data_science.FOOTFALL_TRAIN_STAGE to role haven_data_science_dev revoke current grants;
grant ownership on stage haven_data_science_dev.data_science.MY_STAGE to role haven_data_science_dev revoke current grants;
grant ownership on stage haven_data_science_dev.data_science.REV_FB_TRAIN_STAGE to role haven_data_science_dev revoke current grants;
grant ownership on stage haven_data_science_dev.data_science."V4PZ107SCAV7ARXA (Stage)"  to role haven_data_science_dev revoke current grants;

-- ownership of tables and views

-- tables first

use role dba;

select concat('grant ownership on table haven_data_science_dev.data_science.', table_name, ' to role haven_data_science_dev revoke current grants;')
from information_schema.tables
where table_schema = 'DATA_SCIENCE'
and table_type = 'BASE TABLE';

grant ownership on table haven_data_science_dev.data_science.BACKUP_PREDICTION_RESULTS to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.BOOKINGS_TRAINING_SET_V2 to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.DAILY_RETAIL_PER_SERVICING_VENUE to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.DAILY_RETAIL_PER_SERVICING_VENUE_V2 to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.FNB_RETAIL_PREDICTION_HEAD to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.FNB_RETAIL_PREDICTION_HEAD_PUBLISHED to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.FNB_RETAIL_PREDICTION_RESULTS to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.FNB_RETAIL_PREDICTION_RESULTS_PUBLISHED to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.FOOTFALL_PREDICTION_HEAD to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.FOOTFALL_PREDICTION_HEAD_LIVE to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.FOOTFALL_PREDICTION_RESULTS_PUBLISHED to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.OWNER_RISK_SCORES to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.OWNER_STATUS_STATIC to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.PREDICTION_HEAD to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.PREDICTION_RESULTS to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.TRAINING_SET_BASE_DAILY_RETAIL_NIGHTS_GARY_VERSION to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.TRAINING_SET_BASE_DAILY_RETAIL_NIGHTS to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.TRAINING_SET_BASE_DAILY_RETAIL_NIGHTS_V3 to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.footfall_prediction_head_published to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.HOLIDAYS to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.SAM_ZONAL_VENUE_MAPPING to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.VENUE_MAPPING to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.footfall_prediction_head_published to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.FOOTFALL_PREDICTION_HEAD_PUBLISHED to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.FOOTFALL_PREDICTION_RESULTS to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.FOOTFALL_PREDICTION_RESULTS_LIVE to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.SCHOOLBREAKS_ACROSS_REGIONS to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.TRAINING_SET_BASE_RETAIL_DAILY_NIGHTS to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.VENUE_MAPPING_GARY_VERSION to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.CALENDAR_TABLE to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.TMP_REVENUE_SNAPSHOT to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science.TRAINING_SET_BASE_DAILY_RETAIL_NIGHTS_V2 to role haven_data_science_dev revoke current grants;

show tables;

grant ownership on table haven_data_science_dev.data_science."haven_data_engineering.data_science.footfall_prediction_head_published"  to role haven_data_science_dev revoke current grants;
grant ownership on table haven_data_science_dev.data_science."haven_data_engineering.data_science.haven_data_engineering.data_science.footfall_prediction_head_published" to role haven_data_science_dev revoke current grants;

-- views

select concat('grant ownership on view haven_data_science_dev.data_science.', table_name, ' to role haven_data_science_dev revoke current grants;')
from information_schema.tables
where table_schema = 'DATA_SCIENCE'
and table_type = 'VIEW';


grant ownership on view haven_data_science_dev.data_science.ARRIVAL_BY_LEADING_WEEKS_PADDED to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.ARRIVAL_BY_LEADING_WEEKS_PADDED_V2 to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.ARRIVAL_DATES_SCHOOL_BREAKS_RELATION to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.ARRIVAL_DATE_STATS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.ARRIVAL_DATE_STATS_V2 to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.BOOKING_LEAD_TIME to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.BOOKING_LEAD_TIME__ARRIVALS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.CALENDAR_LABELLED_WITH_HOLIDAYS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_FOOTFALL_PER_PARK to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_FOOTFALL_PER_PARK_HOLIDAY_MAKERS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_FOOTFALL_PER_PARK_PRIVATE_LETS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_PERIODS_HOLIDAYS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_TOTAL_NIGHTS_BY_PARK to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_TOTAL_NIGHTS_BY_PARK_FUTURE_VALUES to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_TOTAL_NIGHTS_BY_PARK_TRAINING_SET to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_TOTAL_NIGHTS_BY_PARK_UNPIVOT to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_WEATHER_ON_PARKS_V3_EXT to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DATE_FEATURES to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DIM_VENUES_SAM_ZONAL to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DS_CHURN_STATISTICS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.FNB_RETAIL_PREDICTION_HEAD_CALCULATED to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.FNB_RETAIL_PREDICTION_HEAD_CALCULATED_PUBLISHED to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.FOOTFALL_PREDICTION_HEAD_CALCULATED to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.FOOTFALL_PREDICTION_HEAD_CALCULATED_PUBLISHED to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.INVESTIGATE_ARRIVAL_DATE_STATS__ARRIVALS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.INVESTIGATE_BOOKING_LEAD_TIME__ARRIVALS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.OWNER_EVENT_ACTIVITY to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.OWNER_STATUS_STATIC_ANALYSIS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.OWNER_STATUS_TIME_SERIES_ANALYSIS_ONLY_PRIVATE_SALES to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.ARRIVAL_DATE_STATS__ARRIVALS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_FOOTFALL_PER_PARK_OWNERS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_WEATHER_ON_PARKS_V2_EXT to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.MY_VIEW to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_RETAIL to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_ROSTER_WITH_ZONAL_VENUES to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_TOTAL_NIGHTS_BY_PARK_PIVOT to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.INVESTIGATE_BOOKINGS_NOT_IN_ARRIVALS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.INVESTIGATE_BOOKING_LEAD_TIME__HOLIDAYBOOKINGS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.INVESTIGATE_FCTBOOKINGS_NOT_IN_ARRIVALS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.OWNER_EXCLUSIVE_EVENT_LIST to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.OWNER_STATUS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.TRAINING_SET_DAILY_RETAIL_NIGHTS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.UK_CPI_MAP to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.BANK_HOLIDAYS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.EPOS_PARK_VENUE_MAP to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.MONTHLY_OWNER_STATUS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.OWNER_AMPLITUDE_USAGE to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.OWNER_AMPLITUDE_USAGE_SESSION_AGG to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.OWNER_STATUS_LONG to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.SUBSCRIPTION_HISTORY_1995_2013 to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_WEATHER_ON_PARKS_V3 to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.INVESTIGATE_ARRIVAL_DATE_STATS__HOLIDAYBOOKINGS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.OWNER_STATUS_TIME_SERIES_ANALYSIS_LESS_PRIVATE_SALES to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.SUBSCRIPTION_HISTORY_1995 to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.SUBSCRIPTION_HISTORY_2020 to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.SUBSCRIPTION_HISTORY_ALL_DATA to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.SUBSCRIPTION_HISTORY_PRE_2013 to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.SUBSCRIPTION_HISTORY_V2 to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.TRAINING_SET_DAILY_RETAIL_NIGHTS_V2 to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.V_DAILY_RETAIL_PER_SERVICING_VENUE to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.V_DAILY_RETAIL_PER_SERVICING_VENUE_UNPIVOT to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_WEATHER_ON_PARKS to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.PREDICTION_HEAD_CALCULATED to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.SUBSCRIPTION_HISTORY_2013 to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.SUBSCRIPTION_HISTORY_2013_AND_LATER to role haven_data_science_dev revoke current grants;
grant ownership on view haven_data_science_dev.data_science.DAILY_WEATHER_ON_PARKS_V2 to role haven_data_science_dev revoke current grants;


use role haven_data_science_dev;

-- production database

use role sysadmin;

use database haven_data_science;

show schemas;

grant ownership on schema DATA_SCIENCE to role haven_schema_setup revoke current grants;

use schema haven_data_science.data_science;

show stages;


grant ownership on stage haven_data_science.data_science.FOOTFALL_TRAIN_STAGE to role haven_data_science revoke current grants;
grant ownership on stage haven_data_science.data_science.MY_STAGE to role haven_data_science revoke current grants;
grant ownership on stage haven_data_science.data_science.REV_FB_TRAIN_STAGE to role haven_data_science revoke current grants;
grant ownership on stage haven_data_science.data_science."V4PZ107SCAV7ARXA (Stage)"  to role haven_data_science revoke current grants;

-- ownership of tables and views

-- tables first

use role dba;

select concat('grant ownership on table haven_data_science.data_science.', table_name, ' to role haven_data_science revoke current grants;')
from information_schema.tables
where table_schema = 'DATA_SCIENCE'
and table_type = 'BASE TABLE';

grant ownership on table haven_data_science.data_science.BACKUP_PREDICTION_RESULTS to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.BOOKINGS_TRAINING_SET_V2 to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.DAILY_RETAIL_PER_SERVICING_VENUE to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.DAILY_RETAIL_PER_SERVICING_VENUE_V2 to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.FNB_RETAIL_PREDICTION_HEAD to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.FNB_RETAIL_PREDICTION_HEAD_PUBLISHED to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.FNB_RETAIL_PREDICTION_RESULTS to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.FNB_RETAIL_PREDICTION_RESULTS_PUBLISHED to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.FOOTFALL_PREDICTION_HEAD to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.FOOTFALL_PREDICTION_HEAD_LIVE to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.FOOTFALL_PREDICTION_RESULTS_PUBLISHED to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.OWNER_RISK_SCORES to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.OWNER_STATUS_STATIC to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.PREDICTION_HEAD to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.PREDICTION_RESULTS to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.TRAINING_SET_BASE_DAILY_RETAIL_NIGHTS_GARY_VERSION to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.TRAINING_SET_BASE_DAILY_RETAIL_NIGHTS to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.TRAINING_SET_BASE_DAILY_RETAIL_NIGHTS_V3 to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.footfall_prediction_head_published to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.HOLIDAYS to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.SAM_ZONAL_VENUE_MAPPING to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.VENUE_MAPPING to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.footfall_prediction_head_published to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.FOOTFALL_PREDICTION_HEAD_PUBLISHED to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.FOOTFALL_PREDICTION_RESULTS to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.FOOTFALL_PREDICTION_RESULTS_LIVE to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.SCHOOLBREAKS_ACROSS_REGIONS to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.TRAINING_SET_BASE_RETAIL_DAILY_NIGHTS to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.VENUE_MAPPING_GARY_VERSION to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.CALENDAR_TABLE to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.TMP_REVENUE_SNAPSHOT to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science.TRAINING_SET_BASE_DAILY_RETAIL_NIGHTS_V2 to role haven_data_science revoke current grants;

show tables;

grant ownership on table haven_data_science.data_science."haven_data_engineering.data_science.footfall_prediction_head_published"  to role haven_data_science revoke current grants;
grant ownership on table haven_data_science.data_science."haven_data_engineering.data_science.haven_data_engineering.data_science.footfall_prediction_head_published" to role haven_data_science revoke current grants;

-- views

select concat('grant ownership on view haven_data_science.data_science.', table_name, ' to role haven_data_science revoke current grants;')
from information_schema.tables
where table_schema = 'DATA_SCIENCE'
and table_type = 'VIEW';


grant ownership on view haven_data_science.data_science.ARRIVAL_BY_LEADING_WEEKS_PADDED to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.ARRIVAL_BY_LEADING_WEEKS_PADDED_V2 to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.ARRIVAL_DATES_SCHOOL_BREAKS_RELATION to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.ARRIVAL_DATE_STATS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.ARRIVAL_DATE_STATS_V2 to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.BOOKING_LEAD_TIME to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.BOOKING_LEAD_TIME__ARRIVALS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.CALENDAR_LABELLED_WITH_HOLIDAYS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_FOOTFALL_PER_PARK to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_FOOTFALL_PER_PARK_HOLIDAY_MAKERS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_FOOTFALL_PER_PARK_PRIVATE_LETS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_PERIODS_HOLIDAYS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_TOTAL_NIGHTS_BY_PARK to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_TOTAL_NIGHTS_BY_PARK_FUTURE_VALUES to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_TOTAL_NIGHTS_BY_PARK_TRAINING_SET to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_TOTAL_NIGHTS_BY_PARK_UNPIVOT to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_WEATHER_ON_PARKS_V3_EXT to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DATE_FEATURES to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DIM_VENUES_SAM_ZONAL to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DS_CHURN_STATISTICS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.FNB_RETAIL_PREDICTION_HEAD_CALCULATED to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.FNB_RETAIL_PREDICTION_HEAD_CALCULATED_PUBLISHED to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.FOOTFALL_PREDICTION_HEAD_CALCULATED to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.FOOTFALL_PREDICTION_HEAD_CALCULATED_PUBLISHED to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.INVESTIGATE_ARRIVAL_DATE_STATS__ARRIVALS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.INVESTIGATE_BOOKING_LEAD_TIME__ARRIVALS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.OWNER_EVENT_ACTIVITY to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.OWNER_STATUS_STATIC_ANALYSIS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.OWNER_STATUS_TIME_SERIES_ANALYSIS_ONLY_PRIVATE_SALES to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.ARRIVAL_DATE_STATS__ARRIVALS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_FOOTFALL_PER_PARK_OWNERS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_WEATHER_ON_PARKS_V2_EXT to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.MY_VIEW to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_RETAIL to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_ROSTER_WITH_ZONAL_VENUES to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_TOTAL_NIGHTS_BY_PARK_PIVOT to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.INVESTIGATE_BOOKINGS_NOT_IN_ARRIVALS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.INVESTIGATE_BOOKING_LEAD_TIME__HOLIDAYBOOKINGS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.INVESTIGATE_FCTBOOKINGS_NOT_IN_ARRIVALS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.OWNER_EXCLUSIVE_EVENT_LIST to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.OWNER_STATUS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.TRAINING_SET_DAILY_RETAIL_NIGHTS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.UK_CPI_MAP to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.BANK_HOLIDAYS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.EPOS_PARK_VENUE_MAP to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.MONTHLY_OWNER_STATUS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.OWNER_AMPLITUDE_USAGE to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.OWNER_AMPLITUDE_USAGE_SESSION_AGG to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.OWNER_STATUS_LONG to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.SUBSCRIPTION_HISTORY_1995_2013 to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_WEATHER_ON_PARKS_V3 to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.INVESTIGATE_ARRIVAL_DATE_STATS__HOLIDAYBOOKINGS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.OWNER_STATUS_TIME_SERIES_ANALYSIS_LESS_PRIVATE_SALES to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.SUBSCRIPTION_HISTORY_1995 to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.SUBSCRIPTION_HISTORY_2020 to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.SUBSCRIPTION_HISTORY_ALL_DATA to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.SUBSCRIPTION_HISTORY_PRE_2013 to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.SUBSCRIPTION_HISTORY_V2 to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.TRAINING_SET_DAILY_RETAIL_NIGHTS_V2 to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.V_DAILY_RETAIL_PER_SERVICING_VENUE to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.V_DAILY_RETAIL_PER_SERVICING_VENUE_UNPIVOT to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_WEATHER_ON_PARKS to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.PREDICTION_HEAD_CALCULATED to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.SUBSCRIPTION_HISTORY_2013 to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.SUBSCRIPTION_HISTORY_2013_AND_LATER to role haven_data_science revoke current grants;
grant ownership on view haven_data_science.data_science.DAILY_WEATHER_ON_PARKS_V2 to role haven_data_science revoke current grants;

use role haven_data_science;
use role haven_data_science_dev;
use role haven_rota_scheduling;

show compute pools;

use role dba;

use schema haven_data_science_dev.data_science;

show tables;

show views;

show schemas;

use role haven_data_science_dev;

show tables;

create table deleteme (cola varchar);