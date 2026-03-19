USE ROLE dba;

SHOW ROLES LIKE 'haven_%';

USE ROLE sysadmin;

CREATE WAREHOUSE haven_finance_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_finance_warehouse_xsmall__warehouse__operator;
create role _haven_finance_warehouse_xsmall__warehouse__usage;
CREATE OR REPLACE ROLE haven_finance;

create user haven_finance_test
login_name = 'haven.finance.test'
password = '<REDACTED>'
display_name = 'haven finance test'
comment = 'haven finance test'
default_role = 'haven_finance'
DEFAULT_WAREHOUSE = 'haven_finance_warehouse_xsmall';

create user GrahamLeonard
login_name = 'graham.leonard@bourne-leisure.co.uk'
display_name = 'Graham Leonard'
email = 'graham.leonard@bourne-leisure.co.uk'
comment = 'Haven Finance Team'
default_role = 'haven_finance'
default_warehouse = 'haven_finance_warehouse_xsmall';

create user AkhilShah
login_name = 'akhil.shah@haven.com'
display_name = 'Akhil Shah'
email = 'akhil.shah@haven.com'
comment = 'Haven Finance Team'
default_role = 'haven_finance'
default_warehouse = 'haven_finance_warehouse_xsmall';

create user AdamCampbell
login_name = 'adam.campbell@bourne-leisure.co.uk'
display_name = 'Adam Campbell'
email = 'adam.campbell@bourne-leisure.co.uk'
comment = 'Haven Finance Team'
default_role = 'haven_finance'
default_warehouse = 'haven_finance_warehouse_xsmall';

use role securityadmin;

grant usage, monitor on warehouse haven_finance_warehouse_xsmall to role _haven_finance_warehouse_xsmall__warehouse__usage;
grant role _haven_finance_warehouse_xsmall__warehouse__usage to role _haven_finance_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_finance_warehouse_xsmall to role _haven_finance_warehouse_xsmall__warehouse__operator;

GRANT role _haven_finance_warehouse_xsmall__warehouse__usage TO ROLE haven_finance;
GRANT ROLE _haven_store__financial_cube__reader TO ROLE haven_finance;

GRANT ROLE haven_finance TO USER GrahamLeonard;
GRANT ROLE haven_finance TO USER AkhilShah;
GRANT ROLE haven_finance TO USER AdamCampbell;
GRANT ROLE haven_finance TO USER haven_finance_test;

USE ROLE accountadmin;

SHOW USERS LIKE 'akhil%';

USE ROLE securityadmin;

ALTER USER AkhilShah SET default_namespace = haven_store.FINANCIAL_CUBE, default_warehouse = haven_finance_warehouse_xsmall, DEFAULT_role = haven_finance;
ALTER USER GrahamLeonard SET default_namespace = haven_store.FINANCIAL_CUBE, default_warehouse = haven_finance_warehouse_xsmall, DEFAULT_role = haven_finance;
ALTER USER AdamCampbell SET default_namespace = haven_store.FINANCIAL_CUBE, default_warehouse = haven_finance_warehouse_xsmall, DEFAULT_role = haven_finance;


-- 24/09/2024

-- roma.barreto
-- roma.barreto@bourne-leisure.co.uk
-- Stock Accountant

USE ROLE useradmin;

create USER romabarreto 
login_name = 'roma.barreto@bourne-leisure.co.uk'
display_name = 'Roma Barreto'
email = 'roma.barreto@bourne-leisure.co.uk'
comment = 'Stock Accountant'
default_role = haven_finance
default_warehouse = haven_finance_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_finance TO USER romabarreto;
GRANT ROLE haven_accountants TO USER romabarreto;

-- 28/11/2024

-- Jason Yanni-Doyle
-- jason.yanni-doyle@haven.com
-- Revenue Controller

USE ROLE useradmin;

create USER JasonYanniDoyle 
login_name = 'jason.yanni-doyle@haven.com'
display_name = 'Jason Yanni-Doyle'
email = 'jason.yanni-doyle@haven.com'
comment = 'Revenue Controller'
default_role = haven_finance
default_warehouse = haven_finance_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_finance TO USER JasonYanniDoyle;
-- GRANT ROLE haven_accountants TO USER JasonYanniDoyle;


-- 10/04/2025

-- Courtney  Barron
-- courtney.barron@haven.com
-- Financial Accounting Assistant

USE ROLE useradmin;

create USER  CourtneyBarron
login_name = 'courtney.barron@haven.com'
display_name = 'Courtney Barron'
email = 'courtney.barron@haven.com'
comment = 'Financial Accounting Assistant'
default_role = haven_finance
default_warehouse = haven_finance_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_finance TO USER CourtneyBarron;

-- RJ Uddin
-- rj.uddin@haven.com
-- Capex Accountant

USE ROLE useradmin;

create USER RJUddin  
login_name = 'rj.uddin@haven.com'
display_name = 'RJ Uddin'
email = 'rj.uddin@haven.com'
comment = 'Capex Accountant'
default_role = haven_finance
default_warehouse = haven_finance_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_finance TO USER RJUddin;




------------

-- 
-- 
-- 

USE ROLE useradmin;

create USER  
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = haven_finance
default_warehouse = haven_finance_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_finance TO USER ;


