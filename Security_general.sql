use role sysadmin;

show roles like '%DBA%';

use role securityadmin;
grant role _BOURNE__DBA_WH__WAREHOUSE__USAGE to role ;

use role useradmin;
show users;

use role securityadmin;
show users;

revoke usage on warehouse dba_wh from role useradmin;
revoke usage on  warehouse dba_wh from role securityadmin;

use role accountadmin;

grant imported privileges on database snowflake to role dba;

use role dba;

select * from snowflake.account_usage.roles limit 10;
select * from snowflake.account_usage.grants_to_roles limit 10;
select * from snowflake.account_usage.grants_to_users where grantee_name = 'CHARANSINGH' limit 10;
select * from snowflake.information_schema.usage_privileges limit 10;

show grants to user CHARANSINGH;
show users;


use role securityadmin;

show roles like '%zendesk%';

grant role _bourne_raw__zendesk__creator to role bourne_batch_dataload;

use role securityadmin;
grant role _butlins_raw__dream__creator to role butlins_cdc_dataload;
grant role _butlins_raw__zonal__creator to role butlins_cdc_dataload;
grant role _haven_raw__dream__creator to role haven_cdc_dataload;
grant role _haven_raw__zonal__creator to role haven_cdc_dataload;
grant role _warner_raw__dream__creator to role warner_cdc_dataload;
grant role _warner_raw__zonal__creator to role warner_cdc_dataload;
grant role _haven_raw__dream_rbp__creator to role haven_cdc_dataload;
grant role _bourne_raw__dream__creator to role bourne_cdc_dataload;
grant role _bourne_raw__dream_efl__creator to role bourne_cdc_dataload;

revoke role _bourne_raw__dream_efl__creator from role bourne_cdc_dataload;
revoke role _haven_raw__dream_rbp__creator from role haven_cdc_dataload;

grant role _bourne_raw__dream_evergreen__creator to role bourne_cdc_dataload;
grant role _haven_raw__dream_rockleyboatpark__creator to role haven_cdc_dataload;


use role useradmin;
create role bourne_cdc_dataload_schema_viewer;

use role securityadmin;
grant role _butlins_raw__seaware__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_raw__seaware__reader to role bourne_cdc_dataload_schema_viewer;
grant role _warner_raw__seaware__reader to role bourne_cdc_dataload_schema_viewer;
grant role _butlins_raw__plot__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_raw__plot__reader to role bourne_cdc_dataload_schema_viewer;
grant role _bourne_raw__dream__reader to role bourne_cdc_dataload_schema_viewer;
grant role _bourne_raw__dream_efl__reader to role bourne_cdc_dataload_schema_viewer;
grant role _butlins_raw__dream__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_raw__dream__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_raw__dream_rbp__reader to role bourne_cdc_dataload_schema_viewer;
grant role _warner_raw__dream__reader to role bourne_cdc_dataload_schema_viewer;
grant role _butlins_raw__zonal__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_raw__zonal__reader to role bourne_cdc_dataload_schema_viewer;
grant role _warner_raw__zonal__reader to role bourne_cdc_dataload_schema_viewer;
grant role _bourne_raw__ma_mart__reader to role bourne_cdc_dataload_schema_viewer;
grant role _bourne_store__sas_common__reader to role bourne_cdc_dataload_schema_viewer;
grant role _bourne_store__sas_scv__reader to role bourne_cdc_dataload_schema_viewer;
grant role _butlins_store__sas_pims__reader to role bourne_cdc_dataload_schema_viewer;
grant role _butlins_store__sas_scv__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_store__sas_scv__reader to role bourne_cdc_dataload_schema_viewer;
grant role _warner_store__sas_scv__reader to role bourne_cdc_dataload_schema_viewer;

revoke role _bourne_raw__dream_efl__reader from role bourne_cdc_dataload_schema_viewer;
revoke role _haven_raw__dream_rbp__reader from role bourne_cdc_dataload_schema_viewer;

revoke role _bourne_raw__dream_evergreen__creator from role bourne_cdc_dataload_schema_viewer;
revoke role _haven_raw__dream_rockleyboatpark__creator from role bourne_cdc_dataload_schema_viewer;

grant role _bourne_raw__dream_evergreen__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_raw__dream_rockleyboatpark__reader to role bourne_cdc_dataload_schema_viewer;


grant role bourne_cdc_dataload_schema_viewer to user johnpering;
grant role bourne_cdc_dataload_schema_viewer to role dba;

use role securityadmin;

show roles like '%pricing%';

show grants of role haven_commercial;

