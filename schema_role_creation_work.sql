-- 21/01/2026

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;
call haven_master.procedures.schema_role_creation('haven_raw', 'revenue_management_file_uploads');
call haven_master.procedures.schema_role_creation('haven_base', 'revenue_management_file_uploads');

call haven_master.procedures.schema_role_creation('haven_raw', 'revenue_management_systems_file_uploads');
call haven_master.procedures.schema_role_creation('haven_base', 'revenue_management_systems_file_uploads');

call haven_master.procedures.schema_role_creation('haven_raw', 'PERFORMANCE_MARKETING_FILE_UPLOADS');
call haven_master.procedures.schema_role_creation('haven_base', 'PERFORMANCE_MARKETING_FILE_UPLOADS');

-- 21/01/2026

use role HAVEN_DBT_TRANSFORM;
grant ownership ON schema haven_store.arcades to role haven_schema_setup REVOKE CURRENT GRANTS;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;
call haven_master.procedures.schema_role_creation('haven_store', 'arcades');


-- 20/01/2026

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;

call haven_master.procedures.schema_role_creation('haven_staging', 'revenue_management_file_uploads');
call haven_master.procedures.schema_role_creation('haven_staging_dev', 'revenue_management_file_uploads');


-- 15/01/2026

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;

call haven_master.procedures.schema_role_creation('haven_master_dev', 'notifications');


-- 14/01/2026

use role HAVEN_DBT_TRANSFORM_DEV;
grant ownership ON schema haven_store_dev.epos_sales to role haven_schema_setup REVOKE CURRENT GRANTS;
use role HAVEN_DBT_TRANSFORM_QAT;
grant ownership ON schema haven_store_qat.epos_sales to role haven_schema_setup REVOKE CURRENT GRANTS;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;
call haven_master.procedures.schema_role_creation('haven_store_dev', 'epos_sales');
call haven_master.procedures.schema_role_creation('haven_store_qat', 'epos_sales');
call haven_master.procedures.schema_role_creation('haven_store', 'epos_sales');


-- 12/01/2026

use role HAVEN_DBT_TRANSFORM_DEV;
grant ownership ON schema haven_store_dev.arcades to role haven_schema_setup REVOKE CURRENT GRANTS;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;
call haven_master.procedures.schema_role_creation('haven_store_dev', 'arcades');
call haven_master.procedures.schema_role_creation('haven_store_qat', 'arcades');

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;

select * from auditlog where lower(schema_name) = 'playsafe';

-- 09/01/2026


use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;

drop schema haven_raw.erpx_fpa;
drop schema haven_base.erpx_fpa;

drop role _HAVEN_BASE__ERPX_FPA__CREATOR;
drop role _HAVEN_BASE__ERPX_FPA__OWNER;
drop role _HAVEN_BASE__ERPX_FPA__READER;
drop role _HAVEN_BASE__ERPX_FPA__USAGE;
drop role _HAVEN_BASE__ERPX_FPA__WRITER;
drop role _HAVEN_RAW__ERPX_FPA__CREATOR;
drop role _HAVEN_RAW__ERPX_FPA__OWNER;
drop role _HAVEN_RAW__ERPX_FPA__READER;
drop role _HAVEN_RAW__ERPX_FPA__USAGE;
drop role _HAVEN_RAW__ERPX_FPA__WRITER;

show roles like '%fpa_erpx%';

show roles like '%erpx_fpa%';

call haven_master.procedures.schema_role_creation('haven_raw', 'fpa_erpx');
call haven_master.procedures.schema_role_creation('haven_base', 'fpa_erpx');



-- 09/01/2026

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;

call haven_master.procedures.schema_role_creation('haven_master', 'notifications');

-- 07/01/2026

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;

call haven_master.procedures.schema_role_creation('haven_store_rms_dev', 'rms_shared_resources');
call haven_master.procedures.schema_role_creation('haven_store_rms_dev', 'rms_target_clustering');
call haven_master.procedures.schema_role_creation('haven_store_rms_dev', 'cyhh_pricing_pilot_reporting');
call haven_master.procedures.schema_role_creation('haven_store_rms_dev', 'flex_calculator');
call haven_master.procedures.schema_role_creation('haven_store_rms_dev', 'employees_member_benefit');
call haven_master.procedures.schema_role_creation('haven_store_rms_dev', 'part_exchange_model');

call haven_master.procedures.schema_role_creation('haven_staging_rms_dev', 'rms_shared_resources');
call haven_master.procedures.schema_role_creation('haven_staging_rms_dev', 'rms_target_clustering');
call haven_master.procedures.schema_role_creation('haven_staging_rms_dev', 'cyhh_pricing_pilot_reporting');
call haven_master.procedures.schema_role_creation('haven_staging_rms_dev', 'flex_calculator');
call haven_master.procedures.schema_role_creation('haven_staging_rms_dev', 'employees_member_benefit');
call haven_master.procedures.schema_role_creation('haven_staging_rms_dev', 'part_exchange_model');
call haven_master.procedures.schema_role_creation('haven_staging_rms_dev', 'decision_matrix_reporting');

