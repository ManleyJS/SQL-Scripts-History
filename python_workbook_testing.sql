# The Snowpark package is required for Python Worksheets. 
# You can add more packages by selecting them using the Packages control and then importing them.

import snowflake.snowpark as snowpark
from snowflake.snowpark.functions import col

def main(session: snowpark.Session): 
  import time
  import snowflake.snowpark.functions

  def setEnvironment(role, warehouse):

    session.use_role(role)
    session. use_warehouse(warehouse)
    

  def getObjectList(dbName, scName):
  
    objectList = []
    error = ""

    sqlText = "SELECT TABLE_NAME,TABLE_TYPE, TABLE_OWNER " \
            "FROM {0}.INFORMATION_SCHEMA.TABLES " \
            "WHERE TABLE_CATALOG = '{0}' " \
            "AND TABLE_SCHEMA = '{1}' " \
            "ORDER BY TABLE_NAME".format(dbName, scName)

    try:
      result = session.sql(sqlText).collect()
    except Exception as e:
      error = e.message
    else:
      for data in result:
        objectList.append([ data[0], data[1], data[2] ])

    return objectList, error

    
  def getRoleList(dbName, scName):
  
    roleList = []
    error = ""

    sqlText = "select name from snowflake.account_usage.roles " \
                "where deleted_on is null " \
                "and contains(name, '{0}__{1}')".format(
                    dbName.upper(), scName.upper())

    try:
      result = session.sql(sqlText).collect()
    except Exception as e:
      error = e.message
    else:
      for data in result:
        if not data[0].startswith("_{0}__{1}__".format(dbName.upper(), scName.upper())):
          roleList.append(data[0])
 
    return roleList, error


  def getGrantsList(roleList):

    grantsList = []
    error = ""
      
    if roleList:
      for role in roleList:
        sqlText = "select privilege, granted_on, table_catalog, table_schema, name " \
                    "from snowflake.account_usage.grants_to_roles " \
                    "where grantee_name = '{0}' " \
                    "and deleted_on is null".format(role.upper())
        try:
          result = session.sql(sqlText).collect()
        except Exception as e:
          error = e.message
        else:
          for data in result:
            grantsList.append([ data[0], data[1], data[2], data[3], data[4], role ])

    return grantsList, error


  def grantOwnershipAndDefaultPermissions(dbName, scName, newOwner, object):

    response = []
    
    sqlText = "grant ownership on {0} {1}.{2}.{3} to role {4} revoke current grants".format(
          object[1], dbName, scName, object[0], newOwner)
    try:
      result = session.sql(sqlText).collect()
    except Exception as e:
      error = e.message
    else:
      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))


    if len(error) == 0:
      sqlText = "grant select on {0}.{1}.{2} to role _{0}__{1}__reader".format(
        dbName, scName, object[0])
      try:
        result = session.sql(sqlText).collect()
      except Exception as e:
        error = e.message
      else:
        for record in result:
          for data in record:
            response.append("{0} : {1}".format(sqlText, data))

    if len(error) == 0 and object[1] == 'TABLE':
      sqlText = "grant insert, update, delete, truncate on {0}.{1}.{2} to role _{0}__{1}__reader".format(
                    dbName, scName, object[0])
      try:
        result = session.sql(sqlText).collect()
      except Exception as e:
        error = e.message
      else:
        for record in result:
          for data in record:
            response.append("{0} : {1}".format(sqlText, data))

    return "\n".join(response), error


  def grantSpecialPermissions(specialAccess):

  response = []
  error = ""

  if specialAccess[1] == "ROLE":
    sqlText = "grant {0} {1} to role {2}".format(specialAccess[1], specialAccess[2], specialAccess[3])
  else:
    sqlText = "grant {0} on {1} {2} to role {3}".format(
            specialAccess[0], specialAccess[1], specialAccess[2], specialAccess[3])
        
  try:
    result = session.sql(sqlText).collect()
  except Exception as e:
    error = e.message
  else:
    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))

  return "\n".join(response), error

  
  #### Main body of code

  responseArray = []
  response = []
  
  objects, errCode = getObjectList(dbName.upper(), scName.upper())

  if len(errCode) == 0:
    responseArray.append(objects)
    roles, errCode = getRoleList(dbName, scName)
  else:
    return errCode

  if len(errCode) == 0:
    responseArray.append(roles)
    grantList, errCode = getGrantsList(roles)
  else:
    return errCode

  if len(errCode) == 0:
    responseArray.append(grsantList)
  else:
    return errCode

  response = []
  
  for object in objects:
    if object[2] != newOwner.upper():
      response.append(grantOwnershipAndDefaultPermissions(dbName.upper(), scName.upper(), newOwner.upper(), object))

  for grant in grantList:
    response.append(grantSpecialPermissions(grant))

  responseArray.append(response)

  return responseArray