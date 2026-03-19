USE ROLE useradmin;
create role _haven_base__competitor__usage;
create role _haven_base__competitor__reader;
create role _haven_base__competitor__writer;
create role _haven_base__competitor__creator;
create role _haven_base__competitor__owner;

CREATE ROLE _haven_base__competitor__derived;
CREATE ROLE _haven_base__competitor__personal;
CREATE ROLE _haven_base__competitor__sensitive;
CREATE ROLE _haven_base__competitor__financial;

--CREATE ROLE warner_competitor_dataload;

--create user warner_competitor_dataload
--password = '<REDACTED>' 
--login_name = 'warner.competitor.dataload'
--display_name = 'warner competitor data load'
--default_role = warner_competitor_dataload
--default_warehouse = bourne_batch_dataload_xsmall
--default_namespace = haven_base.competitor;

USE ROLE SYSADMIN;
create SCHEMA haven_base.competitor;
grant usage on schema haven_base.competitor to role _haven_base__competitor__usage;

USE DATABASE haven_base;
USE SCHEMA competitor;

create masking policy haven_base.competitor.haven_base__competitor__derived__policy as (columnValue string) returns string -> case when is_role_in_session('_haven_base__competitor__DERIVED') then columnValue else '########' END;
create masking policy haven_base.competitor.haven_base__competitor__personal__policy as (columnValue string) returns string -> case when is_role_in_session('_haven_base__competitor__PERSONAL') then columnValue else '########' END;
create masking policy haven_base.competitor.haven_base__competitor__sensitive__policy as (columnValue string) returns string -> case when is_role_in_session('_haven_base__competitor__SENSITIVE') then columnValue else '########' END;
create masking policy haven_base.competitor.haven_base__competitor__financial__policy as (columnValue string) returns string -> case when is_role_in_session('_haven_base__competitor__FINANCIAL') then columnValue else '########' END;

use role securityadmin;

--Usage on base objects
grant ROLE _haven_base__usage to role _haven_base__competitor__usage;
grant role _haven_base__competitor__usage to role _haven_base__competitor__reader;

--Reader privileges
grant SELECT on all tables in schema haven_base.competitor to role _haven_base__competitor__reader;
grant SELECT on all VIEWS in schema haven_base.competitor to role _haven_base__competitor__reader;
grant SELECT on all MATERIALIZED VIEWS in schema haven_base.competitor to role _haven_base__competitor__reader;
grant SELECT on future tables in schema haven_base.competitor to role _haven_base__competitor__reader;
grant SELECT on future views in schema haven_base.competitor to role _haven_base__competitor__reader;
grant SELECT on future materialized views in schema haven_base.competitor to role _haven_base__competitor__reader;

--Writer Privileges
grant role _haven_base__competitor__reader to role _haven_base__competitor__writer;
grant insert, update, delete, truncate on future tables in schema haven_base.competitor to role _haven_base__competitor__writer;

--Creator Privileges
grant role _haven_base__competitor__writer to role _haven_base__competitor__creator;
grant create table, create external table, create view, create materialized view, create sequence on schema haven_base.competitor to role _haven_base__competitor__creator;
grant create function, create procedure on schema haven_base.competitor to role _haven_base__competitor__creator;
grant create file format, create stage, create pipe, create stream, create task on schema haven_base.competitor to role _haven_base__competitor__creator;

--Owner Privileges
grant role _haven_base__competitor__creator to role _haven_base__competitor__owner;
grant create masking policy on schema haven_base.competitor to role _haven_base__competitor__owner;

--Grant roles to dataload and dba 
grant role _haven_base__competitor__owner to role dba;
grant ROLE _haven_base__competitor__creator to ROLE haven_batch_dataload;

--Wareouse role 
--GRANT ROLE  _bourne_batch_dataload__warehouse__usage TO ROLE warner_competitor_dataload;

--GRANT ROLE warner_competitor_dataload TO USER warner_competitor_dataload;

--USE ROLE useradmin;

--ALTER USER haven_competitor_dataload SET  display_name = 'Haven competitor data load';
--ALTER USER warner_competitor_dataload SET Password = '<REDACTED>', display_name = 'Warner competitor data load';
--ALTER USER butlins_competitor_dataload SET Password = '<REDACTED>', display_name = 'Butlins competitor data load';

--SHOW GRANTS TO ROLE haven_batch_dataload;
--REVOKE ROLE _haven_base__Seaware__creator FROM ROLE haven_batch_dataload;



create table haven_raw.competitor.awayresorts_details as select * from haven_store.competitor.awayresorts_details;
create table haven_raw.competitor.butlins_details as select * from haven_store.competitor.butlins_details;
create table haven_raw.competitor.centerparcs_details as select * from haven_store.competitor.centerparcs_details;
create table haven_raw.competitor.haven_details as select * from haven_store.competitor.haven_details;
create table haven_raw.competitor.hoseasons_details as select * from haven_store.competitor.hoseasons_details;
create table haven_raw.competitor.parkdean_details as select * from haven_store.competitor.parkdean_details;
create table haven_raw.competitor.parkholidays_details as select * from haven_store.competitor.parkholidays_details;
create table haven_raw.competitor.travelodge_details as select * from haven_store.competitor.travelodge_details;
create table haven_raw.competitor.warner_details as select * from haven_store.competitor.warner_details;
