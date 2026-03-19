use role useradmin;

create role _haven_raw__payments__usage;
create role _haven_raw__payments__reader;
create role _haven_raw__payments__writer;
create role _haven_raw__payments__creator;
create role _haven_raw__payments__owner;

USE ROLE SYSADMIN;
CREATE SCHEMA haven_raw.payments;
grant usage on schema haven_raw.payments to role _haven_raw__payments__usage;

USE DATABASE haven_raw;
USE SCHEMA payments;

use role securityadmin;

grant role _haven_raw__payments__usage to role _haven_raw__payments__reader;
grant SELECT on all tables in schema haven_raw.payments to role _haven_raw__payments__reader;
grant SELECT on future tables in schema haven_raw.payments to role _haven_raw__payments__reader;
grant SELECT on all views in schema haven_raw.payments to role _haven_raw__payments__reader;
grant SELECT on future views in schema haven_raw.payments to role _haven_raw__payments__reader;
grant SELECT on all materialized views in schema haven_raw.payments to role _haven_raw__payments__reader;
grant SELECT on future materialized views in schema haven_raw.payments to role _haven_raw__payments__reader;

GRANT READ ON all STAGES IN schema haven_raw.payments to role _haven_raw__payments__reader;
GRANT READ ON future STAGES IN schema haven_raw.payments to role _haven_raw__payments__reader;

grant role _haven_raw__payments__reader to role _haven_raw__payments__writer;
grant insert, update, delete, truncate on all tables in schema haven_raw.payments to role _haven_raw__payments__writer;
grant insert, update, delete, truncate on future tables in schema haven_raw.payments to role _haven_raw__payments__writer;
GRANT READ, WRITE, USAGE ON all STAGES in schema haven_raw.payments to role _haven_raw__payments__writer;
GRANT READ, WRITE, USAGE ON future STAGES in schema haven_raw.payments to role _haven_raw__payments__writer;
GRANT USAGE ON all FILE FORMATS IN schema haven_raw.payments to role _haven_raw__payments__writer;
GRANT USAGE ON future FILE FORMATS IN schema haven_raw.payments to role _haven_raw__payments__writer;
GRANT USAGE ON all PROCEDURES IN schema haven_raw.payments to role _haven_raw__payments__writer;
GRANT USAGE ON future PROCEDURES IN schema haven_raw.payments to role _haven_raw__payments__writer;
GRANT USAGE ON all FUNCTIONS IN schema haven_raw.payments to role _haven_raw__payments__writer;
GRANT USAGE ON future FUNCTIONS IN schema haven_raw.payments to role _haven_raw__payments__writer;
GRANT USAGE ON all SEQUENCES IN schema haven_raw.payments to role _haven_raw__payments__writer;
GRANT USAGE ON future SEQUENCES IN schema haven_raw.payments to role _haven_raw__payments__writer;

grant role _haven_raw__payments__writer to role _haven_raw__payments__creator;
grant create table, create external table, create view, create materialized view, create sequence on schema haven_raw.payments to role _haven_raw__payments__creator;
grant create function, create procedure on schema haven_raw.payments to role _haven_raw__payments__creator;
grant create file format, create stage, create pipe, create stream, create task on schema haven_raw.payments to role _haven_raw__payments__creator;

grant role _haven_raw__payments__creator to role _haven_raw__payments__owner;
grant create masking policy on schema haven_raw.payments to role _haven_raw__payments__owner;

grant role _haven_raw__payments__owner to role dba;
--GRANT ROLE _haven_raw__payments__creator TO ROLE haven_cdc_dataload;
--GRANT ROLE _haven_raw__payments__creator TO ROLE haven_batch_dataload;
--GRANT ROLE _bourne_base_cdc__warehouse__usage TO ROLE haven_raw_transform;
--GRANT ROLE haven_raw_transform TO USER haven_raw_transform;

