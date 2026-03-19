use schema training.data_analysis;

show procedures;

use warehouse haven_cdc_migration_wh;

call classify_schema_data('HAVEN_RAW', 'DIG_CAPACITY', TRUE);

select * from column_classification;

select * from haven_raw.dig_capacity.entitysources limit 20;

truncate table column_classification;

call classify_schema_data('HAVEN_RAW', 'IDENTITY_ETLEAP', TRUE);

select * from column_classification where schema_name = 'IDENTITY_ETLEAP';

delete from classification_audit;

-- using standard PROCEDURE this took 1 hour, 40 minutes, 37 seconds
call classify_schema_data('HAVEN_RAW', 'SEAWARE_ETLEAP');

select * from column_classification where schema_name = 'SEAWARE_ETLEAP'
and data_classification = 'postcode';

use schema haven_raw.seaware_etleap;

show tables;

truncate table classification_audit;

truncate table column_classification;

show procedures;

call classify_schema_data('HAVEN_RAW', 'SEAWARE_ETLEAP');

select * from column_classification where schema_name = 'SEAWARE_ETLEAP';

call classify_schema_data('HAVEN_RAW', 'SEAWARE_ETLEAP');

show tables;

select * from column_classification_errors;
select * from classification_audit;

truncate table classification_audit;

truncate table column_classification_errors;
truncate table classification_audit;
truncate table columns_to_analyze;
show tables;

call classify_schema_data('HAVEN_RAW', 'WORKFORCE_SAM');

show tables;

select * from column_classification_errors;

select * from column_classification where data_classification != 'other';
-- UN3C6QXe


show tables;

drop table CLASSIFICATION_AUDIT;
drop table COLUMNS_TO_ANALYZE;
drop table COLUMN_CLASSIFICATION;
drop table COLUMN_CLASSIFICATION_ERRORS;

call classify_schema_data('HAVEN_RAW', 'WORKFORCE_SAM');

select * from column_classification_errors;

show tables;

call classify_schema_data('HAVEN_RAW', 'SEAWARE_ETLEAP');


use schema DATA_CATALOG.TABLE_CATALOG;

SHOW TABLES;

select * from table_catalog limit 10;

select * from table_catalog 
where startswith(tablename, 'HAVEN_STORE.CARAVAN_SALES')
limit 10;

show roles like '%table_catalog%';

use role accountadmin;

create table table_catalog_caravan_sales
as select * from table_catalog 
where startswith(tablename, 'HAVEN_STORE.CARAVAN_SALES');

delete from table_catalog 
where startswith(tablename, 'HAVEN_STORE.CARAVAN_SALES');

select * from table_catalog_caravan_sales;

CALL DATA_CATALOG.TABLE_CATALOG.DATA_CATALOG(target_database => 'HAVEN_STORE',
                                  catalog_database => 'DATA_CATALOG',
                                  catalog_schema => 'TABLE_CATALOG',
                                  catalog_table => 'TABLE_CATALOG',
                                  target_schema => 'CARAVAN_SALES',
                                  sampling_mode => 'fast',
                                  update_comment => TRUE,
                                  use_native_feature => FALSE
                                  );




CALL DATA_CATALOG.TABLE_CATALOG.DATA_CATALOG(target_database => 'HAVEN_STORE',
                                  catalog_database => 'DATA_CATALOG',
                                  catalog_schema => 'TABLE_CATALOG',
                                  catalog_table => 'TABLE_CATALOG',
                                  target_schema => 'CARAVANS',
                                  sampling_mode => 'fast',
                                  update_comment => TRUE,
                                  use_native_feature => FALSE
                                  );
