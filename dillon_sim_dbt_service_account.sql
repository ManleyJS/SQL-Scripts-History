USE ROLE useradmin;

DESCRIBE USER dillonsim;

create user rms_dbt_service_account
login_name = 'rms.dbt.service.account'
password = '<REDACTED>'
display_name = 'Haven ARMS DBT Service Account'
comment = 'Haven RMS DBT Service Account'
default_role = haven_commercial_dillonsim
DEFAULT_WAREHOUSE = haven_commercial_xsmall;

 USE ROLE securityadmin;
 
GRANT ROLE haven_commercial_dillonsim TO USER rms_dbt_service_account; 