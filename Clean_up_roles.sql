-- 10/04/2025
-- BOURNE_DREAM_ANALYSIS 

use role useradmin;

show roles like '%dream_anal%';

use role dba;

use database bourne_dream_analysis;

show schemas;

use schema staging_data;

show views;

show grants of role _bourne_dream_analysis__usage;

use role useradmin;

show users like 'PRABHURAMRAMAIYANRENGIA';

alter user PRABHURAMRAMAIYANRENGIA set default_role = '', default_warehouse = '';
alter user PRASATHNATARAJAN set default_role = '', default_warehouse = '';

drop role BOURNE_DREAM_ANALYSIS;
drop role BOURNE_DREAM_ANALYSIS_PRABHURAMRAMAIYANRENGIA;
drop role BOURNE_DREAM_ANALYSIS_PRASATHNATARAJAN;
drop role _BOURNE_DREAM_ANALYSIS_WAREHOUSE_XSMALL__WAREHOUSE__OPERATOR;
drop role _BOURNE_DREAM_ANALYSIS_WAREHOUSE_XSMALL__WAREHOUSE__USAGE;
drop role _BOURNE_DREAM_ANALYSIS__SCHEMA;

use role securityadmin;
drop role _BOURNE_DREAM_ANALYSIS__USAGE;

use role sysadmin;

drop warehouse bourne_dream_analysis_warehouse_xsmall;
drop database bourne_dream_analysis;

-- 10/04/2025
-- BOURNE_GROUP_FINANCE

use role useradmin;

show roles like '%BOURNE_GROUP_FINANCE%';

show grants of role BOURNE_GROUP_FINANCE;

show users like 'MARKHUMBLE';

-- needs review as perhaps Mark should be moved to HAVEN_FINANCE or SIGMA

-- 10/04/2025
-- HAVEN_AMPLITUDE_EXTRACTS

show roles like '%HAVEN_AMPLITUDE_EXTRACTS%';

show grants of role HAVEN_AMPLITUDE_EXTRACTS_CARAVAN_SALES_LEADS;

show grants to user HAVEN_AMPLITUDE_EXTRACTS_CARAVAN_SALES_LEADS;

show users like 'HAVEN_AMPLITUDE_EXTRACTS_CARAVAN_SALES_LEADS';

drop role HAVEN_AMPLITUDE_EXTRACTS_CARAVAN_SALES_LEADS;
drop role _HAVEN_AMPLITUDE_EXTRACTS_CARAVAN_SALES_LEADS__HAVEN_DEVELOPMENT__AMPLITUDE__READER;
drop role _HAVEN_AMPLITUDE_EXTRACTS_WAREHOUSE_XSMALL__WAREHOUSE__OPERATOR;
drop role _HAVEN_AMPLITUDE_EXTRACTS_WAREHOUSE_XSMALL__WAREHOUSE__USAGE;

use role sysadmin;

drop warehouse HAVEN_AMPLITUDE_EXTRACTS_WAREHOUSE_XSMALL;

-- 10/04/2025
-- HAVEN_DBT_TRANSFORM_QAT_XSMALL

use role useradmin;

show grants of role HAVEN_DBT_TRANSFORM_QAT;
show grants to role HAVEN_DBT_TRANSFORM_QAT;

show roles like '%HAVEN_DBT_TRANSFORM_QAT_XSMALL%';

show grants of role _HAVEN_DBT_TRANSFORM_QAT_XSMALL__WAREHOUSE__USAGE;
show grants of role _HAVEN_DBT_TRANSFORM_QAT_XSMALL__WAREHOUSE__OPERATOR;

drop role _HAVEN_DBT_TRANSFORM_QAT_XSMALL__WAREHOUSE__USAGE;
drop role _HAVEN_DBT_TRANSFORM_QAT_XSMALL__WAREHOUSE__OPERATOR;

use role sysadmin;

show warehouses like '%HAVEN_DBT_TRANSFORM_QAT%';

