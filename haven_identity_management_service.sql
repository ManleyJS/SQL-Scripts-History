USE ROLE useradmin;

CREATE ROLE haven_identity_management_service_account;

create user haven_identity_management_service_account
login_name = 'haven.identity.management.service.account'
password = '<REDACTED>'
display_name = 'Haven Identity Management Service Account'
comment = 'Haven Identity Service Account'
default_role = haven_identity_management_service_account
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xs;


USE ROLE securityadmin;

GRANT ROLE haven_identity_management TO role haven_identity_management_service_account;
GRANT ROLE _haven_identity__schema TO ROLE haven_identity_management_service_account;
GRANT ROLE haven_identity_management_service_account TO USER haven_identity_management_service_account;

USE ROLE useradmin;
drop ROLE haven_development_kevinrichards;
CREATE ROLE haven_development_kevinrichards1;
DROP ROLE haven_development_guspowers;
CREATE ROLE haven_development_guspower;

USE ROLE securityadmin;

SHOW USERS LIKE 'kevin%';
SHOW USERS LIKE 'gus%';

REVOKE ROLE haven_development FROM USER kevinrichards1;
REVOKE ROLE haven_development FROM USER guspower;

grant ROLE haven_development to role haven_development_kevinrichards1;
grant ROLE haven_development TO role haven_development_guspower;

GRANT ROLE _haven_development__schema to role haven_development_kevinrichards1;
GRANT ROLE _haven_development__schema TO role haven_development_guspower;

GRANT ROLE haven_development_kevinrichards1 TO USER kevinrichards1;
GRANT ROLE haven_development_guspower TO USER guspower;

-- 03/07/2025

-- Habib Kaghas
-- Habib.Kaghas@haven.com
-- Senior Software Engineer

USE ROLE USERADMIN;

create USER  HabibKaghas
login_name = 'Habib.Kaghas@haven.com'
display_name = 'Habib Kaghas'
email = 'Habib.Kaghas@haven.com'
comment = 'Senior Software Engineer'
default_role = haven_development
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xs
;

use ROLE securityadmin;

GRANT ROLE haven_development TO USER HabibKaghas

-- 18/09/2025

-- Kevin Richards
-- Kevin.Richards2@haven.com
-- Consultant

USE ROLE USERADMIN;

create USER KevinRichards2  
login_name = 'Kevin.Richards2@haven.com'
display_name = 'Kevin Richards'
email = 'Kevin.Richards2@haven.com'
comment = 'Consultant'
default_role = haven_identity_management
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xs
TYPE = person
;

use ROLE securityadmin;

GRANT ROLE haven_identity_management TO USER KevinRichards2;
GRANT ROLE haven_identity_management_developer TO USER KevinRichards2;

use ROLE securityadmin;

revoke ROLE haven_identity_management from USER KevinRichards2;
revoke ROLE haven_identity_management_developer from USER KevinRichards2;


----------

-- 
-- 
-- 

USE ROLE USERADMIN;

create USER  
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = haven_development
DEFAULT_WAREHOUSE = haven_identity_management_warehouse_xs
;

use ROLE securityadmin;

GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER TO USER 

