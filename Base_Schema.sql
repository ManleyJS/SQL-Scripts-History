use role useradmin;

create role _haven_base__seaware__usage;
create role _haven_base__seaware__reader;
create role _haven_base__seaware__writer;
create role _haven_base__seaware__creator;
create role _haven_base__seaware__owner;

CREATE ROLE _haven_base__seaware__derived;
CREATE ROLE _haven_base__seaware__personal;
CREATE ROLE _haven_base__seaware__sensitive;
CREATE ROLE _haven_base__seaware__financial;

USE ROLE SYSADMIN;
CREATE schema haven_base.seaware;
grant usage on schema haven_base.seaware to role _haven_base__seaware__usage;

create masking policy haven_base.seaware.warner_base__seaware__derived__policy as (columnValue string) returns string -> case when is_role_in_session('_HAVEN_BASE__SEAWARE__DERIVED') then columnValue else '########' END;
create masking policy haven_base.seaware.warner_base__seaware__personal__policy as (columnValue string) returns string -> case when is_role_in_session('_HAVEN_BASE__SEAWARE__PERSONAL') then columnValue else '########' END;
create masking policy haven_base.seaware.warner_base__seaware__sensitive__policy as (columnValue string) returns string -> case when is_role_in_session('_HAVEN_BASE__SEAWARE__SENSITIVE') then columnValue else '########' END;
create masking policy haven_base.seaware.warner_base__seaware__financial__policy as (columnValue string) returns string -> case when is_role_in_session('_HAVEN_BASE__SEAWARE__FINANCIAL') then columnValue else '########' END;

use role securityadmin;

grant ROLE _haven_base__usage TO role _haven_base__seaware__usage;

grant role _haven_base__seaware__usage to role _haven_base__seaware__reader;
grant SELECT on all tables in schema haven_base.seaware to role _haven_base__seaware__reader;
grant SELECT on future tables in schema haven_base.seaware to role _haven_base__seaware__reader;
grant SELECT on future views in schema haven_base.seaware to role _haven_base__seaware__reader;
grant SELECT on future materialized views in schema haven_base.seaware to role _haven_base__seaware__reader;

grant role _haven_base__seaware__reader to role _haven_base__seaware__writer;
grant insert, update, delete, truncate on future tables in schema haven_base.seaware to role _haven_base__seaware__writer;

grant role _haven_base__seaware__writer to role _haven_base__seaware__creator;
grant create table, create external table, create view, create materialized view, create sequence on schema haven_base.seaware to role _haven_base__seaware__creator;
grant create function, create procedure on schema haven_base.seaware to role _haven_base__seaware__creator;
grant create file format, create stage, create pipe, create stream, create task on schema haven_base.seaware to role _haven_base__seaware__creator;

grant role _haven_base__seaware__creator to role _haven_base__seaware__owner;
grant create masking policy on schema haven_base.seaware to role _haven_base__seaware__owner;

grant role _haven_base__seaware__owner to role dba;
GRANT ROLE _haven_base__seaware__creator TO ROLE haven_batch_dataload;
--GRANT ROLE _bourne_cdc_dataload__warehouse__usage TO ROLE haven_cdc_dataload;;

