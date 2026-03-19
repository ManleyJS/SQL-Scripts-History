-------------------------------------------------------------------
--17/06/2024
--We need to read/write the data from "WARNER_BASE_DEV database and read access for SEAWARE_APS schema in the WARNER_STORE

 USE ROLE sysadmin;

CREATE WAREHOUSE warner_aps_reconciliation_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role warner_aps_reconciliation;

--DROP ROLE warner_aps_reconciliation;

CREATE ROLE _warner_aps_reconciliation_xsmall__warehouse__operator;
CREATE ROLE _warner_aps_reconciliation_xsmall__warehouse__usage;

create user warner_aps_reconciliation_service_account
login_name = 'warner.aps.reconciliation'
password = '<REDACTED>'
display_name = 'Warner APS Reconciliation Service Account'
email = 'sumitkumar.gupta@bourne-leisure.co.uk'
comment = 'Warner APS Reconciliation Service Account'
default_role = warner_aps_reconciliation
default_warehouse = warner_aps_reconciliation_xsmall;


USE ROLE securityadmin;

grant usage, monitor on warehouse warner_aps_reconciliation_xsmall to role _warner_aps_reconciliation_xsmall__warehouse__usage;
grant role _warner_aps_reconciliation_xsmall__warehouse__usage to role _warner_aps_reconciliation_xsmall__warehouse__operator;
grant operate, modify on warehouse warner_aps_reconciliation_xsmall to role _warner_aps_reconciliation_xsmall__warehouse__operator;

GRANT ROLE _warner_aps_reconciliation_xsmall__warehouse__usage TO ROLE warner_aps_reconciliation;
GRANT ROLE _warner_store__seaware_aps__reader TO ROLE warner_aps_reconciliation;
GRANT ROLE _warner_base_dev__schema TO ROLE warner_aps_reconciliation;