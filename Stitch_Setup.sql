use role sysadmin;

create warehouse warner_stitch_dataload_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 30 
AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'ECONOMY';

use role useradmin;

create role warner_stitch_dataload;

create user warner_stitch_dataload
password = '<REDACTED>' 
login_name = 'warner.stitch.dataload'
display_name = 'Warner Stitch Data Load'
default_role = warner_stitch_dataload
default_warehouse = warner_stitch_dataload_xsmall
default_namespace = warner_raw;

use role securityadmin;

grant role _warner_raw__maestro__creator to role warner_stitch_dataload;
grant role warner_stitch_dataload to user warner_stitch_dataload;

show roles like '%maestro%';

use role sysadmin;

create warehouse haven_stitch_dataload_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 30 
AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'ECONOMY';


use role useradmin;

create role haven_stitch_dataload;

create user haven_stitch_dataload
password = '<REDACTED>' 
login_name = 'haven.stitch.dataload'
display_name = 'Haven Stitch Data Load'
default_role = haven_stitch_dataload
default_warehouse = haven_stitch_dataload_xsmall
default_namespace = haven_raw;

use role securityadmin;

grant role _haven_raw__digital_arrivals__creator to role haven_stitch_dataload;
grant role haven_stitch_dataload to user haven_stitch_dataload;

show roles like '%digital_arrivals%';

grant role haven_stitch_dataload to role dba;
grant role warner_stitch_dataload to role dba;

use role useradmin;
create role _warner_stitch_dataload__warehouse__usage;
create role _warner_stitch_dataload__warehouse__operator;

use role securityadmin;
grant MONITOR, usage, operate on warehouse warner_stitch_dataload_xsmall to role _warner_stitch_dataload__warehouse__usage;
GRANT MODIFY, OPERATE on warehouse warner_stitch_dataload_xsmall TO ROLE _warner_stitch_dataload__warehouse__operator;

revoke operate on warehouse warner_stitch_dataload_xsmall from role _warner_stitch_dataload__warehouse__usage;
grant role _warner_stitch_dataload__warehouse__usage to role warner_stitch_dataload;

show grants to role warner_stitch_dataload;

show grants to role _warner_stitch_dataload__warehouse__usage;

use role useradmin;
create role _haven_stitch_dataload__warehouse__usage;
create role _haven_stitch_dataload__warehouse__operator;

use role securityadmin;
grant MONITOR, usage on warehouse haven_stitch_dataload_xsmall to role _haven_stitch_dataload__warehouse__usage;
GRANT MODIFY, OPERATE on warehouse haven_stitch_dataload_xsmall TO ROLE _haven_stitch_dataload__warehouse__operator;

grant role _haven_stitch_dataload__warehouse__usage to role haven_stitch_dataload;

use role accountadmin;
drop warehouse pc_stitch_wh;
drop warehouse pc_fivetran_wh;

use role sysadmin;

alter warehouse warner_stitch_dataload_xsmall set auto_suspend = 30;