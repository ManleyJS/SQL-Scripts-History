use role orgadmin;
show organization accounts;

--DROP managed ACCOUNT ocandcstrategy;

create account fourcacaravanlifecycle
  admin_name = ManleyJ  
  admin_password = 'Private19102022'
  first_name = jonathan
  last_name = manley
  email = 'jonathan.manley@bourne-leisure.co.uk'
  edition = standard;

 --Private15112021
show organization accounts;
  
use role accountadmin;

create share ocandc_son_of_monty_share;

show GRANTS TO SHARE ocandc_son_of_monty_share;

use role securityadmin;

GRANT USAGE ON DATABASE haven_commercial TO SHARE ocandc_son_of_monty_share;
GRANT REFERENCE_USAGE ON DATABASE haven_store TO SHARE ocandc_son_of_monty_share;
GRANT REFERENCE_USAGE ON DATABASE haven_base TO SHARE ocandc_son_of_monty_share;

REVOKE USAGE ON DATABASE haven_store from SHARE ocandc_son_of_monty_share;
revoke REFERENCE_USAGE ON DATABASE haven_base from SHARE ocandc_son_of_monty_share;
revoke REFERENCE_USAGE ON DATABASE haven_raw from SHARE ocandc_son_of_monty_share;


GRANT REFERENCE_USAGE ON DATABASE haven_commercial TO SHARE ocandc_son_of_monty_share;
GRANT USAGE ON DATABASE haven_commercial TO SHARE ocandc_son_of_monty_share;

revoke REFERENCE_USAGE ON DATABASE haven_commercial from SHARE ocandc_son_of_monty_share;
GRANT USAGE ON DATABASE haven_commercial TO SHARE ocandc_son_of_monty_share;


GRANT USAGE ON DATABASE haven_store TO SHARE ocandc_son_of_monty_share;
GRANT REFERENCE_USAGE ON DATABASE haven_base TO SHARE ocandc_son_of_monty_share;

GRANT USAGE ON SCHEMA haven_store.pitch_perfect TO SHARE ocandc_son_of_monty_share;
revoke USAGE ON SCHEMA haven_store.pitch_perfect from SHARE ocandc_son_of_monty_share;

GRANT SELECT ON TABLE haven_store.pitch_perfect.occ_budget TO SHARE ocandc_son_of_monty_share;
GRANT SELECT ON view haven_store.pitch_perfect.buy_ins TO SHARE ocandc_son_of_monty_share;

USE ROLE dba;
--revoke SELECT ON TABLE haven_store.pitch_perfect.occ_budget from SHARE ocandc_son_of_monty_share;
revoke SELECT ON view HAVEN_STORE.PITCH_PERFECT.PP_BUY_INS from SHARE ocandc_son_of_monty_share;


show grants to share ocandc_son_of_monty_share;

use role accountadmin;
alter share ocandc_son_of_monty_share set accounts='os67296';

show shares;

use role dba;
drop table haven_store.pitch_perfect.occ_budget;
create table haven_store.pitch_perfect.occ_budget as select * from haven_store.ocandc_sales_pricing.occ_budget;