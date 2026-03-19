USE ROLE sysadmin;

CREATE WAREHOUSE haven_revenue_management_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_revenue_management_warehouse_xsmall__warehouse__operator;
create role _haven_revenue_management_warehouse_xsmall__warehouse__usage;

use role securityadmin;

grant usage, monitor on warehouse haven_revenue_management_warehouse_xsmall to role _haven_revenue_management_warehouse_xsmall__warehouse__usage;
grant role _haven_revenue_management_warehouse_xsmall__warehouse__usage to role _haven_revenue_management_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_revenue_management_warehouse_xsmall to role _haven_revenue_management_warehouse_xsmall__warehouse__operator;

GRANT role _haven_revenue_management_warehouse_xsmall__warehouse__usage TO ROLE haven_revenue_management;

use role useradmin;

## Clare Stinton Clare.Stinton@haven.com
create user ClareStinton
login_name = 'Clare.Stinton@haven.com'
display_name = 'Clare Stinton'
email = 'Clare.Stinton@haven.com'
comment = 'Haven Revenue Management Team'
default_role = 'haven_revenue_management'
default_warehouse = 'haven_revenue_management_warehouse_xsmall';

## Martin Bilyard Martin.Bilyard@haven.com
create user MartinBilyard
login_name = 'Martin.Bilyard@haven.com'
display_name = 'Martin Bilyard'
email = 'Martin.Bilyard@haven.com'
comment = 'Haven Revenue Management Team'
default_role = 'haven_revenue_management'
default_warehouse = 'haven_revenue_management_warehouse_xsmall';

## Louise Beare Louise.Beare@haven.com
create user LouiseBeare
login_name = 'Louise.Beare@haven.com'
display_name = 'Louise Beare'
email = 'Louise.Beare@haven.com'
comment = 'Haven Revenue Management Team'
default_role = 'haven_revenue_management'
default_warehouse = 'haven_revenue_management_warehouse_xsmall';

## Vaughn Medhurst Vaughn.Medhurst@haven.com
create user VaughnMedhurst
login_name = 'Vaughn.Medhurst@haven.com'
display_name = 'Vaughn Medhurst'
email = 'Vaughn.Medhurst@haven.com'
comment = 'Haven Revenue Management Team'
default_role = 'haven_revenue_management'
default_warehouse = 'haven_revenue_management_warehouse_xsmall';

## Debbie Austin Debbie.Austin@haven.com
create user DebbieAustin
login_name = 'Debbie.Austin@haven.com'
display_name = 'Debbie Austin'
email = 'Debbie.Austin@haven.com'
comment = 'Haven Revenue Management Team'
default_role = 'haven_revenue_management'
default_warehouse = 'haven_revenue_management_warehouse_xsmall';

## Maggie Chivers Maggie.Chivers@haven.com
create user MaggieChivers
login_name = 'Maggie.Chivers@haven.com'
display_name = 'Maggie Chivers'
email = 'Maggie.Chivers@haven.com'
comment = 'Haven Revenue Management Team'
default_role = 'haven_revenue_management'
default_warehouse = 'haven_revenue_management_warehouse_xsmall';

## Carol Frain Carol.Frain@haven.com
create user CarolFrain
login_name = 'Carol.Frain@haven.com'
display_name = 'Carol Frain'
email = 'Carol.Frain@haven.com'
comment = 'Haven Revenue Management Team'
default_role = 'haven_revenue_management'
default_warehouse = 'haven_revenue_management_warehouse_xsmall';

## Lydia Rodrigues Lydia.Rodrigues@haven.com
create user LydiaRodrigues
login_name = 'Lydia.Rodrigues@haven.com'
display_name = 'Lydia Rodrigues'
email = 'Lydia.Rodrigues@haven.com'
comment = 'Haven Revenue Management Team'
default_role = 'haven_revenue_management'
default_warehouse = 'haven_revenue_management_warehouse_xsmall';

## Alex Wilde Alex.Wilde@haven.com
create user AlexWilde
login_name = 'Alex.Wilde@haven.com'
display_name = 'Alex Wilde'
email = 'Alex.Wilde@haven.com'
comment = 'Haven Revenue Management Team'
default_role = 'haven_revenue_management'
default_warehouse = 'haven_revenue_management_warehouse_xsmall';

USE ROLE securityadmin;

