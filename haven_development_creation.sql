USE ROLE sysadmin;

CREATE DATABASE haven_development;

CREATE WAREHOUSE haven_development_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_development_warehouse_xsmall__warehouse__operator;
create role _haven_development_warehouse_xsmall__warehouse__usage;

use role securityadmin;

grant usage, monitor on warehouse haven_development_warehouse_xsmall to role _haven_development_warehouse_xsmall__warehouse__usage;
grant role _haven_development_warehouse_xsmall__warehouse__usage to role _haven_development_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_development_warehouse_xsmall to role _haven_development_warehouse_xsmall__warehouse__operator;

GRANT role _haven_development_warehouse_xsmall__warehouse__usage TO ROLE haven_development;

USE ROLE useradmin;
CREATE ROLE _haven_development__usage;
CREATE ROLE _haven_development__schema;

USE ROLE securityadmin;
GRANT USAGE ON DATABASE haven_development TO ROLE _haven_development__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_development TO ROLE _haven_development__usage;
GRANT ROLE _haven_development__usage TO ROLE _haven_development__schema;
GRANT CREATE SCHEMA ON DATABASE haven_development TO ROLE _haven_development__schema;
GRANT SELECT ON future TABLES IN DATABASE haven_development TO ROLE _haven_development__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_development TO ROLE _haven_development__usage;
GRANT SELECT ON all VIEWS IN DATABASE haven_development TO ROLE _haven_development__usage;
GRANT USAGE ON future STAGES IN DATABASE haven_development TO ROLE _haven_development__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE haven_development TO ROLE _haven_development__usage;
GRANT USAGE ON ALL FILE FORMATS IN DATABASE haven_development TO ROLE _haven_development__usage;

GRANT CREATE TASK ON SCHEMA haven_development.staging_data TO ROLE _haven_development__schema;
GRANT ROLE taskadmin TO ROLE  _haven_development__schema;
use role useradmin;

CREATE ROLE haven_development;
create role haven_development_danielcarter;

-- daniel.carter@bourne-leisure.co.uk
create user danielcarter
login_name = 'daniel.carter@bourne-leisure.co.uk'
display_name = 'Dan Carter'
email = 'daniel.carter@bourne-leisure.co.uk'
comment = 'Haven Development Team'
default_role = haven_development_danielcarter
default_warehouse = haven_development_warehouse_xsmall;


