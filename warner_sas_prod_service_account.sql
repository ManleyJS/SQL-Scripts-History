use role sysadmin;

CREATE WAREHOUSE WARNER_SAS_warehouse WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

GRANT OWNERSHIP ON WAREHOUSE WARNER_SAS_warehouse TO ROLE warner_terraform_transform;

use role useradmin;

-- SAS.PROD.SERVICE.ACCOUNT
-- SAS_jAkK36QF
create user sas_prod_service_account
login_name = sas.prod.service.account
display_name = 'Warner SAS Production'
comment = 'Warner SAS Production service account'
default_role = WARNER_SAS 
default_warehouse = WARNER_SAS_warehouse
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4B3Xieb32/lhWwGexC0Z
zjjPXyclBf/9wVEjztz1W05Aq/hMPjv4YEG5HxPGsbCsvlhz+mGw51EidIJC25k2
Rbu2El19rQ6UbvypZQLN8C8VlFUJlmXTGKDWhajbSzpJyhr++FZs52Tmcz5Ib1Ds
wFvBeZeuqXNT8dUHqvqMvMZaRbyQDOHe4jMKwhgvche3i7A+AcuQFrPXh7ECvhZI
hr8j+rn49FC5NhssJRKRA4SFNawF8WRiPoWl+tcQdLu1RE5UfkaZXDhHTJT9TMZR
P5pwTZeH1tBq1iJ8Wt+Zv1E3iu+YOHxhFgRb73eOgQwDKkE9fIgK/j0zTv/EwPn3
UQIDAQAB';

ALTER USER sas_prod_service_account SET default_role = PUBLIC;

DESCRIBE USER warner_sas_prod_service_account;

ALTER USER sas_prod_service_account SET password = '<REDACTED>';

SHOW USERS LIKE 'dion%'

ALTER USER sas_prod_service_account RENAME to warner_sas_prod_service_account; 

USE ROLE warner_cust_sas;

USE SCHEMA warner_cust.ma_mart;
SHOW views;
DESCRIBE VIEW <view_name>;

USE ROLE useradmin;
create user suzannerichardson1
login_name = 'suzanne.richardson1@bourne-leisure.co.uk'
email = 'suzanne.richardson1@bourne-leisure.co.uk'
display_name = 'Suzanne Richardson'
comment = 'Marketing Consultant'
default_role = WARNER_CUST_SAS 
default_warehouse = WARNER_SAS_warehouse;

ALTER USER suzannerichardson1 SET default_namespace = warner_cust.MA_MART;

SHOW WAREHOUSES LIKE 'warner_sas%';

USE ROLE securityadmin;

GRANT ROLE WARNER_CUST_SAS to USER suzannerichardson1;

USE ROLE WARNER_CUST_SAS;

USE SCHEMA warner_cust.ma_mart;
DESCRIBE VIEW d_wrn_guest;