use role HAVEN_DBT_DEVELOPMENT_RMS;
grant ownership ON schema haven_store_rms_dev.decision_matrix_reporting to role haven_schema_setup REVOKE CURRENT GRANTS;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;
call haven_master.procedures.schema_role_creation('haven_store_rms_dev', 'decision_matrix_reporting');

use role HAVEN_DBT_DEVELOPMENT_RMS;
grant ownership ON schema Haven_store_rms_dev.pricer_decision_matrix to role haven_schema_setup REVOKE CURRENT GRANTS;
grant ownership ON schema Haven_staging_rms_dev.pricer_decision_matrix_staging to role haven_schema_setup REVOKE CURRENT GRANTS;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;
call haven_master.procedures.schema_role_creation('Haven_store_rms_dev', 'pricer_decision_matrix');
call haven_master.procedures.schema_role_creation('Haven_staging_rms_dev', 'pricer_decision_matrix_staging');

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;
call haven_master.procedures.schema_role_creation('haven_raw', 'erpx_fpa');
call haven_master.procedures.schema_role_creation('haven_base', 'erpx_fpa');


-- 18/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;
call haven_master.procedures.schema_role_creation('haven_staging_dev', 'revenue_management_file_uploads');
call haven_master.procedures.schema_role_creation('haven_staging', 'revenue_management_file_uploads');

grant role _haven_staging_dev__revenue_management_file_uploads__creator to role streamlit_file_upload_application_dev;
grant role _haven_staging__revenue_management_file_uploads__creator to role streamlit_file_upload_application;


-- 17/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
revoke usage on procedure haven_master.procedures.schema_role_creation(string, string) from role streamlit_file_upload_application_dev;


-- 16/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_work', 'sigma_test');


-- 16/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
grant usage on procedure haven_master.procedures.schema_role_creation(string, string) to role streamlit_file_upload_application_dev;


-- 15/12/2024

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_master', 'openflow_events');

grant role _haven_master__openflow_events__usage to role openflowadmin;

use role accountadmin;

grant create event table on schema haven_master.openflow_events to role openflowadmin;

-- 11/12/2024

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;

grant usage on procedure haven_master.procedures.schema_role_creation(string, string) to role haven_dbt_transform_dev;
grant usage on procedure haven_master.procedures.schema_role_creation(string, string) to role haven_dbt_transform_qat;

call haven_master.procedures.schema_role_creation('haven_store_dev', 'data_build_tool_artifacts');
call haven_master.procedures.schema_role_creation('haven_store_qat', 'data_build_tool_artifacts');
call haven_master.procedures.schema_role_creation('haven_store', 'data_build_tool_artifacts');

use schema haven_master.procedures;

show tables;

desc table auditlog;

select * from auditlog where lower(schema_name) = 'customer'
order by completion_time desc;



-- 10/12/2025

use role haven_dbt_transform_dev;

grant ownership ON schema haven_store_dev.lettings to role haven_schema_setup REVOKE CURRENT GRANTS;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_store_dev', 'lettings');


-- 05/12/2025

use role haven_dbt_transform;

grant ownership ON schema haven_store.rms_pricer_base to role haven_schema_setup REVOKE CURRENT GRANTS;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_store', 'rms_pricer_base');

grant role _haven_store__rms_pricer_base__reader to role HAVEN_DBT_DEVELOPMENT_ALIGN_ALYTICS;

-- 28/11/2025
use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('training', 'call_centre');


-- 28/11/2025
use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_staging', 'performance_marketing_file_uploads');
call haven_master.procedures.schema_role_creation('haven_staging_dev', 'performance_marketing_file_uploads');
call haven_master.procedures.schema_role_creation('haven_staging_qat', 'performance_marketing_file_uploads');


-- 24/11/2025
use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_raw', 'performance_marketing_file_uploads');
call haven_master.procedures.schema_role_creation('haven_base', 'performance_marketing_file_uploads');

show roles like '_haven_store_qat__performance_marketing_file_uploads%';


drop role _HAVEN_RAW__PERFORMANCE_MARKETING_FILE_UPLOADS__CREATOR;
drop role _HAVEN_RAW__PERFORMANCE_MARKETING_FILE_UPLOADS__OWNER;
drop role _HAVEN_RAW__PERFORMANCE_MARKETING_FILE_UPLOADS__READER;
drop role _HAVEN_RAW__PERFORMANCE_MARKETING_FILE_UPLOADS__USAGE;
drop role _HAVEN_RAW__PERFORMANCE_MARKETING_FILE_UPLOADS__WRITER;

drop role _HAVEN_BASE__PERFORMANCE_MARKETING_FILE_UPLOADS__CREATOR;
drop role _HAVEN_BASE__PERFORMANCE_MARKETING_FILE_UPLOADS__OWNER;
drop role _HAVEN_BASE__PERFORMANCE_MARKETING_FILE_UPLOADS__READER;
drop role _HAVEN_BASE__PERFORMANCE_MARKETING_FILE_UPLOADS__USAGE;
drop role _HAVEN_BASE__PERFORMANCE_MARKETING_FILE_UPLOADS__WRITER;