## Clare Stinton Clare.Stinton@haven.com
grant role haven_revenue_management to user ClareStinton;
## Martin Bilyard Martin.Bilyard@haven.com
grant role haven_revenue_management to user MartinBilyard;
## Louise Beare Louise.Beare@haven.com
grant role haven_revenue_management to user LouiseBeare;
## Vaughn Medhurst Vaughn.Medhurst@haven.com
grant role haven_revenue_management to user VaughnMedhurst;
## Debbie Austin Debbie.Austin@haven.com
grant role haven_revenue_management to user DebbieAustin;
## Maggie Chivers Maggie.Chivers@haven.com
grant role haven_revenue_management to user MaggieChivers;
## Carol Frain Carol.Frain@haven.com
grant role haven_revenue_management to user CarolFrain;
## Lydia Rodrigues Lydia.Rodrigues@haven.com
grant role haven_revenue_management to user LydiaRodrigues;
## Alex Wilde Alex.Wilde@haven.com
grant role haven_revenue_management to user AlexWilde;

SHOW GRANTS TO ROLE haven_commercial;

USE ROLE securityadmin;

GRANT ROLE _HAVEN_STORE__ACTIVITIES__READER TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__AVAILABILITY__READER TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__CARAVANS__READER TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__COMMON__READER TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__COMPETITOR__READER TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__OCANDC__READER TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__PAYMENTS__READER TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__PITCH_PERFECT__READER TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__SASMART__READER TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__TROOPER__READER TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__TRPREPRS__READER TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__MA_MART__USAGE TO ROLE haven_revenue_management;
GRANT ROLE _HAVEN_STORE__SAS_SCV__USAGE TO ROLE haven_revenue_management;
GRANT ROLE _haven_store__revenue_management__reader TO ROLE haven_revenue_management;
GRANT ROLE haven_revenue_management TO ROLE dba;
GRANT ROLE haven_revenue_management TO USER jonathanmanley;
GRANT ROLE haven_revenue_management TO USER garyranson;
GRANT ROLE haven_commercial TO USER garyranson;

USE ROLE haven_batch_dataload;

GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME_CATEGORY TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME_GROUP TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME_TYPE TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.HVN_ENHANCE_COM_DETAIL TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HAVEN_ANALYTICS_MART TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HAVEN_ANALYTICS_PIT_MART TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_BOOKINGS TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_CONTACT TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.PARK_PROSPECT_PREF TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.SN_ADDRESS_SEGMENTATION TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.SN_ADDRESS_SEGMENTATION_HIST TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.SN_SOCIO_ECON TO ROLE haven_revenue_management;

USE ROLE haven_cdc_dataload;

GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_APC_SCHEDULE TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_CURRENT TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_HIST TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_ORIGINAL TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.SN_CAMPAIGN TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.SN_COMMUNICATION TO ROLE haven_revenue_management;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.SN_CONTACT_HISTORY TO ROLE haven_revenue_management;

USE ROLE securityadmin;

GRANT ROLE haven_activities_reporting TO USER jonathanmanley;
GRANT ROLE haven_activities_reporting TO USER garyranson;

SHOW GRANTS TO USER clarestinton;
SHOW GRANTS TO ROLE haven_revenue_management;

use role useradmin;
create role _haven_revenue_management__haven_base__seaware__reader;
create role _haven_revenue_management__haven_store__ma_mart__reader;
create role _haven_revenue_management__haven_store__sas_scv__reader;

use role securityadmin;
grant role _haven_revenue_management__haven_base__seaware__reader to role haven_revenue_management;
grant role _haven_revenue_management__haven_store__ma_mart__reader to role haven_revenue_management;
grant role _haven_revenue_management__haven_store__sas_scv__reader to role haven_revenue_management;

use role dba;
USE ROLE securityadmin;

grant select on view haven_base.SEAWARE.AGENCY to role _haven_revenue_management__haven_base__seaware__reader;
grant select on view haven_base.SEAWARE.RES_HEADER  to role _haven_revenue_management__haven_base__seaware__reader;
grant select on view haven_base.SEAWARE.RES_INVOICE_ITEM  to role _haven_revenue_management__haven_base__seaware__reader;
grant select on view haven_base.SEAWARE.VRES_GRADE_PRICE  to role _haven_revenue_management__haven_base__seaware__reader;
grant select on view haven_base.SEAWARE.PACKAGE_DEFINITION  to role _haven_revenue_management__haven_base__seaware__reader;