drop warehouse HAVEN_DBT_TRANSFORM_QAT_XSMALL;

-- 10/04/2025
-- HAVEN_PLOT_DEVELOPMENT

use role useradmin;

show roles like '%HAVEN_PLOT_DEVELOPMENT%';

show users like 'AVAISBASHIR';  -- disabled
show users like 'DAVINARENOUF'; -- never logged on
show users like 'LUKEWALLER'; -- never logged on
show users like 'PHILHALL'; -- never logged on
show users like 'RICHARDSAVAGE'; -- disabled
show users like 'SANDRAHARDING'; -- last logged on 2023-09-15 10:52:21.378 +0100

alter user AVAISBASHIR  set default_role = '', default_warehouse = '';
alter user DAVINARENOUF set default_role = '', default_warehouse = '';
alter user LUKEWALLER set default_role = '', default_warehouse = '';
alter user PHILHALL set default_role = '', default_warehouse = '';
alter user RICHARDSAVAGE set default_role = '', default_warehouse = '';
alter user SANDRAHARDING set default_role = '', default_warehouse = '';

drop role HAVEN_PLOT_DEVELOPMENT;
drop role HAVEN_PLOT_DEVELOPMENT_AVAISBASHIR;
drop role HAVEN_PLOT_DEVELOPMENT_DAVINARENOUF;
drop role HAVEN_PLOT_DEVELOPMENT_LUKEWALLER;
drop role HAVEN_PLOT_DEVELOPMENT_PHILHALL;
drop role HAVEN_PLOT_DEVELOPMENT_RICHARDSAVAGE;
drop role HAVEN_PLOT_DEVELOPMENT_SANDRAHARDING;
drop role HAVEN_PLOT_DEVELOPMENT_TESTUSER;
drop role _HAVEN_PLOT_DEVELOPMENT_WAREHOUSE_XSMALL__WAREHOUSE__OPERATOR;
drop role _HAVEN_PLOT_DEVELOPMENT_WAREHOUSE_XSMALL__WAREHOUSE__USAGE;
drop role _HAVEN_PLOT_DEVELOPMENT__SCHEMA;

use role securityadmin;
drop role _HAVEN_PLOT_DEVELOPMENT__USAGE;

use role sysadmin;

drop warehouse haven_plot_development_warehouse_xsmall;
drop database haven_plot_development;

use role sysadmin;

use database haven_plot_development;

show schemas;

use schema staging_data;

show views;

-- 10/04/2025
-- HAVEN_SEAWARE_INVESTIGATION

use role useradmin;

show roles like '%HAVEN_SEAWARE_INVESTIGATION%';

show users like '%DAVIDCOOK%';

alter user davidcook set default_role = '', default_warehouse = '';

drop role HAVEN_SEAWARE_INVESTIGATION;
drop role HAVEN_SEAWARE_INVESTIGATION_DAVIDCOOK;
drop role HAVEN_SEAWARE_INVESTIGATION_TESTUSER;
drop role _HAVEN_SEAWARE_INVESTIGATION_WAREHOUSE_XS__WAREHOUSE__OPERATOR;
drop role _HAVEN_SEAWARE_INVESTIGATION_WAREHOUSE_XS__WAREHOUSE__USAGE;
drop role _HAVEN_SEAWARE_INVESTIGATION__SCHEMA;

use role securityadmin;

drop role _HAVEN_SEAWARE_INVESTIGATION__USAGE;

use role sysadmin;

drop warehouse haven_seaware_investigation_warehouse_xs;
drop database haven_seaware_investigation;

-- 10/04/2025
-- HAVEN_STORE_UAT

use role sysadmin;

show warehouses like '%HAVEN_STORE_UAT%';
show grants on warehouse haven_store_uat_xsmall;

drop warehouse haven_store_uat_xsmall;

show grants on warehouse bourne_alation_xsmall;

use role useradmin;

show roles like '_HAVEN_STORE_UAT_%WARE%';
show grants on warehouse haven_store_uat_xsmall;

