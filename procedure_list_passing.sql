use role dba;

use schema haven_store.budget_data;

show tables;

show grants to user gregtaylor;

set testString = (select listagg(name, ',') from (select "name" as name from table(result_scan(last_query_id()))));

select $testString;

use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;

use schema haven_master.procedures;

select $testList;

drop procedure user_creation(string, string, string, string);

CREATE OR REPLACE PROCEDURE testListPassing(roleDetails String )
COPY GRANTS
  RETURNS STRING
  LANGUAGE PYTHON
  RUNTIME_VERSION = '3.11'
  PACKAGES = ('snowflake-snowpark-python')
  HANDLER = 'run'
AS
$$
def run(session, roleDetails):

  import time

  roleList = roleDetails.split(',')

  roleString = []

  for data in roleList:
    roleString.append("{0}:{1}".format(time.strftime("%Y-%m-%d %H:%M:%S"), data))

  return "\n".join(roleString)

$$


;;
call testListPassing($testList);