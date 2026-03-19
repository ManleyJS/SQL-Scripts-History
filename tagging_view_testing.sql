-- initial test of tables and views created on the masked tabe view, and the masked view only

USE ROLE HAVEN_DATA_ENGINEERING;
USE WAREHOUSE HAVEN_DATA_ENGINEERING_WAREHOUSE_XSMALL;

SELECT * FROM HAVEN_STORE_DEV.DELETEME.TEST_TABLE LIMIT 10;
SELECT * FROM HAVEN_STORE_DEV.DELETEME.TEST_VIEW LIMIT 10;
SELECT * FROM HAVEN_STORE_DEV.DELETEME.TEST_VIEW_ON_TAGGED_VIEW LIMIT 10;
SELECT * FROM HAVEN_STORE_DEV.DELETEME.TEST_table_ON_TAGGED_VIEW LIMIT 10;
SELECT * FROM haven_base.plot.owners_masked LIMIT 10;
SELECT * FROM haven_base.plot.owners_masked_view LIMIT 10;
SELECT * FROM haven_base.plot.owners LIMIT 10;

USE ROLE HAVEN_DBT_DEVELOPMENT;
USE WAREHOUSE HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;

SELECT * FROM HAVEN_STORE_DEV.DELETEME.TEST_TABLE LIMIT 10;
SELECT * FROM HAVEN_STORE_DEV.DELETEME.TEST_VIEW LIMIT 10;
SELECT * FROM HAVEN_STORE_DEV.DELETEME.TEST_VIEW_ON_TAGGED_VIEW LIMIT 10;
SELECT * FROM HAVEN_STORE_DEV.DELETEME.TEST_table_ON_TAGGED_VIEW LIMIT 10;
SELECT * FROM haven_base.plot.owners_masked LIMIT 10;
SELECT * FROM haven_base.plot.owners_masked_view LIMIT 10;

create schema haven_store_dev.dbt_role_deleteme;
CREATE VIEW haven_store_dev.dbt_role_deleteme.test_view_on_tagged_view
AS SELECT * FROM haven_base.plot.owners_masked_view;

CREATE TABLE haven_store_dev.dbt_role_deleteme.test_table_on_tagged_view
AS SELECT * FROM haven_base.plot.owners_masked_view;

USE ROLE HAVEN_DATA_ENGINEERING;
USE WAREHOUSE HAVEN_DATA_ENGINEERING_WAREHOUSE_XSMALL;

SELECT * FROM HAVEN_STORE_DEV.dbt_role_deleteme.TEST_VIEW_ON_TAGGED_VIEW LIMIT 10;
SELECT * FROM HAVEN_STORE_DEV.dbt_role_deleteme.TEST_table_ON_TAGGED_VIEW LIMIT 10;

USE ROLE HAVEN_DBT_DEVELOPMENT;
USE WAREHOUSE HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;

SELECT * FROM HAVEN_STORE_DEV.dbt_role_deleteme.TEST_VIEW_ON_TAGGED_VIEW LIMIT 10;
SELECT * FROM HAVEN_STORE_DEV.dbt_role_deleteme.TEST_table_ON_TAGGED_VIEW LIMIT 10;


USE ROLE HAVEN_DBT_TRANSFORM_DEV;
USE WAREHOUSE HAVEN_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL;

SELECT * FROM HAVEN_STORE_DEV.dbt_role_deleteme.TEST_VIEW_ON_TAGGED_VIEW LIMIT 10;
SELECT * FROM HAVEN_STORE_DEV.dbt_role_deleteme.TEST_table_ON_TAGGED_VIEW LIMIT 10;

USE ROLE HAVEN_DBT_DEVELOPMENT;
USE WAREHOUSE HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;
drop schema haven_store_dev.dbt_role_DELETEME;

USE ROLE DBA;
USE WAREHOUSE DBA_WH;
DROP SCHEMA HAVEN_STORE_DEV.DELETEME;

-- repeat the test using the masked view only

USE ROLE HAVEN_DBT_DEVELOPMENT;
USE WAREHOUSE HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;
CREATE SCHEMA HAVEN_STORE_DEV.DELETEME;

