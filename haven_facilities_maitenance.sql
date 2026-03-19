USE ROLE sysadmin;

CREATE WAREHOUSE haven_facilities_maintenance_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE useradmin;

CREATE ROLE haven_facilities_maintenance;
create OR REPLACE role _haven_facilities_maintenance_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _haven_facilities_maintenance_warehouse_xsmall__warehouse__usage;

--pete.richardson@haven.com
--pete.richardson

create user peterichardson
login_name = 'pete.richardson@haven.com'
display_name = 'pete Richardson'
email = 'pete.richardson@haven.com'
comment = 'Data Analyst'
default_role = haven_facilities_maintenance
default_warehouse = haven_facilities_maintenance_warehouse_xsmall;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_facilities_maintenance_warehouse_xsmall to role _haven_facilities_maintenance_warehouse_xsmall__warehouse__usage;
grant role _haven_facilities_maintenance_warehouse_xsmall__warehouse__usage to role _haven_facilities_maintenance_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_facilities_maintenance_warehouse_xsmall to role _haven_facilities_maintenance_warehouse_xsmall__warehouse__operator;

GRANT role _haven_facilities_maintenance_warehouse_xsmall__warehouse__usage TO ROLE haven_facilities_maintenance;

GRANT ROLE haven_facilities_maintenance TO USER peterichardson;



USE ROLE dba;