use role dba;
use schema haven_raw.google_integration;

show tables;

call load_avro_data_file('SA360_p_IdMapping_AD', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'SA360_haven/p_IdMapping_AD/2024-10-04/');

desc table SA360_p_IdMapping_AD_stage;
desc table SA360_p_IdMapping_AD;

select count(*) from SA360_p_IdMapping_AD;

alter table SA360_p_IdMapping_AD add column new_secondary_id number;


drop table SA360_p_IdMapping_AD_stage;

alter table SA360_p_IdMapping_AD rename to SA360_p_IdMapping_AD_hold;

undrop table SA360_p_IdMapping_AD;

select count(*) from SA360_p_IdMapping_AD;
select count(*) from SA360_p_IdMapping_AD_hold;

alter table SA360_p_IdMapping_AD rename to SA360_p_IdMapping_AD_pre_new_secondary_id;
alter table SA360_p_IdMapping_AD_hold rename to SA360_p_IdMapping_AD;

create table SA360_p_IdMapping_AD clone SA360_p_IdMapping_AD_stage;

call load_avro_data_file('SA360_p_IdMapping_CAMPAIGN_CRITERION', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'SA360_haven/p_IdMapping_CAMPAIGN_CRITERION/2024-10-04/');

desc table SA360_p_IdMapping_CAMPAIGN_CRITERION;
desc table SA360_p_IdMapping_CAMPAIGN_CRITERION_stage;

alter table SA360_p_IdMapping_CAMPAIGN_CRITERION rename to SA360_p_IdMapping_CAMPAIGN_CRITERION_pre_new_secondary_id;
alter table SA360_P_IDMAPPING_CAMPAIGN_CRITERION_STAGE rename to SA360_p_IdMapping_CAMPAIGN_CRITERION;

show tables;

call load_avro_data_file('SA360_p_IdMapping_CAMPAIGN', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'SA360_haven/p_IdMapping_CAMPAIGN/2024-10-04/');

desc table SA360_p_IdMapping_CAMPAIGN;
desc table SA360_P_IDMAPPING_CAMPAIGN_STAGE;
drop table SA360_P_IDMAPPING_CAMPAIGN_STAGE;

call load_avro_data_file('SA360_p_IdMapping_CAMPAIGN_CRITERION', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'SA360_haven/p_IdMapping_CAMPAIGN_CRITERION/2024-10-04/');

drop table SA360_p_IdMapping_CAMPAIGN_CRITERION_stage;

call load_avro_data_file('SA360_p_IdMapping_CRITERION', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'SA360_haven/p_IdMapping_CRITERION/2024-10-04/');

desc table SA360_p_IdMapping_CRITERION;
desc table SA360_p_IdMapping_CRITERION_stage;

alter table SA360_p_IdMapping_CRITERION_SA360_p_IdMapping_CRITERION rename to SA360_p_IdMapping_CRITERION_new_secondary_id;
alter table SA360_P_IDMAPPING_CRITERION_STAGE rename to SA360_p_IdMapping_CRITERION;

show stages;

--rm @GCS_SNOWFLAKE_DIGITAL_INTEGRATION_STAGE/;

ls @GCS_SNOWFLAKE_DIGITAL_INTEGRATION_STAGE/SA360_haven/p_sa_ProductLeadAndCrossSellStats/2024-10-04/;

call load_avro_data_file('p_sa_ProductLeadAndCrossSellStats', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'SA360_haven/p_sa_ProductLeadAndCrossSellStats/2024-10-04/');

desc table p_sa_ProductLeadAndCrossSellStats_stage;

