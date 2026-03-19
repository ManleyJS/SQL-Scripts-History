use role orgadmin;

show accounts;
SHOW MANAGED ACCOUNTS;

USE ROLE ACCOUNTADMIN;

SHOW SHARES;
SHOW MANAGED ACCOUNTS;

USE ROLE ACCOUNTADMIN;

create or replace database align_alytics_share from share TRVDULB.ALIGNALYTICS.ALIGN_ALYTICS_HAVEN_SHARE;

use role securityadmin;

grant imported privileges on database align_alytics_share to role dba;
grant imported privileges on database align_alytics_share to role haven_revenue_management_pricer;


show grants to role haven_revenue_management_pricer_uat;

use role haven_revenue_management_pricer;

select * from align_alytics.haven_dev_dbt_dms_staging.d09_export limit 20;

select * from align_alytics_share.haven_dev_dbt_dms_staging.d09_export limit 20;