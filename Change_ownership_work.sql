use role dba;

use schema haven_store_dev.abdul_kahare_dev_dbt_bloomreach;

-- use a dbt role to create a schema

use role haven_dbt_transform_dev;

create schema test_owner_permissions;

-- Run the create schema stored procedure to create the permissions for the schema
-- No objects present in schema, no grants given on schema 

use role dba;

call haven_master.procedures.schema_role_creation('haven_store_dev', 'test_owner_permissions');

-- Error message
-- Schema 'TEST_OWNER_PERMISSIONS' already exists, but current role has no privileges on it. 
-- If this is unexpected and you cannot resolve this problem, contact your system administrator. 
-- ACCOUNTADMIN role may be required to manage the privileges on the object in function SCHEMA_ROLE_CREATION with handler run

-- alter owner of schema revoking current grants

grant ownership on schema haven_store_dev.test_owner_permissions to role haven_schema_setup revoke current grants;

-- call stored procedure again

call haven_master.procedures.schema_role_creation('haven_store_dev', 'test_owner_permissions');

-- clean up

show roles like '%_test_owner_permissions_%';

use role haven_schema_setup;

drop role _HAVEN_STORE_DEV__TEST_OWNER_PERMISSIONS__CREATOR;

show views;
drop role _HAVEN_STORE_DEV__TEST_OWNER_PERMISSIONS__OWNER;
drop role _HAVEN_STORE_DEV__TEST_OWNER_PERMISSIONS__READER;
drop role _HAVEN_STORE_DEV__TEST_OWNER_PERMISSIONS__USAGE;
drop role _HAVEN_STORE_DEV__TEST_OWNER_PERMISSIONS__WRITER;

drop schema HAVEN_STORE_DEV.TEST_OWNER_PERMISSIONS;

-- rerun the test with production user

use role haven_dbt_transform;

create schema haven_store.test_owner_permissions;

-- Run the create schema stored procedure to create the permissions for the schema
-- No objects present in schema, no grants given on schema 

use role dba;

call haven_master.procedures.schema_role_creation('haven_store', 'test_owner_permissions');

-- Error message
-- Schema 'TEST_OWNER_PERMISSIONS' already exists, but current role has no privileges on it. 
-- If this is unexpected and you cannot resolve this problem, contact your system administrator. 
-- ACCOUNTADMIN role may be required to manage the privileges on the object in function SCHEMA_ROLE_CREATION with handler run

-- alter owner of schema revoking current grants

grant ownership on schema haven_store.test_owner_permissions to role haven_schema_setup revoke current grants;

-- call stored procedure again

call haven_master.procedures.schema_role_creation('haven_store', 'test_owner_permissions');

-- clean up

show roles like '%_test_owner_permissions_%';

use role haven_schema_setup;

drop role _HAVEN_STORE__TEST_OWNER_PERMISSIONS__CREATOR;
drop role _HAVEN_STORE__TEST_OWNER_PERMISSIONS__OWNER;
drop role _HAVEN_STORE__TEST_OWNER_PERMISSIONS__READER;
drop role _HAVEN_STORE__TEST_OWNER_PERMISSIONS__USAGE;
drop role _HAVEN_STORE__TEST_OWNER_PERMISSIONS__WRITER;

drop schema HAVEN_STORE.TEST_OWNER_PERMISSIONS;

-- create schema for testing stored procedure

use role haven_dbt_transform_dev;

create schema haven_store_dev.test_owner_permissions;

-- create some tables with incorrect owners

use schema haven_store_dev.test_owner_permissions;

select table_catalog, table_schema, table_name
from information_schema.tables
order by table_schema, table_name;

create transient table DIM_ARRIVAL_BOOKING_TYPE as select * from  ARRIVAL.DIM_ARRIVAL_BOOKING_TYPE;
create transient table DIM_ARRIVAL_GUEST_TYPE as select * from ARRIVAL.DIM_ARRIVAL_GUEST_TYPE;
create transient table DIM_ARRIVAL_MODE_OF_TRANSPORT as select * from ARRIVAL.DIM_ARRIVAL_MODE_OF_TRANSPORT;
create transient table FCT_PARK_ARRIVAL as select * from ARRIVAL.FCT_PARK_ARRIVAL;
create transient table FCT_PARK_ARRIVAL_ADDON as select * from ARRIVAL.FCT_PARK_ARRIVAL_ADDON;
create transient table HEADS_ON_PARK_MART as select * from ARRIVAL.HEADS_ON_PARK_MART;


use role dba;

show roles like '%_test_owner_permissions_%';

call haven_master.procedures.schema_role_creation('haven_store_dev', 'test_owner_permissions');

-- Error message
-- Schema 'TEST_OWNER_PERMISSIONS' already exists, but current role has no privileges on it. 
-- If this is unexpected and you cannot resolve this problem, contact your system administrator. 
-- ACCOUNTADMIN role may be required to manage the privileges on the object in function SCHEMA_ROLE_CREATION with handler run

