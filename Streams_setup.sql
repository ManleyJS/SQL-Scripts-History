use role dba;

use schema training.training;

use role securityadmin;

grant role warner_aps_cdc_dataload to role dba;

show warehouses;

show roles like '%TRAINING%';

grant role _BOURNE_TRAINING_DATALOAD_WH__WAREHOUSE__USAGE to role test_permissions_for_database;

show grants to role test_permissions_for_database;


grant create stream on schema training.training to role test_permissions_for_database;

use role test_permissions_for_database;
show views;

select top 20 * from client_test;

use role dba;
alter view client_test set change_tracking = true;

create stream client_test_stream on view client_test;

drop view deleteme;
create table deleteme as select * from client_test;
alter table deleteme set change_tracking = true;

create view deleteme_stream_view as select * from deleteme;
alter view deleteme_stream_view set change_tracking = true;

grant select on view deleteme_stream_view to role test_permissions_for_database;

use role test_permissions_for_database;
show views;

create stream deleteme_stream on view deleteme_stream_view;
drop stream deleteme_stream; 
use role dba;

use role warner_aps_cdc_dataload;

use database warner_raw;

use schema seaware_aps;

alter table warner_raw.seaware_aps.group_booking set change_tracking = true;
alter table warner_raw.seaware_aps.group_event set change_tracking = true;
alter table warner_raw.seaware_aps.ship_inventory_alloc set change_tracking = true;
alter table warner_raw.seaware_aps.acc_trans_detail set change_tracking = true;
alter table warner_raw.seaware_aps.res_invoice_item set change_tracking = true;

use role dba;

use schema warner_base.seaware_aps;

show views;

alter view warner_base.seaware_aps.group_booking set change_tracking = true;
alter view warner_base.seaware_aps.group_event set change_tracking = true;
alter view warner_base.seaware_aps.ship_inventory_alloc set change_tracking = true;
alter view warner_base.seaware_aps.acc_trans_detail set change_tracking = true;
alter view warner_base.seaware_aps.res_invoice_item set change_tracking = true;

use schema warner_store.seaware_aps;

show views;

alter view warner_store.seaware_aps.group_booking set change_tracking = true;
alter view warner_store.seaware_aps.group_event set change_tracking = true;
alter view warner_store.seaware_aps.ship_inventory_alloc set change_tracking = true;
alter view warner_store.seaware_aps.acc_trans_detail set change_tracking = true;
alter view warner_store.seaware_aps.res_invoice_item set change_tracking = true;

use role securityadmin;

show grants to role warner_dbt_transform_dev;

grant create stream on schema warner_store.seaware_aps to role _warner_store__seaware_aps__creator;

grant role _warner_store__seaware_aps__creator to role warner_dbt_transform_dev;

use role warner_dbt_transform_dev;

create stream deleteme on view  warner_store.seaware_aps.group_event;

drop stream deleteme;

use schema warner_store.seaware_aps;

create stream warner_store.seaware_aps.test_stream on table warner_raw.seaware_aps.res_invoice_item;

select * from test_stream;

use schema warner_dwh_dev.warner_bus;

create stream test_stream on table warner_raw.seaware_aps.res_invoice_item;

drop stream test_stream;

use role dba;
create stream test_stream on table warner_raw.seaware_aps.res_invoice_item;

create stream warner_dwh_dev.warner_bus.stream_group_booking_raw on table warner_raw.seaware_aps.group_booking;
create stream warner_dwh_dev.warner_bus.stream_res_invoice_item_raw on table warner_raw.seaware_aps.res_invoice_item;

select * from stream_group_booking_raw;

select * from stream_res_invoice_item_raw;

grant select on stream warner_dwh_dev.warner_bus.stream_group_booking_raw to role warner_dbt_transform_dev;
grant select on stream warner_dwh_dev.warner_bus.stream_res_invoice_item_raw to role warner_dbt_transform_dev;
grant select on stream warner_dwh_dev.warner_bus.test_stream to role warner_dbt_transform_dev;

use role warner_dbt_transform_dev;
select * from stream_res_invoice_item_raw;
select * from stream_group_booking_raw;
select * from test_stream;
use role dba;
select * from stream_res_invoice_item_raw;