drop role _HAVEN_STORE__PERFORMANCE_MARKETING_FILE_UPLOADS__CREATOR;
drop role _HAVEN_STORE__PERFORMANCE_MARKETING_FILE_UPLOADS__OWNER;
drop role _HAVEN_STORE__PERFORMANCE_MARKETING_FILE_UPLOADS__READER;
drop role _HAVEN_STORE__PERFORMANCE_MARKETING_FILE_UPLOADS__USAGE;
drop role _HAVEN_STORE__PERFORMANCE_MARKETING_FILE_UPLOADS__WRITER;

drop role _HAVEN_STORE_DEV__PERFORMANCE_MARKETING_FILE_UPLOADS__CREATOR;
drop role _HAVEN_STORE_DEV__PERFORMANCE_MARKETING_FILE_UPLOADS__OWNER;
drop role _HAVEN_STORE_DEV__PERFORMANCE_MARKETING_FILE_UPLOADS__READER;
drop role _HAVEN_STORE_DEV__PERFORMANCE_MARKETING_FILE_UPLOADS__USAGE;
drop role _HAVEN_STORE_DEV__PERFORMANCE_MARKETING_FILE_UPLOADS__WRITER;

drop schema haven_raw.performance_marketing_file_uploads;
drop schema haven_base.performance_marketing_file_uploads;
drop schema haven_store_dev.performance_marketing_file_uploads;
drop schema haven_store.performance_marketing_file_uploads;



-- 26/11/2025
use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_base', 'eight_by_eight');

-- 26/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_raw', 'eight_by_eight');

use role securityadmin;
revoke role _haven_raw__eight_by_eight__creator from role haven_etleap_dataload;
grant role _haven_raw__eight_by_eight__creator to role haven_batch_dataload;

--BD78472_SFCRole=2_gJm7uXg3KUeiGBtkW2qBjLMwAsp=
--BD78472_SFCRole=2_xlFYenvUD6B4BcRlu7Asp4uTCSY=

use role accountadmin;

show integrations;

desc integration AWS_S3_DIGITAL_OWNERSHIP_INTEGRATION_PROD;


-- 26/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_store', 'park_incidents');
call haven_master.procedures.schema_role_creation('haven_store_dev', 'park_incidents');
call haven_master.procedures.schema_role_creation('haven_store_qat', 'park_incidents');



-- 24/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_store', 'performance_marketing_file_uploads');
call haven_master.procedures.schema_role_creation('haven_store_dev', 'performance_marketing_file_uploads');

show roles like '_%__performance_merket%';

drop role _HAVEN_MASTER__PERFORMANCE_MERKETING_FILE_UPLOADS__CREATOR;
drop role _HAVEN_MASTER__PERFORMANCE_MERKETING_FILE_UPLOADS__OWNER;
drop role _HAVEN_MASTER__PERFORMANCE_MERKETING_FILE_UPLOADS__READER;
drop role _HAVEN_MASTER__PERFORMANCE_MERKETING_FILE_UPLOADS__USAGE;
drop role _HAVEN_MASTER__PERFORMANCE_MERKETING_FILE_UPLOADS__WRITER;
drop role _HAVEN_STORE_DEV__PERFORMANCE_MERKETING_FILE_UPLOADS__CREATOR;
drop role _HAVEN_STORE_DEV__PERFORMANCE_MERKETING_FILE_UPLOADS__OWNER;
drop role _HAVEN_STORE_DEV__PERFORMANCE_MERKETING_FILE_UPLOADS__READER;
drop role _HAVEN_STORE_DEV__PERFORMANCE_MERKETING_FILE_UPLOADS__USAGE; 
drop role _HAVEN_STORE_DEV__PERFORMANCE_MERKETING_FILE_UPLOADS__WRITER; 
drop role _HAVEN_STORE__PERFORMANCE_MERKETING_FILE_UPLOADS__CREATOR ;
drop role _HAVEN_STORE__PERFORMANCE_MERKETING_FILE_UPLOADS__OWNER; 
drop role _HAVEN_STORE__PERFORMANCE_MERKETING_FILE_UPLOADS__READER; 
drop role _HAVEN_STORE__PERFORMANCE_MERKETING_FILE_UPLOADS__USAGE ;
drop role _HAVEN_STORE__PERFORMANCE_MERKETING_FILE_UPLOADS__WRITER ;


drop schema haven_store.performance_merketing_file_uploads;
drop schema haven_master.performance_merketing_file_uploads;
drop schema haven_store_dev.performance_merketing_file_uploads;


-- 14/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_data_science_DEV', 'rota_scheduling');
call haven_master.procedures.schema_role_creation('haven_data_science_DEV', 'test_rota_scheduling');

revoke role _haven_data_science_dev__rota_scheduling__creator from role haven_data_science_dev;
revoke role _haven_data_science_dev__test_rota_scheduling__creator from role haven_data_science_dev;

