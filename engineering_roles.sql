use role useradmin;

create OR REPLACE role _haven_data_integrate_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _haven_data_integrate_warehouse_xsmall__warehouse__usage;
create OR REPLACE role _haven_data_transform_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _haven_data_transform_warehouse_xsmall__warehouse__usage;
create OR REPLACE role _warner_data_integrate_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _warner_data_integrate_warehouse_xsmall__warehouse__usage;
create OR REPLACE role _warner_data_transform_warehouse_xsmall__warehouse__operator;
create OR REPLACE role _warner_data_transform_warehouse_xsmall__warehouse__usage;

create OR REPLACE role _haven_data_transform_warehouse_medium__warehouse__operator;
create OR REPLACE role _haven_data_transform_warehouse_medium__warehouse__usage;

CREATE ROLE haven_data_integrate;
CREATE ROLE haven_data_transform;
CREATE ROLE warner_data_integrate;
CREATE ROLE warner_data_transform;

CREATE ROLE _haven_data_integrate__usage;
CREATE ROLE _haven_data_integrate__schema;
CREATE ROLE _haven_data_transform__usage;
CREATE ROLE _haven_data_transform__schema;
CREATE ROLE _warner_data_integrate__usage;
CREATE ROLE _warner_data_integrate__schema;
CREATE ROLE _warner_data_transform__usage;
CREATE ROLE _warner_data_transform__schema;

CREATE ROLE haven_data_integrate_garyranson;
CREATE ROLE haven_data_transform_garyranson;
CREATE ROLE warner_data_integrate_garyranson;
CREATE ROLE warner_data_transform_garyranson;

CREATE ROLE haven_data_integrate_jonathanmanley;
CREATE ROLE haven_data_transform_jonathanmanley;
CREATE ROLE warner_data_integrate_jonathanmanley;
CREATE ROLE warner_data_transform_jonathanmanley;


USE ROLE sysadmin;

CREATE DATABASE haven_data_integrate;
CREATE DATABASE haven_data_transform;
CREATE DATABASE warner_data_integrate;
CREATE DATABASE warner_data_transform;

CREATE WAREHOUSE haven_data_integrate_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

DROP WAREHOUSE  haven_data_trasform_warehouse_xsmall;
CREATE WAREHOUSE haven_data_transform_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE WAREHOUSE haven_data_transform_warehouse_medium WITH WAREHOUSE_SIZE = 'medium' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE WAREHOUSE warner_data_integrate_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

DROP WAREHOUSE  warner_data_trasform_warehouse_xsmall;
CREATE WAREHOUSE warner_data_transform_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

USE ROLE securityadmin;

GRANT USAGE ON DATABASE haven_data_integrate TO ROLE _haven_data_integrate__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_data_integrate TO ROLE _haven_data_integrate__usage;
GRANT ROLE _haven_data_integrate__usage TO ROLE _haven_data_integrate__schema;
GRANT CREATE SCHEMA ON DATABASE haven_data_integrate TO ROLE _haven_data_integrate__schema;
GRANT SELECT ON future TABLES IN DATABASE haven_data_integrate TO ROLE _haven_data_integrate__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_data_integrate TO ROLE _haven_data_integrate__usage;
GRANT SELECT ON all VIEWS IN DATABASE haven_data_integrate TO ROLE _haven_data_integrate__usage;

GRANT USAGE ON DATABASE haven_data_transform TO ROLE _haven_data_transform__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_data_transform TO ROLE _haven_data_transform__usage;
GRANT ROLE _haven_data_transform__usage TO ROLE _haven_data_transform__schema;
GRANT CREATE SCHEMA ON DATABASE haven_data_transform TO ROLE _haven_data_transform__schema;
GRANT SELECT ON future TABLES IN DATABASE haven_data_transform TO ROLE _haven_data_transform__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_data_transform TO ROLE _haven_data_transform__usage;
GRANT SELECT ON all VIEWS IN DATABASE haven_data_transform TO ROLE _haven_data_transform__usage;

