USE ROLE sysadmin;

ALTER DATABASE warner_dev RENAME TO warner_base_sit;
ALTER WAREHOUSE warner_dev_wh RENAME TO warner_dwh_dev;

SHOW ROLES LIKE '%warner_dalter role ev%';

USE ROLE useradmin;

ALTER ROLE _WARNER_DEV_WH__WAREHOUSE__OPERATOR RENAME TO _WARNER__DWH_DEV__WAREHOUSE__OPERATOR; 
ALTER ROLE _WARNER_DEV_WH__WAREHOUSE__USAGE RENAME TO _WARNER_DWH_DEV__WAREHOUSE__USAGE;
ALTER ROLE _WARNER_DEV__SCHEMA RENAME TO _warner_base_sit__SCHEMA;
ALTER ROLE _WARNER_DEV__USAGE RENAME TO _warner_base_sit__USAGE;

USE ROLE securityadmin;
GRANT USAGE ON DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT ROLE _warner_base_sit__usage TO ROLE _warner_base_sit__schema;
GRANT CREATE SCHEMA ON DATABASE warner_base_sit TO ROLE _warner_base_sit__schema;
GRANT SELECT ON future TABLES IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT SELECT ON ALL TABLES IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT SELECT ON future VIEWS IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT SELECT ON all VIEWS IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT USAGE ON future STAGES IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT USAGE ON ALL STAGES IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT USAGE ON ALL FILE FORMATS IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;


USE ROLE sysadmin;

ALTER DATABASE warner_sit RENAME TO warner_base_sit;
ALTER WAREHOUSE warner_sit_wh RENAME TO warner_dwh_sit;

USE ROLE useradmin;

ALTER ROLE _warner_sit_WH__WAREHOUSE__OPERATOR RENAME TO _WARNER__DWH_SIT__WAREHOUSE__OPERATOR; 
ALTER ROLE _warner_sit_WH__WAREHOUSE__USAGE RENAME TO _WARNER_DWH_SIT__WAREHOUSE__USAGE;
ALTER ROLE _warner_sit__SCHEMA RENAME TO _warner_base_SIT__SCHEMA;
ALTER ROLE _warner_sit__USAGE RENAME TO _warner_base_SIT__USAGE;

USE ROLE securityadmin;
--REVOKE USAGE ON DATABASE warner_base_dev from ROLE _warner_base_sit__usage;
GRANT USAGE ON DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT ROLE _warner_base_sit__usage TO ROLE _warner_base_sit__schema;
GRANT CREATE SCHEMA ON DATABASE warner_base_sit TO ROLE _warner_base_sit__schema;
GRANT SELECT ON future TABLES IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT SELECT ON ALL TABLES IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT SELECT ON future VIEWS IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT SELECT ON all VIEWS IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT USAGE ON future STAGES IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT USAGE ON ALL STAGES IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;
GRANT USAGE ON ALL FILE FORMATS IN DATABASE warner_base_sit TO ROLE _warner_base_sit__usage;

USE ROLE securityadmin;

GRANT ROLE _warner_base__seaware__reader TO ROLE warner_store_dbt_dev;
GRANT ROLE _warner_base__seaware__reader TO ROLE warner_store_terraform_dev;

GRANT ROLE _warner_store__APS_Share__creator TO ROLE warner_store_dbt_dev;
GRANT ROLE _warner_store__APS_Share__creator TO ROLE warner_store_terraform_dev;
show ROLES LIKE '_warner_store_%'; 
GRANT ROLE _warner_store_dwh_dev__warehouse__usage TO ROLE warner_store_dbt_dev;
GRANT ROLE _warner_store_dwh_dev__warehouse__usage TO ROLE warner_store_terraform_dev;
GRANT ROLE warner_store_dbt_dev TO ROLE dba;
GRANT ROLE warner_store_terraform_dev TO ROLE dba;

USE ROLE warner_store_dbt_dev;

CREATE OR REPLACE SECURE VIEW WARNER_STORE.APS_SHARE.ACC_COUPON_CLASS
( COUPON_CLASS, RECORD_ID, COMMENTS, EXTERNAL_CODE, IS_GEN_PER_CLIENT, APPLY_AS_PAYMENT, IS_APPLY_PER_CLIENT, DFLT_QTY_VALID_DAYS, FREQUENT_PGM_CODE )
AS SELECT COUPON_CLASS, RECORD_ID, COMMENTS, EXTERNAL_CODE, IS_GEN_PER_CLIENT, APPLY_AS_PAYMENT, IS_APPLY_PER_CLIENT, DFLT_QTY_VALID_DAYS, FREQUENT_PGM_CODE
FROM WARNER_BASE.SEAWARE.ACC_COUPON_CLASS;

GRANT SELECT ON  VIEW WARNER_STORE.APS_SHARE.ACC_COUPON_CLASS to database role warner_store.aps_share;

USE ROLE securityadmin;

SHOW USERS;

GRANT ROLE warner_store_dbt_dev TO USER SUMITGUPTA;
GRANT ROLE warner_store_dbt_dev TO USER SUNILSHARMA;
GRANT ROLE warner_store_dbt_dev TO USER VISHALJAKHAR;