grant role _haven_data_science_dev__rota_scheduling__creator to role haven_dbt_transform_data_science_dev;
grant role _haven_data_science_dev__test_rota_scheduling__creator to role haven_dbt_transform_data_science_dev;

show grants to role haven_dbt_transform_data_science_dev;

use role securityadmin;

revoke create service on schema haven_data_science_dev.rota_scheduling from role haven_data_science_dev;
revoke create task on schema haven_data_science_dev.rota_scheduling from role haven_data_science_dev;

revoke create service on schema haven_data_science_dev.test_rota_scheduling from role haven_data_science_dev;
revoke create task on schema haven_data_science_dev.test_rota_scheduling from role haven_data_science_dev;

grant create service on schema haven_data_science_dev.rota_scheduling to role haven_dbt_transform_data_science_dev;
grant create task on schema haven_data_science_dev.rota_scheduling to role haven_dbt_transform_data_science_dev;

grant create service on schema haven_data_science_dev.test_rota_scheduling to role haven_dbt_transform_data_science_dev;
grant create task on schema haven_data_science_dev.test_rota_scheduling to role haven_dbt_transform_data_science_dev;


-- 14/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_data_science', 'rota_scheduling');

show grants of role _haven_data_science__rota_scheduling_footfall__reader;
show grants of role _haven_data_science__rota_scheduling__reader;
grant role _haven_data_science__rota_scheduling__reader to role haven_data_science;

show grants of role _haven_data_science__rota_scheduling_footfall__creator;
show grants of role _haven_data_science__rota_scheduling__creator;
grant role _haven_data_science__rota_scheduling__creator to role HAVEN_ROTA_SCHEDULING;

show grants on schema haven_data_science.rota_scheduling_footfall;

use role securityadmin;

grant create service on schema haven_data_science.rota_scheduling to role HAVEN_ROTA_SCHEDULING;
grant create task on schema haven_data_science.rota_scheduling to role HAVEN_ROTA_SCHEDULING;

show grants on schema haven_data_science.rota_scheduling;



-- 12/11/2025

grant role _haven_kpmg_analysis__schema to role haven_data_engineering;
grant role _haven_kpmg_analysis__schema to role haven_dbt_development;


-- 12/11/2025
-- New Master database setup

use role securityadmin;

grant role _haven_master_dev__schema to role haven_schema_setup;
grant role _haven_master_qat__schema to role haven_schema_setup;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;

drop role _haven_master_dev__streamlits__usage;
drop role _haven_master_dev__streamlits__reader;
drop role _haven_master_dev__streamlits__writer;
drop role _haven_master_dev__streamlits__creator;
drop role if exists _haven_master_dev__streamlits__owner;

drop role _haven_master_QAT__streamlits__usage;
drop role _haven_master_qat__streamlits__reader;
drop role _haven_master_qat__streamlits__writer;
drop role _haven_master_qat__streamlits__creator;
drop role if exists _haven_master_qat__streamlits__owner;
 
call haven_master.procedures.schema_role_creation('haven_master_dev', 'streamlits');
call haven_master.procedures.schema_role_creation('haven_master_qat', 'streamlits');

grant role _haven_master_dev__streamlits__usage to role haven_dbt_transform_align_alytics_dev;
grant create streamlit on schema haven_master_dev.streamlits to role haven_dbt_transform_align_alytics_dev;
grant role _haven_master_dev__streamlits__creator to role haven_dbt_transform_align_alytics_dev;

-- 12/11/2025

-- RMS_LAUNCH_PRICE_TOOL

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_staging', 'RMS_LAUNCH_PRICE_TOOL');
call haven_master.procedures.schema_role_creation('haven_semantic', 'RMS_LAUNCH_PRICE_TOOL');
call haven_master.procedures.schema_role_creation('haven_store', 'RMS_LAUNCH_PRICE_TOOL');

call haven_master.procedures.schema_role_creation('haven_staging_aa_dev', 'RMS_LAUNCH_PRICE_TOOL');
call haven_master.procedures.schema_role_creation('haven_semantic_aa_dev', 'RMS_LAUNCH_PRICE_TOOL');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'RMS_LAUNCH_PRICE_TOOL');


-- 10/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_staging', 'rms_reporting_grade');
call haven_master.procedures.schema_role_creation('haven_semantic', 'rms_reporting_grade');

call haven_master.procedures.schema_role_creation('haven_semantic', 'rms_reporting_grade');

show grants of role _haven_semantic__rms_reporting_grade__creator;

-- 06/11/2025

-- HAVEN_STORE_AA_DEV.RMS_LAUNCH_PRICE_TOOL

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('HAVEN_STORE_AA_DEV', 'RMS_LAUNCH_PRICE_TOOL');


-- 05/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_store_dev', 'caravans_sale_restricted');
call haven_master.procedures.schema_role_creation('haven_store_qat', 'caravans_sale_restricted');



-- 05/11/2025

use role sysadmin;

