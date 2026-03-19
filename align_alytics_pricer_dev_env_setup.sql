use role dba;

show grants to user sheldondee;

show grants to role HAVEN_REVENUE_MANAGEMENT_PRICER;
show grants to role HAVEN_REVENUE_MANAGEMENT_PRICER_UAT;
show grants to role HAVEN_REVENUE_MANAGEMENT_PRICER_VALIDATION;

show grants of role HAVEN_REVENUE_MANAGEMENT_PRICER;

show grants to role HAVEN_DBT_TRANSFORM_PRICER_UAT;

show warehouses like '%revenue%';

use role dba;
show grants to role haven_identity_management;

use role dba;

select * from snowflake.account_usage.query_history
where user_name = 'JONATHANMANLEY'
AND START_TIME > '2025-09-16 09:00:00'
--and query_type = 'CREATE_TABLE_AS_SELECT'
and execution_status = 'FAIL'
ORDER BY START_TIME DESC;

use role haven_dbt_transform_align_alytics_dev;

create TABLE HAVEN_STORE_AA_DEV.HAVEN_STAGING.ONETRUST_DAILY_COOKIE_DATA AS SELECT * FROM HAVEN_STORE_UAT.HAVEN_STAGING.ONETRUST_DAILY_COOKIE_DATA;
create TABLE HAVEN_STORE_AA_DEV.HAVEN_STAGING.MARKETING_FALLOW_CELL AS SELECT * FROM HAVEN_STORE_UAT.HAVEN_STAGING.MARKETING_FALLOW_CELL;
create TABLE HAVEN_STORE_AA_DEV.HAVEN_STAGING.MARKETING_BUDGET AS SELECT * FROM HAVEN_STORE_UAT.HAVEN_STAGING.MARKETING_BUDGET;
create TABLE HAVEN_STORE_AA_DEV.HAVEN_STAGING.HOLIDAY_PERIOD_2019_TO_2026 AS SELECT * FROM HAVEN_STORE_UAT.HAVEN_STAGING.HOLIDAY_PERIOD_2019_TO_2026;
create TABLE HAVEN_STORE_AA_DEV.HAVEN_STAGING.FINANCE_CUBE_ERPX_NOMINAL_MAPPING AS SELECT * FROM HAVEN_STORE_UAT.HAVEN_STAGING.FINANCE_CUBE_ERPX_NOMINAL_MAPPING;
create TABLE HAVEN_STORE_AA_DEV.HAVEN_STAGING.FACEBOOK_OLD_CREATIVE_CODES_M2 AS SELECT * FROM HAVEN_STORE_UAT.HAVEN_STAGING.FACEBOOK_OLD_CREATIVE_CODES_M2;
create TABLE HAVEN_STORE_AA_DEV.HAVEN_STAGING.FACEBOOK_OLD_CREATIVE_CODES_C2 AS SELECT * FROM HAVEN_STORE_UAT.HAVEN_STAGING.FACEBOOK_OLD_CREATIVE_CODES_C2;
create TABLE HAVEN_STORE_AA_DEV.HAVEN_STAGING.DUMMY_EMAILS_TOP_OF_THE_FUNNEL AS SELECT * FROM HAVEN_STORE_UAT.HAVEN_STAGING.DUMMY_EMAILS_TOP_OF_THE_FUNNEL;


use role dba;

show grants to role haven_dbt_transform_align_alytics_dev;
show grants to role haven_dbt_transform_pricer_uat;
show grants to role HAVEN_REVENUE_MANAGEMENT_PRICER_UAT;
show grants to role HAVEN_REVENUE_MANAGEMENT_PRICER;

show grants to role _HAVEN_REVENUE_MANAGEMENT__HAVEN_STORE__PERFORMANCE_MARKETING__READER;

show grants to role 


use schema haven_base.freshsales;

select max(updated_at) from deal_history limit 100;

show grants to role _haven_revenue_management_pricer__haven_pipeline__px0006_blueyonder_pricer__reader;

select get_ddl('schema', 'HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER');

show roles like '_haven_dbt_transform_align_alytics_dev%';
show grants to role _haven_revenue_management_pricer__haven_pipeline__px0006_blueyonder_pricer__reader;




use role securityadmin;

drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_BASE__PRICER__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_BASE__SEAWARE__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE_AA_DEV__AVAILABILITY__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE_AA_DEV__COMMERCIAL__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE_AA_DEV__COMMON__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE_AA_DEV__OCANDC__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE_AA_DEV__TROOPER2__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE_AA_DEV__TROOPER__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE__AVAILABILITY__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE__COMMERCIAL__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE__COMMON__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE__HOLIDAY__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE__OCANDC__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE__PERFORMANCE_MARKETING__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE__PRICER__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE__TROOPER2__READER;
drop role _HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV__HAVEN_STORE__TROOPER__READER;

