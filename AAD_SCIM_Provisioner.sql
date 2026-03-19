use role useradmin;
--use role accountadmin;
create role if not exists generic_scim_provisioner;
drop role generic_scim_provisioner;

create role if not exists aad_scim_provisioner;

use role securityadmin;

grant create user on account to role aad_scim_provisioner;
grant create role on account to role aad_scim_provisioner;

grant role aad_scim_provisioner to role accountadmin;
grant role aad_scim_provisioner to role dba;

use role accountadmin;

create or replace security integration aad_scim_provisioning
    type=scim
    scim_client='azure'
    run_as_role='AAD_SCIM_PROVISIONER';
select system$generate_scim_access_token('GENERIC_SCIM_PROVISIONING');

