use role useradmin;

CREATE ROLE bourne_coupa_dataload;

create user bourne_coupa_dataload
password = 'BourneCoupa@2022' 
login_name = 'bourne.coupa.dataload'
display_name = 'Bourne Coupa  Data Load'
default_role = bourne_coupa_dataload
default_warehouse = bourne_batch_dataload_xsmall
default_namespace = bourne_raw.coupa;

GRANT ROLE _bourne_raw__coupa__creator TO ROLE bourne_coupa_dataload;
GRANT ROLE _bourne_raw__create TO ROLE bourne_coupa_dataload;
GRANT ROLE bourne_coupa_dataload TO USER bourne_coupa_dataload;