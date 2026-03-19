use role dba;

use warehouse haven_dbt_transform_warehouse_medium;

use schema HAVEN_STORE.RMS_REPORTING_GRADE;

create table HAVEN_STORE.RMS_REPORTING_GRADE.CONFIG_UPLOAD_AUDIT as
select * from HAVEN_STORE_AA_DEV.DEV_DBT_RMS_REPORTING_GRADE.CONFIG_UPLOAD_AUDIT where upload_description='Default';

create table HAVEN_STORE.RMS_REPORTING_GRADE.CONFIG_MANUAL_ADJUSTMENTS as 
select * from HAVEN_STORE_AA_DEV.DEV_DBT_RMS_REPORTING_GRADE.CONFIG_MANUAL_ADJUSTMENTS where upload_id=0;

create or replace table HAVEN_STORE.RMS_LAUNCH_PRICE_TOOL.SUPPLEMENTS_ADJUSTMENT as
select * from HAVEN_STORE_AA_DEV.DEV_DBT_RMS_LAUNCH_PRICE_TOOL.SUPPLEMENTS_ADJUSTMENT;

ALTER TABLE HAVEN_STORE.RMS_LAUNCH_PRICE_TOOL.L1_PROCESS_CONTROL_HEADER
ADD COLUMN IS_ACTIVE_QAT BOOLEAN DEFAULT FALSE;

ALTER TABLE HAVEN_STORE.RMS_REPORTING_GRADE.L1_PROCESS_CONTROL_HEADER
ADD COLUMN IS_ACTIVE_QAT BOOLEAN DEFAULT FALSE;

call haven_master.procedures.change_object_ownership(
        'HAVEN_STORE', 'RMS_REPORTING_GRADE', 'HAVEN_DBT_TRANSFORM', 'DBA', 'CONFIG_UPLOAD_AUDIT');

show tables;

call haven_master.procedures.change_object_ownership(
        'HAVEN_STORE', 'RMS_REPORTING_GRADE', 'HAVEN_DBT_TRANSFORM', 'DBA', 'CONFIG_MANUAL_ADJUSTMENTS');

show grants on table HAVEN_STORE.RMS_REPORTING_GRADE.CONFIG_MANUAL_ADJUSTMENTS;        

show tables;

call haven_master.procedures.change_object_ownership(
        'HAVEN_STORE', 'RMS_LAUNCH_PRICE_TOOL', 'HAVEN_DBT_TRANSFORM', 'DBA', 'SUPPLEMENTS_ADJUSTMENT');

insert into HAVEN_STORE.RMS_LAUNCH_PRICE_TOOL.L1_PROCESS_CONTROL_HEADER
select * from HAVEN_STORE_AA_DEV.RMS_LAUNCH_PRICE_TOOL.L1_PROCESS_CONTROL_HEADER where is_active;

create table haven_staging.revenue_management_staging.bookings_friends_family
as select * from align_alytics.revenue_management_storage.bookings_friends_family;

show roles like '_haven_staging__revenue%';