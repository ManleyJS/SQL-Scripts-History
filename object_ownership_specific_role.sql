use role dba;
use schema haven_master.procedures;


CREATE OR REPLACE PROCEDURE haven_master.procedures.change_object_ownership(
        databaseName STRING, schemaName STRING, oldOwner STRING, newOwner STRING)
COPY GRANTS
  RETURNS STRING
  LANGUAGE PYTHON
  RUNTIME_VERSION = '3.11'
  PACKAGES = ('snowflake-snowpark-python')
  HANDLER = 'run'
AS
$$
def run(session, dbName, scName, oldOwner, newOwner):

  import time

  def getObjectList(dbName, scName, oldOwner):
    objectList = []

    sqlText = "SELECT TABLE_NAME,TABLE_TYPE, TABLE_OWNER " \
            "FROM {0}.INFORMATION_SCHEMA.TABLES " \
            "WHERE TABLE_CATALOG = '{0}' " \
            "AND TABLE_SCHEMA = '{1}' " \
            "AND TABLE_OWNER = '{2}' " \
            "ORDER BY TABLE_NAME".format(dbName, scName, oldOwner)

    try:
      result = session.sql(sqlText).collect()
    except Exception as e:
      print("{0} : user : {1} : is not present".format(time.strftime("%c"), user[0]))
      print("{0} : Error : {1}".format(time.strftime("%c"), e))
    else:
      for data in result:
        objectList.append([ data[0], data[1], data[2] ])

    return objectList

    
  #### Main body of code
  
  return(getObjectList(dbName.upper(), scName.upper(), oldOwner.upper()))
  
$$;

call haven_master.procedures.change_object_ownership('haven_store_dev', 'TEST_OWNER_PERMISSIONS', 'HAVEN_DBT_transform_pipelines_dev', 'haven_dbt_transform_dev');

show procedures;

SELECT TABLE_NAME,TABLE_TYPE, TABLE_OWNER FROM HAVEN_STORE_DEV.INFORMATION_SCHEMA.TABLES WHERE TABLE_CATALOG = 'HAVEN_STORE_DEV' AND TABLE_SCHEMA = 'TEST_OWNER_PERMISSIONS' ORDER BY TABLE_NAME;

