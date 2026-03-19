--Select * from "SNOWFLAKE"."ACCOUNT_USAGE"."COPY_HISTORY" where table_name = 'OCC_BY_ARRIVAL_DATE_FILL' and schema_name = 'OCANDC';

select * from information_schema.load_history where table_name = 'OCC_BY_ARRIVAL_DATE_FILL' and schema_name = 'OCANDC';

--SASMART.NVR_REVMGT_REBOOKS_CURRENT
--trooper_live.dbo.spg_trawler_publish

use role securityadmin;
grant role _haven_store__activities__creator to role haven_batch_dataload;

use role dba;


