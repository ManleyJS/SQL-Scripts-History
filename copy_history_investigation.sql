use role dba;
use schema haven_store.ocandc_sales_pricing;

select *
from table(information_schema.copy_history(table_name=>'OCC_DENSE_LEAD_TIME_DAY_WITH_BREAKS', start_time=> dateadd(date, -5, current_timestamp())));

select * from snowflake.account_usage.copy_history where table_name = 'HAVEN_DETAILS' order by last_load_time desc limit 500;

select * from snowflake.account_usage.query_history where database_name = 'HAVEN_RAW' and SCHEMA_NAME = 'COMPETITOR' and upper(query_text) like 'TRUNCATE TABLE%PARKDEAN%' order by start_time desc limit 20;

show tables in account ;

use role dba;

use schema haven_store.payments;

select system$clustering_information('PAYMENT_DATA', '(BRIC)');

use role sysadmin;