-- alter owner of schema revoking current grants

grant ownership on schema haven_store_dev.test_owner_permissions to role haven_schema_setup revoke current grants;

-- call stored procedure again

call haven_master.procedures.schema_role_creation('haven_store_dev', 'test_owner_permissions');

-- create test roles

use role useradmin;

create role test_owner_permissions;
create role test_owner_permissions_subset;

drop role _test_owner_role__haven_store_dev__test_owner_permissions__reader;
create role _test_owner_permissions_subset__haven_store_dev__test_owner_permissions__reader;

use role securityadmin;

grant role _haven_store_dev__test_owner_permissions__reader to role test_owner_permissions;

revoke select on haven_store_dev.test_owner_permissions.DIM_ARRIVAL_BOOKING_TYPE from role test_owner_permissions_subset;

grant role _haven_store_dev__test_owner_permissions__usage to role _test_owner_permissions_subset__haven_store_dev__test_owner_permissions__reader;
grant select on table haven_store_dev.test_owner_permissions.DIM_ARRIVAL_BOOKING_TYPE to role _test_owner_permissions_subset__haven_store_dev__test_owner_permissions__reader;
grant select on view haven_store_dev.test_owner_permissions.V_DIM_ARRIVAL_GUEST_TYPE to role _test_owner_permissions_subset__haven_store_dev__test_owner_permissions__reader;


use role haven_dbt_transform_finance_dev;

use schema haven_store_dev.test_owner_permissions;

create view V_DIM_ARRIVAL_BOOKING_TYPE as select * from  haven_store_dev.test_owner_permissions.DIM_ARRIVAL_BOOKING_TYPE;
create view V_DIM_ARRIVAL_GUEST_TYPE as select * from haven_store_dev.test_owner_permissions.DIM_ARRIVAL_GUEST_TYPE;

show views;

use role haven_dbt_transform_pitch_perfect_dev;

create table PP_DIM_ARRIVAL_GUEST_TYPE  as select * from haven_store_dev.test_owner_permissions.DIM_ARRIVAL_GUEST_TYPE;

use role dba;

show grants on table haven_store_dev.test_owner_permissions.DIM_ARRIVAL_BOOKING_TYPE;

select * from snowflake.account_usage.grants_to_roles
where contains(name, 'haven_store_dev__test_owner_permissions');

show roles like '%haven_store_dev__test_owner_permissions%';

show grants to role _TEST_OWNER_PERMISSIONS_SUBSET__HAVEN_STORE_DEV__TEST_OWNER_PERMISSIONS__READER;

use role dba;

show tables;

show grants to role _TEST_OWNER_PERMISSIONS_SUBSET__HAVEN_STORE_DEV__TEST_OWNER_PERMISSIONS__READER;

show views;

 
show tables;

show views;


select privilege, granted_on, table_catalog, table_schema, name, grantee_name from snowflake.account_usage.grants_to_roles where grantee_name = '_TEST_OWNER_PERMISSIONS_SUBSET__HAVEN_STORE_DEV__TEST_OWNER_PERMISSIONS__READER' and deleted_on is null;

use role dba;

grant ownership on table haven_store_dev.test_owner_permissions.FCT_PARK_ARRIVAL_ADDON to role haven_dbt_transform_pipelines_dev revoke current grants;

show views;

grant ownership on view haven_store_dev.test_owner_permissions.V_DIM_ARRIVAL_GUEST_TYPE to role haven_dbt_transform_pipelines_dev revoke current grants;

show tables;


show views;
show tables;
show grants to role _TEST_OWNER_PERMISSIONS_SUBSET__HAVEN_STORE_DEV__TEST_OWNER_PERMISSIONS__READER;
grant ownership on table haven_store_dev.test_owner_permissions.FCT_PARK_ARRIVAL_ADDON to role haven_dbt_transform_pipelines_dev revoke current grants;
grant ownership on view haven_store_dev.test_owner_permissions.V_DIM_ARRIVAL_GUEST_TYPE to role haven_dbt_transform_pipelines_dev revoke current grants;
grant select on view haven_store_dev.test_owner_permissions.V_DIM_ARRIVAL_GUEST_TYPE to role _test_owner_permissions_subset__haven_store_dev__test_owner_permissions__reader;

show views;
show tables;
show grants to role _TEST_OWNER_PERMISSIONS_SUBSET__HAVEN_STORE_DEV__TEST_OWNER_PERMISSIONS__READER;

select privilege, granted_on, table_catalog, table_schema, name, grantee_name, granted_by from snowflake.account_usage.grants_to_roles 
where grantee_name = '_TEST_OWNER_PERMISSIONS_SUBSET__HAVEN_STORE_DEV__TEST_OWNER_PERMISSIONS__READER' 
and deleted_on is null
and granted_by = 'HAVEN_DBT_TRANSFORM_FINANCE_DEV';

