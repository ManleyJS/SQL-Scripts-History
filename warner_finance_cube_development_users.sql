USE ROLE useradmin;

-- Volodymyr Vasiuta
-- volodymyr.vasiuta@warnerhotels.com
-- SoftServe Engineer

create user VolodymyrVasiuta
login_name = 'volodymyr.vasiuta@warnerhotels.com'
display_name = 'Volodymyr vasiuta'
email = 'volodymyr.vasiuta@warnerhotels.com'
comment = 'SoftServe Engineer'
default_role = warner_dbt_transform_dev
DEFAULT_WAREHOUSE = warner_dbt_transform_dev_warehouse_xsmall
;

USE ROLE securityadmin;

GRANT ROLE warner_dbt_transform_dev TO USER VolodymyrVasiuta;

USE ROLE dba;