create or replace table HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_SA_PRODUCTLEADANDCROSSSELLSTATS
AS SELECT "segments_product_sold_type_l3" as segments_product_sold_type_l3,
 "segments_product_sold_type_l4" as segments_product_sold_type_l4,
 "segments_product_sold_type_l5" as segments_product_sold_type_l5,
 "segments_product_title"  as segments_product_title,
 "segments_product_type_l1" as segments_product_type_l1,
 DATE(PARTITIONTIME) as PARTITIONTIME,
 "ad_group_id" as ad_group_id,
 "campaign_id" as campaign_id,
 "customer_id" as customer_id,
 "segments_product_item_id"  as segments_product_item_id,
 "segments_product_sold_item_id" as segments_product_sold_item_id,
 "metrics_client_account_cross_sell_gross_profit_micros" as metrics_client_account_cross_sell_gross_profit_micros,
 "metrics_client_account_cross_sell_revenue_micros" as metrics_client_account_cross_sell_revenue_micros,
 "metrics_client_account_cross_sell_units_sold" as metrics_client_account_cross_sell_units_sold,
 "metrics_client_account_lead_gross_profit_micros" as metrics_client_account_lead_gross_profit_micros,
 "metrics_client_account_lead_revenue_micros" as metrics_client_account_lead_revenue_micros,
 "metrics_client_account_lead_units_sold" as metrics_client_account_lead_units_sold,
 "metrics_lead_units_sold" as metrics_lead_units_sold,
 DATE("segments_date") AS segments_date,
 "segments_product_brand" as segments_product_brand,
 "segments_product_sold_brand" as segments_product_sold_brand,
 "segments_product_sold_title" as segments_product_sold_title,
 "segments_product_sold_type_l1" as segments_product_sold_type_l1,
 "segments_product_sold_type_l2" as segments_product_sold_type_l2,
 "metrics_cross_sell_gross_profit_micros" as metrics_cross_sell_gross_profit_micros,
 "metrics_cross_sell_revenue_micros" as metrics_cross_sell_revenue_micros,
 "metrics_cross_sell_units_sold" as metrics_cross_sell_units_sold,
 "metrics_lead_gross_profit_micros" as metrics_lead_gross_profit_micros,
 "metrics_lead_revenue_micros"  as metrics_lead_revenue_micros,
 "segments_product_type_l2" as segments_product_type_l2,
 "segments_product_type_l3" as segments_product_type_l3,
 "segments_product_type_l4" as segments_product_type_l4,
 "segments_product_type_l5" as segments_product_type_l5
 FROM HAVEN_RAW.GOOGLE_INTEGRATION.P_SA_PRODUCTLEADANDCROSSSELLSTATS_STAGE;

call load_avro_data_file('p_sa_CartDataSalesStats', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'SA360_haven/p_sa_CartDataSalesStats/2024-10-04/');
show tables like 'p_sa_%';

create table HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_SA_CARTDATASALESSTATS
AS SELECT "segments_product_sold_type_l3", "segments_product_sold_type_l4", "segments_product_sold_type_l5", "segments_product_title", "segments_product_type_l1", PARTITIONTIME, "ad_group_id", "campaign_id", "customer_id", "segments_product_item_id", "segments_product_sold_item_id", "metrics_client_account_cross_sell_gross_profit_micros", "metrics_client_account_cross_sell_revenue_micros", "metrics_client_account_cross_sell_units_sold", "metrics_client_account_lead_gross_profit_micros", "metrics_client_account_lead_revenue_micros", "metrics_client_account_lead_units_sold", "metrics_lead_units_sold", DATE("segments_date") AS segments_date, "segments_product_brand", "segments_product_sold_brand", "segments_product_sold_title", "segments_product_sold_type_l1", "segments_product_sold_type_l2", "metrics_cross_sell_gross_profit_micros", "metrics_cross_sell_revenue_micros", "metrics_cross_sell_units_sold", "metrics_lead_gross_profit_micros", "metrics_lead_revenue_micros", "segments_product_type_l2", "segments_product_type_l3", "segments_product_type_l4", "segments_product_type_l5"
FROM HAVEN_RAW.GOOGLE_INTEGRATION.P_SA_CARTDATASALESSTATS_STAGE;


undrop table P_SA_CARTDATASALESSTATS_STAGE;
undrop table P_SA_PRODUCTLEADANDCROSSSELLSTATS_STAGE;


alter table SA360_p_IdMapping_AD rename to SA360_p_IdMapping_AD_stage;
alter table SA360_p_IdMapping_CAMPAIGN_CRITERION rename to SA360_p_IdMapping_CAMPAIGN_CRITERION_stage;
alter table SA360_p_IdMapping_CRITERION rename to SA360_p_IdMapping_CRITERION_stage;

desc table SA360_p_IdMapping_AD_stage;
desc table SA360_p_IdMapping_CAMPAIGN_CRITERION;
desc table SA360_p_IdMapping_CRITERION;

create table HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_IDMAPPING_AD
as SELECT "new_id" as new_id, "legacy_id" as legacy_id, DATE(PARTITIONTIME) as PARTITIONTIME, "new_secondary_id" as new_secondary_id
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_IDMAPPING_AD_STAGE
order by PARTITIONTIME;

create table HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_IDMAPPING_CAMPAIGN_CRITERION
as SELECT "new_id" as new_id, "new_secondary_id" as new_secondary_id, "legacy_id" as legacy_id, DATE(PARTITIONTIME) as PARTITIONTIME
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_IDMAPPING_CAMPAIGN_CRITERION_STAGE
order by PARTITIONTIME;

