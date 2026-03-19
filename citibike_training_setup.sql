use role useradmin;
create role _training__citibike__usage;
create role _training__citibike__reader;
create role _training__citibike__writer;
create role _training__citibike__creator;
create role _training__citibike__owner;

use role sysadmin;

CREATE SCHEMA training.citibike;
grant usage on database training to role _training__citibike__usage;
grant usage on schema training.citibike to role _training__citibike__usage;

use role securityadmin;
grant role _training__citibike__usage to role _training__citibike__reader;
grant SELECT on all tables in schema training.citibike to role _training__citibike__reader;
grant SELECT on all views in schema training.citibike to role _training__citibike__reader;
grant SELECT on all materialized views in schema training.citibike to role _training__citibike__reader;
grant SELECT on future tables in schema training.citibike to role _training__citibike__reader;
grant SELECT on future views in schema training.citibike to role _training__citibike__reader;
grant SELECT on future materialized views in schema training.citibike to role _training__citibike__reader;

grant role _training__citibike__reader to role _training__citibike__writer;
grant insert, update, delete, truncate on all tables in schema training.citibike to role _training__citibike__writer;
grant insert, update, delete, truncate on future tables in schema training.citibike to role _training__citibike__writer;

grant role _training__citibike__writer to role _training__citibike__creator;
grant create table, create external table, create view, create materialized view, create sequence on schema training.citibike to role _training__citibike__creator;
grant create function, create procedure on schema training.citibike to role _training__citibike__creator;
grant create file format, create stage, create pipe, create stream, create task on schema training.citibike to role _training__citibike__creator;

grant role _training__citibike__creator to role _training__citibike__owner;
grant create masking policy on schema training.citibike to role _training__citibike__owner;

grant role _training__citibike__owner to role dba;

--GRANT ROLE _training__citibike__creator TO ROLE haven_cdc_dataload;

--R:q
EVOKE ROLE _training__citibike__owner FROM role dba;
--DROP ROLE _training__citibike__owner;
--DROP ROLE _training__citibike__creator;
--DROP ROLE _training__citibike__writer;
--DROP ROLE _training__citibike__reader;
--DROP ROLE _training__citibike__usage;
--USE ROLE sysadmin;
--DROP SCHEMA training.citibike;
