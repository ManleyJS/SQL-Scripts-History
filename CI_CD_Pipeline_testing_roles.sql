use role haven_dbt_transform_dev;

use role dba;

select * from haven_raw.erpx.companies;

show grants to user haven_dbt_transform_test;
show grants to role haven_dbt_transform_test;

show roles like 'haven_dbt_transform%';

show grants to role haven_dbt_transform_dev;

show grants on database haven_store;

show roles like '_HAVEN_STORE__%__READER';

select * from snowflake.account_usage.roles 
where startswith(NAME, '_HAVEN_STORE__')
and deleted_on is null;

use role haven_dbt_transform_dev;

use role dba;

use role useradmin;
show roles like 'haven_data_transform_%';

show grants to user danielcarter;

show grants of role haven_data_transform_dancarter;

-- drop role HAVEN_DATA_TRANSFORM_MOHAMMADZAHURUDDIN;
-- drop role HAVEN_DATA_TRANSFORM_PAULCALO;
-- drop role HAVEN_DATA_TRANSFORM_RUPAMPATHAK;
-- drop role HAVEN_DATA_TRANSFORM_SANTOSHNAIR;

use role securityadmin;

grant role _haven_raw__facebook_etleap__creator to role haven_etleap_dataload;
grant role _haven_raw__bigquery_etleap__creator to role haven_etleap_dataload;

use role dba;

show warehouses like 'haven_dbt_transform_%';

show grants to role haven_dbt_transform_dev;

select * from snowflake.account_usage.query_history
where start_time > '2024-11-28'
and user_name = 'JONATHANMANLEY'
--and execution_status != 'SUCCESS'
order by start_time desc;

use role useradmin;
show users like 'Richard%';

use role haven_commercial;

use role useradmin;

use role dba;

select * from snowflake.account_usage.users where startswith(default_role, 'HAVEN_DATA_TRANSFORM_');
select NAME from snowflake.account_usage.users where startswith(comment, 'Haven Data Foundation');

show roles like 'HAVEN_DATA_TRANSFORM_%';



use role useradmin;
alter user paulcalo set disabled = true;
alter user RUPAMPATHAK set disabled = true;
alter user SANTOSHNAIR set disabled = true;
alter user MOHAMMADZAHURUDDIN set disabled = true;

show users like 'andrewdaw%';
show users like 'daniel%';

ALTER USER ANDREWDAWSON SET COMMENT = 'Haven Data Foundation - Data Engineering Team'; 
ALTER USER DANIELCARTER SET COMMENT = 'Haven Data Foundation - Data Engineering Team'; 
ALTER USER DONATASGEDGAUDAS SET COMMENT = 'Haven Data Foundation - Data Engineering Team'; 
ALTER USER GARYRANSON SET COMMENT = 'Haven Data Foundation - Data Engineering Team'; 
ALTER USER GREGTAYLOR SET COMMENT = 'Haven Data Foundation - Data Engineering Team'; 
ALTER USER JOHNPERING SET COMMENT = 'Haven Data Foundation - Data Engineering Team'; 
ALTER USER JOSEPHMCDONALD SET COMMENT = 'Haven Data Foundation - Data Engineering Team'; 
ALTER USER JUDYSHAO SET COMMENT = 'Haven Data Foundation - Data Engineering Team'; 
ALTER USER NARAYANAVELAGA SET COMMENT = 'Haven Data Foundation - Data Engineering Team'; 
ALTER USER SARUNASJATAUTIS SET COMMENT = 'Haven Data Foundation - Data Engineering Team'; 

use role securityadmin;
ALTER USER GARYRANSON SET COMMENT = 'Haven Data Foundation - Data Engineering Team'; 

use role haven_dbt_transform_dev;

show grants to role haven_dbt_transform_dev;

use role securityadmin;

show grants to role haven_data_transform_johnpering;

show grants of role log_level_admin;