GRANT USAGE ON DATABASE warner_data_integrate TO ROLE _warner_data_integrate__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE warner_data_integrate TO ROLE _warner_data_integrate__usage;
GRANT ROLE _warner_data_integrate__usage TO ROLE _warner_data_integrate__schema;
GRANT CREATE SCHEMA ON DATABASE warner_data_integrate TO ROLE _warner_data_integrate__schema;
GRANT SELECT ON future TABLES IN DATABASE warner_data_integrate TO ROLE _warner_data_integrate__usage;
GRANT SELECT ON future VIEWS IN DATABASE warner_data_integrate TO ROLE _warner_data_integrate__usage;
GRANT SELECT ON all VIEWS IN DATABASE warner_data_integrate TO ROLE _warner_data_integrate__usage;

GRANT USAGE ON DATABASE warner_data_transform TO ROLE _warner_data_transform__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE warner_data_transform TO ROLE _warner_data_transform__usage;
GRANT ROLE _warner_data_transform__usage TO ROLE _warner_data_transform__schema;
GRANT CREATE SCHEMA ON DATABASE warner_data_transform TO ROLE _warner_data_transform__schema;
GRANT SELECT ON future TABLES IN DATABASE warner_data_transform TO ROLE _warner_data_transform__usage;
GRANT SELECT ON future VIEWS IN DATABASE warner_data_transform TO ROLE _warner_data_transform__usage;
GRANT SELECT ON all VIEWS IN DATABASE warner_data_transform TO ROLE _warner_data_transform__usage;

grant usage, monitor on warehouse haven_data_integrate_warehouse_xsmall to role _haven_data_integrate_warehouse_xsmall__warehouse__usage;
grant role _haven_data_integrate_warehouse_xsmall__warehouse__usage to role _haven_data_integrate_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_data_integrate_warehouse_xsmall to role _haven_data_integrate_warehouse_xsmall__warehouse__operator;

grant usage, monitor on warehouse haven_data_transform_warehouse_xsmall to role _haven_data_transform_warehouse_xsmall__warehouse__usage;
grant role _haven_data_transform_warehouse_xsmall__warehouse__usage to role _haven_data_transform_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_data_transform_warehouse_xsmall to role _haven_data_transform_warehouse_xsmall__warehouse__operator;

grant usage, monitor on warehouse haven_data_transform_warehouse_medium to role _haven_data_transform_warehouse_medium__warehouse__usage;
grant role _haven_data_transform_warehouse_medium__warehouse__usage to role _haven_data_transform_warehouse_medium__warehouse__operator;
grant operate, modify on warehouse haven_data_transform_warehouse_medium to role _haven_data_transform_warehouse_medium__warehouse__operator;

grant usage, monitor on warehouse warner_data_integrate_warehouse_xsmall to role _warner_data_integrate_warehouse_xsmall__warehouse__usage;
grant role _warner_data_integrate_warehouse_xsmall__warehouse__usage to role _warner_data_integrate_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse warner_data_integrate_warehouse_xsmall to role _warner_data_integrate_warehouse_xsmall__warehouse__operator;

grant usage, monitor on warehouse warner_data_transform_warehouse_xsmall to role _warner_data_transform_warehouse_xsmall__warehouse__usage;
grant role _warner_data_transform_warehouse_xsmall__warehouse__usage to role _warner_data_transform_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse warner_data_transform_warehouse_xsmall to role _warner_data_transform_warehouse_xsmall__warehouse__operator;

-- haven_data_transform roles

USE ROLE securityadmin;

