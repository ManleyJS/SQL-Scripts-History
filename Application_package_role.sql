use role useradmin;

create role haven_create_application_packages_role;

use role securityadmin;

grant create application package on account to role haven_create_application_packages_role;

use role accountadmin;

grant create application package on account to role haven_create_application_packages_role;
grant create application on account to role haven_create_application_packages_role;
grant create application role to role haven_create_application_packages_role;

use role securityadmin;

grant role haven_create_application_packages_role to role dba;

grant create application on account to role haven_create_application_packages_role;


create application role if not exists haven_hello_application_package_role
comment = 'Tutorial Application package role';

