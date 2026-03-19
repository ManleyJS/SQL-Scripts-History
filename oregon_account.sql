use role accountadmin;
show managed accounts;

use role orgadmin;
show organization accounts;  

show regions;
  
create account streamlittraining
  admin_name = ManleyJS
  admin_password = '<REDACTED>'
  first_name = jonathan
  last_name = manley
  email = 'jonathan.manley@bourne-leisure.co.uk'
  edition = standard
  region = aws_us_west_2
  comment = 'General account for Streamlit quickstart training';


  
  
-- new password : GUj5r6YUcA6g7w3G
--{ 
--"accountLocator":"BMB07487",
--"accountLocatorUrl":"https://bmb07487.snowflakecomputing.com",
--"accountName":"STREAMLITTRAINING",
--"url":"https://trvdulb-streamlittraining.snowflakecomputing.com",
--"edition":"STANDARD",
--"regionGroup":"PUBLIC",
--"cloud":"AWS",
--"region":"AWS_US_WEST_2"
--}


use role accountadmin;


