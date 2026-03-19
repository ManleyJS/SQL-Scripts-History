use role accountadmin;

show users like '%commeri%';

alter user commercialtest set disabled = false;

use role haven_finance;

show grants to role haven_finance;

use role accountadmin;

use role haven_data_transform_narayanavelaga;

use role haven_commercial;

use role accountadmin;

show users;

USE SECONDARY ROLES NONE;

use role haven_finance;

use role accountadmin;
SELECT SYSTEM$DISABLE_BEHAVIOR_CHANGE_BUNDLE('2024_08');

show grants to user dillonsim;

use role haven_data_transform;

use role useradmin;

use role sysadmin;

alter warehouse warner_dbt_transform_dev_warehouse_xlarge set warehouse_size = medium;