grant ownership on schema haven_pipeline.marketing to role haven_schema_setup revoke current grants;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_pipeline', 'marketing');

use role securityadmin;

grant role _haven_pipeline__marketing__creator to role haven_dbt_pipeline;


-- 05/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_semantic', 'rms_pricer_common');

use role securityadmin;

grant role _haven_semantic__rms_pricer_common__creator to role haven_dbt_transform;


-- 03/11/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_store', 'caravans_sale_restricted');

use role sysadmin;
grant ownership on schema haven_store_dev.weather to role haven_schema_setup revoke current grants;


-- 23/10/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_raw', 'dig_digital_pass');
call haven_master.procedures.schema_role_creation('haven_base', 'dig_digital_pass');

use role securityadmin;

grant role _haven_raw__dig_digital_pass__creator to role haven_etleap_dataload;

use role dba;

show grants of role  _haven_raw__dig_digital_pass__creator;

-- 23/10/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_raw', 'google_cm360');

use role securityadmin;

grant role _haven_raw__google_cm360__creator to role haven_etleap_dataload;


-- 16/10/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_store', 'rms_pricer_forecast');


-- 15/10/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_store_qat', 'weather');

use role sysadmin;
grant ownership on schema haven_store_dev.weather to role haven_schema_setup revoke current grants;

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_store_dev', 'weather');

call haven_master.procedures.schema_role_creation('haven_raw', 'dig_ownership_lettings');

drop schema haven_raw.dig_oenership_lettings;


show roles like '%dig_oenership_lettings%';

drop role _HAVEN_RAW__DIG_OENERSHIP_LETTINGS__CREATOR;
drop role _HAVEN_RAW__DIG_OENERSHIP_LETTINGS__OWNER;
drop role _HAVEN_RAW__DIG_OENERSHIP_LETTINGS__READER;
drop role _HAVEN_RAW__DIG_OENERSHIP_LETTINGS__USAGE;
drop role _HAVEN_RAW__DIG_OENERSHIP_LETTINGS__WRITER;

call haven_master.procedures.schema_role_creation('haven_raw', 'dig_ownership_lettings_pricing');
call haven_master.procedures.schema_role_creation('haven_raw', 'dig_ownership_lettings_renewal');

grant role _haven_raw__dig_ownership_lettings__creator to role haven_etleap_dataload;
grant role _haven_raw__dig_ownership_lettings_pricing__creator to role haven_etleap_dataload;
grant role _haven_raw__dig_ownership_lettings_renewal__creator to role haven_etleap_dataload;

call haven_master.procedures.schema_role_creation('haven_base', 'dig_ownership_lettings');


-- Older Schema creation

use schema haven_master.procedures;

use role dba;

call haven_master.procedures.schema_role_creation('haven_pipeline', 'google_tentacles');
call haven_master.procedures.schema_role_creation('haven_store_dev', 'retail_franchise');
call haven_master.procedures.schema_role_creation('haven_store', 'part_exchange');

call haven_master.procedures.schema_role_creation('haven_store_dev', 'cyhh_reporting_pitch_bookings_by_price');
call haven_master.procedures.schema_role_creation('haven_store_qat', 'cyhh_reporting_pitch_bookings_by_price');
call haven_master.procedures.schema_role_creation('haven_master', 'tag_admin');
call haven_master.procedures.schema_role_creation('haven_master', 'etleap_status');
call haven_master.procedures.schema_role_creation('haven_raw', 'iclean_etleap');
call haven_master.procedures.schema_role_creation('haven_raw', 'prime');

call haven_master.procedures.schema_role_creation('haven_store', 'CYHH_PRICING_CONFIG');
call haven_master.procedures.schema_role_creation('haven_pipeline', 'CYHH_PRICING_PILOT');

call haven_master.procedures.schema_role_creation('haven_master', 'git_integration');

grant ownership on schema haven_pipeline_qat.fpa_erpx to role haven_schema_setup revoke current grants;

call haven_master.procedures.schema_role_creation('haven_pipeline_qat', 'FPA_ERPX');

grant ownership on schema haven_pipeline.fpa_erpx to role haven_schema_setup revoke current grants;

call haven_master.procedures.schema_role_creation('haven_pipeline', 'FPA_ERPX');


call haven_master.procedures.schema_role_creation('haven_raw', 'payment_service');
call haven_master.procedures.schema_role_creation('haven_base', 'payment_service');

call haven_master.procedures.schema_role_creation('haven_pipeline_dev', 'cyhh_pricing_pilot');
call haven_master.procedures.schema_role_creation('haven_pipeline', '');


use database haven_pipeline_dev;

show schemas;

use role accountadmin;

grant ownership ON schema haven_pipeline_dev.cyhh_pricing_pilot to role haven_schema_setup REVOKE CURRENT GRANTS;

show tables;
USE ROLE DBA;

call haven_master.procedures.schema_role_creation('haven_pipeline_dev', 'cyhh_pricing_pilot');
show roles like '%cyhh_pricing_pilot%';

