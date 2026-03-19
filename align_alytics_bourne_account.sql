USE ROLE haven_revenue_management_pricer;

SHOW GRANTS TO ROLE haven_revenue_management_pricer;

SHOW WAREHOUSES;

USE ROLE useradmin;

--Matthew Betts
--matthew.betts@haven.com
--Align Alytics Engineer

create USER MatthewBetts 
login_name = 'matthew.betts@haven.com'
display_name = 'Matthew Betts'
email = 'matthew.betts@haven.com'
comment = 'Align Alytics Engineer'
default_role = haven_revenue_management_pricer
DEFAULT_WAREHOUSE = ALIGNALYTICS_PRICING_DATA_WAREHOUSE
;

--Sheldon Dee
--sheldon.dee@haven.com 
--Align Alytics Engineer

DROP USER SheldonDee;

create USER SheldonDee 
login_name = 'sheldon.dee@haven.com'
display_name = 'Sheldon Dee'
email = 'sheldon.dee@haven.com'
comment = 'Align Alytics Engineer'
default_role = haven_revenue_management_pricer
DEFAULT_WAREHOUSE = ALIGNALYTICS_PRICING_DATA_WAREHOUSE
;

--Richard Teuchert
--richard.teuchert@haven.com
--Align Alytics Engineer
create USER RichardTeuchert 
login_name = 'richard.teuchert@haven.com'
display_name = 'Richard Teuchert'
email = 'richard.teuchert@haven.com'
comment = 'Align Alytics Engineer'
default_role = haven_revenue_management_pricer
DEFAULT_WAREHOUSE = ALIGNALYTICS_PRICING_DATA_WAREHOUSE
;

USE ROLE securityadmin;
SHOW GRANTS TO ROLE _ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE__MONITOR;

GRANT ROLE haven_revenue_management_pricer TO USER MatthewBetts;
GRANT ROLE haven_revenue_management_pricer TO USER SheldonDee;
GRANT ROLE haven_revenue_management_pricer TO USER RichardTeuchert;


USE ROLE useradmin;

-- eoin.rando
-- eoin.rando@bourne-leisure.co.uk 
-- Align Alytics Engineer

create USER eoinrando  
login_name = 'eoin.rando@bourne-leisure.co.uk'
display_name = 'Eoin Rando'
email = 'eoin.rando@bourne-leisure.co.uk'
comment = 'Align Alytics Engineer'
default_role = haven_revenue_management_pricer
DEFAULT_WAREHOUSE = ALIGNALYTICS_PRICING_DATA_WAREHOUSE
;

USE role SECURITYadmin;

--SHOW GRANTS TO USER SheldonDee;

GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER TO USER eoinrando;
GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER_UAT TO USER eoinrando;
GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER_VALIDATION TO USER eoinrando;


---- Snowsight workbook load

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

--- end of workbook

-- 30/01/2025

USE ROLE securityadmin;

grant role _alignalytics_dbt_processing_warehouse_medium__usage to role HAVEN_REVENUE_MANAGEMENT_PRICER;
grant role _alignalytics_dbt_processing_warehouse_xsmall__usage to role HAVEN_REVENUE_MANAGEMENT_PRICER;
revoke role _ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE__MONITOR from role HAVEN_REVENUE_MANAGEMENT_PRICER;
grant role _ALIGNALYTICS_DBT_PROCESSING_WAREHOUSE__USAGE to role HAVEN_REVENUE_MANAGEMENT_PRICER;

revoke role _ALIGNALYTICS_PRICING_DATA_WAREHOUSE__MONITOR from role HAVEN_REVENUE_MANAGEMENT_PRICER;
grant role _ALIGNALYTICS_PRICING_DATA_WAREHOUSE__USAGE to role HAVEN_REVENUE_MANAGEMENT_PRICER;

SHOW GRANTS TO ROLE HAVEN_REVENUE_MANAGEMENT_PRICER;

SHOW warehouses LIKE 'ALIGN%';

-- 23/04/2025

-- Huan Yu
-- huan.yu@haven.com
-- Align Alytics Engineer

use ROLE useradmin;

create USER  HuanYu
login_name = 'huan.yu@haven.com'
display_name = 'Huan Yu'
email = 'huan.yu@haven.com'
comment = 'Align Alytics Engineer'
default_role = haven_revenue_management_pricer
DEFAULT_WAREHOUSE = ALIGNALYTICS_PRICING_DATA_WAREHOUSE
;

