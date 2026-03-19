use role accountadmin;
show managed accounts;
use role orgadmin;
show organization accounts;  
  
create account externaltraining
  admin_name = ManleyJ  
  admin_password = '<REDACTED>'
  first_name = jonathan
  last_name = manley
  email = 'jonathan.manley@bourne-leisure.co.uk'
  edition = standard
  comment = 'General account for external training and testing';
  
-- bew password on connect : 9d%3ojyg9&&3Rl9f 
-- {"accountLocator":"MA36072",
-- "accountLocatorUrl":"https://ma36072.eu-west-1.snowflakecomputing.com",
-- "accountName":"EXTERNALTRAINING",
-- "url":"https://trvdulb-externaltraining.snowflakecomputing.com",
-- "edition":"STANDARD",
-- "regionGroup":"PUBLIC",
-- "cloud":"AWS",
-- "region":"AWS_EU_WEST_1"}


--USE ROLE useradmin;

--CREATE ROLE warner_aps_share;

USE ROLE accountadmin;

CREATE SHARE training;

USE ROLE sysadmin;

drop DATABASE ROLE haven_master.interview_share;
create DATABASE ROLE haven_master.training;

USE ROLE securityadmin;

GRANT USAGE ON DATABASE haven_master TO share training;

GRANT USAGE ON DATABASE haven_master TO DATABASE ROLE haven_master.training;
GRANT USAGE ON SCHEMA haven_master.interview_share TO DATABASE ROLE haven_master.training;
REVOKE USAGE ON SCHEMA haven_master.interview_share FROM DATABASE ROLE haven_master.training;

GRANT USAGE ON SCHEMA haven_master.training_data TO DATABASE ROLE haven_master.training;


revoke SELECT ON  TABLE haven_master.interview_share.res_guest from database role haven_master.training;
revoke SELECT ON  TABLE haven_master.interview_share.res_header from database role haven_master.training;
revoke SELECT ON  TABLE haven_master.interview_share.res_invoice_item from database role haven_master.training;

GRANT SELECT ON  TABLE haven_master.training_data.res_guest to database role haven_master.training;
GRANT SELECT ON  TABLE haven_master.training_data.res_header to database role haven_master.training;
GRANT SELECT ON  TABLE haven_master.training_data.res_invoice_item to database role haven_master.training;

GRANT DATABASE ROLE haven_master.training TO SHARE training;

USE ROLE accountadmin;
alter share training set accounts='MA36072';

DROP SHARE interview_share;