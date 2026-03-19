use role useradmin;

create role role_creation_admin;

use role securityadmin;

grant role useradmin to role role_creation_admin;
grant role sysadmin to role role_creation_admin;
grant role securityadmin to role role_creation_admin;

revoke role useradmin from role role_creation_admin;
revoke role sysadmin from role role_creation_admin;
revoke role securityadmin from role role_creation_admin;

grant create role to role_creation_admin;
grant create schema