-- 10/04/2025
-- HAVEN_UNIT_WEEKS

use role sysadmin;

show warehouses like 'HAVEN_UNIT_WEEKS%';

show roles like '%HAVEN_UNIT_WEEKS%'; 

show grants of role HAVEN_UNIT_WEEKS;

use role useradmin;

show users like 'benmackey'; -- disabled
show users like 'markjank'; -- disabled

alter user benmackey set default_role = '', default_warehouse = '';
alter user markjank set default_role = '', default_warehouse = '';

show roles like '%HAVEN_UNIT_WEEKS%'; 

drop role HAVEN_UNIT_WEEKS;
drop role _HAVEN_UNIT_WEEKS_WAREHOUSE_XS__WAREHOUSE__OPERATOR;
drop role _HAVEN_UNIT_WEEKS_WAREHOUSE_XS__WAREHOUSE__USAGE;

use role sysadmin;

drop warehouse haven_unit_weeks_warehouse_xs; 

-- 10/04/2025
-- SOLUTION_ARCHITECT

use role sysadmin;

show warehouses like 'SOLUTION_ARCHITECT%';

-- SOLUTION_ARCHITECT_WAREHOUSE_XSMALL

use role useradmin;

show roles like '%SOLUTION_ARCHITECT%';

show grants of role SOLUTION_ARCHITECT;

show users like 'davidcook';

drop role SOLUTION_ARCHITECT;
drop role _SOLUTION_ARCHITECT_WAREHOUSE_XSMALL__WAREHOUSE__OPERATOR;
drop role _SOLUTION_ARCHITECT_WAREHOUSE_XSMALL__WAREHOUSE__USAGE;

use role sysadmin;

drop warehouse SOLUTION_ARCHITECT_WAREHOUSE_XSMALL;

-- 10/04/2025
-- VANLIFE_4CASSOCIATES

use role sysadmin;

show warehouses like '%VANLIFE_4CASSOCIATES%';

-- VANLIFE_4CASSOCIATES_WAREHOUSE_XSMALL

use role useradmin;

show roles like '%VANLIFE_4CASSOCIATES%';

drop role _VANLIFE_4CASSOCIATES_WAREHOUSE_XSMALL__OPERATOR;
drop role _VANLIFE_4CASSOCIATES_WAREHOUSE_XSMALL__USAGE;

use role sysadmin;

drop warehouse vanlife_4cassociates_warehouse_xsmall;

-- 10/04/2025
-- WARNER_GUEST_COMMERCIAL

use role sysadmin;

show warehouses like '%WARNER_GUEST_COMMERCIAL%';

-- WARNER_GUEST_COMMERCIAL_WAREHOUSE_XSMALL

use role useradmin;

show roles like '%WARNER_GUEST_COMMERCIAL%';

SHOW USERS LIKE 'JOSEPHEVANS';
SHOW USERS LIKE 'RAHEELTAHIR';

ALTER USER JOSEPHEVANS set default_role = '', default_warehouse = '';
ALTER USER RAHEELTAHIR set default_role = '', default_warehouse = '';

DROP ROLE WARNER_GUEST_COMMERCIAL;
DROP ROLE WARNER_GUEST_COMMERCIAL_JOSEPHEVANS;
DROP ROLE WARNER_GUEST_COMMERCIAL_RAHEELTAHIR;
DROP ROLE _WARNER_GUEST_COMMERCIAL_WAREHOUSE_XSMALL__WAREHOUSE__OPERATOR;
DROP ROLE _WARNER_GUEST_COMMERCIAL_WAREHOUSE_XSMALL__WAREHOUSE__USAGE;
DROP ROLE _WARNER_GUEST_COMMERCIAL__SCHEMA;

USE ROLE SECURITYADMIN;

DROP ROLE _WARNER_GUEST_COMMERCIAL__USAGE;

USE ROLE SYSADMIN;

DROP WAREHOUSE WARNER_GUEST_COMMERCIAL_WAREHOUSE_XSMALL;
DROP DATABASE WARNER_GUEST_COMMERCIAL;

