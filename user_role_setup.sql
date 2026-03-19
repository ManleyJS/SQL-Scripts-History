use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;

use schema haven_master.procedures;

drop procedure user_creation(string, string, string, string);

CREATE OR REPLACE PROCEDURE user_creation(email STRING, roleName STRING, whName STRING, title STRING)
COPY GRANTS
  RETURNS STRING
  LANGUAGE PYTHON
  RUNTIME_VERSION = '3.11'
  PACKAGES = ('snowflake-snowpark-python')
  HANDLER = 'run'
AS
$$
def run(session, email, roleName, whName, title):

  import time

  responses = []

  def createUser(email, userName, displayName, roleName, whName, title):

    response = []

    sqlText = "create user {0} " \
            "login_name = '{1}'" \
            "display_name = '{2}' " \
            "email = '{1}' " \
            "comment = '{3}' " \
            "default_role = {4} " \
            "default_warehouse = {5} " \
            "type = person " \
            "default_secondary_roles = ()".format(
                userName, email, displayName, title, roleName, whName)

    result = session.sql(sqlText).collect()

    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))

    return "\n".join(response)


  def grantRoleToUser(userName, roleList):

    response = []

    for role in roleList:
      sqlText = "grant role {0} to user {1}".format(role, userName)

      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))

    return "\n".join(response)


## main body of code

  userName    = email.split("@")[0].replace(".", "")
  displayName = email.split("@")[0].replace(".", " ").title()

  roleList = roleName.split(',')

  responses.append(createUser(email, userName, displayName, roleList[0], whName, title))
  responses.append(grantRoleToUser(userName, roleList))

  return "\n".join(responses) 
  
$$;

show grants to user gregtaylor;

set testString = (select listagg(name, ',') from (select "name" as name from table(result_scan(last_query_id()))));

-- email STRING, roleName STRING, whName STRING, title STRING

call user_creation('user.creation.test@nomail.com', $testString, 'haven_dbt_transform_warehouse_xsmall', 'delete me asap');

desc user usercreationtest;

drop user usercreationtest;

show grants to user usercreationtest;

drop user usercreationtest;