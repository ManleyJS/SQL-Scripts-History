use role useradmin;
--SHOW ROLES LIKE 'haven_commercial_%';
--SHOW GRANTS TO ROLE haven_commercial;
--SHOW GRANTS TO ROLE haven_commercial_harrybillimore;

create role haven_commercial_AmitNarsian;

create user AmitNarsian
login_name = 'Amit.Narsian@haven.com'
display_name = 'Amit Narsian'
email = 'Amit.Narsian@haven.com'
comment = 'Haven Commercial Analytical Team'
default_role = haven_commercial_AmitNarsian
default_warehouse = haven_commercial_xsmall;

use role securityadmin;

GRANT ROLE haven_commercial TO ROLE haven_commercial_AmitNarsian;
GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_AmitNarsian;
GRANT ROLE haven_commercial_AmitNarsian TO USER AmitNarsian; 

create user deleteme
login_name = 'deleteme@haven.com'
display_name = 'Amit Narsian'
email = 'Amit.Narsian@haven.com'
comment = 'Haven Commercial Analytical Team'
default_role = haven_commercial_AmitNarsian
default_warehouse = haven_commercial_xsmall;

DROP USER deleteme;

USE ROLE useradmin;
CREATE ROLE haven_commercial_davidparsons;

--david.parsons@haven.com
create user DavidParsons
login_name = 'david.parsons@haven.com'
display_name = 'David Parsons'
email = 'david.parsons@haven.com'
comment = 'Business Intelligence Lead'
default_role = haven_commercial_DavidParsons
default_warehouse = haven_commercial_xsmall;

USE ROLE securityadmin;
GRANT ROLE _haven_commercial__schema TO ROLE haven_commercial_davidparsons;
GRANT ROLE haven_commercial TO ROLE haven_commercial_davidparsons;
GRANT ROLE haven_commercial_davidparsons TO USER DavidParsons; 

USE ROLE useradmin;

CREATE ROLE people_data_restricted;

USE ROLE securityadmin;

GRANT ROLE _haven_base__workforce_sam__reader TO ROLE people_data_restricted; 
