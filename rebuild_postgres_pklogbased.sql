select * FROM pg_catalog.pg_extension;

create extension pglogical;
select * FROM pg_catalog.pg_extension;

SELECT pglogical.create_node(node_name := 'postgres_dms_node', dsn := 'host=cdctestinstance.cluster-cgg8jq7kqbjx.eu-west-1.rds.amazonaws.com port=5432 dbname=pklogbased');

select pglogical.drop_replication_set('postgres_dms_s3');
select pglogical.drop_replication_set('postgres_dms_s3_slot');

select * from pg_replication_slots;

SELECT 'init' FROM pg_create_logical_replication_slot('postgres_dms_s3', 'pglogical');                        
SELECT pglogical.create_node(node_name := 'postgres_dms_node', dsn := 'host=cdctestinstance.cluster-cgg8jq7kqbjx.eu-west-1.rds.amazonaws.com port=5432 dbname=pklogbased');
select pglogical.create_replication_set('postgres_dms_s3', true, false, false, true);
select pglogical.create_replication_set('ipostgres_dms_s3', false, true, true, false);

select * from pg_replication_slots;

select pglogical.replication_set_add_table('postgres_dms_s3', 'pklogwork.agentname', true);
select pglogical.replication_set_add_table('ipostgres_dms_s3', 'pklogwork.agentname', true);                  
select pglogical.replication_set_add_table('postgres_dms_s3', 'pklogwork.lastnames', true);
select pglogical.replication_set_add_table('ipostgres_dms_s3', 'pklogwork.lastnames', true);                  
select pglogical.replication_set_add_table('postgres_dms_s3', 'pklogwork.phonenumbers', true);
select pglogical.replication_set_add_table('ipostgres_dms_s3', 'pklogwork.phonenumbers', true);                  
select pglogical.replication_set_add_table('postgres_dms_s3', 'pklogwork.uk_towns', true);
select pglogical.replication_set_add_table('ipostgres_dms_s3', 'pklogwork.uk_towns', true);                  
select pglogical.replication_set_add_table('postgres_dms_s3', 'pklogwork.salesorderdetail', true);                  
select pglogical.replication_set_add_table('ipostgres_dms_s3', 'pklogwork.salesorderdetail', true);                  

select * from pg_replication_slots;

select pg_drop_replication_slot('aws_dms_postgres_00021759_a75679fe_6696_4da4_8054_158fd90abcc2');
select pg_drop_replication_slot('postgres_dms_s3');
select pg_drop_replication_slot('stitch');
select pg_drop_replication_slot('replication_slot_name');
select pg_drop_replication_slot('stitch_cdcwork');
select pg_drop_replication_slot('stitch_nonpklogbasedincrmt');
select pg_drop_replication_slot('stitch_pklogbased');
select pg_drop_replication_slot('stitch_appenddatemod');
select pg_drop_replication_slot('stitch_appenddatedate');
select pg_drop_replication_slot('dms_postgres_s3');
select * from pg_replication_slots;

SELECT 'init' FROM pg_create_logical_replication_slot('dms_pklogbased', 'test_decoding');

select * from pg_catalog.pg_publication;
select * from pg_catalog.pg_publication_tables;

select * from agentname order by pk_id;

update agentname set agent_name = UPPER(agent_name) where pk_id between 1 and 10;

select pg_current_wal_lsn();  

select count(*) from pklogwork.lastnames p ;

select * from pklogwork.uk_towns where pk_id between 5000 and 5100 ;

select max(pk_id) from pklogwork.uk_towns; 

select * from pklogwork.agentname a where pk_id = 23188;

select * from pklogwork.phonenumbers p limit 100;

select current_timestamp 
