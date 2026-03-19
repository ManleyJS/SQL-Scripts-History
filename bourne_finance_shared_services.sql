USE ROLE sysadmin;

CREATE WAREHOUSE bourne_finance_shared_services_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _bourne_finance_shared_services_warehouse_xsmall__warehouse__operator;
create role _bourne_finance_shared_services_warehouse_xsmall__warehouse__usage;

show GRANTS TO ROLE bourne_finance_shared_services;
--create role bourne_finance_shared_services;

-- Pamela McCarthy 
-- Pamela.McCarthy@bourne-leisure.co.uk 
create user PamelaMcCarthy
login_name = 'Pamela.McCarthy@bourne-leisure.co.uk'
display_name = 'Pamela McCarthy'
email = 'Pamela.McCarthy@bourne-leisure.co.uk'
comment = 'Income Accounting Team Leader'
default_role = bourne_finance_shared_services
default_warehouse = bourne_finance_shared_services_warehouse_xsmall;

-- Ingrid Klescova 
-- Ingrid.Klescova@bourne-leisure.co.uk
create USER IngridKlescova  
login_name = 'Ingrid.Klescova@bourne-leisure.co.uk'
display_name = 'Ingrid Klescova'
email = 'Ingrid.Klescova@bourne-leisure.co.uk'
comment = 'Banking and Income Manager'
default_role = bourne_finance_shared_services
default_warehouse = bourne_finance_shared_services_warehouse_xsmall;

-- Deborah Cooper 
-- Deborah.Cooper@bourne-leisure.co.uk
create USER DeborahCooper 
login_name = 'Deborah.Cooper@bourne-leisure.co.uk'
display_name = 'Deborah Cooper'
email = 'Deborah.Cooper@bourne-leisure.co.uk'
comment = 'Guest Support Assistant Accountant'
default_role = bourne_finance_shared_services
default_warehouse = bourne_finance_shared_services_warehouse_xsmall;

-- Zakia Choudhury 
-- Zakia.Choudhury@bourne-leisure.co.uk
create USER ZakiaChoudhury 
login_name = 'Zakia.Choudhury@bourne-leisure.co.uk'
display_name = 'Zakia Choudhury'
email = 'Zakia.Choudhury@bourne-leisure.co.uk'
comment = 'Sundry Income Assistant Accountant'
default_role = bourne_finance_shared_services
default_warehouse = bourne_finance_shared_services_warehouse_xsmall;

use role securityadmin;

grant usage, monitor on warehouse bourne_finance_shared_services_warehouse_xsmall to role _bourne_finance_shared_services_warehouse_xsmall__warehouse__usage;
grant role _bourne_finance_shared_services_warehouse_xsmall__warehouse__usage to role _bourne_finance_shared_services_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse bourne_finance_shared_services_warehouse_xsmall to role _bourne_finance_shared_services_warehouse_xsmall__warehouse__operator;

GRANT ROLE _bourne_store__finance_shared_services__reader TO ROLE bourne_finance_shared_services;
grant role _bourne_finance_shared_services_warehouse_xsmall__warehouse__usage to role bourne_finance_shared_services;

grant role bourne_finance_shared_services to user PamelaMcCarthy;
grant role bourne_finance_shared_services to user IngridKlescova;
grant role bourne_finance_shared_services to user DeborahCooper;
grant role bourne_finance_shared_services to user ZakiaChoudhury;

SHOW GRANTS TO ROLE bourne_finance_shared_services;

REVOKE ROLE _BOURNE_FINANCE_SHARED_SERVICES_XSMALL__WAREHOUSE__USAGE FROM ROLE bourne_finance_shared_services;

USE ROLE useradmin;

DROP ROLE _BOURNE_FINANCE_SHARED_SERVICES_XSMALL__WAREHOUSE__USAGE;
DROP ROLE _BOURNE_FINANCE_SHARED_SERVICES_XSMALL__WAREHOUSE__OPERATOR;

USE ROLE sysadmin;

DROP WAREHOUSE BOURNE_FINANCE_SHARED_SERVICES_XSMALL;

-- 08/01/02025

USE ROLE useradmin;

--  
-- 
-- 

create USER  
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = bourne_finance_shared_services
default_warehouse = bourne_finance_shared_services_warehouse_xsmall;

USE ROLE securityadmin;

grant role bourne_finance_shared_services to user ;






-- Standard user add

USE ROLE useradmin;

-- Mbayang Sarr 
-- mbayang.sarr@bourne-leisure.co.uk
-- Income Assistant

create USER  MbayangSarr
login_name = 'mbayang.sarr@bourne-leisure.co.uk'
display_name = 'Mbayang Sarr'
email = 'mbayang.sarr@bourne-leisure.co.uk'
comment = 'Income Assistant'
default_role = bourne_finance_shared_services
default_warehouse = bourne_finance_shared_services_warehouse_xsmall;

USE ROLE securityadmin;

grant role bourne_finance_shared_services to user MbayangSarr;