revoke role LOG_LEVEL_ADMIN from role haven_data_transform_johnpering;
revoke role LOG_LEVEL_ADMIN from role haven_data_transform_garyranson;
revoke role LOG_LEVEL_ADMIN from role haven_data_transform_jonathanmanley;

grant role log_level_admin to role haven_data_transform;

use role dba;

show grants to role haven_data_transform_johnpering;

show grants to role log_level_admin;

use role haven_data_transform_jonathanmanley;

select * from haven_master.event_log.LOGGING_EVENTS --152
where resource_attributes:"snow.executable.name" like 'FRESHSALES_RETL%'
and timestamp between current_date()-10 and current_date()
--and timestamp between current_date()-1 and current_date()
--and timestamp between '2024-11-28 01:00:00.817' and '2024-11-28 12:10:49.817'
--and record:"severity_text" like '%ERROR%'
--and value like '%cf_plot_cancellation%'
--and value like '%cf_plot_quote_created_date%'
--and value like '%plot%'
order by timestamp desc;

use role haven_data_transform_josephmcdonald;


show grants to role haven_data_transform_jonathanmanley;

use role securityadmin;

grant role _HAVEN_MASTER__EVENT_LOG__READER to role log_level_admin;
grant role haven_data_transform_abdulkahare to role dba;

use role dba;
use role haven_dbt_transform_dev;

use role dba;

show roles like '_haven_dbt_transform_dev_%';

show grants to role _HAVEN_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL__OPERATOR;

show warehouses like 'haven_dbt_transform_%_%';

use role haven_dbt_transform_dev;

use role securityadmin;

grant role _haven_dbt_transform_dev_warehouse_xsmall__usage to role haven_dbt_transform_dev;

show warehouses;

use role dba;
show grants of role _haven_pipeline_dev__schema;


show grants of role _haven_store_dev__schema;
show grants of role _haven_staging_dev__schema;

show grants to role haven_dbt_transform_qat;

use role securityadmin;
grant role _haven_dbt_transform_qat_warehouse_xsmall__usage to role haven_dbt_transform_qat;
revoke role _haven_pipeline__schema from role HAVEN_DATA_TRANSFORM_ANDREWDAWSON;
revoke role _haven_pipeline__schema from role HAVEN_DATA_TRANSFORM_DANIELCARTER;
revoke role _haven_pipeline__schema from role HAVEN_DATA_TRANSFORM_DONATASGEDGAUDAS;
revoke role _haven_pipeline__schema from role HAVEN_DATA_TRANSFORM_GARYRANSON;
revoke role _haven_pipeline__schema from role HAVEN_DATA_TRANSFORM_GREGTAYLOR;
revoke role _haven_pipeline__schema from role HAVEN_DATA_TRANSFORM_JOHNPERING;
revoke role _haven_pipeline__schema from role HAVEN_DATA_TRANSFORM_JOSEPHMCDONALD;
revoke role _haven_pipeline__schema from role HAVEN_DATA_TRANSFORM_JUDYSHAO;
revoke role _haven_pipeline__schema from role HAVEN_DATA_TRANSFORM_NARAYANAVELAGA;
revoke role _haven_pipeline__schema from role HAVEN_DATA_TRANSFORM_SARUNASJATAUTIS;

revoke role _haven_staging__schema from role HAVEN_DATA_TRANSFORM_ANDREWDAWSON;
revoke role _haven_staging__schema from role HAVEN_DATA_TRANSFORM_DANIELCARTER;
revoke role _haven_staging__schema from role HAVEN_DATA_TRANSFORM_DONATASGEDGAUDAS;
revoke role _haven_staging__schema from role HAVEN_DATA_TRANSFORM_GARYRANSON;
revoke role _haven_staging__schema from role HAVEN_DATA_TRANSFORM_GREGTAYLOR;
revoke role _haven_staging__schema from role HAVEN_DATA_TRANSFORM_JOHNPERING;
revoke role _haven_staging__schema from role HAVEN_DATA_TRANSFORM_JOSEPHMCDONALD;
revoke role _haven_staging__schema from role HAVEN_DATA_TRANSFORM_JUDYSHAO;
revoke role _haven_staging__schema from role HAVEN_DATA_TRANSFORM_NARAYANAVELAGA;
revoke role _haven_staging__schema from role HAVEN_DATA_TRANSFORM_SARUNASJATAUTIS;