create table HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_IDMAPPING_CRITERION
as SELECT "new_secondary_id" as new_secondary_id, "legacy_id" as legacy_id, DATE(PARTITIONTIME) as PARTITIONTIME, "new_id" as new_id
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_IDMAPPING_CRITERION_stage
order by PARTITIONTIME;

create or replace table HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_SA_PRODUCTLEADANDCROSSSELLSTATS
AS SELECT "segments_product_sold_type_l3" as segments_product_sold_type_l3,
 "segments_product_sold_type_l4" as segments_product_sold_type_l4,
 "segments_product_sold_type_l5" as segments_product_sold_type_l5,
 "segments_product_title"  as segments_product_title,
 "segments_product_type_l1" as segments_product_type_l1,
 DATE(PARTITIONTIME) as PARTITIONTIME,
 "ad_group_id" as ad_group_id,
 "campaign_id" as campaign_id,
 "customer_id" as customer_id,
 "segments_product_item_id"  as segments_product_item_id,
 "segments_product_sold_item_id" as segments_product_sold_item_id,
 "metrics_client_account_cross_sell_gross_profit_micros" as metrics_client_account_cross_sell_gross_profit_micros,
 "metrics_client_account_cross_sell_revenue_micros" as metrics_client_account_cross_sell_revenue_micros,
 "metrics_client_account_cross_sell_units_sold" as metrics_client_account_cross_sell_units_sold,
 "metrics_client_account_lead_gross_profit_micros" as metrics_client_account_lead_gross_profit_micros,
 "metrics_client_account_lead_revenue_micros" as metrics_client_account_lead_revenue_micros,
 "metrics_client_account_lead_units_sold" as metrics_client_account_lead_units_sold,
 "metrics_lead_units_sold" as metrics_lead_units_sold,
 DATE("segments_date") AS segments_date,
 "segments_product_brand" as segments_product_brand,
 "segments_product_sold_brand" as segments_product_sold_brand,
 "segments_product_sold_title" as segments_product_sold_title,
 "segments_product_sold_type_l1" as segments_product_sold_type_l1,
 "segments_product_sold_type_l2" as segments_product_sold_type_l2,
 "metrics_cross_sell_gross_profit_micros" as metrics_cross_sell_gross_profit_micros,
 "metrics_cross_sell_revenue_micros" as metrics_cross_sell_revenue_micros,
 "metrics_cross_sell_units_sold" as metrics_cross_sell_units_sold,
 "metrics_lead_gross_profit_micros" as metrics_lead_gross_profit_micros,
 "metrics_lead_revenue_micros"  as metrics_lead_revenue_micros,
 "segments_product_type_l2" as segments_product_type_l2,
 "segments_product_type_l3" as segments_product_type_l3,
 "segments_product_type_l4" as segments_product_type_l4,
 "segments_product_type_l5" as segments_product_type_l5
 FROM HAVEN_RAW.GOOGLE_INTEGRATION.P_SA_PRODUCTLEADANDCROSSSELLSTATS_STAGE;

 create or replace table HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_SA_CARTDATASALESSTATS
AS SELECT "segments_product_sold_type_l3" as segments_product_sold_type_l3,
 "segments_product_sold_type_l4" as segments_product_sold_type_l4,
 "segments_product_sold_type_l5" as segments_product_sold_type_l5,
 "segments_product_title"  as segments_product_title,
 "segments_product_type_l1" as segments_product_type_l1,
 DATE(PARTITIONTIME) as PARTITIONTIME,
 "ad_group_id" as ad_group_id,
 "campaign_id" as campaign_id,
 "customer_id" as customer_id,
 "segments_product_item_id"  as segments_product_item_id,
 "segments_product_sold_item_id" as segments_product_sold_item_id,
 "metrics_client_account_cross_sell_gross_profit_micros" as metrics_client_account_cross_sell_gross_profit_micros,
 "metrics_client_account_cross_sell_revenue_micros" as metrics_client_account_cross_sell_revenue_micros,
 "metrics_client_account_cross_sell_units_sold" as metrics_client_account_cross_sell_units_sold,
 "metrics_client_account_lead_gross_profit_micros" as metrics_client_account_lead_gross_profit_micros,
 "metrics_client_account_lead_revenue_micros" as metrics_client_account_lead_revenue_micros,
 "metrics_client_account_lead_units_sold" as metrics_client_account_lead_units_sold,
 "metrics_lead_units_sold" as metrics_lead_units_sold,
 DATE("segments_date") AS segments_date,
 "segments_product_brand" as segments_product_brand,
 "segments_product_sold_brand" as segments_product_sold_brand,
 "segments_product_sold_title" as segments_product_sold_title,
 "segments_product_sold_type_l1" as segments_product_sold_type_l1,
 "segments_product_sold_type_l2" as segments_product_sold_type_l2,
 "metrics_cross_sell_gross_profit_micros" as metrics_cross_sell_gross_profit_micros,
 "metrics_cross_sell_revenue_micros" as metrics_cross_sell_revenue_micros,
 "metrics_cross_sell_units_sold" as metrics_cross_sell_units_sold,
 "metrics_lead_gross_profit_micros" as metrics_lead_gross_profit_micros,
 "metrics_lead_revenue_micros"  as metrics_lead_revenue_micros,
 "segments_product_type_l2" as segments_product_type_l2,
 "segments_product_type_l3" as segments_product_type_l3,
 "segments_product_type_l4" as segments_product_type_l4,
 "segments_product_type_l5" as segments_product_type_l5
 FROM HAVEN_RAW.GOOGLE_INTEGRATION.P_SA_CARTDATASALESSTATS_STAGE;

