USE ROLE sysadmin;

CREATE WAREHOUSE Haven_amplitude_extracts_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _Haven_amplitude_extracts_warehouse_xsmall__warehouse__operator;
create role _Haven_amplitude_extracts_warehouse_xsmall__warehouse__usage;

create role Haven_amplitude_extracts_CARAVAN_SALES_LEADS;

CREATE ROLE _Haven_amplitude_extracts_CARAVAN_SALES_LEADS__haven_development__amplitude__reader;

create user Haven_amplitude_extracts_CARAVAN_SALES_LEADS
login_name = 'haven.amplitude.extracts.caravan.sales.leads'
password = '<REDACTED>'
display_name = 'Extracts of Caravan Sales Leads'
email = 'Dan.Carter@bourne-leisure.co.uk'
comment = 'Haven Amplitude Extracts For Caravan Sales Leads'
default_role = Haven_amplitude_extracts_CARAVAN_SALES_LEADS
default_warehouse = Haven_amplitude_extracts_warehouse_xsmall;

use role securityadmin;

grant usage, monitor on warehouse Haven_amplitude_extracts_warehouse_xsmall to role _Haven_amplitude_extracts_warehouse_xsmall__warehouse__usage;
grant role _Haven_amplitude_extracts_warehouse_xsmall__warehouse__usage to role _Haven_amplitude_extracts_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse Haven_amplitude_extracts_warehouse_xsmall to role _Haven_amplitude_extracts_warehouse_xsmall__warehouse__operator;

grant role _Haven_amplitude_extracts_warehouse_xsmall__warehouse__usage to role Haven_amplitude_extracts_caravan_sales_leads;
GRANT SELECT ON VIEW haven_development.amplitude.STG__AMPLITUDE_ENHANCED_CARAVAN_SALES_LEADS TO ROLE _Haven_amplitude_extracts_CARAVAN_SALES_LEADS__haven_development__amplitude__reader; 

revoke USAGE ON DATABASE HAVEN_DEVELOPMENT from ROLE _Haven_amplitude_extracts_CARAVAN_SALES_LEADS__haven_development__amplitude__reader;
revoke USAGE ON SCHEMA HAVEN_DEVELOPMENT.AMPLITUDE from ROLE _Haven_amplitude_extracts_CARAVAN_SALES_LEADS__haven_development__amplitude__reader;
GRANT ROLE _HAVEN_DEVELOPMENT__SCHEMA TO ROLE _Haven_amplitude_extracts_CARAVAN_SALES_LEADS__haven_development__amplitude__reader;
GRANT ROLE _Haven_amplitude_extracts_CARAVAN_SALES_LEADS__haven_development__amplitude__reader TO ROLE Haven_amplitude_extracts_CARAVAN_SALES_LEADS;
grant role Haven_amplitude_extracts_CARAVAN_SALES_LEADS to user Haven_amplitude_extracts_CARAVAN_SALES_LEADS;
