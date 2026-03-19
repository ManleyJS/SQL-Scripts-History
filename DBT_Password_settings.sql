use role securityadmin;

use role useradmin;

show users like '%haven%dbt%';

alter user HAVEN_DBT_TRANSFORM_UAT unset password;

alter user HAVEN_DBT_PIPELINE unset password;
alter user HAVEN_DBT_TRANSFORM unset password;
alter user HAVEN_DBT_TRANSFORM_DEV unset password;
alter user HAVEN_DBT_TRANSFORM_PRICER_UAT unset password;
alter user HAVEN_DBT_TRANSFORM_QAT unset password;
alter user HAVEN_DBT_TRANSFORM_UAT unset password;
