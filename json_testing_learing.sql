use role dba;
use database training;
use schema citibike;

create or replace table server_data (
  src variant);

create or replace stage server_data_stage
  url = 's3://snowflake-docs/tutorials/json';
  
list @server_data_stage;

copy into server_data
  from @server_data_stage/server/2.6/2016/07/15/15
  file_format = (type = json);
  
select src from server_data;

select src:events[0].f from server_data;

select
  value:v
  from
    server_data, 
    lateral flatten( input => src:events) as f
;

select * from table(flatten(input => parse_json(select src from server_data)));

select * from table(flatten(input => parse_json(select src from server_data), recursive => true, outer => true));

