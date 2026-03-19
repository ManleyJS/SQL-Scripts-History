use role sysadmin;

create database HAVEN_SIGMA;

use role useradmin;

create role _haven_sigma__usage;
create role _haven_sigma__schema;
create role _haven_sigma__schema__development;

use role securityadmin;

grant usage on database  HAVEN_SIGMA to role _haven_sigma__usage;
grant role _haven_sigma__usage to role _haven_sigma__schema;
grant create schema on database  HAVEN_SIGMA to role _haven_sigma__schema;

grant role _haven_sigma__schema to role haven_schema_setup;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
use schema haven_master.procedures;

call haven_master.procedures.schema_role_creation('haven_sigma', 'procurement');

select * from auditlog where schema_name = 'procurement';

grant role _haven_sigma__procurement__reader to role HAVEN_PROCUREMENT_SIGMA;

use role useradmin;

create role HAVEN_PROCUREMENT_SIGMA_WRITER;

use role useradmin;

create role _haven_sigma__procurement__reader__views;

use role securityadmin;

grant role _haven_sigma__procurement__usage to role _haven_sigma__procurement__reader__views;
grant select on future views in schema haven_sigma.procurement to role _haven_sigma__procurement__reader__views;
revoke role _haven_sigma__procurement__reader from role HAVEN_PROCUREMENT_SIGMA;
grant role _haven_sigma__procurement__reader__views to role HAVEN_PROCUREMENT_SIGMA;

show grants to role HAVEN_PROCUREMENT_SIGMA;

show grants to role _haven_sigma__procurement__reader__views;


grant role HAVEN_PROCUREMENT_SIGMA to role HAVEN_PROCUREMENT_SIGMA_WRITER;
grant role _haven_sigma__procurement__creator to role HAVEN_PROCUREMENT_SIGMA_WRITER;

show users like '%procurement%';
grant role HAVEN_PROCUREMENT_SIGMA_WRITER to user HAVEN_PROCUREMENT_SIGMA_SERVICE_ACCOUNT;

show grants to role _haven_sigma__procurement__creator;