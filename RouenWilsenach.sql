USE ROLE sysadmin;

CREATE WAREHOUSE haven_amplitude_management_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE useradmin;

CREATE ROLE haven_amplitude_management;
create OR REPLACE role _haven_amplitude_management_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _haven_amplitude_management_warehouse_xsmall__warehouse__usage;

--rouan.wilsenach@bourne-leisure.co.uk
--rouan.wilsenach
--rouanwilsenach

create user rouanwilsenach
login_name = 'rouan.wilsenach@bourne-leisure.co.uk'
display_name = 'Rouan Wilsenach'
email = 'rouan.wilsenach@bourne-leisure.co.uk'
comment = 'Senior Software Engineer'
default_role = haven_amplitude_management
default_warehouse = haven_amplitude_management_warehouse_xsmall;

USE ROLE securityadmin;


grant usage, monitor on warehouse haven_amplitude_management_warehouse_xsmall to role _haven_amplitude_management_warehouse_xsmall__warehouse__usage;
grant role _haven_amplitude_management_warehouse_xsmall__warehouse__usage to role _haven_amplitude_management_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_amplitude_management_warehouse_xsmall to role _haven_amplitude_management_warehouse_xsmall__warehouse__operator;

GRANT role _haven_amplitude_management_warehouse_xsmall__warehouse__usage TO ROLE haven_amplitude_management;
GRANT ROLE _haven_base__amplitude__reader TO ROLE haven_amplitude_management; 

GRANT ROLE haven_amplitude_management TO USER rouanwilsenach;
GRANT ROLE haven_amplitude_management TO role dba;


USE ROLE haven_amplitude_management;
