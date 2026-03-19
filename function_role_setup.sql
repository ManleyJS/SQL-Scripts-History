use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;

use schema haven_master.procedures;

drop procedure functional_role_setup(string, string, string);

CREATE OR REPLACE PROCEDURE functional_role_setup(roleName STRING, whSize STRING, scratchDB STRING)
COPY GRANTS
  RETURNS STRING
  LANGUAGE PYTHON
  RUNTIME_VERSION = '3.11'
  PACKAGES = ('snowflake-snowpark-python')
  HANDLER = 'run'
AS
$$
def run(session, roleName, whSize, scratchDB):

  import time

  responses = []

  def createWarehouse(warehouse, whSize):

    response = []

    sqlText = "CREATE WAREHOUSE {0} WITH WAREHOUSE_SIZE = {1} WAREHOUSE_TYPE = STANDARD " \
            "AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 " \
            "SCALING_POLICY = STANDARD".format(warehouse, whSize)

    result = session.sql(sqlText).collect()

    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))

    return "\n".join(response)


  def createRolesAndGrants(roleName, warehouse):

    response = []

    roleCreate   = "create role {0}".format(roleName)

    usageRole    = "_{0}__usage".format(warehouse)
    operatorRole = "_{0}__operator".format(warehouse)
  
    usageCreate    = "create role {0}".format(usageRole)
    operatorCreate = "create role {0}".format(operatorRole)

    usageGrant      = "grant usage, monitor on warehouse {0} to role {1}".format(warehouse, usageRole)
    usageToOperator = "grant role {0} to role {1}".format(usageRole, operatorRole) 
    operatorGrant   = "grant operate, modify on warehouse {0} to role {1}".format(warehouse, operatorRole)

    warehouseGrant = "grant role {0} to role {1}".format(usageRole, roleName)
    dbaGrant       = "grant role {0} to role dba".format(roleName)

    for sqlText in roleCreate, usageCreate, operatorCreate, \
                  usageGrant, usageToOperator, operatorGrant, \
                  warehouseGrant, dbaGrant:
      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))

    return "\n".join(response)


## main body of code


  warehouse = "{0}_WAREHOUSE_{1}".format(roleName, whSize)

  responses.append(createWarehouse(warehouse, whSize))
  responses.append(createRolesAndGrants(roleName, warehouse))

  return "\n".join(responses) 
  
$$;

call functional_role_setup('warner_data_review', 'xsmall', 'warner_data_review');