drop table P_SA_CARTDATASALESSTATS_STAGE;
drop table P_SA_PRODUCTLEADANDCROSSSELLSTATS_STAGE;


 select * from sa360_p_idmapping_ad limit 20;


show tables like '%_stage';

drop table SA360_P_IDMAPPING_AD_STAGE;
drop table SA360_P_IDMAPPING_CRITERION_STAGE;
drop table SA360_P_SA_CARTDATASALESSTATS_STAGE;

drop table BO02_BOURNE_LEISURE_SALES__SESSIONS_BY_DATE_STAGE;
drop table BO02_BOURNE_TEAM_SITE_STAGE;
drop table BO03_BOURNE_TEAM_SITE__SESSIONS_BY_DATE_STAGE;
drop table BOURNE_CAREERS_OLD_PROPERTY__SESSIONS_BY_DATE_STAGE;
drop table BUTLINS_CAREERS_OLD_PROPERTY__SESSIONS_BY_DATE_STAGE;
drop table HA08_HAVEN_EQUALIZER__SESSIONS_BY_DATE_STAGE;
drop table HA12_OLD_HAVEN_OWNER_SERVICES__SESSIONS_BY_DATE_STAGE;
drop table HAVEN_BLOG__SESSIONS_BY_DATE_STAGE;
drop table HAVEN_ROLLUP__SESSIONS_BY_DATE_STAGE;
drop table OLD_HAVEN_CYHH__SESSIONS_BY_DATE_STAGE;
drop table OLD_HAVEN_HOLIDAY_HOMES__SESSIONS_BY_DATE_STAGE;
drop table OLD_HAVEN_LODGE_SALES__SESSIONS_BY_DATE_STAGE;
drop table WARNER_CAREERS_OLD_PROPERTY__SESSIONS_BY_DATE_STAGE ;

call load_avro_data_file('SA360_p_IdMapping_AD', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'SA360_haven/p_IdMapping_AD/2024-10-04/');

insert into HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_IDMAPPING_AD
SELECT "new_id" as new_id, "legacy_id" as legacy_id, DATE(PARTITIONTIME) as PARTITIONTIME, "new_secondary_id" as new_secondary_id
FROM HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_IDMAPPING_AD_STAGE
order by PARTITIONTIME;

drop table HAVEN_RAW.GOOGLE_INTEGRATION.SA360_P_IDMAPPING_AD_STAGE;

use role dba;

use schema haven_base.seaware;

show views;

use schema haven_base.plot;

show views;

use schema haven_BASE.aztec_COMPLEX;

show views;

use schema haven_BASE.ZBSDATA_COMPLEX;

SHOW VIEWS;

use schema haven_BASE.ZBSDATA_retail;

SHOW VIEWS;

use schema haven_BASE.KMSREPORTING_COMPLEX;

SHOW VIEWS;


USE SCHEMA HAVEN_BASE.MARINER;

SHOW VIEWS;

USE SCHEMA HAVEN_BASE.GOOGLE_INTEGRATION;

SHOW VIEWS;

USE SCHEMA BOURNE_RAW.COUPA;

SHOW TABLES;

USE SCHEMA BOURNE_RAW.CONCUR;

SHOW TABLES;

USE SCHEMA HAVEN_RAW.BRAINTREE;

SHOW TABLES;

USE SCHEMA HAVEN_BASE.FINANCIAL_CUBE;

SHOW VIEWS;

USE SCHEMA bourne_raw.FINANCIAL_CUBE;

show tables;

desc table fact_tb;
use role securityadmin;
grant role bourne_batch_dataload to role dba;

use role bourne_batch_dataload;

desc table fact_tb;