grant role _haven_base__activities__reader to role haven_data_transform;
grant role _haven_base__amplitude__reader to role haven_data_transform;
grant role _haven_base__aztecactivitymanagement_complex__reader to role haven_data_transform;
grant role _haven_base__aztecactivitymanagement__reader to role haven_data_transform;
grant role _haven_base__aztec_complex__reader to role haven_data_transform;
grant role _haven_base__aztec_retail__reader to role haven_data_transform;
grant role _haven_base__aztec__reader to role haven_data_transform;
grant role _haven_base__bigquery__reader to role haven_data_transform;
grant role _haven_base__braintree__reader to role haven_data_transform;
grant role _haven_base__common__reader to role haven_data_transform;
grant role _haven_base__competitor__reader to role haven_data_transform;
grant role _haven_base__consent_and_preference__reader to role haven_data_transform;
grant role _haven_base__cyhh__reader to role haven_data_transform;
grant role _haven_base__dig_activities__reader to role haven_data_transform;
grant role _haven_base__dig_arrivals__reader to role haven_data_transform;
grant role _haven_base__dig_bookings__reader to role haven_data_transform;
grant role _haven_base__dig_capacity__reader to role haven_data_transform;
grant role _haven_base__dig_payments__reader to role haven_data_transform;
grant role _haven_base__dig_pricing__reader to role haven_data_transform;
grant role _haven_base__dream__reader to role haven_data_transform;
grant role _haven_base__equaliser__reader to role haven_data_transform;
grant role _haven_base__facebook_caravan_sales_leads__reader to role haven_data_transform;
grant role _haven_base__facebook_caravan_sales__reader to role haven_data_transform;
grant role _haven_base__facebook_holiday_sales__reader to role haven_data_transform;
grant role _haven_base__financial_cube__reader to role haven_data_transform;
grant role _haven_base__iclean__reader to role haven_data_transform;
grant role _haven_base__identity__reader to role haven_data_transform;
grant role _haven_base__jdaadmin__reader to role haven_data_transform;
grant role _haven_base__kmsreporting_complex__reader to role haven_data_transform;
grant role _haven_base__mariner__reader to role haven_data_transform;
grant role _haven_base__plot_archive__reader to role haven_data_transform;
grant role _haven_base__plot__reader to role haven_data_transform;
grant role _haven_base__sas_common__reader to role haven_data_transform;
grant role _haven_base__sas_scv__reader to role haven_data_transform;
grant role _haven_base__seaware__reader to role haven_data_transform;
grant role _haven_base__ski_lift__reader to role haven_data_transform;
grant role _haven_base__zbsdata_complex__reader to role haven_data_transform;
grant role _haven_base__zbsdata_retail__reader to role haven_data_transform;
grant role _haven_base__zendesk__reader to role haven_data_transform;
grant role _haven_base__zonal__reader to role haven_data_transform;
grant role _haven_base__google_integration__reader to role haven_data_transform;
grant role _haven_base__bloomreach_integration__reader to role haven_data_transform;
grant role _haven_base__plot_dream__reader to role haven_data_transform;
grant role _haven_base__eclient__reader to role haven_data_transform;

grant role _haven_store_trawler_reader to role haven_data_transform;
grant role _haven_store__activities__reader to role haven_data_transform;
grant role _haven_store__availability__reader to role haven_data_transform;
grant role _haven_store__caravans__reader to role haven_data_transform;
grant role _haven_store__commercial__reader to role haven_data_transform;
grant role _haven_store__common__reader to role haven_data_transform;
grant role _haven_store__competitor__reader to role haven_data_transform;
grant role _haven_store__consent_and_preference__reader to role haven_data_transform;
grant role _haven_store__digital__reader to role haven_data_transform;
grant role _haven_store__financial_cube__reader to role haven_data_transform;
grant role _haven_store__identity__reader to role haven_data_transform;
grant role _haven_store__integration__reader to role haven_data_transform;
grant role _haven_store__jdaadmin__reader to role haven_data_transform;
grant role _haven_store__jdaprep__reader to role haven_data_transform;
grant role _haven_store__kmsreporting_complex__reader to role haven_data_transform;
grant role _haven_store__kmsreporting__reader to role haven_data_transform;
grant role _haven_store__ma_mart__reader to role haven_data_transform;
grant role _haven_store__ocandc__reader to role haven_data_transform;
grant role _haven_store__payments__reader to role haven_data_transform;
grant role _haven_store__pitch_perfect__reader to role haven_data_transform;
grant role _haven_store__playpass__reader to role haven_data_transform;
grant role _haven_store__plotreprs__reader to role haven_data_transform;
grant role _haven_store__plot_reporting__reader to role haven_data_transform;
grant role _haven_store__prospects__reader to role haven_data_transform;
grant role _haven_store__revenue_management__reader to role haven_data_transform;
grant role _haven_store__sales_planner__reader to role haven_data_transform;
grant role _haven_store__sasmart__reader to role haven_data_transform;
grant role _haven_store__sas_scv__reader to role haven_data_transform;
grant role _haven_store__seaware__reader to role haven_data_transform;
grant role _haven_store__trooper2__reader to role haven_data_transform;
grant role _haven_store__trooper__reader to role haven_data_transform;
grant role _haven_store__trpreprs__reader to role haven_data_transform;
grant role _haven_store__zbsdata_complex__reader to role haven_data_transform;
grant role _haven_store__zbsdata_retail__reader to role haven_data_transform;
grant role _haven_store__zbsdata__reader to role haven_data_transform;

