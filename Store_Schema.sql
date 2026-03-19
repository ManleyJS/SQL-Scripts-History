use role useradmin;

create role _haven_store__digital__usage;
create role _haven_store__digital__reader;
create role _haven_store__digital__writer;
create role _haven_store__digital__creator;
create role _haven_store__digital__owner;

CREATE ROLE haven_store_staging;

USE ROLE SYSADMIN;
CREATE SCHEMA haven_store.digital;
grant usage on schema haven_store.digital to role _haven_store__digital__usage;

USE DATABASE haven_store;
USE SCHEMA digital;

use role securityadmin;

grant ROLE _haven_store__usage TO role _haven_store__digital__usage;

grant role _haven_store__digital__usage to role _haven_store__digital__reader;
grant SELECT on all tables in schema haven_store.digital to role _haven_store__digital__reader;
grant SELECT on future tables in schema haven_store.digital to role _haven_store__digital__reader;
grant SELECT on future views in schema haven_store.digital to role _haven_store__digital__reader;
grant SELECT on future materialized views in schema haven_store.digital to role _haven_store__digital__reader;

grant role _haven_store__digital__reader to role _haven_store__digital__writer;
grant insert, update, delete, truncate on future tables in schema haven_store.digital to role _haven_store__digital__writer;

grant role _haven_store__digital__writer to role _haven_store__digital__creator;
grant create table, create external table, create view, create materialized view, create sequence on schema haven_store.digital to role _haven_store__digital__creator;
grant create function, create procedure on schema haven_store.digital to role _haven_store__digital__creator;
grant create file format, create stage, create pipe, create stream, create task on schema haven_store.digital to role _haven_store__digital__creator;

grant role _haven_store__digital__creator to role _haven_store__digital__owner;
grant create masking policy on schema haven_store.digital to role _haven_store__digital__owner;

grant role _haven_store__digital__owner to role dba;
GRANT ROLE _haven_store__digital__creator TO ROLE haven_store_staging;

create user haven_raw_transform
password = '<REDACTED>' 
login_name = 'warner.base.transform'
display_name = 'warner cleansed layer transform'
default_role = haven_raw_transform
default_warehouse = bourne_base_transform_xsmall
default_namespace = haven_raw;