-- 10/04/2025
-- WARNER_MARKETING

USE ROLE SYSADMIN;

SHOW WAREHOUSES LIKE '%WARNER_MARKETING%';

-- WARNER_MARKETING_WAREHOUSE_XSMALL

USE ROLE USERADMIN;

SHOW ROLES LIKE '%WARNER_MARKETING%';

DROP ROLE WARNER_MARKETING;
DROP ROLE WARNER_MARKETING_JOSEPHEVANS;
DROP ROLE WARNER_MARKETING_RAHEELTAHIR;
DROP ROLE _WARNER_MARKETING_WAREHOUSE_XSMALL__WAREHOUSE__OPERATOR;
DROP ROLE _WARNER_MARKETING_WAREHOUSE_XSMALL__WAREHOUSE__USAGE;
DROP ROLE _WARNER_MARKETING__SCHEMA;


USE ROLE SECURITYADMIN;

DROP ROLE _WARNER_MARKETING__USAGE;

USE ROLE SYSADMIN;

DROP WAREHOUSE WARNER_MARKETING_WAREHOUSE_XSMALL;
DROP DATABASE WARNER_MARKETING;

SHOW DATABASES;

-- 10/04/2025
-- PC_FIVETRAN_DB

use role sysadmin;

show warehouses like '%PC%DB%';
show databases like '%PC%DB%';

show roles like '%PC%DB%';

use role accountadmin;

select max(created) from pc_fivetran_db.zendesk_haven.ticket_comment;

drop database pc_fivetran_db;
drop database pc_stitch_db;

-- 10/04/2025
-- Alation

use role useradmin;

show roles like '%alation%';

show grants of role alation_integration;

show users like 'ALATION_INTEGRATION';

drop user alation_integration;

use role sysadmin;

show warehouses like '%alation%';

-- ALATION_INTEGRATION_WAREHOUSE_XS
-- BOURNE_ALATION_XSMALL

show databases like '%alation%';


use role useradmin;

show grants to role HAVEN_RAW_ALATION_CATALOGUE;
show grants to role HAVEN_STORE_ALATION_CATALOGUE;

drop role ALATION_INTEGRATION;
drop role HAVEN_RAW_ALATION_CATALOGUE;
drop role HAVEN_STORE_ALATION_CATALOGUE;

drop role _ALATION_INTEGRATION_WAREHOUSE_XS__WAREHOUSE__OPERATOR;
drop role _ALATION_INTEGRATION_WAREHOUSE_XS__WAREHOUSE__USAGE;
drop role _BOURNE_ALATION__WAREHOUSE__OPERATOR;
drop role _BOURNE_ALATION__WAREHOUSE__USAGE;

drop role _BOURNE_MASTER__ALATION_METADATA__CREATOR;
drop role _BOURNE_MASTER__ALATION_METADATA__OWNER;
drop role _BOURNE_MASTER__ALATION_METADATA__READER;
drop role _BOURNE_MASTER__ALATION_METADATA__USAGE;
drop role _BOURNE_MASTER__ALATION_METADATA__WRITER;
drop role _BOURNE_MASTER__ALATION_QUERY_LOG__CREATOR;
drop role _BOURNE_MASTER__ALATION_QUERY_LOG__OWNER;
drop role _BOURNE_MASTER__ALATION_QUERY_LOG__READER;
drop role _BOURNE_MASTER__ALATION_QUERY_LOG__USAGE;
drop role _BOURNE_MASTER__ALATION_QUERY_LOG__WRITER;

use role securityadmin;
drop role _BOURNE_MASTER__ALATION_METADATA__READER;
drop role _BOURNE_MASTER__ALATION_METADATA__WRITER;
drop role _BOURNE_MASTER__ALATION_QUERY_LOG__READER;
drop role _BOURNE_MASTER__ALATION_QUERY_LOG__WRITER;

use role sysadmin;