revoke role _haven_store__schema from role HAVEN_DATA_TRANSFORM_ANDREWDAWSON;
revoke role _haven_store__schema from role HAVEN_DATA_TRANSFORM_DANIELCARTER;
revoke role _haven_store__schema from role HAVEN_DATA_TRANSFORM_DONATASGEDGAUDAS;
revoke role _haven_store__schema from role HAVEN_DATA_TRANSFORM_GARYRANSON;
revoke role _haven_store__schema from role HAVEN_DATA_TRANSFORM_GREGTAYLOR;
revoke role _haven_store__schema from role HAVEN_DATA_TRANSFORM_JOHNPERING;
revoke role _haven_store__schema from role HAVEN_DATA_TRANSFORM_JOSEPHMCDONALD;
revoke role _haven_store__schema from role HAVEN_DATA_TRANSFORM_JUDYSHAO;
revoke role _haven_store__schema from role HAVEN_DATA_TRANSFORM_NARAYANAVELAGA;
revoke role _haven_store__schema from role HAVEN_DATA_TRANSFORM_SARUNASJATAUTIS;

use role sysadmin;;

drop database warner_dwh_dev_replicate;

use role haven_dbt_transform_qat;

use role haven_data_transform_abdulkahare;

show grants to role haven_data_transform_josephmcdonald;
show grants to role haven_dbt_transform_qat;

show roles like '_haven_dbt_transform_qat_%';

use role securityadmin;

grant role _HAVEN_DBT_TRANSFORM_QAT_WAREHOUSE_XSMALL__OPERATOR to role haven_dbt_transform_qat;

use role haven_dbt_transform_qat;

show warehouses;

use role haven_dbt_transform;

use database haven_store;

show schemas;

USE ROLE SYSADMIN;

USE DATABASE HAVEN_STORE_QAT;

DROP SCHEMA COMMON_DBT_CARAVANS;
DROP SCHEMA COMMON_DBT_COMMERCIAL;
DROP SCHEMA COMMON_DBT_HAVEN_STAGING;
DROP SCHEMA COMMON_DBT_HOLIDAY;
DROP SCHEMA COMMON_DBT_PRICER;
DROP SCHEMA DBT_CLOUD_PR_2666_227_DBT_AVAILABILITY;
DROP SCHEMA DBT_CLOUD_PR_2666_227_DBT_HAVEN_STAGING;
DROP SCHEMA DBT_CLOUD_PR_2666_228_DBT_CARAVANS;
DROP SCHEMA DBT_CLOUD_PR_2666_93;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_CARAVANS;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_CARAVAN_SALES;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_COMMERCIAL;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_COMMON;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_COMPETITOR;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_HAVEN_STAGING;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_HOLIDAY;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_PERFORMANCE_MARKETING;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_PRICER;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_PROSPECTS;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_RETAIL;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_SURVEY;
DROP SCHEMA DBT_CLOUD_PR_2666_93_DBT_TROOPER2;



use role securityadmin;

grant role _haven_pipeline_qat__usage to role haven_data_transform;
grant role _haven_staging_qat__usage to role haven_data_transform;
grant role _haven_store_qat__usage to role haven_data_transform;


grant role _haven_pipeline_dev__usage to role haven_data_transform;
grant role _haven_staging_dev__usage to role haven_data_transform;
grant role _haven_store_dev__usage to role haven_data_transform;


