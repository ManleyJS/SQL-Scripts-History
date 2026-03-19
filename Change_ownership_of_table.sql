use role dba;

use schema haven_store_dev.availability;

show tables;

use role securityadmin;

grant ownership on table haven_store_dev.availability.GRADE_PRICE_HISTORY_SCD to role haven_dbt_transform_dev revoke current grants;
grant select on table haven_store_dev.availability.GRADE_PRICE_HISTORY_SCD to role _haven_store_dev__availability__reader;

grant ownership on table haven_store_qat.availability.GRADE_PRICE_HISTORY_SCD to role haven_dbt_transform_qat revoke current grants;
grant select on table haven_store_qat.availability.GRADE_PRICE_HISTORY_SCD to role _haven_store_qat__availability__reader;

grant ownership on table haven_store_prod.availability.GRADE_PRICE_HISTORY_SCD to role haven_dbt_transform_prod revoke current grants;
grant select on table haven_store_prod.availability.GRADE_PRICE_HISTORY_SCD to role _haven_store_prod__availability__reader;

use role haven_dbt_transform_dev;
use schema haven_store_dev.availability;
use warehouse haven_dbt_transform_dev_warehouse_xsmall;
select * from grade_price_history_scd limit 10;


use role haven_dbt_transform_qat;
use schema haven_store_qat.availability;
use warehouse haven_dbt_transform_qat_warehouse_xsmall;
select * from grade_price_history_scd limit 10;

use role haven_dbt_transform_prod;
use schema haven_store_prod.availability;
use warehouse haven_dbt_transform_prod_warehouse_xsmall;
select * from grade_price_history_scd limit 10;