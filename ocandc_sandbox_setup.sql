USE role useradmin;

create role _ocandc__sandbox__usage;
create role _ocandc__sandbox__reader;
create role _ocandc__sandbox__writer;
create role _ocandc__sandbox__creator;
create role _ocandc__sandbox__owner;

create role _ocandc__usage;

USE ROLE SYSADMIN;
CREATE DATABASE ocandc;
CREATE SCHEMA ocandc.sandbox;
grant usage on database ocandc to role _ocandc__usage;
grant usage on schema ocandc.sandbox to role _ocandc__sandbox__usage;

USE DATABASE ocandc;
USE SCHEMA sandbox;

use role securityadmin;

GRANT ROLE _ocandc__usage TO ROLE _ocandc__sandbox__usage;  
grant role _ocandc__sandbox__usage to role _ocandc__sandbox__reader;

grant SELECT on all tables in schema ocandc.sandbox to role _ocandc__sandbox__reader;
grant SELECT on future tables in schema ocandc.sandbox to role _ocandc__sandbox__reader;
grant SELECT on all views in schema ocandc.sandbox to role _ocandc__sandbox__reader;
grant SELECT on future views in schema ocandc.sandbox to role _ocandc__sandbox__reader;
grant SELECT on all materialized views in schema ocandc.sandbox to role _ocandc__sandbox__reader;
grant SELECT on future materialized views in schema ocandc.sandbox to role _ocandc__sandbox__reader;

GRANT READ ON all STAGES IN schema ocandc.sandbox to role _ocandc__sandbox__reader;
GRANT READ ON future STAGES IN schema ocandc.sandbox to role _ocandc__sandbox__reader;

grant role _ocandc__sandbox__reader to role _ocandc__sandbox__writer;
grant insert, update, delete, truncate on all tables in schema ocandc.sandbox to role _ocandc__sandbox__writer;
grant insert, update, delete, truncate on future tables in schema ocandc.sandbox to role _ocandc__sandbox__writer;
GRANT READ, WRITE, USAGE ON all STAGES in schema ocandc.sandbox to role _ocandc__sandbox__writer;
GRANT READ, WRITE, USAGE ON future STAGES in schema ocandc.sandbox to role _ocandc__sandbox__writer;
GRANT USAGE ON all FILE FORMATS IN schema ocandc.sandbox to role _ocandc__sandbox__writer;
GRANT USAGE ON future FILE FORMATS IN schema ocandc.sandbox to role _ocandc__sandbox__writer;
GRANT USAGE ON all PROCEDURES IN schema ocandc.sandbox to role _ocandc__sandbox__writer;
GRANT USAGE ON future PROCEDURES IN schema ocandc.sandbox to role _ocandc__sandbox__writer;
GRANT USAGE ON all FUNCTIONS IN schema ocandc.sandbox to role _ocandc__sandbox__writer;
GRANT USAGE ON future FUNCTIONS IN schema ocandc.sandbox to role _ocandc__sandbox__writer;
GRANT USAGE ON all SEQUENCES IN schema ocandc.sandbox to role _ocandc__sandbox__writer;
GRANT USAGE ON future SEQUENCES IN schema ocandc.sandbox to role _ocandc__sandbox__writer;

grant role _ocandc__sandbox__writer to role _ocandc__sandbox__creator;
grant create table, create external table, create view, create materialized view, create sequence on schema ocandc.sandbox to role _ocandc__sandbox__creator;
grant create function, create procedure on schema ocandc.sandbox to role _ocandc__sandbox__creator;
grant create file format, create stage, create pipe, create stream, create task on schema ocandc.sandbox to role _ocandc__sandbox__creator;

grant role _ocandc__sandbox__creator to role _ocandc__sandbox__owner;
grant create masking policy on schema ocandc.sandbox to role _ocandc__sandbox__owner;

grant role _ocandc__sandbox__owner to role dba;
--GRANT ROLE _ocandc__sandbox__reader TO ROLE ocandc_modelling;