call haven_master.procedures.schema_role_creation('haven_staging_dev', 'cyhh_pricing_pilot_staging');

call haven_master.procedures.schema_role_creation('haven_store_dev', 'cyhh_pricing_pilot_reporting');

SHOW ROLES LIKE '%DECISION_MATRIX%';
call haven_master.procedures.schema_role_creation('haven_staging_dev', 'decision_matrix_staging');

call haven_master.procedures.schema_role_creation('haven_staging_dev', 'pricer_decision_matrix_staging');

call haven_master.procedures.schema_role_creation('haven_store_dev', 'flex_calculator');
call haven_master.procedures.schema_role_creation('haven_staging_dev', 'flex_calculator_staging');

call haven_master.procedures.schema_role_creation('haven_pipeline_dev', 'Employees_Member_Benefit');

call haven_master.procedures.schema_role_creation('haven_staging_dev', 'Employees_Member_Benefit_staging');

call haven_master.procedures.schema_role_creation('haven_staging_dev', 'caravan_sales_pricing_application_staging');

call haven_master.procedures.schema_role_creation('haven_store_dev', 'part_exchange_model');

call haven_master.procedures.schema_role_creation('haven_staging_dev', 'part_exchange_model_staging');

call haven_master.procedures.schema_role_creation('haven_store_dev', 'decision_matrix_reporting');

call haven_master.procedures.schema_role_creation('haven_staging_dev', 'decision_matrix_reporting_staging');

call haven_master.procedures.schema_role_creation('haven_store_dev', 'rms_shared_resources');



grant usage on PROCEDURE haven_master.procedures.schema_role_creation(string, string) to role dba;


use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;

use schema haven_master.procedures;

use role dba;

call haven_master.procedures.schema_role_creation('haven_pipeline', 'google_tentacles');
call haven_master.procedures.schema_role_creation('haven_store_dev', 'retail_franchise');
call haven_master.procedures.schema_role_creation('haven_store', 'part_exchange');

show grants to role haven_data_engineering;

revoke role _haven_data_engineering__streamlits__usage from role haven_data_engineering;
grant role _haven_data_engineering__streamlits__creator to role haven_data_engineering;
grant create streamlit on schema haven_data_engineering.streamlits to role haven_data_engineering;

revoke role _haven_data_engineering__streamlits__usage from role haven_streamlit_dev;
grant role _haven_data_engineering__streamlits__creator to role haven_streamlit_dev;
grant create streamlit on schema haven_data_engineering.streamlits to role haven_streamlit_dev;

grant usage on procedure test_schema_creation(string, string) to role dba;

create OR REPLACE table haven_master.procedures.auditlog (
database_name varchar(),
schema_name varchar(),
EXECUTION_LOG varchar(),
completion_time timestamp_ltz default current_timestamp);

select * from haven_master.procedures.auditlog;

show roles like 'haven_dbt_transform_%';

use role useradmin;

alter role HAVEN_DBT_TRANSFORM__PRICER_DEV rename to HAVEN_DBT_TRANSFORM_PRICER_DEV;
alter role HAVEN_DBT_TRANSFORM__PRICER_PROD rename to HAVEN_DBT_TRANSFORM_PRICER_PROD;
alter role HAVEN_DBT_TRANSFORM__PRICER_QAT rename to HAVEN_DBT_TRANSFORM_PRICER_QAT;
alter role HAVEN_DBT_TRANSFORM__PRICER_TEST rename to HAVEN_DBT_TRANSFORM_PRICER_TEST;


-- 21/07/2025

USE ROLE DBA;
use database haven_pipeline_qat;

show schemas;
grant ownership on schema haven_pipeline_qat.cyhh_pricing_pilot to role haven_schema_setup revoke current grants;

call haven_master.procedures.schema_role_creation('haven_pipeline_qat', 'cyhh_pricing_pilot');
show roles like '%cyhh_pricing_pilot%';

call haven_master.procedures.schema_role_creation('haven_staging_qat', 'cyhh_pricing_pilot_staging');

call haven_master.procedures.schema_role_creation('haven_store_qat', 'cyhh_pricing_pilot_reporting');

SHOW ROLES LIKE '%DECISION_MATRIX%';
grant ownership on schema haven_staging_qat.decision_matrix_staging to role haven_schema_setup revoke current grants;
call haven_master.procedures.schema_role_creation('haven_staging_qat', 'decision_matrix_staging');

call haven_master.procedures.schema_role_creation('haven_staging_qat', 'pricer_decision_matrix_staging');

call haven_master.procedures.schema_role_creation('haven_store_qat', 'flex_calculator');
call haven_master.procedures.schema_role_creation('haven_staging_qat', 'flex_calculator_staging');

call haven_master.procedures.schema_role_creation('haven_pipeline_qat', 'Employees_Member_Benefit');

call haven_master.procedures.schema_role_creation('haven_staging_qat', 'Employees_Member_Benefit_staging');

