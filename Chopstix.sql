use role accountadmin;

CREATE or replace STORAGE INTEGRATION haven_chopstix_azure_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'AZURE'
  ENABLED = TRUE
  AZURE_TENANT_ID = 'a8e869b0-3f54-43fe-afd5-f54defa5566f'
  STORAGE_ALLOWED_LOCATIONS = ('azure://cpxstorage.blob.core.windows.net/havendatacpx/');

DESC STORAGE INTEGRATION  haven_chopstix_azure_integration;

  -- https://cpxstorage.blob.core.windows.net/havendatacpx
use role securityadmin;
grant usage on integration haven_chopstix_azure_integration to role dba;
grant usage on integration haven_chopstix_azure_integration to role haven_data_transform;

use role dba;

use schema training.training;

CREATE STAGE my_azure_stage
  STORAGE_INTEGRATION = haven_chopstix_azure_integration
  URL = 'azure://cpxstorage.blob.core.windows.net/havendatacpx/';

ls @my_azure_stage;

copy into @my_azure_stage/deleteme 
from (select 1);

rm @my_azure_stage/deleteme;



  