show roles like '_HAVEN_DBT_DEVELOPMENT_ALIGN_ALYTICS%';

use role dba;

select count(*) from haven_base.freshsales.deal_history AT(TIMESTAMP => '2025-09-16 09:00:00');

select get_ddl('view', 'HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.BREAK_LOOKUP');

use role haven_dbt_transform_align_alytics_dev;

use role dba;

use role haven_dbt_development_align_alytics;

use role securityadmin;

show users like 'haven_dbt_transform%';

grant role haven_dbt_transform_align_alytics_dev to user HAVEN_DBT_TRANSFORM_DEV;

use role dba;

use database haven_staging_uat;

use schema dms_staging;

show views;

use schema rm_staging;

show views;

select get_ddl('schema', 'rm_staging');

show grants to role haven_dbt_transform_align_alytics_dev;

show roles like '_haven_master__revenue_management_storage%';

use role securityadmin;

grant role _HAVEN_MASTER__REVENUE_MANAGEMENT_STORAGE__READER to role haven_dbt_transform_align_alytics_dev;
grant role _HAVEN_MASTER__REVENUE_MANAGEMENT_STORAGE__READER to role haven_dbt_development_align_alytics;

use role dba;

select get_ddl('schema', 'revenue_management_staging');
use schema haven_staging_uat.revenue_management_output;

show views;

use role haven_dbt_transform_align_alytics_dev;

use schema haven_staging_aa_dev.revenue_management_output;

select get_ddl('schema', 'revenue_management_staging');

create or replace   view HAVEN_STAGING_AA_DEV.REVENUE_MANAGEMENT_OUTPUT.DMS_Forecast_History_stayid_check
  copy grants
  as (
    WITH forecast_history AS (
    SELECT
        RUN_DATE
        ,MASTER_VERSION_LABEL
        ,STAY_ID
        ,UNIT_FCS_FN_NET_UNCN
        ,ROW_NUMBER() OVER (PARTITION BY STAY_ID, MASTER_VERSION_LABEL ORDER BY RUN_DATE DESC) AS LATEST_RECORD_FLAG
    FROM 
        HAVEN_STAGING_AA_DEV.REVENUE_MANAGEMENT_OUTPUT.DMS_Forecast_History_stayid a
) 
SELECT 
     a.MASTER_VERSION_LABEL
    ,a.STAY_ID
    ,b.RUN_DATE AS RUN_DATE_PREV
    ,a.RUN_DATE
    ,b.UNIT_FCS_FN_NET_UNCN AS UNIT_FCS_FN_NET_UNCN_PREV
    ,a.UNIT_FCS_FN_NET_UNCN
    ,a.UNIT_FCS_FN_NET_UNCN-b.UNIT_FCS_FN_NET_UNCN AS UNIT_FCS_FN_NET_UNCN_ABS_DIFF
    ,DIV0(a.UNIT_FCS_FN_NET_UNCN,b.UNIT_FCS_FN_NET_UNCN)-1 AS UNIT_FCS_FN_NET_UNCN_PERC_DIFF 
FROM 
    forecast_history a 
    LEFT JOIN forecast_history b
        ON a.STAY_ID=B.STAY_ID
        AND a.MASTER_VERSION_LABEL=b.MASTER_VERSION_LABEL
        AND b.LATEST_RECORD_FLAG=2
WHERE 
    a.LATEST_RECORD_FLAG=1
    AND UNIT_FCS_FN_NET_UNCN_ABS_DIFF>10
  )
;

use role dba;

use database haven_store;

use schema availability;

show views;

create or replace view HAVEN_STORE_AA_DEV.AVAILABILITY.BLL_INV_AVAILABILITY_CURRENT(
	DATE_,
	PARK_CODE,
	GRADE_CODE,
	PRODUCT_TYPE,
	PITCHES,
	NA_ABS,
	HELD,
	RSRV_UA,
	RSRV_OL,
	RSRV_OB,
	ALLOC,
	CAP,
	AVAIL,
	FIRM,
	ASGN_ABS,
	GTY_ABS,
	TIMESTAMP,
	DATADATE,
	EXTRACTID
) as
select  
	DATE_,
	PARK_CODE,
	GRADE_CODE,
	PRODUCT_TYPE,
	PITCHES,
	NA_ABS,
	HELD,
	 RSRV_UA,
	 RSRV_OL,
	 RSRV_OB,
	 ALLOC,
	 CAP,
	 AVAIL,
	FIRM,
	ASGN_ABS,
	GTY_ABS,
	current_date TIMESTAMP,
	current_date DATADATE,
	0 EXTRACTID
