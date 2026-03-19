use role dba;
use schema haven_store.ocandc_sales_pricing;

select *
from table(information_schema.copy_history(table_name=>'OCC_DENSE_LEAD_TIME_DAY_WITH_BREAKS', start_time=> dateadd(date, -5, current_timestamp())));


select * from snowflake.account_usage.copy_history where table_name = 'HAVEN_DETAILS' order by last_load_time desc limit 500;

select * from snowflake.account_usage.query_history where database_name = 'HAVEN_RAW' and SCHEMA_NAME = 'COMPETITOR' and upper(query_text) like 'TRUNCATE TABLE%PARKDEAN%' order by start_time desc limit 20;

show tables in account ;

use role dba;
use database haven_store;
use schema integration;

show stages;

use role securityadmin;
grant usage on future stages in schema haven_store.integration to role data_engineering;

revoke read on future stages in schema haven_store.integration from role data_engineering;
revoke READ ON future STAGES IN schema haven_store.integration from role _haven_store__integration__reader;

"HAVEN_STORE"."TROOPER"."OUTSTANDING_DEBT_2019"

grant SELECT on all tables in schema haven_store.integration to role _haven_store__integration__reader;
grant SELECT on future tables in schema haven_store.integration to role _haven_store__integration__reader;
grant SELECT on all views in schema haven_store.integration to role _haven_store__integration__reader;
grant SELECT on future views in schema haven_store.integration to role _haven_store__integration__reader;
grant SELECT on all materialized views in schema haven_store.integration to role _haven_store__integration__reader;
grant SELECT on future materialized views in schema haven_store.integration to role _haven_store__integration__reader;

GRANT READ ON all STAGES IN schema haven_store.integration to role _haven_store__integration__reader;
GRANT READ ON future STAGES IN schema haven_store.integration to role _haven_store__integration__reader;

grant role _haven_store__integration__reader to role _haven_store__integration__writer;
grant insert, update, delete, truncate on all tables in schema haven_store.integration to role _haven_store__integration__writer;
grant insert, update, delete, truncate on future tables in schema haven_store.integration to role _haven_store__integration__writer;
GRANT read, WRITE, USAGE ON all STAGES in schema haven_store.integration to role _haven_store__integration__writer;
GRANT read, WRITE, USAGE ON future STAGES in schema haven_store.integration to role _haven_store__integration__writer;
GRANT USAGE ON all FILE formats IN schema haven_store.integration to role _haven_store__integration__writer;
GRANT USAGE ON future FILE FORMATs IN schema haven_store.integration to role _haven_store__integration__writer;
GRANT USAGE ON all PROCEDUREs IN schema haven_store.integration to role _haven_store__integration__writer;
GRANT USAGE ON future PROCEDUREs IN schema haven_store.integration to role _haven_store__integration__writer;
GRANT USAGE ON all FUNCTIONs IN schema haven_store.integration to role _haven_store__integration__writer;
GRANT USAGE ON future FUNCTIONs IN schema haven_store.integration to role _haven_store__integration__writer;
GRANT USAGE ON all SEQUENCEs IN schema haven_store.integration to role _haven_store__integration__writer;
GRANT USAGE ON future SEQUENCEs IN schema haven_store.integration to role _haven_store__integration__writer;


show roles like '%COMMERCIAL%';

USE ROLE SECURITYADMIN;

GRANT ROLE _HAVEN_STORE__PAYMENTS__READER TO ROLE HAVEN_COMMERCIAL;

USE ROLE HAVEN_COMMERCIAL;

use role dba;

use schema haven_store.payments;

select system$clustering_information('PAYMENT_DATA', '(BRIC)');

use role sysadmin;

show roles like '%marlon%';

show grants to role data_engineering_JOHNPERING;

show grants to role data_engineering_marlongill;

SHOW GRANTS TO ROLE DATA_ENGINEERING;

use role securityadmin;