revoke role _HAVEN_STORE__OCANDC_SALES_PRICING__READER from role DATA_ENGINEERING;

use role useradmin;
drop role _HAVEN_STORE__OCANDC_SALES_PRICING__OWNER;
drop role _HAVEN_STORE__OCANDC_SALES_PRICING__CREATOR;

use role securityadmin;
drop role _HAVEN_STORE__OCANDC_SALES_PRICING__WRITER;
drop role _HAVEN_STORE__OCANDC_SALES_PRICING__READER;
drop role _HAVEN_STORE__OCANDC_SALES_PRICING__USAGE;


show grants on table haven_store.trooper.spg_trawler;

show grants to role haven_pipeline;

grant role _haven_store__playpass__creator to role haven_batch_dataload;

use role securityadmin;

show grants on schema haven_work.ocandc_sales_pricing;

revoke usage on schema haven_work.ocandc_sales_pricing from role haven_pipeline;
use role sysadmin;
drop schema haven_work.ocandc_sales_pricing;

show roles like '%dream_efl%';

show grants on schema bourne_raw.dream_efl;

show grants on role _BOURNE_RAW__DREAM_EFL__READER;

use role dba;
select * from snowflake.account_usage.grants_to_roles where grantee_name = '_BOURNE_RAW__DREAM_EFL__READER';

use role bourne_cdc_dataload_schema_viewer;


use role securityadmin;
grant role _haven_raw__braintree__creator to role haven_stitch_dataload;
--grant role _haven_raw__braintree__owner to role dba;

use role _haven_raw__dream_rockleyboatpark__reader;

show grants to role _butlins_raw__dream__reader;

show roles like '%warehouse%';

grant role _BOURNE_DATA_ENGINEERING__WAREHOUSE__USAGE to role bourne_cdc_dataload_schema_viewer;

use role securityadmin;
grant role _bourne_raw__AztecActivityManagement__creator to role bourne_cdc_dataload;
grant role _bourne_raw__ZBSData__creator to role bourne_cdc_dataload;
grant role _bourne_raw__Aztec__creator to role bourne_cdc_dataload;
grant role _bourne_raw__KmsReporting__creator to role bourne_cdc_dataload;

grant role _bourne_raw__AztecActivityManagement__reader to role bourne_cdc_dataload_schema_viewer;
grant role _bourne_raw__ZBSData__reader to role bourne_cdc_dataload_schema_viewer;
grant role _bourne_raw__Aztec__reader to role bourne_cdc_dataload_schema_viewer;
grant role _bourne_raw__KmsReporting__reader to role bourne_cdc_dataload_schema_viewer;

use role dba;

show grants on table haven_store.sas_scv.booking_hist;

use role securityadmin;

show grants to role pc_stitch_role;

use role sysadmin;
drop table pc_stitch_db.zendesk_test_haven._sdc_rejected;

use role securityadmin;
revoke role pc_stitch_role from user pc_stitch_user;
use role useradmin;
drop user pc_stitch_user;
use role accountadmin;
drop user pc_stitch_user;

show grants on schema pc_stitch_db.zendesk_test_haven;
use schema pc_stitch_db.zendesk_test_haven;
revoke all on schema pc_stitch_db.zendesk_test_haven from role public;

show grants on schema haven_store.activities;

grant ownership on schema pc_stitch_db.zendesk_test_haven to role DBA;

drop role pc_stitch_role;

use role sysadmin;
drop schema "PC_FIVETRAN_DB"."FIVEINCRMTDB__INCREMENTALWORK";
drop schema "PC_FIVETRAN_DB"."FIVETRAN_PERIPHERAL_APRIL_STAGING";
drop schema "PC_FIVETRAN_DB"."POSTGRES_INCRMT_INCREMENTALWORK";
drop schema "PC_FIVETRAN_DB"."POSTGRES_RDS_NONPK_NONPKLOGWORK";
drop schema "PC_FIVETRAN_DB"."POSTGRES_RDS_PK_PKLOGWORK";
drop schema "PC_FIVETRAN_DB"."SQLSERVERPK_PKLOGFILE";

show grants to role pc_fivetran_role;
show grants on database pc_fivetran_db;
show grants on schema pc_fivetran_db.zendesk_haven;

use role securityadmin;
grant ownership on schema pc_fivetran_db.zendesk_haven to role dba;
revoke usage on schema pc_fivetran_db.zendesk_haven from role dba;
revoke usage on database pc_fivetran_db from role dba;
revoke all on schema pc_fivetran_db.zendesk_haven from role dba;

