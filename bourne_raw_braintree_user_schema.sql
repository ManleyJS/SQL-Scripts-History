use role useradmin;

CREATE ROLE bourne_braintree_dataload;

create user bourne_braintree_dataload
password = 'BourneBraintree@2022' 
login_name = 'bourne.braintree.dataload'
display_name = 'Bourne raintree Data Load'
default_role = bourne_braintree_dataload
default_warehouse = bourne_batch_dataload_xsmall
default_namespace = bourne_raw.braintree;

GRANT ROLE _bourne_raw__braintree__creator TO ROLE bourne_braintree_dataload;
GRANT ROLE _bourne_raw__create TO ROLE bourne_braintree_dataload;
GRANT ROLE _bourne_batch_dataload__warehouse__usage TO ROLE bourne_braintree_dataload;
GRANT ROLE bourne_braintree_dataload TO USER bourne_braintree_dataload;

USE ROLE securityadmin;
GRANT ROLE _haven_store__ma_mart__creator TO ROLE haven_batch_dataload;

USE ROLE useradmin;

CREATE ROLE dbt_training_dataload;

create user dbt_training_dataload
password = 'DBTTraining@2022' 
login_name = 'dbt.training.dataload'
display_name = 'DBT Training Data Load'
default_role = dbt_training_dataload
default_warehouse = Bourne_training_dataload_wh
default_namespace = training.dbt;

USE ROLE securityadmin;

GRANT ROLE _training__training__creator TO ROLE dbt_training_dataload;
GRANT ROLE _training__usage TO ROLE _training__training__usage;  
GRANT ROLE _Bourne_training_dataload_wh__warehouse__usage TO ROLE dbt_training_dataload;
GRANT ROLE dbt_training_dataload TO USER dbt_training_dataload;
GRANT ROLE _training__citibike__reader TO ROLE dbt_training_dataload;

GRANT ROLE _training__jaffle_shop__creator TO ROLE dbt_training_dataload;
GRANT ROLE _training__stripe__creator TO ROLE dbt_training_dataload;