drop schema bourne_master.alation_metadata;
drop schema bourne_master.alation_query_log;
drop schema bourne_master.query_log;

drop warehouse alation_integration_warehouse_xs;
drop warehouse bourne_alation_xsmall;

-- 10/04/2025
-- HAVEN_FIVETRAN_DATALOAD_XSMALL

use role useradmin;

show roles like '%fivetran_dataload%';
show grants of role haven_fivetran_dataload;

show grants to user HAVEN_FIVETRAN_DATALOAD;

show users like 'HAVEN_FIVETRAN_DATALOAD';

show grants to role haven_fivetran_dataload;

show grants of role HAVEN_FIVETRAN_DATALOAD;

use role haven_fivetran_dataload;

use role useradmin;

drop user HAVEN_FIVETRAN_DATALOAD;
drop role HAVEN_FIVETRAN_DATALOAD;
drop role _HAVEN_FIVETRAN_DATALOAD_XSMALL__WAREHOUSE__OPERATOR;
drop role _HAVEN_FIVETRAN_DATALOAD_XSMALL__WAREHOUSE__USAGE;

use role sysadmin;

drop warehouse HAVEN_FIVETRAN_DATALOAD_XSMALL;

-- 10/04/2025
-- HAVEN_STITCH_DATALOAD_XSMALL

use role useradmin;

show roles like '%HAVEN_STITCH_DATALOAD%';

show grants to role HAVEN_STITCH_DATALOAD;

use role HAVEN_STITCH_DATALOAD;

select max(_sdc_batched_at) from haven_raw.digital_arrivals.arrival;

drop file format HAVEN_RAW.BRAINTREE.STITCH_LOADING_FILE_FORMAT_V1;
drop file format HAVEN_RAW.DIGITAL_ARRIVALS.STITCH_LOADING_FILE_FORMAT_V1;
drop file format HAVEN_RAW.GOOGLE_ANALYTICS.STITCH_LOADING_FILE_FORMAT_V1;

drop stage HAVEN_RAW.BRAINTREE.STITCH_LOADING;
drop stage HAVEN_RAW.DIGITAL_ARRIVALS.STITCH_LOADING;
drop stage HAVEN_RAW.GOOGLE_ANALYTICS.STITCH_LOADING;

use role useradmin;

drop user haven_stitch_dataload;
drop role HAVEN_STITCH_DATALOAD;
drop role _HAVEN_STITCH_DATALOAD__WAREHOUSE__OPERATOR;
drop role _HAVEN_STITCH_DATALOAD__WAREHOUSE__USAGE;

use role sysadmin;

drop schema haven_raw.digital_arrivals;
drop warehouse haven_stitch_dataload_xsmall;

-- 10/05/2025
-- HAVEN_EXABEAM_MONITOR_MEDIUM

use role useradmin;

show roles like '%HAVEN_EXABEAM_%';

show grants to role HAVEN_EXABEAM_MONITOR_SERVICE;
show grants to user HAVEN_EXABEAM_MONITOR_SERVICE;

show roles like '_HAVEN_MASTER__EXABEAM_MONITO%';

show grants to role _HAVEN_MASTER__EXABEAM_MONITOR__READER;

drop user HAVEN_EXABEAM_MONITOR_SERVICE;
drop role HAVEN_EXABEAM_MONITOR_SERVICE;
drop role _HAVEN_EXABEAM_MONITOR_MEDIUM__WAREHOUSE__OPERATOR;
drop role _HAVEN_EXABEAM_MONITOR_MEDIUM__WAREHOUSE__USAGE;
drop role _HAVEN_EXABEAM_MONITOR_XSMALL__WAREHOUSE__OPERATOR;
drop role _HAVEN_EXABEAM_MONITOR_XSMALL__WAREHOUSE__USAGE;

drop role _HAVEN_MASTER__EXABEAM_MONITOR__CREATOR;
drop role _HAVEN_MASTER__EXABEAM_MONITOR__OWNER;
drop role _HAVEN_MASTER__EXABEAM_MONITOR__USAGE;

