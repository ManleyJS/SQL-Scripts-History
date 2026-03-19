use role dba;

CREATE STREAM IF NOT EXISTS HAVEN_STORE_AA_DEV.RMS_PRICER.FCT_HOLIDAY_BOOKINGS_PRORATED_STREAM 
    ON TABLE HAVEN_STORE.HOLIDAY.FCT_HOLIDAY_BOOKINGS_PRORATED
    SHOW_INITIAL_ROWS = FALSE;


CREATE STREAM IF NOT EXISTS HAVEN_STORE.RMS_PRICER.FCT_HOLIDAY_BOOKINGS_PRORATED_STREAM 
    ON TABLE HAVEN_STORE.HOLIDAY.FCT_HOLIDAY_BOOKINGS_PRORATED
    SHOW_INITIAL_ROWS = FALSE;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_data_science_dev', 'owner_churn');
call haven_master.procedures.schema_role_creation('haven_data_science_dev', 'test_owner_churn');

use role securityadmin;

show grants to role _haven_dbt_transform_align_alytics_dev__HAVEN_STORE_AA_DEV__RMS_PRICER__READER;

grant select on table HAVEN_STORE.HOLIDAY.FCT_HOLIDAY_BOOKINGS_PRORATED to role _haven_dbt_transform_align_alytics_dev__HAVEN_STORE_AA_DEV__RMS_PRICER__READER;
grant select on table HAVEN_STORE.HOLIDAY.FCT_HOLIDAY_BOOKINGS_PRORATED to role _haven_dbt_transform__HAVEN_STORE__RMS_PRICER__READER;

use role dba;

grant select on stream HAVEN_STORE_AA_DEV.RMS_PRICER.FCT_HOLIDAY_BOOKINGS_PRORATED_STREAM to role _haven_dbt_transform_align_alytics_dev__HAVEN_STORE_AA_DEV__RMS_PRICER__READER;

grant select on stream HAVEN_STORE.RMS_PRICER.FCT_HOLIDAY_BOOKINGS_PRORATED_STREAM to role _haven_dbt_transform__HAVEN_STORE__RMS_PRICER__READER;

use role dba;

use role securityadmin;

show grants to role _haven_dbt_transform_align_alytics_dev__HAVEN_STORE_AA_DEV__RMS_PRICER__READER;




