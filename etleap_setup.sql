USE ROLE sysadmin;

CREATE WAREHOUSE haven_etleap_dataload_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE useradmin;

create role haven_etleap_dataload;

create OR REPLACE role _haven_etleap_dataload_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _haven_etleap_dataload_warehouse_xsmall__warehouse__usage;

create user haven_etleap_dataload
login_name = 'haven.etleap.dataload'
password = '<REDACTED>'
display_name = 'Haven ETleap Dataload'
email = 'jonathan.manley@bourne-leisure.co.uk'
comment = 'Haven ETleap Dataload'
default_role = haven_etleap_dataload
default_warehouse = haven_etleap_dataload_warehouse_xsmall;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_etleap_dataload_warehouse_xsmall to role _haven_etleap_dataload_warehouse_xsmall__warehouse__usage;
grant role _haven_etleap_dataload_warehouse_xsmall__warehouse__usage to role _haven_etleap_dataload_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_etleap_dataload_warehouse_xsmall to role _haven_etleap_dataload_warehouse_xsmall__warehouse__operator;

GRANT role _haven_etleap_dataload_warehouse_xsmall__warehouse__usage TO ROLE haven_etleap_dataload;
GRANT ROLE _haven_raw__freshsales__creator TO ROLE haven_etleap_dataload;

GRANT ROLE haven_etleap_dataload TO USER haven_etleap_dataload;

USE ROLE dba;

