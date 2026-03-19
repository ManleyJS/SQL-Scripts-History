USE ROLE securityadmin;

SHOW ROLES LIKE '%equaliser%';


use role sysadmin;
create schema haven_raw.equaliser_prod;

USE ROLE securityadmin;

grant usage on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__usage;

grant select on all tables in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__reader;
grant select on all views in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__reader;
grant select on all materialized views in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__reader;

grant select on future tables in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__reader;
grant select on future views in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__reader;
grant select on future materialized views in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__reader;

grant read on all stages in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__reader;
grant read on future stages in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__reader;

grant insert, update, delete, truncate on all tables in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;
grant insert, update, delete, truncate on future tables in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;
grant usage on all stages in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;
grant usage on future stages in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;
grant usage on all file formats in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;
grant usage on future file formats in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;
grant usage on all procedures in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;
grant usage on future procedures in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;
grant usage on all functions in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;
grant usage on future functions in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;
grant usage on all sequences in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;
grant usage on future sequences in schema haven_raw.equaliser_prod to role _haven_raw__equaliser__writer;

grant create table on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;
grant create external table on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;
grant create view on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;
grant create materialized view on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;
grant create sequence on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;

grant create function on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;
grant create procedure on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;

grant create file format on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;
grant create stage on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;
grant create pipe on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;
grant create stream on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;
grant create task on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__creator;

grant create masking policy on schema haven_raw.equaliser_prod to role _haven_raw__equaliser__owner;

USE ROLE securityadmin;
GRANT ROLE _haven_raw__equaliser__creator TO ROLE haven_cdc_dataload;
USE ROLE haven_cdc_dataload;

