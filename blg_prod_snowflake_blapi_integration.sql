use role accountadmin;

-- blg-prod-blapi-s3
-- blg-prod-snowflake-blapi-role
-- BD78472_SFCRole=73lh0MSBf1XIiZ6YvJMqmiBcTQBX
-- arn:aws:iam::753707732315:role/blg-prod-snowflake-blapi-role

create storage integration blg_prod_snowflake_blapi_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::753707732315:role/blg-prod-snowflake-blapi-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=73lh0MSBf1XIiZ6YvJMqmiBcTQBX'
  storage_allowed_locations = ('s3://blg-prod-blapi-s3/');
 
DESC integration blg_prod_snowflake_blapi_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_prod_snowflake_blapi_integration TO ROLE dba;
GRANT USAGE ON integration blg_prod_snowflake_blapi_integration TO ROLE HAVEN_DATA_TRANSFORM;

SHOW integrations;

-- 31/01/2025

USE ROLE dba;

USE SCHEMA haven_raw.blapi_pricing;

CREATE OR REPLACE STAGE haven_raw.blapi_pricing.PRICING_AND_AVAILABILITY__STAGE
	STORAGE_INTEGRATION = blg_prod_snowflake_blapi_integration 
  	URL = 's3://blg-prod-blapi-s3/';			
	--list @PRICING_AND_AVAILABILITY__STAGE;  see the external stage from within snowflake)

 
create or replace TABLE haven_raw.blapi_pricing.PRICING_AND_AVAILABILITY (
	JSON_COL VARIANT,
	METADATA_START_SCAN_TIME VARCHAR(16777216),
	METADATA_FILENAME VARCHAR(16777216)
);

ALTER TABLE haven_raw.blapi_pricing.PRICING_AND_AVAILABILITY SET change_tracking = TRUE;
 
CREATE OR REPLACE PIPE haven_raw.blapi_pricing.PRICING_AND_AVAILABILITY__PIPE auto_ingest=true as
	copy into PRICING_AND_AVAILABILITY(JSON_COL, METADATA_START_SCAN_TIME, METADATA_FILENAME)      
	from (SELECT $1,METADATA$START_SCAN_TIME, METADATA$FILENAME FROM @PRICING_AND_AVAILABILITY__STAGE) 
	file_format = (type = 'JSON');

 
 
--obvs 1min is a bit much..

create or replace dynamic table haven_raw.blapi_pricing.PRICING_AND_AVAILABILITY__DYNAMIC(
	PACKAGE_ID,
	IS_ACTIVE,
	ARRIVAL_DATE,
	DEPARTURE_DATE,
	DURATION,
	PARK_CODE,
	PACKAGE_CODE,
	ADDONS,
	IS_AVAILABLE,
	DISCOUNT_PRICE,
	GRADE_CODE,
	PRICE,
	STATUS,
	NESTED_ASSIGNED_QUANTITY,
	NESTED_BLOCKED_QUANTITY,
	NESTED_TOTAL_QUANTITY,
	NESTED_REMAINING_ABSOLUTE_QUANTITY,
	NESTED_REMAINING_QUANTITY,
	NESTED_REMAINING_TOTAL_QUANTITY,
	NESTED_AVAILABILITY_CODE,
	NESTED_SELLING_LIMIT,
	METADATA_START_SCAN_TIME
) target_lag = '1 minute' refresh_mode = AUTO initialize = ON_CREATE warehouse = HAVEN_DATA_TRANSFORM_WAREHOUSE_XSMALL
as 
            --3. Automatic (and intelligent) incremental refreshes: Refresh only what’s changed, even for complex queries, automatically. Processing only new/changing data can save costs significantly, especially as data volume                 increases. No need to track scheduling for dependent tables, as Dynamic Tables can intelligently fall back to full refresh in cases when it is cheaper (or more sensible). Dynamic Tables will also intelligently skip                  any refreshes in cases where there is no new data to process or if dependent tables are still refreshing without any user intervention. (During the private preview period some restrictions apply, details below.)
with
    c_data__step10 as (
        select  
            aa.json_col as json, 
            TO_TIMESTAMP_TZ(aa.metadata_start_scan_time) metadata_start_scan_time 
        from 
            PRICING_AND_AVAILABILITY aa
            )
    ,c_data__step20 as (
        select  
            f2.VALUE::number package_id, --they all contain only 1 id
            aa.json:active::boolean is_active,
            aa.json:arrive::date arrival_date,
            aa.json:depart::date departure_date,
            aa.json:nights::integer duration,
            aa.json:parkCode::string park_code,
            aa.json:type::string package_code,
            f1.VALUE:addons::variant addons, --all empty at the moment, so not sure what it will contain
            f1.VALUE:available::boolean is_available,
            f1.VALUE:discount::float discount_price,
            f1.VALUE:gradeCode::string grade_code,
            f1.VALUE:price::float price,
            f1.VALUE:status::string status,
            f1.VALUE:source::variant:assigned::number as nested_assigned_quantity,
            f1.VALUE:source::variant:blocked::number as nested_blocked_quantity,
            f1.VALUE:source::variant:total::number as nested_total_quantity,
            f1.VALUE:source::variant:remaining::variant:absolute::number as nested_remaining_absolute_quantity,
            f1.VALUE:source::variant:remaining::variant:nested::number as nested_remaining_quantity,
            f1.VALUE:source::variant:remaining::variant:total::number as nested_remaining_total_quantity,
            f3.VALUE:availabilityCode::string as nested_availability_code,
            f3.VALUE:sellingLimit::number as nested_selling_limit,
            aa.metadata_start_scan_time,
        from 
            c_data__step10 aa,
            LATERAL FLATTEN(INPUT => aa.json:availabilities, path => '', outer => TRUE, recursive => FALSE, mode => 'ARRAY') AS f1, --flatten ARRAY of 'availabilities'
            LATERAL FLATTEN(INPUT => aa.json:ids, path => '', outer => TRUE, recursive => FALSE, mode => 'ARRAY') AS f2, --flatten ARRAY 'ids'
            LATERAL FLATTEN(INPUT => f1.VALUE:source::variant:nestingSource, path => '', outer => TRUE, recursive => FALSE, mode => 'ARRAY') AS f3, --flatten ARRAY 'nestingSource'
    )
select * from c_data__step20;

 SELECT SYSTEM$PIPE_STATUS( 'PRICING_AND_AVAILABILITY__PIPE' );
 
