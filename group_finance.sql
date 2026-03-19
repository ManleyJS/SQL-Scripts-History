USE ROLE sysadmin;

DROP WAREHOUSE group_finance_warehouse_xsmall ;

CREATE WAREHOUSE bourne_group_finance_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

drop role _group_finance_warehouse_xsmall__warehouse__operator;
DROP role _group_finance_warehouse_xsmall__warehouse__usage;

create OR REPLACE role _bourne_group_finance_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _bourne_group_finance_warehouse_xsmall__warehouse__usage;

CREATE OR REPLACE ROLE bourne_group_finance;

create user bourne_group_finance_test
login_name = 'bourne.group.finance.test'
password = '<REDACTED>'
display_name = 'Bourne Group Finance Test'
comment = 'Bourne Group Finance Test'
default_role = 'bourne_group_finance'
DEFAULT_WAREHOUSE = 'bourne_group_finance_warehouse_xsmall';

create user markhumble
login_name = 'mark.humble@bourne-leisure.co.uk'
display_name = 'Mark Humble'
email = 'mark.humble@bourne-leisure.co.uk'
comment = 'Finance Manager (Tax) WCSC'
default_role = 'bourne_group_finance'
default_warehouse = 'bourne_group_finance_warehouse_xsmall';

use role securityadmin;

grant usage, monitor on warehouse bourne_group_finance_warehouse_xsmall to role _bourne_group_finance_warehouse_xsmall__warehouse__usage;
grant role _bourne_group_finance_warehouse_xsmall__warehouse__usage to role _bourne_group_finance_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse bourne_group_finance_warehouse_xsmall to role _bourne_group_finance_warehouse_xsmall__warehouse__operator;

GRANT role _bourne_group_finance_warehouse_xsmall__warehouse__usage TO ROLE bourne_group_finance;
GRANT ROLE _haven_base__plot__reader TO ROLE bourne_group_finance;

GRANT ROLE bourne_group_finance TO USER markhumble;
GRANT ROLE bourne_group_finance TO USER bourne_group_finance_test;

ALTER USER markhumble SET DEFAULT_ROLE = bourne_group_finance;
ALTER USER bourne_group_finance_test SET DEFAULT_ROLE = bourne_group_finance;
