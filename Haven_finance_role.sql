USE ROLE sysadmin;

CREATE WAREHOUSE haven_strategic_projects_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_strategic_projects_warehouse_xsmall__warehouse__operator;
create role _haven_strategic_projects_warehouse_xsmall__warehouse__usage;

use role sysadmin;
grant usage, monitor on warehouse haven_strategic_projects_warehouse_xsmall to role _haven_strategic_projects_warehouse_xsmall__warehouse__usage;
grant operate, modify on warehouse haven_strategic_projects_warehouse_xsmall to role _haven_strategic_projects_warehouse_xsmall__warehouse__operator;

use role useradmin;
create role haven_strategic_projects;

-- alex.pickering@bourne-leisure.co.uk 
create user alexpickering
login_name = 'alex.pickering@bourne-leisure.co.uk'
display_name = 'Alex Pickering'
email = 'alex.pickering@bourne-leisure.co.uk'
comment = 'Head of Strategic Projects'
default_role = haven_strategic_projects
default_warehouse = haven_strategic_projects_warehouse_xsmall;


use role securityadmin;

grant role _haven_strategic_projects_warehouse_xsmall__warehouse__usage to role _haven_strategic_projects_warehouse_xsmall__warehouse__operator;
grant role _haven_store__finance_cube__reader to role haven_strategic_projects;
grant role _haven_strategic_projects_warehouse_xsmall__warehouse__operator to role haven_strategic_projects;
grant role haven_strategic_projects to user alexpickering;
grant role _haven_store__finance_cube__reader to role haven_commercial;

GRANT ROLE haven_strategic_projects TO ROLE dba;


revoke role _haven_store__finance_cube__reader from role haven_strategic_projects;
revoke role _haven_store__finance_cube__reader from role haven_commercial;
grant role _haven_store__financial_cube__reader to role haven_strategic_projects;
grant role _haven_store__financial_cube__reader to role haven_commercial;

USE ROLE useradmin;

-- sophie.hoye@bourne-leisure.co.uk
create user sophiehoye
login_name = 'sophie.hoye@bourne-leisure.co.uk'
display_name = 'Sophie Hoye'
email = 'sophie.hoye@bourne-leisure.co.uk'
comment = 'Group Reporting Manager'
default_role = haven_strategic_projects
default_warehouse = haven_strategic_projects_warehouse_xsmall;

ALTER USER sophiehoye SET login_name = 'sophie.hoye@bourne-leisure.co.uk';

USE ROLE securityadmin;
grant role haven_strategic_projects to user sophiehoye;
