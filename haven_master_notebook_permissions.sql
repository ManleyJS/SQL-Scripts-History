use role securityadmin;

grant role _haven_master__usage to role haven_dbt_development;
grant role _haven_master__usage to role haven_dbt_development;

GRANT CREATE NOTEBOOK ON SCHEMA haven_master.notebook_sandbox TO ROLE haven_dbt_development;

revoke role _haven_master__usage from role haven_dbt_development;

grant role _haven_master__notebook_sandbox__usage to role haven_dbt_development;
GRANT CREATE NOTEBOOK ON SCHEMA haven_master.notebook_sandbox TO ROLE haven_dbt_development;

use role accountadmin;
grant usage on warehouse SYSTEM$STREAMLIT_NOTEBOOK_WH to role haven_dbt_development;

-- 04/03/2025 

-- updating permissions to see if I can move notebooks across roles

use role securityadmin;

grant role _haven_master__notebook_sandbox__usage to role haven_data_engineering;

GRANT CREATE NOTEBOOK ON SCHEMA haven_master.notebook_sandbox TO ROLE haven_data_engineering;

use role haven_data_engineering;

use role securityadmin;

grant ownership on notebook 