call haven_master.procedures.schema_role_creation('haven_staging_qat', 'caravan_sales_pricing_application_staging');
call haven_master.procedures.schema_role_creation('haven_store_qat', 'caravan_sales_pricing_application');

call haven_master.procedures.schema_role_creation('haven_store_qat', 'part_exchange_model');

call haven_master.procedures.schema_role_creation('haven_staging_qat', 'part_exchange_model_staging');

call haven_master.procedures.schema_role_creation('haven_store_qat', 'decision_matrix_reporting');

call haven_master.procedures.schema_role_creation('haven_staging_qat', 'decision_matrix_reporting_staging');

call haven_master.procedures.schema_role_creation('haven_store_qat', 'rms_shared_resources');

--- production

USE ROLE DBA;

grant ownership on schema haven_pipeline.cyhh_pricing_pilot to role haven_schema_setup revoke current grants;
call haven_master.procedures.schema_role_creation('haven_pipeline', 'cyhh_pricing_pilot');
show roles like '%cyhh_pricing_pilot%';

call haven_master.procedures.schema_role_creation('haven_staging', 'cyhh_pricing_pilot_staging');

call haven_master.procedures.schema_role_creation('haven_store', 'cyhh_pricing_pilot_reporting');

SHOW ROLES LIKE '%DECISION_MATRIX%';
grant ownership on schema haven_staging.decision_matrix_staging to role haven_schema_setup revoke current grants;
call haven_master.procedures.schema_role_creation('haven_staging', 'decision_matrix_staging');

call haven_master.procedures.schema_role_creation('haven_staging', 'pricer_decision_matrix_staging');

call haven_master.procedures.schema_role_creation('haven_store', 'flex_calculator');
call haven_master.procedures.schema_role_creation('haven_staging', 'flex_calculator_staging');

call haven_master.procedures.schema_role_creation('haven_pipeline', 'Employees_Member_Benefit');

call haven_master.procedures.schema_role_creation('haven_staging', 'Employees_Member_Benefit_staging');

call haven_master.procedures.schema_role_creation('haven_staging', 'caravan_sales_pricing_application_staging');
grant ownership on schema haven_store.caravan_sales_pricing_application to role haven_schema_setup revoke current grants;
call haven_master.procedures.schema_role_creation('haven_store', 'caravan_sales_pricing_application');

call haven_master.procedures.schema_role_creation('haven_store', 'part_exchange_model');

call haven_master.procedures.schema_role_creation('haven_staging', 'part_exchange_model_staging');

call haven_master.procedures.schema_role_creation('haven_store', 'decision_matrix_reporting');

call haven_master.procedures.schema_role_creation('haven_staging', 'decision_matrix_reporting_staging');

call haven_master.procedures.schema_role_creation('haven_store', 'rms_shared_resources');

--29/07/2025

call haven_master.procedures.schema_role_creation('haven_pipeline', 'COMMERCIAL_PRIORITY_SCORING');

--31/07/2025

call haven_master.procedures.schema_role_creation('HAVEN_STAGING', 'customer_staging');

grant ownership on schema haven_store.customer to role haven_schema_setup revoke current grants;
call haven_master.procedures.schema_role_creation('HAVEN_store', 'customer');

revoke usage on schema haven_store.customer from role _haven_store__usage;

-- 21/08/2025

call haven_master.procedures.schema_role_creation('HAVEN_base', 'oecd');
call haven_master.procedures.schema_role_creation('HAVEN_base', 'cybersyn');

use role securityadmin;
grant role _haven_data_science__usage to role haven_schema_setup;
grant role _haven_data_science__schema to role haven_schema_setup;

use role dba;
call haven_master.procedures.schema_role_creation('haven_data_science', 'data_science');
call haven_master.procedures.schema_role_creation('haven_data_science', 'rota_scheduling_footfall');
call haven_master.procedures.schema_role_creation('haven_data_science', 'rota_scheduling_revenue_fb');

call haven_master.procedures.schema_role_creation('haven_store', 'park_database');

-- 22-08-2025

use role securityadmin;
grant role _haven_data_science__usage to role haven_schema_setup;
grant role _haven_data_science_dev__schema to role haven_schema_setup;

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_data_science_dev', 'notebooks');
call haven_master.procedures.schema_role_creation('haven_data_science_dev', 'data_science');

-- 05/09/2025

use role dba;

use role securityadmin;

grant ownership on schema haven_store_dev.rms_pricer to role haven_schema_setup revoke current grants;

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_store_dev', 'rms_pricer');

use role securityadmin;

grant create task on schema haven_store_dev.rms_pricer to role haven_dbt_transform_rms_pricer_dev;
grant role _haven_store_dev__rms_pricer__creator to role haven_dbt_transform_rms_pricer_dev;

show grants to role haven_dbt_transform_rms_pricer_dev;


-- 10/09/2025

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_raw', 'freshdesk');
call haven_master.procedures.schema_role_creation('haven_base', 'freshdesk');

grant role _haven_raw__freshdesk__creator to role haven_etleap_dataload;

