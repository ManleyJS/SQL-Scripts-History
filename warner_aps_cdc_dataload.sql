USE ROLE sysadmin;

CREATE WAREHOUSE warner_aps_cdc_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create OR REPLACE role _warner_aps_cdc_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _warner_aps_cdc_warehouse_xsmall__warehouse__usage;

CREATE OR REPLACE ROLE warner_aps_cdc_dataload;

create user warner_aps_cdc_dataload
login_name = 'warner.aps.cdc.dataload'
password = '<REDACTED>'
display_name = 'Warner APS CDC Integration'
comment = 'Warner APS CDC Integration'
default_role = warner_aps_cdc_dataload
DEFAULT_WAREHOUSE = warner_aps_cdc_warehouse_xsmall;

use role securityadmin;

grant usage, monitor on warehouse warner_aps_cdc_warehouse_xsmall to role _warner_aps_cdc_warehouse_xsmall__warehouse__usage;
grant role _warner_aps_cdc_warehouse_xsmall__warehouse__usage to role _warner_aps_cdc_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse warner_aps_cdc_warehouse_xsmall to role _warner_aps_cdc_warehouse_xsmall__warehouse__operator;

GRANT role _warner_aps_cdc_warehouse_xsmall__warehouse__usage TO ROLE warner_aps_cdc_dataload;
GRANT ROLE _warner_raw__seaware_aps__creator TO ROLE warner_aps_cdc_dataload;

GRANT ROLE warner_aps_cdc_dataload TO USER warner_aps_cdc_dataload;