from
    HAVEN_base.seaware.bll_inv_availability
-- where
--     snapshot_timestamp::date = (select max(snapshot_timestamp)::date from HAVEN_STORE.AVAILABILITY.INVENTORY_AVAILABILITY_HISTORY)
;
create or replace view HAVEN_STORE_AA_DEV.AVAILABILITY.BLL_INV_CONTRACT_CURRENT as
select 
  DATE_, PARK_CODE, GRADE_CODE, PRODUCT_TYPE, CONTRACT_TYPE, PITCHES, NA_ABS, HELD, ALLOC, ASGN_ABS, TIMESTAMP, timestamp DATADATE, null EXTRACTID
from 
    HAVEN_base.SEAWARE.BLL_INV_CONTRACT
;

create or replace view haven_store_AA_DEV.availability.CS_SCANDTCAP_ALL(
	SEASON,
	PARK_CODE,
	MINIMUMCAPACITY,
	MAXIMUMBOOKED,
	GROUPNAME,
	STARTDATE,
	GRADE_CODE,
	PRODUCT_TYPE
) as 
    select 2016 as season, aa.park_code,aa.minimumcapacity,aa.maximumbooked,aa.groupname,aa.startdate,aa.grade_code,aa.product_type from availability.cs_SCandTCap16 aa union all 
    select 2017 as season, aa.park_code,aa.minimumcapacity,aa.maximumbooked,aa.groupname,aa.startdate,aa.grade_code,aa.product_type from availability.cs_SCandTCap17 aa union all 
    select 2018 as season, aa.park_code,aa.minimumcapacity,aa.maximumbooked,aa.groupname,aa.startdate,aa.grade_code,aa.product_type from availability.cs_SCandTCap18 aa union all 
    select 2019 as season, aa.park_code,aa.minimumcapacity,aa.maximumbooked,aa.groupname,aa.startdate,aa.grade_code,aa.product_type from availability.cs_SCandTCap19 aa union all 
    select 2020 as season, aa.park_code,aa.minimumcapacity,aa.maximumbooked,aa.groupname,aa.startdate,aa.grade_code,aa.product_type from availability.cs_SCandTCap20 aa union all 
    select 2021 as season, aa.park_code,aa.minimumcapacity,aa.maximumbooked,aa.groupname,aa.startdate,aa.grade_code,aa.product_type from availability.cs_SCandTCap21 aa union all 
    select 2022 as season, aa.park_code,aa.minimumcapacity,aa.maximumbooked,aa.groupname,aa.startdate,aa.grade_code,aa.product_type from availability.cs_SCandTCap22 aa union all 
    select 2023 as season, aa.park_code,aa.minimumcapacity,aa.maximumbooked,aa.groupname,aa.startdate,aa.grade_code,aa.product_type from availability.cs_SCandTCap23 aa union all 
    select 2024 as season, aa.park_code,aa.minimumcapacity,aa.maximumbooked,aa.groupname,aa.startdate,aa.grade_code,aa.product_type from availability.cs_SCandTCap24 aa union all 
    select 2025 as season, aa.park_code,aa.minimumcapacity,aa.maximumbooked,aa.groupname,aa.startdate,aa.grade_code,aa.product_type from availability.cs_SCandTCap25 aa union all
    select 2026 as season, aa.park_code,aa.minimumcapacity,aa.maximumbooked,aa.groupname,aa.startdate,aa.grade_code,aa.product_type from availability.cs_SCandTCap26 aa
;


use schema commercial;

show views;

USE SCHEMA COMMON;

SHOW VIEWS;



use role securityadmin;

grant role _haven_store_aa_dev__rms_pricer__creator to role haven_dbt_development_align_alytics;
grant role taskadmin to role haven_dbt_development_align_alytics;
grant create task on schema haven_store_aa_dev.rms_pricer to role haven_dbt_development_align_alytics;
grant create service on schema haven_store_aa_dev.rms_pricer to role haven_dbt_development_align_alytics;
grant create dbt project on schema haven_store_aa_dev.rms_pricer to role haven_dbt_development_align_alytics;

grant role _haven_store_aa_dev__rms_pricer__creator to role haven_dbt_transform_align_alytics_dev;
grant role taskadmin to role haven_dbt_transform_align_alytics_dev;
grant create task on schema haven_store_aa_dev.rms_pricer to role haven_dbt_transform_align_alytics_dev;
grant create service on schema haven_store_aa_dev.rms_pricer to role haven_dbt_transform_align_alytics_dev;
grant create dbt project on schema haven_store_aa_dev.rms_pricer to role haven_dbt_transform_align_alytics_dev;

use role accountadmin;

