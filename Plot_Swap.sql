use role sysadmin;

use database haven_raw;

alter schema haven_raw.plot swap with haven_raw.plot_swap;

select * from haven_base.plot.account_cars limit 10;

use role securityadmin;

grant role _WARNER_BASE__SEAWARE_APS__READER to role WARNER_TESTING_TEAM;

use role haven_cdc_dataload;

select * from haven_raw.plot.card_audit_detail 
order by created_dt desc
limit 10;


select * from haven_raw.plot.sales_quote_van_attributes
order by created_dt desc
limit 10;

use role dba;

use role securityadmin;
grant ownership on all views in schema warner_cust.ma_mart to role warner_terraform_transform_dev;
