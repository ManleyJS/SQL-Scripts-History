--  Seed script for dev 
--  AA Dev app role will need write permissions granted after its created 

use ROLE dba;

use SCHEMA HAVEN_STAGING_AA_DEV.REVENUE_MANAGEMENT_STAGING;

SHOW tables;

use ROLE haven_dbt_transform_align_alytics_dev;

CREATE TABLE HAVEN_STAGING_AA_DEV.REVENUE_MANAGEMENT_STAGING.TARGET_TOOL_CONFIG (
    VARIABLE_NAME VARCHAR PRIMARY KEY,  
    VARIABLE_VALUE VARCHAR,             
    LAST_UPDATED_DATE TIMESTAMP,       
    LAST_UPDATED_BY VARCHAR             
);

SHOW warehouses;

use warehouse HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV_WAREHOUSE_MEDIUM;

INSERT INTO HAVEN_STAGING_AA_DEV.REVENUE_MANAGEMENT_STAGING.TARGET_TOOL_CONFIG
    (VARIABLE_NAME, VARIABLE_VALUE, LAST_UPDATED_DATE, LAST_UPDATED_BY)
VALUES
    ('break_targets_version_id', '55', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('model_label', '2024 budgets with 2022 bkgs/canc/prices', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('budget_data_version_id', '18', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('cancellations_data_version_id', '9', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('stay_price_adjustment_version_id', '9', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('optimiser_price_data_version_id', '3', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('optimiser_volume_data_version_id', '25', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('break_lookup_version_id', '11', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('source_lookup_version_id', '1', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('calendar_lookup_version_id', '7', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('break_segmentation_lookup_version_id', '11', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('deluxe_price_version_id', '2', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('year_1_go_live_date', '2022-12-06', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('year_2_go_live_date', '2023-12-14', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('year_3_go_live_date', '2024-12-15', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('lead_time_weeks', '60', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('transactions_description', '2022 bookings', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('transactions_arrival_from', '2022-03-01', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('transactions_arrival_to', '2022-11-30', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('price_description', '2022 bronze price', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('price_arrival_from', '2024-03-01', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('price_arrival_to', '2024-11-30', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('price_var_min', '0.7', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('price_var_max', '0.97', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('target_start_date', '2025-04-03', CURRENT_TIMESTAMP(), 'SYSTEM');


-- 16/12/2025

use ROLE dba;

--use role haven_dbt_transform_align_alytics;

use SCHEMA HAVEN_STAGING.REVENUE_MANAGEMENT_STAGING;

SHOW warehouses;

use warehouse dba_wh;

--use warehouse HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV_WAREHOUSE_XSMALL;


CREATE TABLE HAVEN_STAGING.REVENUE_MANAGEMENT_STAGING.TARGET_TOOL_CONFIG (
    VARIABLE_NAME VARCHAR PRIMARY KEY,  
    VARIABLE_VALUE VARCHAR,             
    LAST_UPDATED_DATE TIMESTAMP,       
    LAST_UPDATED_BY VARCHAR             
);

INSERT INTO HAVEN_STAGING.REVENUE_MANAGEMENT_STAGING.TARGET_TOOL_CONFIG
    (VARIABLE_NAME, VARIABLE_VALUE, LAST_UPDATED_DATE, LAST_UPDATED_BY)
VALUES
    ('break_targets_version_id', '55', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('model_label', '2024 budgets with 2022 bkgs/canc/prices', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('budget_data_version_id', '18', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('cancellations_data_version_id', '9', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('stay_price_adjustment_version_id', '9', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('optimiser_price_data_version_id', '3', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('optimiser_volume_data_version_id', '25', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('break_lookup_version_id', '11', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('source_lookup_version_id', '1', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('calendar_lookup_version_id', '7', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('break_segmentation_lookup_version_id', '11', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('deluxe_price_version_id', '2', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('year_1_go_live_date', '2022-12-06', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('year_2_go_live_date', '2023-12-14', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('year_3_go_live_date', '2024-12-15', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('lead_time_weeks', '60', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('transactions_description', '2022 bookings', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('transactions_arrival_from', '2022-03-01', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('transactions_arrival_to', '2022-11-30', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('price_description', '2022 bronze price', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('price_arrival_from', '2024-03-01', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('price_arrival_to', '2024-11-30', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('price_var_min', '0.7', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('price_var_max', '0.97', CURRENT_TIMESTAMP(), 'SYSTEM'),
    ('target_start_date', '2025-04-03', CURRENT_TIMESTAMP(), 'SYSTEM');



