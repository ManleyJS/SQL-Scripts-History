use role useradmin;
create role _butlins_raw__qualtrics__usage;
create role _butlins_raw__qualtrics__reader;
create role _butlins_raw__qualtrics__writer;
create role _butlins_raw__qualtrics__creator;
create role _butlins_raw__qualtrics__owner;

use role sysadmin;
CREATE SCHEMA butlins_raw.qualtrics;
grant usage on database butlins_raw to role _butlins_raw__qualtrics__usage;
grant usage on schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__usage;

use role securityadmin;
grant role _butlins_raw__qualtrics__usage to role _butlins_raw__qualtrics__reader;
grant SELECT on all tables in schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__reader;
grant SELECT on all views in schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__reader;
grant SELECT on all materialized views in schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__reader;
grant SELECT on future tables in schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__reader;
grant SELECT on future views in schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__reader;
grant SELECT on future materialized views in schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__reader;

grant role _butlins_raw__qualtrics__reader to role _butlins_raw__qualtrics__writer;
grant insert, update, delete, truncate on all tables in schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__writer;
grant insert, update, delete, truncate on future tables in schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__writer;

grant role _butlins_raw__qualtrics__writer to role _butlins_raw__qualtrics__creator;
grant create table, create external table, create view, create materialized view, create sequence on schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__creator;
grant create function, create procedure on schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__creator;
grant create file format, create stage, create pipe, create stream, create task on schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__creator;

grant role _butlins_raw__qualtrics__creator to role _butlins_raw__qualtrics__owner;
grant create masking policy on schema butlins_raw.qualtrics to role _butlins_raw__qualtrics__owner;

grant role _butlins_raw__qualtrics__owner to role dba;

--roles for new data load user


--GRANT ROLE _butlins_raw__qualtrics__creator TO ROLE haven_batch_dataload;


--REVOKE ROLE _butlins_raw__qualtrics__owner FROM role dba;

--DROP ROLE _butlins_raw__qualtrics__owner;
--DROP ROLE _butlins_raw__qualtrics__creator;
--DROP ROLE _butlins_raw__qualtrics__writer;
--DROP ROLE _butlins_raw__qualtrics__reader;
--DROP ROLE _butlins_raw__qualtrics__usage;

--USE ROLE SYSADMIN;
--DROP SCHEMA WARNER_STORE.QUALTRICS;