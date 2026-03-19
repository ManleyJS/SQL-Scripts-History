use role accountadmin;

CREATE or replace CATALOG INTEGRATION ETLEAP_ICEBERG_CATALOG
CATALOG_SOURCE = GLUE
GLUE_AWS_ROLE_ARN = 'arn:aws:iam::328265102953:role/blg-snowflake-iceberg-integration-role'
GLUE_CATALOG_ID = '328265102953'
CATALOG_NAMESPACE = 'etleapicebergintegrationdatabase'
GLUE_REGION = 'eu-west-1'
TABLE_FORMAT = ICEBERG
ENABLED = TRUE;

CREATE or replace EXTERNAL VOLUME ETLEAP_ICEBERG_EXTERNAL_VOLUME
STORAGE_LOCATIONS = ((
    NAME = 'etleap_iceberg_bucket'
    STORAGE_PROVIDER = 'S3'
    STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::328265102953:role/blg-snowflake-iceberg-integration-role'
    STORAGE_BASE_URL = 's3://blg-etleap-iceberg-integrations-data-s3/'
))
ALLOW_WRITES = FALSE;

use role accountadmin;

call  SYSTEM$VERIFY_EXTERNAL_VOLUME('ETLEAP_ICEBERG_EXTERNAL_VOLUME');

DESC CATALOG INTEGRATION ETLEAP_ICEBERG_CATALOG;

-- old value : BD78472_SFCRole=2_3kuxLDrqlkIPLJtElLIZpZib0l0=
-- new value : BD78472_SFCRole=2_b6cAiczhp0t7Hx/qNxhTnEaA5GU=
-- latest : BD78472_SFCRole=2_d3A6mn7sjYpxN9moQjgAx2ROFSY=

SELECT *
FROM table(RESULT_SCAN(LAST_QUERY_ID())) 
--WHERE "property" = 'STORAGE_LOCATION_1'
;


DESC CATALOG INTEGRATION ETLEAP_ICEBERG_CATALOG;

DESC EXTERNAL VOLUME ETLEAP_ICEBERG_EXTERNAL_VOLUME;
     
SELECT
  PARSE_JSON("property_value")['STORAGE_AWS_IAM_USER_ARN'] STORAGE_AWS_IAM_USER_ARN,
  PARSE_JSON("property_value")['STORAGE_AWS_EXTERNAL_ID'] STORAGE_AWS_EXTERNAL_ID
FROM table(RESULT_SCAN(LAST_QUERY_ID())) WHERE "property" = 'STORAGE_LOCATION_1';

DESC EXTERNAL VOLUME ETLEAP_ICEBERG_EXTERNAL_VOLUME;

SELECT
  PARSE_JSON("property_value")['STORAGE_AWS_IAM_USER_ARN'] STORAGE_AWS_IAM_USER_ARN,
  PARSE_JSON("property_value")['STORAGE_AWS_EXTERNAL_ID'] STORAGE_AWS_EXTERNAL_ID
FROM table(RESULT_SCAN(LAST_QUERY_ID())) 
WHERE "property" = 'STORAGE_LOCATION_1'
;


use role securityadmin;

GRANT USAGE ON EXTERNAL VOLUME ETLEAP_ICEBERG_EXTERNAL_VOLUME TO ROLE haven_etleap_dataload;
GRANT USAGE ON INTEGRATION ETLEAP_ICEBERG_CATALOG TO ROLE haven_etleap_dataload;

use role securityadmin;

grant role _haven_raw__iceberg_etleap_poc__creator to role haven_etleap_dataload;

grant create iceberg table on schema haven_raw.iceberg_etleap_poc to role _haven_raw__iceberg_etleap_poc__creator;