SELECT GET_DDL('VIEW', 'HAVEN_BASE.PLOT.OWNERS_MASKED');
SELECT GET_DDL('VIEW', 'HAVEN_BASE.PLOT.OWNERS_MASKED_VIEW');


CREATE VIEW haven_store_dev.DELETEme.test_view_on_tagged_view
AS SELECT * FROM haven_base.plot.owners_masked_view;

CREATE TABLE haven_store_dev.DELETEme.test_table_on_tagged_view
AS SELECT * FROM haven_base.plot.owners_masked_view;

select * from haven_store_dev.DELETEme.test_view_on_tagged_view limit 10;

USE ROLE HAVEN_DBT_TRANSFORM_DEV;
USE WAREHOUSE HAVEN_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL;
select * from haven_store_dev.DELETEme.test_view_on_tagged_view limit 10;

-- repeat the test having dropped the masked table viewq, and jiust working with the masked view only

USE ROLE HAVEN_DBT_DEVELOPMENT;
USE WAREHOUSE HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;

SELECT GET_DDL('VIEW', 'HAVEN_BASE.PLOT.OWNERS_MASKED');
SELECT GET_DDL('VIEW', 'HAVEN_BASE.PLOT.OWNERS_MASKED_VIEW');

drop view haven_store_dev.DELETEme.test_view_on_tagged_view;

CREATE VIEW haven_store_dev.DELETEme.test_view_on_tagged_view
AS SELECT * FROM haven_base.plot.owners_masked;

CREATE TABLE haven_store_dev.DELETEme.test_table_on_tagged_view
AS SELECT * FROM haven_base.plot.owners_masked;

select * from haven_store_dev.DELETEme.test_view_on_tagged_view limit 10;
select * from haven_store_dev.DELETEme.test_table_on_tagged_view limit 10;

USE ROLE HAVEN_DBT_TRANSFORM_DEV;
USE WAREHOUSE HAVEN_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL;
select * from haven_store_dev.DELETEme.test_view_on_tagged_view limit 10;
select * from haven_store_dev.DELETEme.test_table_on_tagged_view limit 10;

USE ROLE HAVEN_DATA_ENGINEERING;
USE WAREHOUSE HAVEN_DATA_ENGINEERING_WAREHOUSE_XSMALL;
select * from haven_store_dev.DELETEme.test_view_on_tagged_view limit 10;
select * from haven_store_dev.DELETEme.test_table_on_tagged_view limit 10;

use role securityadmin;

show roles like '%masking_policy%';

revoke role __CAR_REGISTRATION_MASKING_POLICY_LOCATION_ROLE from role haven_dbt_development;
revoke role __CAR_REGISTRATION_MASKING_POLICY_LOCATION_YEAR_ROLE from role haven_dbt_development;
revoke role __CAR_REGISTRATION_MASKING_POLICY_YEAR_ROLE from role haven_dbt_development;
revoke role __DATE_OF_BIRTH_MASKING_POLICY_AGE_DATA_RANGE_ROLE from role haven_dbt_development;
revoke role __DATE_OF_BIRTH_MASKING_POLICY_AGE_DATA_ROLE from role haven_dbt_development;
revoke role __EMAIL_MASKING_POLICY_PROVIDER_ROLE from role haven_dbt_development;
revoke role __POSTCODE_MASKING_POLICY_AREA_ROLE from role haven_dbt_development;
revoke role __POSTCODE_MASKING_POLICY_REGION_ROLE from role haven_dbt_development;
revoke role __POSTCODE_MASKING_POLICY_SECTOR_ROLE from role haven_dbt_development;

USE ROLE HAVEN_DBT_DEVELOPMENT;
USE WAREHOUSE HAVEN_DBT_DEVELOPMENT_WAREHOUSE_XSMALL;
select * from haven_store_dev.DELETEme.test_view_on_tagged_view limit 10;
select * from haven_store_dev.DELETEme.test_table_on_tagged_view limit 10;


USE ROLE HAVEN_DATA_ENGINEERING;
USE WAREHOUSE HAVEN_DATA_ENGINEERING_WAREHOUSE_XSMALL;
select * from haven_store_dev.DELETEme.test_view_on_tagged_view limit 10;
select * from haven_store_dev.DELETEme.test_table_on_tagged_view limit 10;
