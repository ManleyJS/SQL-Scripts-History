USE ROLE useradmin;

create user haven_commercial_tableau_service
login_name = 'haven.commercial.tableau.service'
password = '<REDACTED>'
display_name = 'Haven Commercial Tableau Service Account'
comment = 'Commercial Tableau Service Account'
default_role = haven_commercial
DEFAULT_WAREHOUSE = haven_commercial_xsmall;

create user haven_activities_reporting_tableau_service
login_name = 'haven.activities.reporting.tableau.service'
password = '<REDACTED>'
display_name = 'Haven Activities Reporting Tableau Service Account'
comment = 'Haven Activities Reporting_Tableau Service Account'
default_role = haven_activities_reporting
DEFAULT_WAREHOUSE = haven_activities_reporting_xsmall;

create user haven_revenue_management_tableau_service
login_name = 'haven.revenue.management.tableau.service'
password = '<REDACTED>'
display_name = 'Haven Revenue Management Tableau Service Account'
comment = 'Haven Revenue Management Tableau Service Account'
default_role = haven_revenue_management
DEFAULT_WAREHOUSE = haven_revenue_management_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_commercial TO USER haven_commercial_tableau_service;
GRANT ROLE haven_activities_reporting TO USER haven_activities_reporting_tableau_service;
GRANT ROLE haven_revenue_management TO USER haven_revenue_management_tableau_service;

USE ROLE useradmin;

ALTER USER haven_commercial_tableau_service SET password = '<REDACTED>';
ALTER USER haven_activities_reporting_tableau_service SET password = '<REDACTED>';
ALTER USER haven_revenue_management_tableau_service SET password = '<REDACTED>';

ALTER USER haven_commercial_tableau_service SET password = '<REDACTED>';
