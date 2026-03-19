use role sysadmin
;

CREATE WAREHOUSE haven_etleap_dataload_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD'
;

---------

use ROLE useradmin;

create role haven_etleap_dataload;

create OR REPLACE role _haven_etleap_dataload_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _haven_etleap_dataload_warehouse_xsmall__warehouse__usage;

--pete.richardson@haven.com
--pete.richardson

create user haven_etleap_dataload
login_name = 'haven.etleap.dataload'
password = '<REDACTED>'
display_name = 'Haven ETleap Dataload'
email = 'jonathan.manley@bourne-leisure.co.uk'
comment = 'Haven ETleap Dataload'
default_role = haven_etleap_dataload
default_warehouse = haven_etleap_dataload_warehouse_xsmall;

use ROLE useradmin;

ALTER user haven_etleap_dataload
SET RSA_PUBLIC_KEY = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoeFEXJ6GCHue+yaVqDjF
O+NlmsyQJIsB+Rikc84mnaTvoqs4/MTqwiHcnZMRIb+ShGrUV/HdEkyKJBQJhrqj
MwWtzlwJVUdLUC2xuNj3pSVxfU6oPnc2nipXvpJmZ8oyyeJ8Hj6fFOWY8++okvFD
KEMheH1KD0IuM14VVrPTI225qnlddlX6v4vsf7bAbji6BbQM994vbavCMqawRjAj
w5P26WqEpCUmeCO8xo2Lq3g6dqJg/nuRb8P541v0tEolskRKgXzTpvtseGJkdjGp
uqHx0wkrQeO8caQ8y6aOVCU9Ypijb20MkHYAwktF+VzDnK6DsjXkB9cWcylULDaS
yQIDAQAB';


USE ROLE securityadmin;

grant usage, monitor on warehouse haven_etleap_dataload_warehouse_xsmall to role _haven_etleap_dataload_warehouse_xsmall__warehouse__usage;
grant role _haven_etleap_dataload_warehouse_xsmall__warehouse__usage to role _haven_etleap_dataload_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_etleap_dataload_warehouse_xsmall to role _haven_etleap_dataload_warehouse_xsmall__warehouse__operator;

GRANT role _haven_etleap_dataload_warehouse_xsmall__warehouse__usage TO ROLE haven_etleap_dataload;
GRANT ROLE _haven_raw__freshsales__creator TO ROLE haven_etleap_dataload;

GRANT ROLE haven_etleap_dataload TO USER haven_etleap_dataload;

USE ROLE dba;

