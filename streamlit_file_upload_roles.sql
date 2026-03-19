use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;
call haven_master.procedures.schema_role_creation('haven_store', 'performance_marketing_file_uploads');
call haven_master.procedures.schema_role_creation('haven_store_dev', 'performance_marketing_file_uploads');


use role useradmin;

create role streamlit_file_upload_application_dev;
create role streamlit_file_upload_application;

use role securityadmin;

grant role _bourne_batch_dataload__warehouse__usage to role streamlit_file_upload_application_dev;
grant role _bourne_batch_dataload__warehouse__usage to role streamlit_file_upload_application;

grant create streamlit on schema haven_master_dev.streamlits to role streamlit_file_upload_application_dev;
grant create streamlit on schema haven_master.streamlits to role streamlit_file_upload_application;

grant role _haven_master_dev__streamlits__usage to role streamlit_file_upload_application_dev;
grant role _haven_master__streamlits__usage to role streamlit_file_upload_application;

grant role _haven_store_dev__performance_marketing_file_uploads__creator to role streamlit_file_upload_application_dev;
grant role _haven_store__performance_marketing_file_uploads__creator to role streamlit_file_upload_application;

use role dba;
show warehouses like 'bourne_batch_%';

show roles like 'haven_data_transform%';
GRANT ROLE streamlit_file_upload_application_dev TO USER HAVEN_DBT_TRANSFORM_DEV;
GRANT ROLE streamlit_file_upload_application TO USER HAVEN_DBT_TRANSFORM;
GRANT ROLE streamlit_file_upload_application_dev TO USER sarunasjatautis;
GRANT ROLE streamlit_file_upload_application TO USER sarunasjatautis;

GRANT ROLE streamlit_file_upload_application_dev TO role dba;
GRANT ROLE streamlit_file_upload_application TO role dba ;