create event table haven_store_aa_dev.event_data.align_alytics_events;
alter database haven_store_aa_dev set event_table = haven_store_aa_dev.event_data.align_alytics_events;
alter database haven_staging_aa_dev set event_table = haven_store_aa_dev.event_data.align_alytics_events;
alter database haven_pipeline_aa_dev set event_table = haven_store_aa_dev.event_data.align_alytics_events;

use role securityadmin;

grant role _haven_store_aa_dev__event_data__reader to role haven_dbt_development_align_alytics;
grant role _haven_store_aa_dev__event_data__reader to role haven_dbt_transform_align_alytics_dev;

grant select on event table haven_store_aa_dev.event_data.align_alytics_events to role haven_dbt_development_align_alytics;
grant select on event table haven_store_aa_dev.event_data.align_alytics_events to role haven_dbt_transform_align_alytics_dev;

-- 17/0/2025

use role sysadmin;
ALTER SCHEMA haven_store_aa_dev.rms_pricer SET LOG_LEVEL = 'INFO';

use role accountadmin;
ALTER SCHEMA haven_store_aa_dev.rms_pricer SET TRACE_LEVEL = 'ALWAYS';
ALTER SCHEMA haven_store_aa_dev.rms_pricer SET METRIC_LEVEL = 'ALL';

use role securityadmin;
grant create task on schema haven_store_aa_dev.rms_reporting_grade to role haven_dbt_transform_align_alytics_dev;
grant create service on schema haven_store_aa_dev.rms_reporting_grade to role haven_dbt_transform_align_alytics_dev;
grant create dbt project on schema haven_store_aa_dev.rms_reporting_grade to role haven_dbt_transform_align_alytics_dev;

use role sysadmin;
ALTER SCHEMA haven_store_aa_dev.rms_reporting_grade SET LOG_LEVEL = 'INFO';

use role accountadmin;
ALTER SCHEMA haven_store_aa_dev.rms_reporting_grade SET TRACE_LEVEL = 'ALWAYS';
ALTER SCHEMA haven_store_aa_dev.rms_reporting_grade SET METRIC_LEVEL = 'ALL';

-- 18/09/2025

use role securityadmin;

grant role _haven_store_aa_dev__rms_reporting_grade__creator to role haven_dbt_transform_align_alytics_dev;


-- 19/09/2025

use role securityadmin;

show grants to role haven_dbt_development_align_alytics;

grant role _haven_store_aa_dev__rms_pricer__reader to role haven_dbt_development_align_alytics;
grant role _haven_store_aa_dev__rms_reporting_grade__reader to role haven_dbt_development_align_alytics;

grant usage on future dbt projects in schema haven_store_aa_dev.rms_pricer to role _haven_store_aa_dev__rms_pricer__owner;
grant usage on future  in schema haven_store_aa_dev.rms_pricer to role _haven_store_aa_dev__rms_pricer__owner;

-- 19/09/2025

use role dba;

call haven_master.procedures.schema_role_creation('haven_store', 'rms_pricer');
call haven_master.procedures.schema_role_creation('haven_store', 'rms_reporting_grade');

use role securityadmin;
grant create task on schema HAVEN_STORE.rms_pricer to role HAVEN_DBT_TRANSFORM;
grant create service on schema HAVEN_STORE.rms_pricer to role HAVEN_DBT_TRANSFORM;
grant create dbt project on schema HAVEN_STORE.rms_pricer to role HAVEN_DBT_TRANSFORM;

use role sysadmin;
ALTER SCHEMA HAVEN_STORE.rms_pricer SET LOG_LEVEL = 'INFO';

use role accountadmin;
ALTER SCHEMA HAVEN_STORE.rms_pricer SET TRACE_LEVEL = 'ALWAYS';
ALTER SCHEMA HAVEN_STORE.rms_pricer SET METRIC_LEVEL = 'ALL';

use role securityadmin;
grant create task on schema HAVEN_STORE.rms_reporting_grade to role HAVEN_DBT_TRANSFORM;
grant create service on schema HAVEN_STORE.rms_reporting_grade to role HAVEN_DBT_TRANSFORM;
grant create dbt project on schema HAVEN_STORE.rms_reporting_grade to role HAVEN_DBT_TRANSFORM;

use role sysadmin;
ALTER SCHEMA HAVEN_STORE.rms_reporting_grade SET LOG_LEVEL = 'INFO';

use role accountadmin;
ALTER SCHEMA HAVEN_STORE.rms_reporting_grade SET TRACE_LEVEL = 'ALWAYS';
ALTER SCHEMA HAVEN_STORE.rms_reporting_grade SET METRIC_LEVEL = 'ALL';

use role securityadmin;

show grants to role haven_dbt_transform;

grant role taskadmin to role haven_dbt_transform;

