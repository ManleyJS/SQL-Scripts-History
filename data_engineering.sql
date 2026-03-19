SHOW GRANTS TO ROLE data_engineering_MarlonGill;

SHOW GRANTS TO USER marlongill;

SHOW GRANTS TO role digital_operations;

show GRANTS TO ROLE data_engineering;

USE ROLE securityadmin;
SHOW GRANTS TO ROLE _BOURNE_DATA_ENGINEERING__WAREHOUSE__USAGE;

USE ROLE useradmin;

-- paul.calo@bourne-leisure.co.uk

CREATE ROLE data_engineering_PaulCalo;

create user PaulCalo
login_name = 'paul.calo@bourne-leisure.co.uk'
display_name = 'Paul Calo'
email = 'paul.calo@bourne-leisure.co.uk'
comment = 'Data Engineering team'
default_role = 'data_engineering_PaulCalo'
default_warehouse = 'BOURNE_DATA_ENGINEERING_XSMALL';

ALTER USER paulcalo SET default_warehouse = BOURNE_DATA_ENGINEERING_XSMALL;

USE ROLE securityadmin;

GRANT ROLE data_engineering TO ROLE data_engineering_PaulCalo;
GRANT ROLE _BOURNE_WORK__ENGINEERING__CREATOR TO ROLE data_engineering_PaulCalo;
GRANT ROLE data_engineering_PaulCalo TO USER paulcalo;

SHOW GRANTS TO USER paulcalo;

--------------------------------

SHOW ROLES LIKE '%transform%';
SHOW GRANTS TO ROLE haven_data_transform;

USE ROLE useradmin;


CREATE ROLE haven_data_transform_MohammadZahuruddin;
--CREATE ROLE haven_data_integration_MohammadZahuruddin;

create user MohammadZahuruddin
login_name = 'Mohammad.Zahuruddin@haven.com'
display_name = 'MohammadZahuruddin'
email = 'Mohammad.Zahuruddin@haven.com'
comment = 'Data Engineering team'
default_role = haven_data_trasform_MohammadZahuruddin
default_warehouse = haven_data_transform_warehouse_xsmall;

USE ROLE securityadmin;

--GRANT ROLE haven_data_integration TO ROLE data_engineering_MohammadZahuruddin;
GRANT ROLE haven_data_transform TO ROLE haven_data_transform_MohammadZahuruddin;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_MohammadZahuruddin;
GRANT ROLE haven_data_transform_MohammadZahuruddin TO USER MohammadZahuruddin;

SHOW GRANTS TO USER MohammadZahuruddin;
SHOW GRANTS TO ROLE haven_data_transform_MohammadZahuruddin;