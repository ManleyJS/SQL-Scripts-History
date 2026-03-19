use role useradmin;

create role warner_qualtrics_dataload;

create user warner_qualtrics_dataload
password = '<REDACTED>' 
login_name = 'warner.qualtrics.dataload'
display_name = 'Warner Qualtrics Integration User'
default_role = warner_qualtrics_dataload
default_warehouse = warner_qualtrics_warehouse_xsmall	
default_namespace = warner_raw.qualtrics;


