use role accountadmin;

show procedures like 'update%';

drop procedure haven_master.public.update_default_secondary_roles();

CREATE OR REPLACE PROCEDURE haven_master.procedures.update_default_secondary_roles()
RETURNS VARIANT NOT NULL
LANGUAGE JAVASCRIPT
EXECUTE AS CALLER
AS
$$
let updated_users = [];
let users = snowflake.execute({sqlText: "SHOW USERS"});
while (users.next()) {
  let username = users.getColumnValue("name");
  let dsr = users.getColumnValue("default_secondary_roles");
  
  if (dsr !== "") {
    continue;
  }
  if (username !== "SNOWFLAKE") {
    snowflake.execute({
      sqlText: "alter user identifier(?) set default_secondary_roles=()",
      binds: ["\"" + username + "\""],
    });
    updated_users.push(username);
  }
}
return updated_users;
$$;

show users;

CALL haven_master.procedures.update_default_secondary_roles();

show users;

use role dba;

select default_secondary_role from snowflake.account_usage.users
where deleted_on is null
group by all;

select * from snowflake.account_usage.users
where default_secondary_role = '["ALL"]';

use role dba;
select * from snowflake.account_usage.users
where default_secondary_role = '[ALL]'
and deleted_on is null;

use role useradmin;

alter user PETERNEMETH set default_secondary_roles=();
alter user DOVYDASSTEPONAVICIUS set default_secondary_roles=();
alter user GARYRANSOn set default_secondary_roles=();
alter user HAVENPROCUREMENT set default_secondary_roles=();

use role useradmin;
alter user BALINTNEMETH set default_secondary_roles=();
alter user PETERZENTAI set default_secondary_roles=();

-- List of users previously set to ALL
EMMANUELADEDEJI
HAVEN_PARK_DATABASE_DEV_SERVICE_ACCOUNT
SAMUELCLARKE
COURTNEYBARRON
SAIMANASIR
KEVINRICHARDS2
ROLANDNAGY
RJUDDIN
HAVEN_HOLIDAYS_SUPPORT_SIGMA_SERVICE_ACCOUNT
RICHARDJOLLY
LEWISCHAI
RACHELGREGORY
PETERSZECSI
JAYGOULD
FRASERTARBET
HAVEN_DBT_TRANSFORM_DATA_SCIENCE_DEV
GIEDRIUSVALANCIUS
MICHAELSOFFE
MELUMPANDE
HABIBKAGHAS
HANNAHCHAPMAN
MAYURVAGHASIA
HAVEN_BLOOMREACH_INTEGRATION_DEV_SERVICE_ACCOUNT
MATTHEWLAMBERT
MATTHEWEVANS
HAVEN_DATA_SCIENCE_PIPELINE
HAVEN_PARK_DATABASE_SERVICE_ACCOUNT
HAVEN_TRANSACTIONS_MANAGEMENT_SIGMA_SERVICE_ACCOUNT
HUANYU
HAVEN_STREAMLIT_DEV_SERVICE_ACCOUNT
HAVEN_STREAMLIT_APPLICATION_DEPLOYMENT_ACCOUNT_DEV
IANCOLEMAN
VICTOREMOVON
ASHWINISHARMA
AHSANMIAH
HAVEN_STREAMLIT_APPLICATION_DEPLOYMENT_ACCOUNT
AA_ANALYTICS_DEV_ENVIRONMENT_SERVICE_ACCOUNT
HAVEN_PROCUREMENT_SIGMA_SERVICE_ACCOUNT
SNOWFLAKE
ABBIEJOHNSON
CAITLINSMITH
SIMONCOLE

