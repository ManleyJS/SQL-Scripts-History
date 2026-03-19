use schema snowflake.account_usage;

select * from tables 
where startswith(table_name, 'FCT_HOLIDAY_BOOKINGS_PRORATED')
and deleted is null;


select table_catalog, table_schema, table_name, row_count, bytes, created
from tables
where row_count >= 100000000
and deleted is null
order by row_count desc;

-- 58,665,087,053



use role dba;

desc table HAVEN_STORE_UAT.HOLIDAY.FCT_HOLIDAY_ADDONS;

use role haven_dbt_transform;

use schema haven_store.availability;

show tables;

use role haven_batch_dataload;

desc table INVENTORY_AVAILABILITY_HISTORY;