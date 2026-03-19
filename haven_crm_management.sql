USE ROLE sysadmin;

CREATE WAREHOUSE haven_crm_management_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_crm_management_warehouse_xsmall__warehouse__operator;
create role _haven_crm_management_warehouse_xsmall__warehouse__usage;

create ROLE haven_crm_management;

-- Ben Frost - ben.frost@bourne-leisure.co.uk
create user BenFrost
login_name = 'ben.frost@bourne-leisure.co.uk'
display_name = 'Ben Frost'
email = 'ben.frost@bourne-leisure.co.uk'
comment = 'Haven CRM Management Team'
default_role = haven_crm_management
default_warehouse = haven_crm_management_warehouse_xsmall;

-- Uday Patel - uday.patel@bourne-leisure.co.uk
create user UdayPatel
login_name = 'uday.patel@bourne-leisure.co.uk'
display_name = 'Uday Patel'
email = 'uday.patel@bourne-leisure.co.uk'
comment = 'Haven CRM Management Team'
default_role = haven_crm_management
default_warehouse = haven_crm_management_warehouse_xsmall;

--Kirsty Cox - kirsty.cox@haven.com
create user KirstyCox
login_name = 'kirsty.cox@haven.com'
display_name = 'Kirsty Cox'
email = 'kirsty.cox@haven.com'
comment = 'Haven CRM Management Team'
default_role = haven_crm_management
default_warehouse = haven_crm_management_warehouse_xsmall;

-- test user
create user haven_crm_management_test
login_name = 'haven.crm.management.test'
password = '<REDACTED>'
display_name = 'Haven CRM Management Test user'
comment = 'Haven CRM Management Team'
default_role = haven_crm_management
default_warehouse = haven_crm_management_warehouse_xsmall;


use role securityadmin;

grant usage, monitor on warehouse haven_crm_management_warehouse_xsmall to role _haven_crm_management_warehouse_xsmall__warehouse__usage;
grant role _haven_crm_management_warehouse_xsmall__warehouse__usage to role _haven_crm_management_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_crm_management_warehouse_xsmall to role _haven_crm_management_warehouse_xsmall__warehouse__operator;

GRANT role _haven_crm_management_warehouse_xsmall__warehouse__usage TO ROLE haven_crm_management;

grant role _haven_base__amplitude__reader to role haven_crm_management;
grant role _haven_base__aztecactivitymanagement_complex__reader to role haven_crm_management;
grant role _haven_base__aztec_complex__reader to role haven_crm_management;
grant role _haven_base__aztec_retail__reader to role haven_crm_management;
grant role _haven_base__braintree__reader to role haven_crm_management;
grant role _haven_base__facebook_caravan_sales__reader to role haven_crm_management;
grant role _haven_base__facebook_caravan_sales_leads__reader to role haven_crm_management;
grant role _haven_base__facebook_holiday_sales__reader to role haven_crm_management;
grant role _haven_base__jdaadmin__reader to role haven_crm_management;
grant role _haven_base__mariner__reader to role haven_crm_management;
grant role _haven_base__plot__reader to role haven_crm_management;
grant role _haven_base__sas_common__reader to role haven_crm_management;
grant role _haven_base__sas_scv__reader to role haven_crm_management;
grant role _haven_base__seaware__reader to role haven_crm_management;
grant role _haven_base__zbsdata_complex__reader to role haven_crm_management;
grant role _haven_base__zbsdata_retail__reader to role haven_crm_management;
grant role _haven_base__zendesk__reader to role haven_crm_management;
grant role _haven_base__zonal__reader to role haven_crm_management;

GRANT ROLE haven_crm_management TO USER haven_crm_management_test;
GRANT ROLE haven_crm_management TO USER BenFrost;
GRANT ROLE haven_crm_management TO USER UdayPatel;
GRANT ROLE haven_crm_management TO USER KirstyCox;

