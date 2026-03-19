USE ROLE sysadmin;

CREATE SCHEMA haven_raw.seaware_swap;

USE ROLE securityadmin;

--revoke usage on schema haven_raw.seaware_swap from role _haven_raw__seaware__usage;

--revoke select on all tables in schema haven_raw.seaware_swap from role _haven_raw__seaware__reader;
--revoke select on all views in schema haven_raw.seaware_swap from role _haven_raw__seaware__reader;
--revoke select on all materialized views in schema haven_raw.seaware_swap from role _haven_raw__seaware__reader;

grant usage on schema haven_raw.seaware_swap to role _haven_raw__seaware__usage;

grant select on all tables in schema haven_raw.seaware_swap to role _haven_raw__seaware__reader;
grant select on all views in schema haven_raw.seaware_swap to role _haven_raw__seaware__reader;
grant select on all materialized views in schema haven_raw.seaware_swap to role _haven_raw__seaware__reader;

grant select on future tables in schema haven_raw.seaware_swap to role _haven_raw__seaware__reader;
grant select on future views in schema haven_raw.seaware_swap to role _haven_raw__seaware__reader;
grant select on future materialized views in schema haven_raw.seaware_swap to role _haven_raw__seaware__reader;

grant read on all stages in schema haven_raw.seaware_swap to role _haven_raw__seaware__reader;
grant read on future stages in schema haven_raw.seaware_swap to role _haven_raw__seaware__reader;

grant insert, update, delete, truncate on all tables in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;
grant insert, update, delete, truncate on future tables in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;
grant usage on all stages in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;
grant usage on future stages in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;
grant usage on all file formats in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;
grant usage on future file formats in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;
grant usage on all procedures in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;
grant usage on future procedures in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;
grant usage on all functions in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;
grant usage on future functions in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;
grant usage on all sequences in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;
grant usage on future sequences in schema haven_raw.seaware_swap to role _haven_raw__seaware__writer;

grant create table on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;
grant create external table on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;
grant create view on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;
grant create materialized view on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;
grant create sequence on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;

grant create function on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;
grant create procedure on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;

grant create file format on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;
grant create stage on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;
grant create pipe on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;
grant create stream on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;
grant create task on schema haven_raw.seaware_swap to role _haven_raw__seaware__creator;

grant create masking policy on schema haven_raw.seaware_swap to role _haven_raw__seaware__owner;

--USE ROLE securityadmin;
--GRANT ROLE _haven_raw__seaware__creator TO ROLE haven_cdc_dataload;
USE ROLE haven_cdc_dataload;