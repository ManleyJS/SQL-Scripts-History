USE ROLE sysadmin;

CREATE WAREHOUSE warner_survey_management_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _warner_survey_management_warehouse_xsmall__warehouse__operator;
create role _warner_survey_management_warehouse_xsmall__warehouse__usage;

create role warner_survey_management;


create user warner_survey_management
login_name = 'warner.survey.management'
password = '<REDACTED>'
display_name = 'warner survey managementt'
comment = 'warner survey management'
default_role = warner_survey_management
DEFAULT_WAREHOUSE = warner_survey_management_warehouse_xsmall;

create user RodPestell
login_name = 'rod.pestell@bourne-leisure.co.uk'
display_name = 'Rod Pestell'
email = 'rod.pestell@bourne-leisure.co.uk'
comment = 'Warner Survey Management Team'
default_role = 'warner_survey_management'
default_warehouse = 'warner_survey_management_warehouse_xsmall';

use role useradmin;

alter user RodPestell set default_role = public;

use role securityadmin;

grant usage, monitor on warehouse warner_survey_management_warehouse_xsmall to role _warner_survey_management_warehouse_xsmall__warehouse__usage;
grant role _warner_survey_management_warehouse_xsmall__warehouse__usage to role _warner_survey_management_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse warner_survey_management_warehouse_xsmall to role _warner_survey_management_warehouse_xsmall__warehouse__operator;

GRANT role _warner_survey_management_warehouse_xsmall__warehouse__usage TO ROLE warner_survey_management;
grant role _warner_base__qualtrics__reader to role warner_survey_management;

grant role warner_survey_management to user RodPestell;
grant role warner_survey_management to user warner_survey_management;

grant role warner_survey_management to role dba;

use role accountadmin;

show users like 'Rod%';
