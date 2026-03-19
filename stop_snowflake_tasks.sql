USE ROLE dba;
SHOW tasks;

ALTER task haven_store.digital.PX0001_DIGITAL_EXTRACT SUSPEND;
ALTER task haven_store.digital.PX0002_WEB_TEST_PRICES SUSPEND;
ALTER task haven_store.digital.PX0013_DIGITAL_EXPERIENCE_ARRIVALS_TASK SUSPEND;
ALTER task haven_store.integration.PX0003_HOTEL_ROOMS_TASK SUSPEND;
ALTER task haven_store.integration.PX0003_PRICING_VARIABLES_TASK  SUSPEND;
ALTER task haven_store.integration.PX0004_GOOGLE_PPC SUSPEND;
ALTER task haven_work.PX0010_DIGITAL_ALLOCATIONS.PX0010_DIGITAL_ALLOCATIONS SUSPEND;
ALTER task haven_raw.activities.PX0009_ACTIVITIES_DELTA SUSPEND;
ALTER task haven_raw.activities.PX0009_DIGITAL_EXTRACT SUSPEND;
ALTER task haven_store.availability.GRADE_PRICE_HISTORY_STREAM_LOADER SUSPEND;
ALTER task haven_store.availability.INVENTORY_AVAILABILITY_HISTORY_STREAM_LOADER SUSPEND;
ALTER task haven_store.digital.PX0013_DIGITAL_EXPERIENCE_ARRIVALS_TASK SUSPEND;

PX0005_MH_EXTRACTS_TASK	HAVEN_WORK	INTEGRATIONS	started


ALTER task haven_store.digital.PX0001_DIGITAL_EXTRACT resume;
ALTER task haven_store.digital.PX0002_WEB_TEST_PRICES resume;
ALTER task haven_store.digital.PX0013_DIGITAL_EXPERIENCE_ARRIVALS_TASK resume;
ALTER task haven_store.integration.PX0003_HOTEL_ROOMS_TASK resume;
ALTER task haven_store.integration.PX0003_PRICING_VARIABLES_TASK  resume;
ALTER task haven_store.integration.PX0004_GOOGLE_PPC resume;
ALTER task haven_work.PX0010_DIGITAL_ALLOCATIONS.PX0010_DIGITAL_ALLOCATIONS resume;
ALTER task haven_raw.activities.PX0009_ACTIVITIES_DELTA resume;
ALTER task haven_raw.activities.PX0009_DIGITAL_EXTRACT resume;
ALTER task haven_store.availability.GRADE_PRICE_HISTORY_STREAM_LOADER resume;
ALTER task haven_store.availability.INVENTORY_AVAILABILITY_HISTORY_STREAM_LOADER resume;
ALTER task haven_store.digital.PX0013_DIGITAL_EXPERIENCE_ARRIVALS_TASK resume;

USE SCHEMA haven_raw.seaware;

USE ROLE dba;

alter task SKUUUDLE_INGEST suspend;
alter task GRADE_PRICE_HISTORY_STREAM_LOADER suspend;
alter task INVENTORY_AVAILABILITY_HISTORY_STREAM_LOADER suspend;
alter task BREAKFREE_EXTRACT_GRADE_PRICE suspend;
alter task PX0001_DIGITAL_EXTRACT suspend;
alter task PX0001_VRES_DISTRESSED_INV_CLN_EXTRACT suspend;
alter task PX0002_WEB_TEST_PRICES suspend;
alter task PX0013_DIGITAL_EXPERIENCE_ARRIVALS_TASK suspend;
alter task PX0003_HOTEL_ROOMS_TASK suspend;
alter task PX0003_PRICING_VARIABLES_TASK suspend;
alter task PX0004_GOOGLE_PPC suspend;

SHOW streams;

drop stream BLL_INV_AVAILABILITY_STREAM;
drop stream VRES_GRADE_PRICE_STREAM;

USE ROLE accountadmin;

SHOW tasks IN account;

