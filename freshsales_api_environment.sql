-------------------------------
-- CREATE ROLES
-------------------------------

use role useradmin;

create role _haven_data_transform__system_functions__execute;

--grant role _haven_data_transform__system_functions__execute to role haven_dbt_pipeline;
--grant role _haven_data_transform__system_functions__execute to role haven_data_transform;


-------------------------------
-- CREATE SCHEMA
-------------------------------
use role sysadmin;

-- use database haven_data_transform;

-- create schema haven_data_transform.system_functions;

use schema haven_data_transform.system_functions;


-------------------------------
-- CREATE STAGE (to host python source)
-------------------------------

--use role useradmin;
use role sysadmin;
create stage haven_data_transform.system_functions.system_stage;
grant read,write on stage haven_data_transform.system_functions.system_stage to role _haven_data_transform__system_functions__execute;


-------------------------------
-- CREATE NETWORK RULES
-------------------------------

use role sysadmin;
create network rule haven_data_transform.system_functions.freshsales_api_network_rule
  type = host_port
  mode = egress
  value_list = ('haven.myfreshworks.com:443');


-------------------------------
-- CREATE SECRETS
-------------------------------
use role sysadmin;

create secret haven_data_transform.system_functions.freshsales_api_secret
    type = generic_string
    secret_string = 'dummy';

-- create or replace secret does not appear to have a "copy grants" option. To reset the string we must use an 'alter' statement
alter secret haven_data_transform.system_functions.freshsales_api_secret
    set secret_string =
--    '{  "base_url": "https://haven.myfreshworks.com/crm/sales/api", "token": "Token token=wVXrzh6Wp9Do9aDOADw8Kw",    "content_type": "application/json",    "retry": {        "total": 5,        "backoff_factor": 0.1,        "status_forcelist": [500, 502, 503, 504],        "allowed_methods": ["POST"]    }}'
 '{  "base_url": "https://haven.myfreshworks.com/crm-sandbox/sales/api", "token": "Token token=PGdJu-BscbGH-HtqbU0L7g",    "content_type": "application/json",    "retry": {        "total": 5,        "backoff_factor": 0.1,        "status_forcelist": [500, 502, 503, 504],        "allowed_methods": ["POST"]    }}'
;
use role useradmin?
-- is this required?
--grant read on secret haven_data_transform.system_functions.freshsales_api_secret to role _haven_data_transform__system_functions__execute;


-------------------------------
-- CREATE ACCESS INTEGRATIONS
-------------------------------

use role accountadmin;

-- perhaps name this inline with the target rules and secrets ..
--    eg ... haven_data_transform__freshsales__access_integration _prod ?
--    eg ... haven_data_transform__freshsales__access_integration_prod ?

create or replace external access integration haven_data_transform__freshsales__access_integration -- NOTE - different between dev/prod
  allowed_network_rules = (haven_data_transform.system_functions.freshsales_api_network_rule)
  allowed_authentication_secrets = (haven_data_transform.system_functions.freshsales_api_secret)
  enabled = true;

grant usage on integration haven_data_transform__freshsales__access_integration to role _haven_data_transform__system_functions__execute;


-------------------------------
-- CREATE TEST PROCEDURE
-------------------------------

use role sysadmin;

create or replace procedure haven_data_transform.system_functions.test_secret()
    copy grants
    returns variant
    language python
    runtime_version = 3.11
    handler = 'main'
    external_access_integrations = (haven_data_transform__freshsales__access_integration)
    packages = ('snowflake-snowpark-python')
    secrets = ('cred' = haven_data_transform.system_functions.freshsales_api_secret )
    execute as caller
as $$
import _snowflake
def main(session):
    cred = _snowflake.get_generic_secret_string('cred')
    return f'result={cred}'
$$;
;
call haven_data_transform.system_functions.test_secret()
;
grant usage on procedure haven_data_transform.system_functions.test_secret()  to role _haven_data_transform__system_functions__execute;
;
-- perhaps grant permissions to allow the role to alter log_levels?
alter procedure haven_data_transform.system_functions.test_secret() set log_level='DEBUG'
;

-------------------------------
-- PROC V1
-------------------------------

create or replace procedure haven_data_transform.system_functions.freshsales_retl_v1(table_name string)
    copy grants
    returns varchar(16777216)
    language python
    runtime_version = '3.11'
    packages = ('snowflake-snowpark-python', 'requests')
    imports = ('@system_stage/freshsales.zip')
    handler = 'freshsales.main.main'
    external_access_integrations = (freshsales_access_integration_test2)
    secrets = ('cred' = freshsales_api_secret )
    execute as caller;

grant usage on procedure haven_data_transform.system_functions.freshsales_retl_v1(string)  to role _haven_data_transform__system_functions__execute;
;


-- TESTED PROC

create or replace procedure haven_data_transform.system_functions.freshsales_retl(table_name string)
    copy grants
    returns string
    language python
    runtime_version = '3.11'
    packages = ('snowflake-snowpark-python', 'requests', 'simplejson', 'urllib3')
    external_access_integrations = (haven_data_transform__freshsales__access_integration)
    secrets = ('cred' = haven_data_transform.system_functions.freshsales_api_secret )
    handler = 'sproc_main'
    execute as caller