-- haven_data_integrate roles

grant role _haven_raw__activities__reader to role haven_data_integrate;
grant role _haven_raw__amplitude__reader to role haven_data_integrate;
grant role _haven_raw__aztecactivitymanagement_complex__reader to role haven_data_integrate;
grant role _haven_raw__aztec_complex__reader to role haven_data_integrate;
grant role _haven_raw__aztec_retail__reader to role haven_data_integrate;
grant role _haven_raw__aztec__reader to role haven_data_integrate;
grant role _haven_raw__bigquery__reader to role haven_data_integrate;
grant role _haven_raw__bookings__reader to role haven_data_integrate;
grant role _haven_raw__braintree__reader to role haven_data_integrate;
grant role _haven_raw__common__reader to role haven_data_integrate;
grant role _haven_raw__competitor__reader to role haven_data_integrate;
grant role _haven_raw__consent_and_preference__reader to role haven_data_integrate;
grant role _haven_raw__cyhh__reader to role haven_data_integrate;
grant role _haven_raw__digital_arrivals__reader to role haven_data_integrate;
grant role _haven_raw__dig_activities__reader to role haven_data_integrate;
grant role _haven_raw__dig_arrivals_transportation__reader to role haven_data_integrate;
grant role _haven_raw__dig_arrivals__reader to role haven_data_integrate;
grant role _haven_raw__dig_bookings__reader to role haven_data_integrate;
grant role _haven_raw__dig_capacity__reader to role haven_data_integrate;
grant role _haven_raw__dig_payments__reader to role haven_data_integrate;
grant role _haven_raw__dig_pricing__reader to role haven_data_integrate;
grant role _haven_raw__dig_transportation__reader to role haven_data_integrate;
grant role _haven_raw__dream_rockleyboatpark__reader to role haven_data_integrate;
grant role _haven_raw__dream__reader to role haven_data_integrate;
grant role _haven_raw__equaliser__reader to role haven_data_integrate;
grant role _haven_raw__facebook_caravan_sales_leads__reader to role haven_data_integrate;
grant role _haven_raw__facebook_caravan_sales__reader to role haven_data_integrate;
grant role _haven_raw__facebook_holiday_sales__reader to role haven_data_integrate;
grant role _haven_raw__facebook__reader to role haven_data_integrate;
grant role _haven_raw__financial_cube__reader to role haven_data_integrate;
grant role _haven_raw__google_analytics__reader to role haven_data_integrate;
grant role _haven_raw__hit_admin_rds__reader to role haven_data_integrate;
grant role _haven_raw__hit_admin__reader to role haven_data_integrate;
grant role _haven_raw__iclean__reader to role haven_data_integrate;
grant role _haven_raw__identity__reader to role haven_data_integrate;
grant role _haven_raw__jdaadmin_rds__reader to role haven_data_integrate;
grant role _haven_raw__jdaadmin__reader to role haven_data_integrate;
grant role _haven_raw__mariner_rds__reader to role haven_data_integrate;
grant role _haven_raw__mariner__reader to role haven_data_integrate;
grant role _haven_raw__payments__reader to role haven_data_integrate;
grant role _haven_raw__plot_2019__reader to role haven_data_integrate;
grant role _haven_raw__plot_archive__reader to role haven_data_integrate;
grant role _haven_raw__plot_rds_test__reader to role haven_data_integrate;
grant role _haven_raw__plot__reader to role haven_data_integrate;
grant role _haven_raw__qualtrics__reader to role haven_data_integrate;
grant role _haven_raw__seaware__reader to role haven_data_integrate;
grant role _haven_raw__ski_lift__reader to role haven_data_integrate;
grant role _haven_raw__workforce_sam__reader to role haven_data_integrate;
grant role _haven_raw__workforce__reader to role haven_data_integrate;
grant role _haven_raw__zendesk__reader to role haven_data_integrate;
grant role _haven_raw__zonal__reader to role haven_data_integrate;

