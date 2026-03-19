-- 21/01/2025
-- rms pricer dev

USE ROLE sysadmin;

CREATE WAREHOUSE haven_dbt_transform_rms_pricer_dev_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_dbt_transform_rms_pricer_dev_warehouse_xsmall__operator;
create role _haven_dbt_transform_rms_pricer_dev_warehouse_xsmall__usage;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_dbt_transform_rms_pricer_dev_warehouse_xsmall to role _haven_dbt_transform_rms_pricer_dev_warehouse_xsmall__usage;
grant role _haven_dbt_transform_rms_pricer_dev_warehouse_xsmall__usage to role _haven_dbt_transform_rms_pricer_dev_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_dbt_transform_rms_pricer_dev_warehouse_xsmall to role _haven_dbt_transform_rms_pricer_dev_warehouse_xsmall__operator;

USE ROLE dba;

USE SCHEMA haven_pipeline_dev.pricing_tactical_process;


create or replace view RM_SW_PRICE_PREV_DAY(
	PACKAGE_ID,
	PARK,
	BREAK_DATE,
	GRADE,
	DURATION,
	SUBPRODUCT,
	SW_PRICE_PREV_DAY
) as 
    select
        package_id,
        ship_code as park,
        arrivaldate::date as break_date,
        grade,
        length as duration,
        iff(
            contains(PACKAGETYPE,'HIDEAWAY'),
            'HIDEAWAY',
            'HAVEN HOLIDAY'
        ) subproduct,
        amount_total as sw_price_prev_day,
        
    from
        haven_base.seaware.vres_grade_price
    
    qualify 
    row_number() over (
            partition by package_id, ship_code,grade, arrivaldate, length
            order by
                date_created desc
        ) = 1;
    
    
-- 05/09/2025
    
use ROLE sysadmin;    
    
CREATE WAREHOUSE haven_dbt_transform_rms_pricer_dev_warehouse_medium WITH WAREHOUSE_SIZE = medium WAREHOUSE_TYPE = STANDARD 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = STANDARD;

use role useradmin;

create role _haven_dbt_transform_rms_pricer_dev_warehouse_medium__operator;
create role _haven_dbt_transform_rms_pricer_dev_warehouse_medium__usage;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_dbt_transform_rms_pricer_dev_warehouse_medium to role _haven_dbt_transform_rms_pricer_dev_warehouse_medium__usage;
grant role _haven_dbt_transform_rms_pricer_dev_warehouse_medium__usage to role _haven_dbt_transform_rms_pricer_dev_warehouse_medium__operator;
grant operate, modify on warehouse haven_dbt_transform_rms_pricer_dev_warehouse_medium to role _haven_dbt_transform_rms_pricer_dev_warehouse_medium__operator;
    
SHOW roles LIKE '_haven_dbt_transform_rms_pricer_dev_warehouse_medium__operator';

SHOW GRANTS OF ROLE _haven_dbt_transform_rms_pricer_dev_warehouse_medium__usage;

GRANT ROLE _haven_dbt_transform_rms_pricer_dev_warehouse_medium__usage TO ROLE haven_dbt_transform_rms_pricer_dev;

use ROLE securityadmin;

GRANT CREATE TASK ON SCHEMA haven_store_dev.rms_pricer TO ROLE haven_dbt_transform_rms_pricer_dev;
GRANT ROLE taskadmin TO ROLE haven_dbt_transform_rms_pricer_dev;
GRANT CREATE dbt project ON SCHEMA haven_store_dev.rms_pricer TO ROLE haven_dbt_transform_rms_pricer_dev;

-- 16/10/2025
-- setup HAVEN_DBT_TRANSFORM

use ROLE securityadmin;

GRANT ROLE taskadmin TO ROLE haven_dbt_transform;

GRANT CREATE TASK ON SCHEMA haven_store.rms_pricer TO ROLE haven_dbt_transform;
GRANT CREATE dbt project ON SCHEMA haven_store.rms_pricer TO ROLE haven_dbt_transform;

GRANT CREATE TASK ON SCHEMA haven_store.rms_reporting_grade TO ROLE haven_dbt_transform;
GRANT CREATE dbt project ON SCHEMA haven_store.rms_reporting_grade TO ROLE haven_dbt_transform;

