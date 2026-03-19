use role securityadmin;
revoke role _HAVEN_REVENUE_MANAGEMENT_PRICER_WAREHOUSE_XSMALL__WAREHOUSE__USAGE from role haven_revenue_management_pricer;

use role useradmin;
drop role _HAVEN_REVENUE_MANAGEMENT_PRICER_WAREHOUSE_XSMALL__WAREHOUSE__USAGE;
drop role _HAVEN_REVENUE_MANAGEMENT_PRICER_WAREHOUSE_XSMALL__WAREHOUSE__OPERATOR;

use role sysadmin;
drop warehouse HAVEN_REVENUE_MANAGEMENT_PRICER_WAREHOUSE_XSMALL;

use role sysadmin;

create database align_alytics;

CREATE WAREHOUSE alignalytics_pricing_data_warehouse WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE ;

CREATE WAREHOUSE alignalytics_snowpark_ml_warehouse WITH WAREHOUSE_SIZE = 'MEDIUM' WAREHOUSE_TYPE = 'SNOWPARK-OPTIMIZED' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE ;

CREATE WAREHOUSE alignalytics_dbt_processing_warehouse WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE ;


use role useradmin;

create role _alignalytics_pricing_data_warehouse__usage;
create role _alignalytics_pricing_data_warehouse__monitor;

create role _align_alytics__usage;
create role _align_alytics__schema;

create role _alignalytics_snowpark_ml_warehouse__usage;
create role _alignalytics_snowpark_ml_warehouse__monitor;

create role _alignalytics_dbt_processing_warehouse__usage;
create role _alignalytics_dbt_processing_warehouse__monitor;

use role securityadmin;

GRANT USAGE ON DATABASE align_alytics TO ROLE _align_alytics__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE align_alytics TO ROLE _align_alytics__usage;
GRANT SELECT ON future TABLES IN DATABASE align_alytics TO ROLE _align_alytics__usage;
GRANT SELECT ON future VIEWS IN DATABASE align_alytics TO ROLE _align_alytics__usage;
GRANT SELECT ON all VIEWS IN DATABASE align_alytics TO ROLE _align_alytics__usage;
GRANT ROLE _align_alytics__usage TO ROLE _align_alytics__schema;
GRANT CREATE SCHEMA ON DATABASE align_alytics TO ROLE _align_alytics__schema;
grant role _align_alytics__schema to role haven_revenue_management_pricer;

grant usage, monitor on warehouse alignalytics_pricing_data_warehouse to role _alignalytics_pricing_data_warehouse__usage;
grant role _alignalytics_pricing_data_warehouse__usage to role _alignalytics_pricing_data_warehouse__monitor;
grant operate, modify on warehouse alignalytics_pricing_data_warehouse to role _alignalytics_pricing_data_warehouse__monitor;
grant role _alignalytics_pricing_data_warehouse__monitor to role haven_revenue_management_pricer;

grant usage, monitor on warehouse alignalytics_snowpark_ml_warehouse to role _alignalytics_snowpark_ml_warehouse__usage;
grant role _alignalytics_snowpark_ml_warehouse__usage to role _alignalytics_snowpark_ml_warehouse__monitor;
grant operate, modify on warehouse alignalytics_snowpark_ml_warehouse to role _alignalytics_snowpark_ml_warehouse__monitor;
grant role _alignalytics_snowpark_ml_warehouse__monitor to role haven_revenue_management_pricer;

grant usage, monitor on warehouse alignalytics_dbt_processing_warehouse to role _alignalytics_dbt_processing_warehouse__usage;
grant role _alignalytics_dbt_processing_warehouse__usage to role _alignalytics_dbt_processing_warehouse__monitor;
grant operate, modify on warehouse alignalytics_dbt_processing_warehouse to role _alignalytics_dbt_processing_warehouse__monitor;
grant role _alignalytics_dbt_processing_warehouse__monitor to role haven_revenue_management_pricer;

use role accountadmin;

create or replace resource monitor align_alytics_compute_monitor 
with 
    credit_quota = 500
    frequency = never
    start_timestamp = immediately
    notify_users = ("JONATHANMANLEY", "GARYRANSON", "DONOVANRANSOME")
triggers 
    on 80 percent do notify
    on 90 percent do notify
    on 100 percent do suspend_immediate;

alter warehouse alignalytics_snowpark_ml_warehouse set resource_monitor = align_alytics_compute_monitor;
alter warehouse alignalytics_pricing_data_warehouse set resource_monitor = align_alytics_compute_monitor;
alter warehouse alignalytics_dbt_processing_warehouse set resource_monitor = align_alytics_compute_monitor;

use role haven_revenue_management_pricer;

use role securityadmin;

grant select on view HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.BREAK_LOOKUP to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER;

grant select on view HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.BREAK_SEGMENTATION_LOOKUP to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER;

grant select on view HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.BUDGET_INPUTS to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER;

grant select on view HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.CALENDAR_LOOKUP to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER;

grant select on view HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.D09_EXPORT to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER;

grant select on view HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.OPTIMISER_INPUTS_PRICE_SHAPE_CHANGE to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER;

grant select on view HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.OPTIMISER_INPUTS_VOLUME_PERC_SHAPE to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER;

grant select on view HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.SOURCE_LOOKUP to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER;

grant select on view HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.STAY_PRICE_ADJUSTMENT to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER;

-- 30/01/2025

use role dba;

use role sysadmin;

CREATE WAREHOUSE alignalytics_dbt_processing_warehouse_xsmall WITH WAREHOUSE_SIZE = XSMALL WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE ;

CREATE WAREHOUSE alignalytics_dbt_processing_warehouse_medium WITH WAREHOUSE_SIZE = MEDIUM WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE ;

use role useradmin;

create role _alignalytics_dbt_processing_warehouse_xsmall__usage;
create role _alignalytics_dbt_processing_warehouse_xsmall__monitor;

create role _alignalytics_dbt_processing_warehouse_medium__usage;
create role _alignalytics_dbt_processing_warehouse_medium__monitor;

use role securityadmin;

grant usage, monitor on warehouse alignalytics_dbt_processing_warehouse_xsmall to role _alignalytics_dbt_processing_warehouse_xsmall__usage;
grant role _alignalytics_dbt_processing_warehouse_xsmall__usage to role _alignalytics_dbt_processing_warehouse_xsmall__monitor;
grant operate, modify on warehouse alignalytics_dbt_processing_warehouse_xsmall to role _alignalytics_dbt_processing_warehouse_xsmall__monitor;

grant usage, monitor on warehouse alignalytics_dbt_processing_warehouse_medium to role _alignalytics_dbt_processing_warehouse_medium__usage;
grant role _alignalytics_dbt_processing_warehouse_medium__usage to role _alignalytics_dbt_processing_warehouse_medium__monitor;
grant operate, modify on warehouse alignalytics_dbt_processing_warehouse_medium to role _alignalytics_dbt_processing_warehouse_medium__monitor;

use role accountadmin;

alter warehouse alignalytics_dbt_processing_warehouse_xsmall set resource_monitor = align_alytics_compute_monitor;
alter warehouse alignalytics_dbt_processing_warehouse_medium set resource_monitor = align_alytics_compute_monitor;
