USE ROLE useradmin;

SHOW ROLES LIKE '%commercial%';
SHOW GRANTS TO ROLE haven_commercial; 

CREATE ROLE _haven_commercial__haven_base__identity__reader;

USE ROLE securityadmin;

GRANT ROLE _haven_base__identity__usage TO ROLE _haven_commercial__haven_base__identity__reader;
GRANT SELECT ON VIEW haven_base.IDENTITY.hid TO ROLE _haven_commercial__haven_base__identity__reader;
GRANT SELECT ON VIEW haven_base.IDENTITY.hid_to_seaware_client TO ROLE _haven_commercial__haven_base__identity__reader;
GRANT SELECT ON VIEW haven_base.IDENTITY.hid_to_plot_owner TO ROLE _haven_commercial__haven_base__identity__reader;

GRANT ROLE _haven_commercial__haven_base__identity__reader TO ROLE haven_commercial;

USE ROLE haven_commercial;