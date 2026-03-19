use role accountadmin;

select * from snowflake.account_usage.login_history
where user_name = 'JONATHANMANLEY'
and event_timestamp > '2024-09-28'
order by event_timestamp desc;

show resource monitors like 'bourne%';

use role haven_dbt_transform;

use schema haven_store.retail;

alter table haven_store.retail.fct_retail_sales rename to haven_store.retail.fct_retail_sales_old ;
undrop table haven_store.retail.fct_retail_sales;
alter table haven_store.retail.fct_retail_sales_old rename to haven_store.retail.fct_retail_sales ;

use role ;

create table haven_store.retail.fct_retail_sales 
as select * from haven_store.retail.fct_retail_sales_old before(STATEMENT=>'01b74a52-0204-ed65-00aa-99012f7236a3');

select * from haven_store.retail.fct_retail_sales_old before(STATEMENT=>'01b74a52-0204-ed65-00aa-99012f7236a3');
select * from haven_store.retail.fct_retail_sales at(timestamp => '2024-09-26 15:10:20.000 +0100');

show tables;

use role dba;

use schema haven_raw.seaware;

show tables;

SELECT table_id,
  table_name,
  table_schema,
  table_catalog,
  created,
  deleted,
  comment
FROM SNOWFLAKE.ACCOUNT_USAGE.TABLES
WHERE table_catalog = 'HAVEN_STORE'
AND table_schema = 'RETAIL'
AND table_name = 'FCT_RETAIL_SALES'
--AND deleted IS NOT NULL
ORDER BY deleted;

use schema training.training;

show tables;