revoke role _haven_pipeline_qat__usage from role HAVEN_DATA_TRANSFORM_ANDREWDAWSON;
revoke role _haven_pipeline_qat__usage from role HAVEN_DATA_TRANSFORM_DANIELCARTER;
revoke role _haven_pipeline_qat__usage from role HAVEN_DATA_TRANSFORM_DONATASGEDGAUDAS;
revoke role _haven_pipeline_qat__usage from role HAVEN_DATA_TRANSFORM_GARYRANSON;
revoke role _haven_pipeline_qat__usage from role HAVEN_DATA_TRANSFORM_GREGTAYLOR;
revoke role _haven_pipeline_qat__usage from role HAVEN_DATA_TRANSFORM_JOHNPERING;
revoke role _haven_pipeline_qat__usage from role HAVEN_DATA_TRANSFORM_JOSEPHMCDONALD;
revoke role _haven_pipeline_qat__usage from role HAVEN_DATA_TRANSFORM_JUDYSHAO;
revoke role _haven_pipeline_qat__usage from role HAVEN_DATA_TRANSFORM_NARAYANAVELAGA;
revoke role _haven_pipeline_qat__usage from role HAVEN_DATA_TRANSFORM_SARUNASJATAUTIS;

revoke role _haven_staging_qat__usage from role HAVEN_DATA_TRANSFORM_ANDREWDAWSON;
revoke role _haven_staging_qat__usage from role HAVEN_DATA_TRANSFORM_DANIELCARTER;
revoke role _haven_staging_qat__usage from role HAVEN_DATA_TRANSFORM_DONATASGEDGAUDAS;
revoke role _haven_staging_qat__usage from role HAVEN_DATA_TRANSFORM_GARYRANSON;
revoke role _haven_staging_qat__usage from role HAVEN_DATA_TRANSFORM_GREGTAYLOR;
revoke role _haven_staging_qat__usage from role HAVEN_DATA_TRANSFORM_JOHNPERING;
revoke role _haven_staging_qat__usage from role HAVEN_DATA_TRANSFORM_JOSEPHMCDONALD;
revoke role _haven_staging_qat__usage from role HAVEN_DATA_TRANSFORM_JUDYSHAO;
revoke role _haven_staging_qat__usage from role HAVEN_DATA_TRANSFORM_NARAYANAVELAGA;
revoke role _haven_staging_qat__usage from role HAVEN_DATA_TRANSFORM_SARUNASJATAUTIS;

revoke role _haven_store_qat__usage from role HAVEN_DATA_TRANSFORM_ANDREWDAWSON;
revoke role _haven_store_qat__usage from role HAVEN_DATA_TRANSFORM_DANIELCARTER;
revoke role _haven_store_qat__usage from role HAVEN_DATA_TRANSFORM_DONATASGEDGAUDAS;
revoke role _haven_store_qat__usage from role HAVEN_DATA_TRANSFORM_GARYRANSON;
revoke role _haven_store_qat__usage from role HAVEN_DATA_TRANSFORM_GREGTAYLOR;
revoke role _haven_store_qat__usage from role HAVEN_DATA_TRANSFORM_JOHNPERING;
revoke role _haven_store_qat__usage from role HAVEN_DATA_TRANSFORM_JOSEPHMCDONALD;
revoke role _haven_store_qat__usage from role HAVEN_DATA_TRANSFORM_JUDYSHAO;
revoke role _haven_store_qat__usage from role HAVEN_DATA_TRANSFORM_NARAYANAVELAGA;
revoke role _haven_store_qat__usage from role HAVEN_DATA_TRANSFORM_SARUNASJATAUTIS;

use role dba;

select * from snowflake.account_usage.query_history
where role_name = 'HAVEN_KPMG_ANALYSIS'
and start_time > '2024-11-29'
order by start_time;


show grants to user davidparsons;

show grants to role HAVEN_PEOPLE_DATA_RESTRICTED;

use role useradmin;
show users like 'rou%' ;

use role dba;


show grants to role HAVEN_AMPLITUDE_MANAGEMENT;

show grants of role haven_crm_management;

show grants to role haven_crm_management;


show roles like '%holiday%';