grant role _HAVEN_BASE__ACTIVITIES__READER to role haven_development;
grant role _HAVEN_BASE__AZTECACTIVITYMANAGEMENT_COMPLEX__READER to role haven_development;
grant role _HAVEN_BASE__AZTECACTIVITYMANAGEMENT__READER to role haven_development;
grant role _HAVEN_BASE__AZTEC_COMPLEX__READER to role haven_development;
grant role _HAVEN_BASE__AZTEC_RETAIL__READER to role haven_development;
grant role _HAVEN_BASE__AZTEC__READER to role haven_development;
grant role _HAVEN_BASE__BIGQUERY__READER to role haven_development;
grant role _HAVEN_BASE__BRAINTREE__READER to role haven_development;
grant role _HAVEN_BASE__COMMON__READER to role haven_development;
grant role _HAVEN_BASE__COMPETITOR__READER to role haven_development;
grant role _HAVEN_BASE__DIG_ACTIVITIES__READER to role haven_development;
grant role _HAVEN_BASE__DIG_BOOKINGS__READER to role haven_development;
grant role _HAVEN_BASE__DIG_CAPACITY__READER to role haven_development;
grant role _HAVEN_BASE__DIG_PAYMENTS__READER to role haven_development;
grant role _HAVEN_BASE__DIG_PRICING__READER to role haven_development;
grant role _HAVEN_BASE__DREAM__READER to role haven_development;
grant role _HAVEN_BASE__JDAADMIN__READER to role haven_development;
grant role _HAVEN_BASE__MARINER__READER to role haven_development;
grant role _HAVEN_BASE__PLOT_ARCHIVE__READER to role haven_development;
grant role _HAVEN_BASE__PLOT__READER to role haven_development;
grant role _HAVEN_BASE__QUERY_LOG__READER to role haven_development;
grant role _HAVEN_BASE__SAS_COMMON__READER to role haven_development;
grant role _HAVEN_BASE__SAS_SCV__READER to role haven_development;
grant role _HAVEN_BASE__SEAWARE__READER to role haven_development;
grant role _HAVEN_BASE__ZBSDATA_COMPLEX__READER to role haven_development;
grant role _HAVEN_BASE__ZBSDATA_RETAIL__READER to role haven_development;
grant role _HAVEN_BASE__ZENDESK__READER to role haven_development;
grant role _HAVEN_BASE__ZONAL__READER to role haven_development;
grant role _HAVEN_STORE__AVAILABILITY__READER to role haven_development;
grant role _HAVEN_STORE__CARAVANS__READER to role haven_development;
grant role _HAVEN_STORE__COMMERCIAL__READER to role haven_development;
grant role _HAVEN_STORE__COMMON__READER to role haven_development;
grant role _HAVEN_STORE__COMPETITOR__READER to role haven_development;
grant role _HAVEN_STORE__DIGITAL__READER to role haven_development;
grant role _HAVEN_STORE__DIZZY__READER to role haven_development;
grant role _HAVEN_STORE__FINANCE_CUBE__READER to role haven_development;
grant role _HAVEN_STORE__FINANCIAL_CUBE__READER to role haven_development;
grant role _HAVEN_STORE__IDENTITY__READER to role haven_development;
grant role _HAVEN_STORE__INTEGRATION__READER to role haven_development;
grant role _HAVEN_STORE__JDAADMIN__READER to role haven_development;
grant role _HAVEN_STORE__JDAPREP__READER to role haven_development;
grant role _HAVEN_STORE__KMSREPORTING_COMPLEX__READER to role haven_development;
grant role _HAVEN_STORE__KMSREPORTING__READER to role haven_development;
grant role _HAVEN_STORE__MA_MART__READER to role haven_development;
grant role _HAVEN_STORE__OCANDC__READER to role haven_development;
grant role _HAVEN_STORE__PAYMENTS__READER to role haven_development;
grant role _HAVEN_STORE__PITCH_PERFECT__READER to role haven_development;
grant role _HAVEN_STORE__PLAYPASS__READER to role haven_development;
grant role _HAVEN_STORE__PLOTREPRS__READER to role haven_development;
grant role _HAVEN_STORE__PLOT_REPORTING__READER to role haven_development;
grant role _HAVEN_STORE__REVENUE_MANAGEMENT__READER to role haven_development;
grant role _HAVEN_STORE__SALES_PLANNER__READER to role haven_development;
grant role _HAVEN_STORE__SASMART__READER to role haven_development;
grant role _HAVEN_STORE__SAS_SCV__READER to role haven_development;
grant role _HAVEN_STORE__SEAWARE__READER to role haven_development;
grant role _HAVEN_STORE__TROOPER2__READER to role haven_development;
grant role _HAVEN_STORE__TROOPER__READER to role haven_development;
grant role _HAVEN_STORE__TRPREPRS__READER to role haven_development;

revoke role _haven_development__usage from role haven_development_danielcarter;
grant role _haven_development__schema to role haven_development_danielcarter;
grant role haven_development to role haven_development_danielcarter;
grant role haven_development_danielcarter to user danielcarter;

REVOKE ROLE _HAVEN_STORE__QUERY_LOG__READER FROM ROLE haven_development;
revoke role _HAVEN_BASE__QUERY_LOG__READER from role haven_development;
revoke role _HAVEN_BASE__SKI_LIFT__READER from role haven_development;
revoke role _HAVEN_STORE_TRAWLER_READER FROM role haven_development;
revoke role _HAVEN_STORE__ACTIVITIES__READER FROM role haven_development;
revoke role _HAVEN_STORE__ZBSDATA_COMPLEX__READER FROM role haven_development;
revoke role _HAVEN_STORE__ZBSDATA_RETAIL__READER FROM role haven_development;
revoke role _HAVEN_STORE__ZBSDATA__READER FROM role haven_development;

USE ROLE useradmin;

-- abdul.kahare@haven.com
create role haven_development_abdulkahare;

create user abdulkahare
login_name = 'abdul.kahare@haven.com'
display_name = 'Abdul Kahare'
email = 'abdul.kahare@haven.com'
comment = 'Customer Data Engineering Lead'
default_role = haven_development_abdulkahare
default_warehouse = haven_development_warehouse_xsmall;

;

use role securityadmin;
GRANT ROLE haven_development TO ROLE haven_development_abdulkahare;
grant role _haven_development__schema to role haven_development_abdulkahare;
GRANT ROLE haven_development_abdulkahare TO USER abdulkahare;


USE ROLE useradmin;
-- ian.mckay@bourne-leisure.co.uk
create role haven_development_ianmckay;

create user ianmckay
login_name = 'ian.mckay@bourne-leisure.co.uk'
display_name = 'Ian McKay'
email = 'ian.mckay@bourne-leisure.co.uk'
comment = 'Haven Data Engineering Team'
default_role = haven_development_ianmckay
default_warehouse = haven_development_warehouse_xsmall;

;

use role securityadmin;
GRANT ROLE haven_development TO ROLE haven_development_ianmckay;
grant role _haven_development__schema to role haven_development_ianmckay;
GRANT ROLE haven_development_ianmckay TO USER ianmckay;

