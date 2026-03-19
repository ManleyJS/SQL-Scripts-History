use role securityadmin;

GRANT ROLE _HAVEN_BASE__CYHH__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_BASE__PLOT__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_BASE__SEAWARE__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_BASE__BIGQUERY__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_BASE__ZONAL__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_BASE__PRICER__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_BASE__DREAM__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_STORE__ACTIVITIES__READER  TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__AVAILABILITY__READER  TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__ALIGN_ALYTICS__READER  TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__CARAVANS__READER  TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__CARAVAN_SALES__READER  TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__COMMERCIAL__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__COMMON__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__COMPETITOR__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__FINANCIAL_CUBE__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__HOLIDAY__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__MA_MART__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__OCANDC__READER	 TO ROLE HAVEN_REVENUE_MANAGEMENT; 
GRANT ROLE _HAVEN_STORE__PITCH_PERFECT__READER	  TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_STORE__PRICER__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_STORE__PRICER_FORECAST__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;	 
GRANT ROLE _HAVEN_STORE__PROSPECTS__READER	  TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_STORE__RETAIL__READER	  TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_STORE__SASMART__READER	  TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_STORE__SAS_SCV__READER	  TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_STORE__SURVEY__READER	  TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_STORE__TROOPER__READER	  TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_STORE__TROOPER2__READER	  TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_PIPELINE__PX0006_BLUEYONDER_PRICER__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;
GRANT ROLE _HAVEN_PIPELINE__PX0007_PITCH_PERFECT__READER TO ROLE HAVEN_REVENUE_MANAGEMENT;

use role sysadmin;
use database haven_commercial;

create schema haven_revenue_management.ds_dev clone ds_dev;  
create schema haven_revenue_management.CYHH_PRICING_PILOT clone CYHH_PRICING_PILOT;  
create schema haven_revenue_management.DSIM_DBT_CYHH_PRICING_PILOT clone DSIM_DBT_CYHH_PRICING_PILOT;  

use database haven_revenue_management;

grant ownership on schema haven_revenue_management.ds_dev to role haven_revenue_management_dillonsim revoke current grants;
grant ownership on schema haven_revenue_management.CYHH_PRICING_PILOT to role haven_revenue_management_dillonsim revoke current grants;
grant ownership on schema haven_revenue_management.DSIM_DBT_CYHH_PRICING_PILOT to role haven_revenue_management_dillonsim revoke current grants;

use role sysadmin;

use role securityadmin;

grant ownership on all tables in schema haven_revenue_management.ds_dev to role haven_revenue_management_dillonsim revoke current grants;
grant ownership on all tables in schema haven_revenue_management.CYHH_PRICING_PILOT to role haven_revenue_management_dillonsim revoke current grants;
grant ownership on all tables in schema haven_revenue_management.DSIM_DBT_CYHH_PRICING_PILOT to role haven_revenue_management_dillonsim revoke current grants;

grant ownership on all views in schema haven_revenue_management.ds_dev to role haven_revenue_management_dillonsim revoke current grants;
grant ownership on all views in schema haven_revenue_management.CYHH_PRICING_PILOT to role haven_revenue_management_dillonsim revoke current grants;
grant ownership on all views in schema haven_revenue_management.DSIM_DBT_CYHH_PRICING_PILOT to role haven_revenue_management_dillonsim revoke current grants;

use role haven_revenue_management;

grant role haven_revenue_management_dillonsim to role dba;

use role haven_revenue_management_dillonsim;

use schema haven_revenue_management.ds_dev;

show views;



