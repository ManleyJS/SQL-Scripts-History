USE ROLE useradmin;

SHOW ROLES LIKE '%bourne_cdc%';

create user haven_facebook_integration
login_name = 'haven.facebook.integration'
password = '<REDACTED>'
display_name = 'Haven Facebook Integration'
comment = 'Haven Facebook Integration'
default_role = haven_facebook_integration
default_warehouse = bourne_cdc_dataload_xsmall;

ALTER USER haven_facebook_integration SET default_warehouse = haven_stitch_dataload;

CREATE ROLE haven_facebook_integration;

USE ROLE securityadmin;

revoke ROLE _BOURNE_CDC_DATALOAD__WAREHOUSE__USAGE from ROLE haven_facebook_integration;
SHOW ROLES LIKE '_haven_stitch%';
GRANT ROLE _HAVEN_STITCH_DATALOAD__WAREHOUSE__USAGE TO ROLE haven_facebook_integration;
GRANT ROLE  _haven_raw__facebook__creator to ROLE haven_facebook_integration;
GRANT ROLE haven_facebook_integration TO USER haven_facebook_integration;

grant ROLE _haven_raw__facebook__reader to ROLE data_engineering;


use role useradmin;

create role _bourne_stitch_warehouse_xsmall__warehouse__operator;
create role _bourne_stitch_warehouse_xsmall__warehouse__usage;


create user haven_stitch_integration
login_name = 'haven.stitch.integration'
password = '<REDACTED>'
display_name = 'Haven stitch Integration'
comment = 'Haven Stitch Integration'
default_role = haven_stitch_integration
default_warehouse = bourne_stitch_datawarehouse_xsmall

CREATE ROLE haven_stitch_integration;

USE ROLE sysadmin;

CREATE WAREHOUSE bourne_stitch_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

grant usage, monitor on warehouse bourne_stitch_warehouse_xsmall to role _bourne_stitch_warehouse_xsmall__warehouse__usage;
grant operate, modify on warehouse bourne_stitch_warehouse_xsmall to role _bourne_stitch_warehouse_xsmall__warehouse__operator;

USE ROLE securityadmin;

grant role _bourne_stitch_warehouse_xsmall__warehouse__usage to role _bourne_stitch_warehouse_xsmall__warehouse__operator;

GRANT ROLE _bourne_stitch_WAREHOUSE_xsmall__warehouse__USAGE TO ROLE haven_stitch_integration;
GRANT ROLE  _haven_raw__facebook__creator to ROLE haven_stitch_integration;
GRANT ROLE haven_stitch_integration TO USER haven_stitch_integration;

grant ROLE _haven_raw__facebook__reader to ROLE data_engineering;
