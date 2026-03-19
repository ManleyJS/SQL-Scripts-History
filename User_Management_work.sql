use role securityadmin;

alter user haven_qualtrics_dataload set mins_to_unlock=0;

use role accountadmin;
show users like 'clare%';
show grants to user clarestinton;

use role useradmin;
alter user clarestinton set default_namespace = 'haven_store.availability';

show grants to user marlongill;

use role useradmin;
create role data_engineering_judyshao;
create user judyshao
login_name = 'judy.shao@bourne-leisure.co.uk'
display_name = 'Judy Shao'
email = 'judy.shao@bourne-leisure.co.uk'
comment = 'Bourne engineering team'
default_role = data_engineering_hudyshao;

use role securityadmin;
grant role data_engineering to role data_engineering_judyshao;
grant role _bourne_work__engineering__creator to role data_engineering_judyshao;
grant role data_engineering_judyshao to user judyshao;

use role dba;

show tasks;

use role sysadmin;
create or replace schema haven_raw.seaware_clone_03102022 clone haven_raw.seaware;