as $$
##from snowflake.snowpark.functions import col
import logging
import snowflake.snowpark
from snowflake.snowpark import Session
from snowflake.snowpark import DataFrame
import time
import requests
from requests.adapters import HTTPAdapter
import _snowflake
import simplejson as json
import urllib3
from urllib3 import Retry

logger = logging.getLogger("python_logger")
logger.info("Logging from Python module.")

############################################################################################################
##START this code goes into snowflake sp
URLENDPOINT = "contacts/upsert"

RETRYABLE_FRESHSALES_ERRORS = [
    'Connection timed out Connection timed out'
]

def get_secret_details():
    logger.debug(f"Step get_secret_details  10.")
    try:                                                                        ##when using secret in snowflake via a snowflake stored procedure
        logger.debug(f"Step get_secret_details  20.")
        secrets = json.loads(_snowflake.get_generic_secret_string('cred'))
    except:                                                                     ##json file - running locally from vscode
        logger.debug(f"Step get_secret_details  30.")
        with open("secrets.json", "r") as f:
            secrets = json.load(f)
    logger.debug(f"Step get_secret_details  40.")
    return(secrets)


class MyRetry(Retry):
    def is_retry(self, method, status_code, has_retry_after=False):
        if method and method.upper() == 'POST' and status_code == 400:
            return True
        return super().is_retry(method, status_code, has_retry_after)
    def increment(self, method=None, url=None, response=None, error=None, _pool=None, _stacktrace=None):
        if response is not None and isinstance(method, str) and method.upper() == 'POST' and response.status == 400:
            message = self._get_error_message(response)
            logger.info(f"increment message {message}. Status {response.status}.")
            if message[0] in RETRYABLE_FRESHSALES_ERRORS:
                error = Exception(message)
                logger.info(f"MyRetry loop. Status {response.status}.")
                return super().increment(method, url, response, error, _pool, _stacktrace)
            return
        logger.info(f"Retry loop. Status {response.status}.")
        return super().increment(method, url, response, error, _pool, _stacktrace)

    def _get_error_message(self, response):
        data = response.read(decode_content=True)
        value = json.loads(data)
        errors = value.get('errors')
        return errors and errors.get('message')


class ApiRequest:
    def __init__(self, base_url, token, content_type, retry, **kwargs ) -> None:  #type hint               **kwargs, catch all for any additional items passed in the dict
        logger.debug(f"Step ApiRequest  10.")
        logger.info(f"API class instance.")
        self.url = f"{base_url}/{URLENDPOINT}"
        logger.debug(f"Step ApiRequest  20.")
        self.session = requests.Session()
        logger.debug(f"Step ApiRequest  30.")
        self.headers = {
            'Authorization': token,
            'Content-Type': content_type,
        }
        logger.debug(f"Step ApiRequest  40.")
        self.session.headers.update(self.headers)
        logger.debug(f"Step ApiRequest  50.")
        retry_strategy = MyRetry(**retry)  ## ** unpacks the dict 'retry', assigning the values to the corresponding keyword arguments inside the function "Retry" - could roll into line below.
        logger.debug(f"Step ApiRequest  60.")
        #self.session.mount(self.url, HTTPAdapter(max_retries=retries))
        self.session.mount(self.url, HTTPAdapter(max_retries=retry_strategy))
        logger.debug(f"Step ApiRequest  70.")
    def api_post_contact(self, data):
        response = self.session.post(self.url, data)   ##actual api post call
        logger.info(f"API Response {response.status_code}.")
        if response.status_code not in(200,201):
            logger.error(f"API Response {response.content}.")

def sproc_main(session: Session, table_name = 'HAVEN_DATA_TRANSFORM.dbt_jpering_dbt_freshsales.freshsales_equaliser_outbound__export'): ##This is the function that will be named as the HANDLER in the snowflake sp.
    try:
        ##Get data
        logger.info(f"START of proc run for table_name {table_name}.")
        logger.info(f"Get data.")
        sql = session.table(table_name).select('JSON_PAYLOAD')
        api_request_instance = ApiRequest(**get_secret_details())             ## ** unpacks the dict returned from "get_secret_details" function, assigning the values to the corresponding keyword arguments inside the function "APIRequest"

        ##Loop over data and post to api
        for i, row in enumerate(sql.collect()):
            logger.info(f"Process row {i+1}.")
            try:
                api_request_instance.api_post_contact(row.JSON_PAYLOAD)
            except Exception as ex:
                logger.error(f"Exception message from Retry {ex} for {row.JSON_PAYLOAD}")

        logger.info(f"END of proc run for table_name {table_name}.")

    except Exception as ex:
             logger.error("Error: %s", ex)

##END this code goes into snowflake sp
############################################################################################################

$$;

grant usage on procedure haven_data_transform.system_functions.freshsales_retl(string)  to role _haven_data_transform__system_functions__execute;
