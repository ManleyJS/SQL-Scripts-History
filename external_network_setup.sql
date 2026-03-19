USE ROLE accountadmin;

USE DATABASE bourne_master;

CREATE OR REPLACE NETWORK RULE freshsales_apis_network_rule
  MODE = EGRESS
  TYPE = HOST_PORT
  VALUE_LIST = ('haven.myfreshworks.com:443');
 
 SHOW network RULEs;
DROP NETWORK RULE freshsales_apis_network_rule;
  
 CREATE OR REPLACE SECRET freshsales_apis_secret
    TYPE = GENERIC_STRING
    SECRET_STRING = 'vlsp0bEmCmfXcxHGGG7euQ';
   
SHOW secrets;
DROP secret FRESHSALES_APIS_SECRET;

 CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION freshsales_apis_access_integration
  ALLOWED_NETWORK_RULES = (freshsales_apis_network_rule)
  ALLOWED_AUTHENTICATION_SECRETS = (freshsales_apis_secret)
  ENABLED = TRUE;   
 
 SHOW integrations;
   
DROP integration freshsales_apis_access_integration;

USE ROLE securityadmin; 

USE DATABASE bourne_master;

GRANT read ON secret freshsales_apis_secret TO ROLE dba;
GRANT USAGE ON INTEGRATION freshsales_apis_access_integration TO ROLE dba;