grant role _haven_raw__google_integration__reader to role haven_data_integrate;
grant role _haven_raw__bloomreach_integration__reader to role haven_data_integrate;
grant role _haven_raw__plot_dream__reader to role haven_data_integrate;
grant role _haven_raw__eclient__reader to role haven_data_integrate;

-- warner_data_transform roles

grant role _warner_base__aztecactivitymanagement__reader to role warner_data_transform;
grant role _warner_base__aztec__reader to role warner_data_transform;
grant role _warner_base__kmsreporting__reader to role warner_data_transform;
grant role _warner_base__maestro__reader to role warner_data_transform;
grant role _warner_base__qualtrics__reader to role warner_data_transform;
grant role _warner_base__rotaready__reader to role warner_data_transform;
grant role _warner_base__seaware__reader to role warner_data_transform;
grant role _warner_base__zbsdata__reader to role warner_data_transform;
grant role _warner_base__zendesk__reader to role warner_data_transform;

grant role _warner_store__common__reader to role warner_data_transform;
grant role _warner_store__kmsreporting__reader to role warner_data_transform;
grant role _warner_store__ma_mart__reader to role warner_data_transform;
grant role _warner_store__sas_scv__reader to role warner_data_transform;
grant role _warner_store__zbsdata__reader to role warner_data_transform;

-- warner_data_integrate roles

grant role _warner_raw__dream__reader to role warner_data_integrate;
grant role _warner_raw__maestro__reader to role warner_data_integrate;
grant role _warner_raw__qualtrics__reader to role warner_data_integrate;
grant role _warner_raw__rotaready__reader to role warner_data_integrate;
grant role _warner_raw__seaware__reader to role warner_data_integrate;
grant role _warner_raw__warner_qualtrics__reader to role warner_data_integrate;
grant role _warner_raw__zendesk__reader to role warner_data_integrate;
grant role _warner_raw__zonal__reader to role warner_data_integrate;

GRANT ROLE haven_data_transform TO ROLE dba;
GRANT ROLE haven_data_integrate TO ROLE dba;
GRANT ROLE warner_data_transform TO ROLE dba;
GRANT ROLE warner_data_integrate TO ROLE dba;

GRANT ROLE haven_data_transform TO user jonathanmanley;
GRANT ROLE haven_data_integrate TO user jonathanmanley;
GRANT ROLE warner_data_transform TO user jonathanmanley;
GRANT ROLE warner_data_integrate TO user jonathanmanley;

GRANT ROLE haven_data_transform TO user garyranson;
GRANT ROLE haven_data_integrate TO user garyranson;
GRANT ROLE warner_data_transform TO user garyranson;
GRANT ROLE warner_data_integrate TO user garyranson;

GRANT ROLE _haven_data_integrate_warehouse_xsmall__warehouse__usage TO ROLE haven_data_integrate;
GRANT ROLE _haven_data_transform_warehouse_xsmall__warehouse__usage TO ROLE haven_data_transform;
GRANT ROLE _haven_data_transform_warehouse_medium__warehouse__usage TO ROLE warner_data_transform;

GRANT ROLE _warner_data_integrate_warehouse_xsmall__warehouse__usage TO ROLE warner_data_integrate;
GRANT ROLE _warner_data_transform_warehouse_xsmall__warehouse__usage TO ROLE warner_data_transform;


GRANT ROLE _haven_data_integrate__usage TO ROLE haven_data_integrate;
GRANT ROLE _haven_data_transform__usage TO ROLE haven_data_transform;
GRANT ROLE _warner_data_integrate__usage TO ROLE warner_data_integrate;
GRANT ROLE _warner_data_transform__usage TO ROLE warner_data_transform;

GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_jonathanmanley;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_jonathanmanley;
GRANT ROLE _warner_data_integrate__schema TO ROLE warner_data_integrate_jonathanmanley;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_jonathanmanley;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_jonathanmanley;
GRANT ROLE haven_data_transform TO ROLE haven_data_transform_jonathanmanley;
GRANT ROLE warner_data_integrate TO ROLE warner_data_integrate_jonathanmanley;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_jonathanmanley;

