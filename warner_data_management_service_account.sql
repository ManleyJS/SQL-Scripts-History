use role useradmin;

show grants to user shaunkelly;

show grants to role WARNER_DATA_TRANSFORM_SHAUNKELLY;

show grants to role warner_data_management;

use role warner_data_management;

use role dba;

use role securityadmin;

grant role _warner_store__common__reader to role warner_data_management;

USE ROLE useradmin;

create user warner_data_management_service_account
login_name = 'warner.data.management.service.account'
password = '<REDACTED>'
display_name = 'Warner Data Management Service Account'
comment = 'Warner Data Management Service Account'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

USE ROLE securityadmin;

ALTER USER warner_data_management_service_account
SET rsa_public_key =
'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5Teip0TTBYU+Unv1FBzc
IsB0DcK0sD1PJ1hWvwsERBdlypa6MdyMwzW8eG3C8dWY9dFauSAu95bljyuQgBdS
lqu2ncO0jmUouw6u8V7UkhTb/9YRjKAgVgXUl385esYqvh/VuyOWqymEHgsH9b8X
Aloi1oNhd8MaRjZkw4no1sj2DDR+i3PqSSQ8cqhX5V6ETSsR6v20/SR1KaLYXI67
/gzD9j6BniBk0PTqrX3FB42tPxyxakmSqWnryhVnnvekh8/4L72zf8km6ek0OyOs
cguAKkrmqdZ0Ovk38M2MdBLvEx2XR/IF8sAESXXArH978Kjh6yWUGoGtY03YudCF
awIDAQAB';

GRANT ROLE warner_data_management TO USER  warner_data_management_service_account;

SHOW GRANTS TO user warner_data_management_service_account;

SHOW USERS;