use role securityadmin;

drop role _HAVEN_MASTER__EXABEAM_MONITOR__READER;
drop role _HAVEN_MASTER__EXABEAM_MONITOR__WRITER;

use role sysadmin;

drop warehouse HAVEN_EXABEAM_MONITOR_MEDIUM;
drop warehouse HAVEN_EXABEAM_MONITOR_XSMALL;

drop schema haven_master.exabeam_monitor;

-- schema roles to clear up

use role useradmin;
show roles like '_bourne_master__query_log%';
show roles like '_haven_raw__digital_arrivals%';


drop role _BOURNE_MASTER__QUERY_LOG__CREATOR;
drop role _BOURNE_MASTER__QUERY_LOG__OWNER;
drop role _BOURNE_MASTER__QUERY_LOG__USAGE;

drop role _HAVEN_RAW__DIGITAL_ARRIVALS__CREATOR;
drop role _HAVEN_RAW__DIGITAL_ARRIVALS__OWNER;
drop role _HAVEN_RAW__DIGITAL_ARRIVALS__USAGE;

use role securityadmin;

drop role _HAVEN_RAW__DIGITAL_ARRIVALS__READER;
drop role _HAVEN_RAW__DIGITAL_ARRIVALS__WRITER;
drop role _BOURNE_MASTER__QUERY_LOG__READER;
drop role _BOURNE_MASTER__QUERY_LOG__WRITER;

-- 11/04/2025
-- BOURNE_GROUP_FINANCE

use role sysadmin;

show warehouses like '%BOURNE_GROUP_FINANCE%';

-- BOURNE_GROUP_FINANCE_WAREHOUSE_XSMALL

use role useradmin;

show roles like '%BOURNE_GROUP_FINANCE%';

show grants of role BOURNE_GROUP_FINANCE;
show grants to role BOURNE_GROUP_FINANCE;

drop user BOURNE_GROUP_FINANCE_TEST;

alter user MARKHUMBLE set default_role = '', default_warehouse = '';

show users like 'MARKHUMBLE';

drop role BOURNE_GROUP_FINANCE;
drop role _BOURNE_GROUP_FINANCE_WAREHOUSE_XSMALL__WAREHOUSE__OPERATOR;
drop role _BOURNE_GROUP_FINANCE_WAREHOUSE_XSMALL__WAREHOUSE__USAGE;

use role sysadmin;

drop warehouse bourne_group_finance_warehouse_xsmall;
-- needs review as perhaps Mark should be moved to HAVEN_FINANCE or SIGMA

-- 11/04/2025
-- HAVEN_FIVETRAN_LOGS_WAREHOUSE_XSMALL

use role useradmin;

show roles like '%HAVEN_FIVETRAN%';

show grants of role HAVEN_FIVETRAN_LOGS;

drop user HAVEN_FIVETRAN_LOGS_SERVICE_ACCOUNT;
drop role HAVEN_FIVETRAN_LOGS;
drop role _HAVEN_FIVETRAN_LOGS_WAREHOUSE_XSMALL__WAREHOUSE__OPERATOR;
drop role _HAVEN_FIVETRAN_LOGS_WAREHOUSE_XSMALL__WAREHOUSE__USAGE;

use role sysadmin;

drop warehouse HAVEN_FIVETRAN_LOGS_WAREHOUSE_XSMALL;

-- 11/04/2025
-- HAVEN_ZONAL_DISCOVERY_WAREHOUSE_XS

USE ROLE USERADMIN;

SHOW ROLES LIKE 'HAVEN_ZONAL_DISCO%';

SHOW GRANTS OF ROLE HAVEN_ZONAL_DISCOVERY;

use role useradmin;
DROP role HAVEN_ZONAL_DISCOVERY_TESTUSER;

show users like 'GREGPUGH';
show users like 'MAXYMAXWELL';
show users like 'MUHAMMADTALHA';
show users like 'THOMLOVERIDGE';