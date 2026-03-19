use role dba;

use schema haven_raw.seaware;

show tables;

desc table VCS_LOG_FIELD;
desc table res_hist_value;
desc table VCS_LOG_RECORD;

use role haven_cdc_dataload;

show warehouses;

use warehouse HAVEN_CDC_MIGRATION_WH;

select date(date_modified), count(*)
from vcs_log_record
group by 1 order by 1;

select date(date_modified), count(*)
from vcs_log_record
group by 1 order by 1;


create table vcs_log_record_swap
as select log_record_id, source_id, date_modified, modified_by, table_name, action from vcs_log_record
order by log_record_id;


create or replace table vcs_log_record_cluster
cluster by (date(date_modified))
as select log_record_id, source_id, date_modified, modified_by, table_name, action from vcs_log_record
order by date_modified;

select * from vcs_log_field_swap limit 5;

create or replace table vcs_log_field_fieldname
cluster by (field_name, log_record_id)
as select log_record_id, field_name, field_value from vcs_log_field
;

create or replace table vcs_log_record_swap
as select log_record_id, source_id, date_modified, modified_by, table_name, action from vcs_log_record
order by log_record_id;


create or replace table vcs_log_field_swap
as select * from vcs_log_field
order by log_record_id;

select * from vcs_log_field_swap limit 10;
select * from vcs_log_record_swap limit 10;

SELECT system$clustering_information('VCS_LOG_RECORD', '(DATE_MODIFIED))');
SELECT system$clustering_information('VCS_LOG_RECORD', '(DATE(DATE_MODIFIED))');
SELECT system$clustering_information('VCS_LOG_RECORD', '(TABLE_NAME, action)');

SELECT system$clustering_information('VCS_LOG_RECORD', '(DATE_MODIFIED))');
SELECT system$clustering_information('VCS_LOG_RECORD', '(DATE(DATE_MODIFIED))');
SELECT system$clustering_information('VCS_LOG_RECORD', '(TABLE_NAME)');
SELECT system$clustering_information('VCS_LOG_RECORD', '(TABLE_NAME, action)');

SELECT system$clustering_information('VCS_LOG_RECORD_SWAP', '(TABLE_NAME, action)');
SELECT system$clustering_information('VCS_LOG_RECORD_SWAP', '(DATE(DATE_MODIFIED))');

SELECT system$clustering_information('VCS_LOG_RECORD_CLUSTER');

select * from vcs_log_field_fieldname limit 100;

show tables like 'vcs_log_%';

use role dba;