GRANT ROLE haven_data_integrate_jonathanmanley TO USER jonathanmanley;
GRANT ROLE haven_data_transform_jonathanmanley TO USER jonathanmanley;
GRANT ROLE warner_data_integrate_jonathanmanley TO USER jonathanmanley;
GRANT ROLE warner_data_transform_jonathanmanley TO USER jonathanmanley;

GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_garyranson;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_garyranson;
GRANT ROLE _warner_data_integrate__schema TO ROLE warner_data_integrate_garyranson;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_garyranson;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_garyranson;
GRANT ROLE haven_data_transform TO ROLE haven_data_transform_garyranson;
GRANT ROLE warner_data_integrate TO ROLE warner_data_integrate_garyranson;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_garyranson;

GRANT ROLE haven_data_integrate_garyranson TO USER garyranson;
GRANT ROLE haven_data_transform_garyranson TO USER garyranson;
GRANT ROLE warner_data_integrate_garyranson TO USER garyranson;
GRANT ROLE warner_data_transform_garyranson TO USER garyranson;

USE ROLE useradmin;

CREATE ROLE haven_data_integrate_johnpering;
CREATE ROLE haven_data_transform_johnpering;
CREATE ROLE warner_data_integrate_johnpering;
CREATE ROLE warner_data_transform_johnpering;

CREATE ROLE haven_data_integrate_marlongill;
CREATE ROLE haven_data_transform_marlongill;
CREATE ROLE warner_data_integrate_marlongill;
CREATE ROLE warner_data_transform_marlongill;

CREATE ROLE haven_data_integrate_judyshao;
CREATE ROLE haven_data_transform_judyshao;
CREATE ROLE warner_data_integrate_judyshao;
CREATE ROLE warner_data_transform_judyshao;

CREATE ROLE haven_data_integrate_josephmcdonald;
CREATE ROLE haven_data_transform_josephmcdonald;
CREATE ROLE warner_data_integrate_josephmcdonald;
CREATE ROLE warner_data_transform_josephmcdonald;

CREATE ROLE haven_data_integrate_paulcalo;
CREATE ROLE haven_data_transform_paulcalo;
CREATE ROLE warner_data_integrate_paulcalo;
CREATE ROLE warner_data_transform_paulcalo;

CREATE ROLE haven_data_transform_gregtaylor;
CREATE ROLE warner_data_transform_gregtaylor;

USE ROLE securityadmin;

GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_johnpering;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_johnpering;
GRANT ROLE _warner_data_integrate__schema TO ROLE warner_data_integrate_johnpering;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_johnpering;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_johnpering;
GRANT ROLE haven_data_transform TO ROLE haven_data_transform_johnpering;
GRANT ROLE warner_data_integrate TO ROLE warner_data_integrate_johnpering;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_johnpering;

GRANT ROLE haven_data_integrate_johnpering TO USER johnpering;
GRANT ROLE haven_data_transform_johnpering TO USER johnpering;
GRANT ROLE warner_data_integrate_johnpering TO USER johnpering;
GRANT ROLE warner_data_transform_johnpering TO USER johnpering;

GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_marlongill;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_marlongill;
GRANT ROLE _warner_data_integrate__schema TO ROLE warner_data_integrate_marlongill;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_marlongill;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_marlongill;
GRANT ROLE haven_data_transform TO ROLE haven_data_transform_marlongill;
GRANT ROLE warner_data_integrate TO ROLE warner_data_integrate_marlongill;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_marlongill;

GRANT ROLE haven_data_integrate_marlongill TO USER marlongill;
GRANT ROLE haven_data_transform_marlongill TO USER marlongill;
GRANT ROLE warner_data_integrate_marlongill TO USER marlongill;
GRANT ROLE warner_data_transform_marlongill TO USER marlongill;

GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_judyshao;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_judyshao;
GRANT ROLE _warner_data_integrate__schema TO ROLE warner_data_integrate_judyshao;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_judyshao;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_judyshao;
GRANT ROLE haven_data_transform TO ROLE haven_data_transform_judyshao;
GRANT ROLE warner_data_integrate TO ROLE warner_data_integrate_judyshao;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_judyshao;