USE ROLE haven_batch_dataload;

GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME_CATEGORY TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME_GROUP TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME_TYPE TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.HVN_ENHANCE_COM_DETAIL TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_BOOKINGS TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_CONTACT TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.PARK_PROSPECT_PREF TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.SN_ADDRESS_SEGMENTATION TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.SN_ADDRESS_SEGMENTATION_HIST TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.SN_SOCIO_ECON TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HAVEN_ANALYTICS_MART TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;
GRANT SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HAVEN_ANALYTICS_PIT_MART TO ROLE _haven_revenue_management__haven_store__ma_mart__reader;

USE ROLE haven_cdc_dataload;

GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_APC_SCHEDULE TO ROLE _haven_revenue_management__haven_store__sas_scv__reader;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_CURRENT TO ROLE _haven_revenue_management__haven_store__sas_scv__reader;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_HIST TO ROLE _haven_revenue_management__haven_store__sas_scv__reader;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_ORIGINAL TO ROLE _haven_revenue_management__haven_store__sas_scv__reader;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.SN_CAMPAIGN TO ROLE _haven_revenue_management__haven_store__sas_scv__reader;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.SN_COMMUNICATION TO ROLE _haven_revenue_management__haven_store__sas_scv__reader;
GRANT SELECT ON TABLE HAVEN_STORE.SAS_SCV.SN_CONTACT_HISTORY TO ROLE _haven_revenue_management__haven_store__sas_scv__reader;

use role dba;

revoke select on table haven_base.SEAWARE.AGENCY from role haven_revenue_management;
revoke select on table haven_base.SEAWARE.RES_HEADER  from role haven_revenue_management;
revoke select on table haven_base.SEAWARE.RES_INVOICE_ITEM  from role haven_revenue_management;
revoke select on table haven_base.SEAWARE.VRES_GRADE_PRICE  from role haven_revenue_management;
revoke select on table haven_base.SEAWARE.PACKAGE_DEFINITION  from role haven_revenue_management;

USE ROLE haven_batch_dataload;

revoke SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME_CATEGORY from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME_GROUP from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.CAMEO_INCOME_TYPE from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.HVN_ENHANCE_COM_DETAIL from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HAVEN_ANALYTICS_MART from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HAVEN_ANALYTICS_PIT_MART from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_BOOKINGS from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_CONTACT from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.PARK_PROSPECT_PREF from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.SN_ADDRESS_SEGMENTATION from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.SN_ADDRESS_SEGMENTATION_HIST from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.MA_MART.SN_SOCIO_ECON from role haven_revenue_management;

USE ROLE haven_cdc_dataload;

revoke SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_APC_SCHEDULE from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_CURRENT from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_HIST from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.SAS_SCV.BOOKING_ORIGINAL from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.SAS_SCV.SN_CAMPAIGN from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.SAS_SCV.SN_COMMUNICATION from role haven_revenue_management;
revoke SELECT ON TABLE HAVEN_STORE.SAS_SCV.SN_CONTACT_HISTORY from role haven_revenue_management;

use role dba;
use database haven_store;
use schema ma_mart;

grant ownership on table haven_store.ma_haven_analytics_mart to role _haven_revenue_management__haven_store__ma_mart__reader;

use role useradmin;

alter user clarestinton set default_role = public;

-- 26/09/2024

-- markheuchan
-- mark.heuchan@haven.com
-- Revenue Manager

USE ROLE useradmin;

create user markheuchan
login_name = 'mark.heuchan@haven.com'
display_name = 'Mark Heuchan'
email = 'mark.heuchan@haven.com'
comment = 'Revenue Manager'
default_role = haven_revenue_management
default_warehouse = haven_revenue_management_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_revenue_management TO USER markheuchan;


-- 21/01/2025

-- Rambaut Fairley
-- rambaut.fairley@bourne-leisure.co.uk
-- 

USE ROLE useradmin;

create user RambautFairley
login_name = 'rambaut.fairley@bourne-leisure.co.uk'
display_name = 'Rambaut Fairley'
email = 'rambaut.fairley@bourne-leisure.co.uk'
comment = 'Chief Commercial Officer'
default_role = haven_revenue_management
default_warehouse = haven_revenue_management_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_revenue_management TO USER RambautFairley;


