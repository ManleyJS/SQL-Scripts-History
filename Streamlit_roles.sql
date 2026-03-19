USE ROLE SECURITYADMIN;

GRANT ROLE _TRAINING__TRAINING__CREATOR TO ROLE DBA;

GRANT CREATE STREAMLIT ON SCHEMA TRAINING.TRAINING TO ROLE _TRAINING__TRAINING__CREATOR;

SHOW GRANTS ON DATABASE HAVEN_COMMERCIAL;

SHOW GRANTS ON SCHEMA HAVEN_COMMERCIAL.CT_DEV;

USE ROLE HAVEN_COMMERCIAL_TEST;

USE DATABASE HAVEN_COMMERCIAL;

CREATE SCHEMA ct_st_dev;

DROP SCHEMA ct_st_dev;

USE ROLE DBA;

USE SCHEMA TRAINING.TRAINING;

SHOW STREAMLITS;

USE ROLE HAVEN_COMMERCIAL;

USE DATABASE HAVEN_COMMERCIAL;

SHOW SCHEMAS;
SHOW STREAMLITS;

USE ROLE ACCOUNTADMIN;
SHOW STREAMLITS;
USE ROLE DBA;
USE DATABASE TRAINING;
SHOW STREAMLITS IN ACCOUNT;


grant role warner_store_dev_terraform_rw to user SUNILSHARMA;
grant role warner_store_dev_dbt_rw to user SANDRAIKEGULU;
grant role warner_store_dev_terraform_rw to user SANDRAIKEGULU;
grant role warner_store_dev_dbt_rw to user VISHALJAKHAR;
grant role warner_store_dev_terraform_rw to user VISHALJAKHAR;
grant role warner_store_dev_dbt_rw to user YOGENRANA;
grant role warner_store_dev_terraform_rw to user YOGENRANA;

--ANUSASI
grant role warner_store_dev_dbt_ro to user ANUSASI;
grant role warner_store_dev_terraform_ro to user ANUSASI;