use ROLE securityadmin;

GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER TO USER HuanYu;
GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER_UAT TO USER HuanYu;
GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER_VALIDATION TO USER HuanYu;

-- 12/05/2025

USE ROLE useradmin;

-- Richard Jolly
-- richard.jolly@haven.com
-- Align Alytics Engineer


CREATE USER RichardJolly
login_name = 'richard.jolly@haven.com'
display_name = 'Richard Jolly'
email = 'richard.jolly@haven.com'
comment = 'Align Alytics Engineer'
default_role = haven_revenue_management_pricer
default_warehouse = ALIGNALYTICS_PRICING_DATA_WAREHOUSE;

USE ROLE securityadmin;

GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER TO USER RichardJolly;
GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER_UAT TO USER RichardJolly;
GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER_VALIDATION TO USER RichardJolly;

-- 09/06/2025

use role useradmin;

create role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;

show grants TO ROLE _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__COMMON__READER;

use ROLE securityadmin;

grant role _haven_store__holiday__usage to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;

grant select on table haven_store.holiday.DIM_BOOKING_REFERRAL_SOURCE to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;
grant select on table haven_store.holiday.DIM_BOOKING_SOURCE_CHANNEL to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;
grant select on table haven_store.holiday.DIM_BOOKING_STATUS to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;
grant select on table haven_store.holiday.DIM_GRADE to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;
grant select on table haven_store.holiday.DIM_PACKAGE_TYPE to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;
grant select on table haven_store.holiday.DIM_PAYMENT_PLAN to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;
grant select on table haven_store.holiday.FCT_ARRIVAL_SLOT_AVAILABILITY to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;
grant select on table haven_store.holiday.FCT_HOLIDAY_ADDONS to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;
grant select on table haven_store.holiday.FCT_HOLIDAY_BOOKINGS to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;
grant select on table haven_store.holiday.FCT_HOLIDAY_BOOKINGS_PRORATED to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;
grant select on table haven_store.holiday.FCT_HOLIDAY_BUDGET to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;
grant select on table haven_store.holiday.FCT_HOLIDAY_TOURING_BUDGET to role _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER;

GRANT ROLE _HAVEN_REVENUE_MANAGEMENT_PRICER__HAVEN_STORE__HOLIDAY__READER TO ROLE HAVEN_REVENUE_MANAGEMENT_PRICER;


-- 03/07/2025

use role securityadmin;

grant role _haven_store__competitor__reader to role haven_revenue_management_pricer;

use ROLE useradmin;

CREATE ROLE _haven_revenue_management_pricer__haven_store__common__reader;

use ROLE securityadmin;

show grants TO ROLE _haven_revenue_management_pricer__haven_store__common__reader;

GRANT SELECT ON TABLE haven_store.common.grade_mapping TO ROLE _haven_revenue_management_pricer__haven_store__common__reader;

-- 17/11/2025
-- Adding new user 

use ROLE HAVEN_DBT_DEVELOPMENT_ALIGN_ALYTICS;

show warehouses;

-- Michael Soffe	
-- michael.soffe@haven.com
-- Align Alytics Engineer

use ROLE useradmin;

CREATE USER MichaelSoffe
login_name = 'michael.soffe@haven.com'                                                          
display_name = 'Michael Soffe'                                                        
email = 'michael.soffe@haven.com'                                     
comment = 'Align Alytics Engineer'                                                             
default_role = HAVEN_DBT_DEVELOPMENT_ALIGN_ALYTICS                       
DEFAULT_WAREHOUSE = HAVEN_DBT_DEVELOPMENT_ALIGN_ALYTICS_WAREHOUSE_XSMALL; 
                                                                        
                                                                         
use ROLE securityadmin;                                                  
                                                                         
GRANT ROLE HAVEN_DBT_DEVELOPMENT_ALIGN_ALYTICS TO USER MichaelSoffe;

----------

-- 
-- 

USE ROLE USERADMIN;

CREATE USER  
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = HAVEN_DBT_DEVELOPMENT_ALIGN_ALYTICS
DEFAULT_WAREHOUSE = 
;

use ROLE securityadmin;

GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER TO USER 
GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER_UAT TO USER 
GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER_VALIDATION TO USER 