-- 30/09/2025

-- Caitlin Smith
-- Caitlin.Smith@haven.com
-- Product Pricing Manager

USE ROLE useradmin;

create user CaitlinSmith
login_name = 'Caitlin.Smith@haven.com'
display_name = 'Caitlin Smith'
email = 'Caitlin.Smith@haven.com'
comment = 'Product Pricing Manager'
default_role = haven_revenue_management
default_warehouse = haven_revenue_management_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_revenue_management TO USER CaitlinSmith;


-- 02/10/2025

-- Lewis Chai
-- Lewis.Chai@haven.com
-- 

USE ROLE useradmin;

CREATE ROLE haven_revenue_management_LewisChai;
CREATE ROLE haven_revenue_management_CaitlinSmith;

create user LewisChai
login_name = 'Lewis.Chai@haven.com'
display_name = 'Lewis Chai'
email = 'Lewis.Chai@haven.com'
comment = 'Decision Scientist'
default_role = haven_revenue_management
default_warehouse = haven_revenue_management_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE _haven_revenue_management__schema TO ROLE haven_revenue_management_LewisChai;
GRANT ROLE haven_revenue_management to ROLE haven_revenue_management_LewisChai;  

GRANT ROLE haven_revenue_management_LewisChai TO USER LewisChai;

GRANT ROLE _haven_revenue_management__schema TO ROLE haven_revenue_management_CaitlinSmith;
GRANT ROLE haven_revenue_management to ROLE haven_revenue_management_CaitlinSmith;  

GRANT ROLE haven_revenue_management_CaitlinSmith TO USER CaitlinSmith;

-- 14/10/2025

-- notebook creation privileges

use ROLE dba;

show GRANTS TO ROLE haven_revenue_management_dillonsim;

SHOW GRANTS TO ROLE HAVEN_REVENUE_MANAGEMENT;

use ROLE securityadmin;

grant ROLE haven_revenue_management_CaitlinSmith TO ROLE dba;

-- 16/10/2025

use ROLE securityadmin;

GRANT ROLE HAVEN_DBT_DEVELOPMENT_ALIGN_ALYTICS TO user CaitlinSmith;
GRANT ROLE HAVEN_DBT_DEVELOPMENT_ALIGN_ALYTICS TO user LewisChai;


-- 03/11/2025

-- Rachel.Gregory@haven.com
-- Rachel.Gregory@haven.com
-- Director, Pitch Profitability

USE ROLE useradmin;

create user RachelGregory
login_name = 'Rachel.Gregory@haven.com'
display_name = 'Rachel Gregory'
email = 'Rachel.Gregory@haven.com'
comment = 'Director, Pitch Profitability'
default_role = haven_revenue_management
default_warehouse = haven_revenue_management_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_revenue_management TO USER RachelGregory;

-- 13/11/2025

use ROLE dba;

use DATABASE haven_semantic;

SHOW schemas;

use ROLE securityadmin;

GRANT ROLE _haven_semantic__REVENUE_MANAGEMENT_REPORTING__READER TO ROLE haven_revenue_management; 
GRANT ROLE _haven_semantic__RMS_LAUNCH_PRICE_TOOL__READER TO ROLE haven_revenue_management;
GRANT ROLE _haven_semantic__RMS_PRICER_COMMON__READER TO ROLE haven_revenue_management;
GRANT ROLE _haven_semantic__RMS_REPORTING_GRADE__READER TO ROLE haven_revenue_management;



-- 06/01/2026

use ROLE securityadmin;

GRANT ROLE haven_revenue_management TO USER simoncole;

-- 13/01/2026

use ROLE securityadmin;

GRANT ROLE _haven_store__performance_marketing__reader TO ROLE haven_revenue_management;



-- Melu Mpande 
--  Matthew Evans
 

--------------------------
-- date

-- 
-- 
-- 

USE ROLE useradmin;

create user 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = haven_revenue_management
default_warehouse = haven_revenue_management_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_revenue_management TO USER ;






-- Melu Mpande 
--  Matthew Evans
 

--------------------------
-- date

-- 
-- 
-- 

USE ROLE useradmin;

create user 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = haven_revenue_management
default_warehouse = haven_revenue_management_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_revenue_management TO USER ;
