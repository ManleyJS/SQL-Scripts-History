SHOW ROLES LIKE '%commercial%';

USE ROLE useradmin;

CREATE ROLE _haven_commercial__haven_base__plot__reader;

USE ROLE securityadmin;
GRANT SELECT ON TABLE haven_base.plot.owners TO ROLE _haven_commercial__haven_base__plot__reader;
GRANT ROLE _haven_commercial__haven_base__plot__reader TO ROLE haven_commercial;
revoke ROLE _haven_commercial__haven_base__plot__reader from ROLE haven_commercial;

USE ROLE haven_commercial;
USE WAREHOUSE haven_commercial_xsmall;
SELECT * FROM haven_base.plot.owners LIMIT 100;

USE ROLE useradmin;
create user haven_commercial_tableau_virtual_connection
login_name = 'haven.commercial.tableau.vc'
password = '<REDACTED>'
display_name = 'Haven Commercial Tableau Virtual Connection'
comment = 'haven Commercial Tableau Virtual Connection'
default_role = haven_commercial
DEFAULT_WAREHOUSE = haven_commercial_xsmall;

ALTER USER haven_commercial_tableau_virtual_connection SET default_role = haven_commercial,
DEFAULT_WAREHOUSE = haven_commercial_xsmall;

USE ROLE securityadmin;
GRANT ROLE haven_commercial TO USER haven_commercial_tableau_virtual_connection;