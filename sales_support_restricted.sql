use ROLE useradmin;

CREATE ROLE sales_support_restricted;

use ROLE securityadmin;

show roles LIKE '_haven_commercial_%';

show roles LIKE 'sales_support_restricted';

GRANT ROLE _HAVEN_COMMERCIAL__WAREHOUSE__USAGE TO ROLE sales_support_restricted;
GRANT ROLE _haven_store__sales_support_restricted__reader TO ROLE sales_support_restricted;

GRANT ROLE sales_support_restricted TO ROLE dba;

use ROLE dba;

use ROLE sales_support_restricted;

use SCHEMA haven_store.sales_support_restricted;

show tables;

show views;

show warehouses;

use ROLE securityadmin;

GRANT ROLE sales_support_restricted TO USER saimanasir;