-- 11/09/2025

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_store', 'finance');
call haven_master.procedures.schema_role_creation('haven_store_dev', 'finance');
call haven_master.procedures.schema_role_creation('haven_store_qat', 'finance');

-- 12/09/2025

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_raw', 'customer_verification');
call haven_master.procedures.schema_role_creation('haven_base', 'customer_verification');

grant role _haven_raw__customer_verification__creator to role haven_etleap_dataload;

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_raw', 'ethyca_fides');
call haven_master.procedures.schema_role_creation('haven_base', 'ethyca_fides');

grant role _haven_raw__ethyca_fides__creator to role haven_etleap_dataload;

-- 15/09/2025

use role securityadmin;

grant create schema on database haven_store_aa_dev to role haven_schema_setup;
grant create schema on database haven_staging_aa_dev to role haven_schema_setup;
grant create schema on database haven_pipeline_aa_dev to role haven_schema_setup;

use role haven_schema_setup;

call haven_master.procedures.schema_role_creation('haven_staging_aa_dev', 'dms_staging');
call haven_master.procedures.schema_role_creation('haven_staging_aa_dev', 'rm_staging');
call haven_master.procedures.schema_role_creation('haven_staging_aa_dev', 'revenue_management_output');
call haven_master.procedures.schema_role_creation('haven_staging_aa_dev', 'revenue_management_staging');

call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'haven_staging');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'output_history');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'pricer');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'pricer_forecast');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'storage');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'revenue_management_reporting');


call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'availability');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'commercial');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'common');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'ocandc');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'trooper');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'trooper2');

call haven_master.procedures.schema_role_creation('haven_pipeline_aa_dev', 'px0006_blueyonder_pricer');

-- 16/09/2025

use role securityadmin;

grant ownership on schema haven_store_aa_dev.rms_pricer to role haven_schema_setup revoke current grants;

use role haven_schema_setup;

call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'rms_pricer');
call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'event_data');

-- 17/09/2025

use role securityadmin;

grant usage on procedure haven_master.procedures.schema_role_creation(string, string) to role haven_dbt_transform;
grant role _haven_master__procedures__reader to role haven_dbt_transform;

use role haven_dbt_transform;

-- 17/09/2025

use role haven_schema_setup;

call haven_master.procedures.schema_role_creation('haven_store_aa_dev', 'RMS_REPORTING_GRADE');

-- 22/09/2025

use role haven_schema_setup;

call haven_master.procedures.schema_role_creation('haven_raw', 'ZBSDATA_RETAIL_CLOUD');
call haven_master.procedures.schema_role_creation('haven_raw', 'ZBSDATA_COMPLEX_CLOUD');
call haven_master.procedures.schema_role_creation('haven_raw', 'KMSREPORTING_COMPLEX_CLOUD');

use role securityadmin;

grant role _HAVEN_RAW__ZBSDATA_COMPLEX_CLOUD__CREATOR TO ROLE HAVEN_ETLEAP_DATALOAD;
grant role _HAVEN_RAW__ZBSDATA_RETAIL_CLOUD__CREATOR TO ROLE HAVEN_ETLEAP_DATALOAD;
grant role _HAVEN_RAW__KMSREPORTING_COMPLEX_CLOUD__CREATOR TO ROLE HAVEN_ETLEAP_DATALOAD;

-- 02/10/2025

use role sysadmin;
grant ownership on schema haven_store_qat.customer to role haven_schema_setup;

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_store_qat', 'CUSTOMER');

use role securityadmin;

grant role _haven_store_qat__customer__reader to role haven_commercial;

-- 03/10/2025

use role sysadmin;
grant ownership on schema haven_store_qat.iclean to role haven_schema_setup;

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_store_qat', 'iclean');

-- 07/10/2025

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_raw', 'dig_ownership_owners_quote');
call haven_master.procedures.schema_role_creation('haven_base', 'dig_ownership_owners_quote');

use role securityadmin;

grant role _haven_raw__dig_ownership_owners_quote__creator to role haven_etleap_dataload;

use role haven_schema_setup;
call haven_master.procedures.schema_role_creation('haven_raw', 'sports_fixtures');
call haven_master.procedures.schema_role_creation('haven_base', 'sports_fixtures');

use role securityadmin;

grant role _haven_raw__sports_fixtures__creator to role haven_batch_dataload;

-- 09/10/2025

use role haven_schema_setup;

use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_store', 'park_maintenance');

use role haven_schema_setup;

use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_semantic_dev', 'finance_model');

show grants of role _haven_semantic_dev__finance_model__creator;
show grants of role _haven_semantic_dev__finance_model__reader;

drop role _haven_semantic_dev__finance_model__owner;
drop role _haven_semantic_dev__finance_model__creator;
drop role _haven_semantic_dev__finance_model__writer;
drop role _haven_semantic_dev__finance_model__reader;
drop role _haven_semantic_dev__finance_model__usage;

drop schema haven_semantic_dev.finance_model;

-- 10/10/2025

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_store', 'iclean');

call haven_master.procedures.schema_role_creation('haven_store', 'weather');
