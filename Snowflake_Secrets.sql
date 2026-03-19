USE ROLE ACCOUNTADMIN;

with
integration_secrets as (
  select parse_json(system$show_oauth_client_secrets('DBT_CLOUD_SSO_INTEGRATION')) as secrets
)
select
  secrets:"OAUTH_CLIENT_ID"::string     as client_id,
  secrets:"OAUTH_CLIENT_SECRET"::string as client_secret
from
  integration_secrets;

  SHOW SECURITY INTEGRATIONS;

use role securityadmin;