use role accountadmin;
revoke role pc_fivetran_role from user pc_fivetran_user;
revoke all on schema pc_fivetran_db.zendesk_haven from role pc_fivetran_role;
revoke all on database pc_fivetran_db from role pc_fivetran_role;
drop role pc_fivetran_role;

use role securityadmin;
show grants to user andrewwestlake;
revoke role warner_data_engineering_andrewwestlake from user andrewwestlake;
revoke role warner_data_engineering from role warner_data_engineering_andrewwestlake;
show grants to role warner_data_engineering_andrewwestlake;
revoke role _warner_work__common__creator from role warner_data_engineering_andrewwestlake;
grant ownership on table "WARNER_WORK"."COMMON"."DAILYRESERVATION_STAGINGTABLE" to role dba revoke current grants;
grant ownership on function WARNER_WORK.COMMON.SIMPLE_TABLE_FUNCTION() to role dba revoke current grants;
show grants on table "WARNER_WORK"."COMMON"."DAILYRESERVATION_STAGINGTABLE" ;

use role dba;
drop table "WARNER_WORK"."COMMON"."DAILYRESERVATION_STAGINGTABLE" ;
use schema warner_work.common;
show functions like 'simple%';
drop function simple_table_function();

use role securityadmin;
drop role warner_data_engineering_andrewwestlake;

use role useradmin;

create role bourne_securityadmin;
create role bourne_useradmin;
create role bourne_sysadmin;

use role securityadmin;
grant role securityadmin to role bourne_securityadmin ;
grant role useradmin to role bourne_useradmin;
grant role sysadmin to role bourne_sysadmin; 


use role securityadmin;
grant role _bourne_raw__Aztec__reader to role bourne_cdc_dataload_schema_viewer;
grant role _bourne_raw__AztecActivityManagement__reader to role bourne_cdc_dataload_schema_viewer;
grant role _bourne_store__ZBSData__reader to role bourne_cdc_dataload_schema_viewer;
grant role _bourne_store__KMSReporting__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_raw__Aztec_retail__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_store__ZBSData_Retail__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_raw__Aztec_Complex__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_raw__AztecActivityManagement_Complex__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_store__ZBSData_Complex__reader to role bourne_cdc_dataload_schema_viewer;
grant role _haven_store__KMSReporting_Complex__reader to role bourne_cdc_dataload_schema_viewer;

grant role _bourne_raw__Aztec__creator to role bourne_cdc_dataload;
grant role _bourne_raw__AztecActivityManagement__creator to role bourne_cdc_dataload;
grant role _bourne_store__ZBSData__creator to role bourne_cdc_dataload;
grant role _bourne_store__KMSReporting__creator to role bourne_cdc_dataload;

revoke role _haven_raw__Aztec_retail__creator from role bourne_cdc_dataload;
revoke role _haven_store__ZBSData_Retail__creator from role bourne_cdc_dataload;
revoke role _haven_raw__Aztec_Complex__creator from role bourne_cdc_dataload;
revoke role _haven_raw__AztecActivityManagement_Complex__creator from role bourne_cdc_dataload;
revoke role _haven_store__ZBSData_Complex__creator from role bourne_cdc_dataload;
revoke role _haven_store__KMSReporting_Complex__creator from role bourne_cdc_dataload;


grant role _haven_raw__Aztec_retail__creator to role haven_cdc_dataload;
grant role _haven_store__ZBSData_Retail__creator to role haven_cdc_dataload;
grant role _haven_raw__Aztec_Complex__creator to role haven_cdc_dataload;
grant role _haven_raw__AztecActivityManagement_Complex__creator to role haven_cdc_dataload;
grant role _haven_store__ZBSData_Complex__creator to role haven_cdc_dataload;
grant role _haven_store__KMSReporting_Complex__creator to role haven_cdc_dataload;


use role dba;

select a.siteid, b.name, count(*) from bourne_raw.aztecactivitymanagement.activitylocation a
left outer join bourne_raw.aztecactivitymanagement.site b
on a.siteid = b.id
group by 1, 2 order by 1;



use schema bourne_raw.aztec;

select * from information_schema.tables where table_schema = 'AZTEC' and table_name like '%SITE%';

select * from information_schema.COLUMNS where table_schema = 'AZTEC' and COLUMN_name like '%AREA%';

select * from ac_area;
select * from ac_site;
select * from ac_company;


use role sysadmin;

drop schema haven_base.aztecactivitymanagement;
drop schema haven_base.aztec;
drop schema butlins_store.kmsreporting_complex;