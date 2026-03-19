USE ROLE sysadmin;

SHOW WAREHOUSES LIKE '%pricer%';

USE ROLE useradmin;

SHOW ROLES LIKE '%pricer%';

create user haven_dbt_transform_pricer_uat
login_name = 'haven.dbt.transform.pricer.uat'
password = '<REDACTED>'
display_name = 'Haven DBT Pricer UAT'
email = 'donatas.gedgaudas@haven.com'
comment = 'Haven DBT Pricer UAT Model Development'
default_role = haven_dbt_transform_pricer_uat
default_warehouse = HAVEN_REVENUE_MANAGEMENT_PRICER_UAT_WAREHOUSE_MEDIUM;

USE ROLE securityadmin;

GRANT ROLE haven_dbt_transform_pricer_uat TO USER haven_dbt_transform_pricer_uat;

SHOW GRANTS TO USER haven_dbt_transform_pricer_uat;
SHOW GRANTS TO ROLE haven_dbt_transform_pricer_uat;
SHOW GRANTS TO ROLE haven_revenue_management_pricer_uat;