GRANT ROLE haven_data_integrate_judyshao TO USER judyshao;
GRANT ROLE haven_data_transform_judyshao TO USER judyshao;
GRANT ROLE warner_data_integrate_judyshao TO USER judyshao;
GRANT ROLE warner_data_transform_judyshao TO USER judyshao;

GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_josephmcdonald;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_josephmcdonald;
GRANT ROLE _warner_data_integrate__schema TO ROLE warner_data_integrate_josephmcdonald;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_josephmcdonald;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_josephmcdonald;
GRANT ROLE haven_data_transform TO ROLE haven_data_transform_josephmcdonald;
GRANT ROLE warner_data_integrate TO ROLE warner_data_integrate_josephmcdonald;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_josephmcdonald;

GRANT ROLE haven_data_integrate_josephmcdonald TO USER josephmcdonald;
GRANT ROLE haven_data_transform_josephmcdonald TO USER josephmcdonald;
GRANT ROLE warner_data_integrate_josephmcdonald TO USER josephmcdonald;
GRANT ROLE warner_data_transform_josephmcdonald TO USER josephmcdonald;

GRANT ROLE _haven_data_integrate__schema TO ROLE haven_data_integrate_paulcalo;
GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_paulcalo;
GRANT ROLE _warner_data_integrate__schema TO ROLE warner_data_integrate_paulcalo;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_paulcalo;

GRANT ROLE haven_data_integrate TO ROLE haven_data_integrate_paulcalo;
GRANT ROLE haven_data_transform TO ROLE haven_data_transform_paulcalo;
GRANT ROLE warner_data_integrate TO ROLE warner_data_integrate_paulcalo;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_paulcalo;

GRANT ROLE haven_data_integrate_paulcalo TO USER paulcalo;
GRANT ROLE haven_data_transform_paulcalo TO USER paulcalo;
GRANT ROLE warner_data_integrate_paulcalo TO USER paulcalo;
GRANT ROLE warner_data_transform_paulcalo TO USER paulcalo;

GRANT ROLE _haven_data_transform__schema TO ROLE haven_data_transform_gregtaylor;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_gregtaylor;

GRANT ROLE haven_data_transform TO ROLE haven_data_transform_gregtaylor;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_gregtaylor;

GRANT ROLE haven_data_transform_gregtaylor TO USER gregtaylor;
GRANT ROLE warner_data_transform_gregtaylor TO USER gregtaylor;

USE ROLE securityadmin;
GRANT ROLE _haven_raw__iclean__reader TO ROLE haven_data_integrate;
GRANT ROLE _haven_base__iclean__reader TO ROLE haven_data_transform;

USE ROLE securityadmin;
GRANT ROLE _haven_raw__financial_cube__reader TO ROLE haven_data_integrate;

--REVOKE ROLE warner_data_transform_jonathanmanley FROM USER jonathanmanley;
REVOKE ROLE warner_data_transform_garyranson FROM USER garyranson;
REVOKE ROLE warner_data_transform_johnpering FROM USER johnpering;
REVOKE ROLE warner_data_transform_marlongill FROM USER marlongill;
REVOKE ROLE warner_data_transform_judyshao FROM USER judyshao;
REVOKE ROLE warner_data_transform_josephmcdonald FROM USER josephmcdonald;
REVOKE ROLE warner_data_transform_paulcalo FROM USER paulcalo;
REVOKE ROLE warner_data_transform_gregtaylor FROM USER gregtaylor;

--REVOKE ROLE warner_data_integrate_jonathanmanley FROM USER jonathanmanley;
REVOKE ROLE warner_data_integrate_garyranson FROM USER garyranson;
REVOKE ROLE warner_data_integrate_johnpering FROM USER johnpering;
REVOKE ROLE warner_data_integrate_marlongill FROM USER marlongill;
REVOKE ROLE warner_data_integrate_judyshao FROM USER judyshao;
REVOKE ROLE warner_data_integrate_josephmcdonald FROM USER josephmcdonald;
REVOKE ROLE warner_data_integrate_paulcalo FROM USER paulcalo;
REVOKE ROLE warner_data_integrate_gregtaylor FROM USER gregtaylor;

USE ROLE warner_data_transform_jonathanmanley;

SHOW WAREHOUSES;