desc table fact_tb_swap;

-- BOURNE_RAW.FINANCIAL_CUBE.FACT_TB definition

create or replace TABLE BOURNE_RAW.FINANCIAL_CUBE.FACT_TB (
	NOMINAL_REF NUMBER(38,0),
	BRAND_REF NUMBER(38,0),
	SITE_REF NUMBER(38,0),
	DEPARTMENT_REF NUMBER(38,0),
	SUB_DEPARTMENT_REF NUMBER(38,0),
	LEDGER_REF NUMBER(38,0),
	LEDGER_ACCOUNT_REF NUMBER(38,0),
	LEDGER3_REF NUMBER(38,0),
	LEDGER3_ACCOUNT_REF NUMBER(38,0),
	STATSSUM_REF NUMBER(38,0),
	CASHFLOW_REF NUMBER(38,0),
	WAGES_ANALYSIS_REF NUMBER(38,0),
	WAGES_SUMMARY_REF NUMBER(38,0),
	TRADITIONAL_P_AND_L_REF NUMBER(38,0),
	VERSION_REF NUMBER(38,0),
	PERIOD_REF NUMBER(38,0),
	WEEK_VALUE NUMBER(20,4),
	WEEK_USERVALUE NUMBER(20,4),
	WEEK_USERVALUEFIELD1 NUMBER(20,4),
	WEEK_USERVALUEFIELD2 NUMBER(20,4),
	WEEK_USERVALUEFIELD3 NUMBER(20,4),
	WEEK_USERVALUEFIELD4 NUMBER(20,4),
	YTD_VALUE NUMBER(20,4),
	YTD_USERVALUE NUMBER(20,4),
	YTD_USERVALUEFIELD1 NUMBER(20,4),
	YTD_USERVALUEFIELD2 NUMBER(20,4),
	YTD_USERVALUEFIELD3 NUMBER(20,4),
	YTD_USERVALUEFIELD4 NUMBER(20,4),
	CPARKPL_REF NUMBER(38,0)
);


-- BOURNE_RAW.FINANCIAL_CUBE.FACT_TB_SWAP definition

create or replace TABLE BOURNE_RAW.FINANCIAL_CUBE.FACT_TB_SWAP (
	NOMINAL_REF NUMBER(38,0),
	BRAND_REF NUMBER(38,0),
	SITE_REF NUMBER(38,0),
	DEPARTMENT_REF NUMBER(38,0),
	SUB_DEPARTMENT_REF NUMBER(38,0),
	LEDGER_REF NUMBER(38,0),
	LEDGER_ACCOUNT_REF NUMBER(38,0),
	LEDGER3_REF NUMBER(38,0),
	LEDGER3_ACCOUNT_REF NUMBER(38,0),
	STATSSUM_REF NUMBER(38,0),
	CASHFLOW_REF NUMBER(38,0),
	WAGES_ANALYSIS_REF NUMBER(38,0),
	WAGES_SUMMARY_REF NUMBER(38,0),
	TRADITIONAL_P_AND_L_REF NUMBER(38,0),
	VERSION_REF NUMBER(38,0),
	PERIOD_REF NUMBER(38,0),
	WEEK_VALUE NUMBER(20,4),
	WEEK_USERVALUE NUMBER(20,4),
	WEEK_USERVALUEFIELD1 NUMBER(20,4),
	WEEK_USERVALUEFIELD2 NUMBER(20,4),
	WEEK_USERVALUEFIELD3 NUMBER(20,4),
	WEEK_USERVALUEFIELD4 NUMBER(20,4),
	YTD_VALUE NUMBER(20,4),
	YTD_USERVALUE NUMBER(20,4),
	YTD_USERVALUEFIELD1 NUMBER(20,4),
	YTD_USERVALUEFIELD2 NUMBER(20,4),
	YTD_USERVALUEFIELD3 NUMBER(20,4),
	YTD_USERVALUEFIELD4 NUMBER(20,4),
	CPARKPL_REF NUMBER(38,0)
);

show stages;
show file formats;

ls @FINANCIAL_CUBE_STAGE/x1c53ef01f1f44dc38ce3c3969667804b/out__fact_tb;

copy into fact_tb
from @FINANCIAL_CUBE_STAGE/x1c53ef01f1f44dc38ce3c3969667804b/out__fact_tb
file_format=(type=CSV field_delimiter='|' trim_space=true field_optionally_enclosed_by='"' escape_unenclosed_field=None);

select count(*) from fact_tb;

show tables;

use role useradmin;

show users;

use role dba;

call SYSTEM$CANCEL_QUERY('01b79978-0205-2f08-00aa-990134946f97');