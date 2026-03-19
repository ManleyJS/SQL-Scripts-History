use role haven_schema_setup;
use warehouse haven_schema_setup_warehouse_xsmall;

use schema haven_master.procedures;

drop procedure haven_master.procedures.schema_role_creation(string , string );

CREATE OR REPLACE PROCEDURE haven_master.procedures.schema_role_creation(databaseName STRING, schemaName STRING)
COPY GRANTS
  RETURNS STRING
  LANGUAGE PYTHON
  RUNTIME_VERSION = '3.11'
  PACKAGES = ('snowflake-snowpark-python')
  HANDLER = 'run'
AS
$$
def run(session, databaseName, schemaName):

  import time

  consDBList     = ['HAVEN_STORE', 'HAVEN_PIPELINE', 'HAVEN_STAGING', 'BOURNE_STORE']
  baseDBList     = ['HAVEN_BASE', 'BOURNE_BASE']
  rawDBList      = ['HAVEN_RAW', 'BOURNE_RAW']

  masterDB       = 'HAVEN_MASTER'

  cicdRoles      = ['haven_dbt_transform', 'haven_dbt_transform_finance', 'haven_dbt_transform_pipelines',
                    'haven_dbt_transform_pricer', 'haven_dbt_transform_pitch_perfect' ]

  engrRoleDev    = 'haven_dbt_development'
  engrRoleDebug  = 'haven_data_engineering'

  governRole     = 'bourne_governance'
  dbaRole        = 'dba'

  oldDataXFRole  = 'haven_data_transform'
  oldDataIntRole = 'haven_data_integrate'

  envSuffix      = ['dev', 'qat', 'prod']

  auditTable     = 'haven_master.procedures.auditlog'
  
  responseArray = []

  def createSchema(dbName, schemaName):

    response = []

    sqlText = "create schema if not exists {0}.{1}".format(dbName, schemaName)
    
    result = session.sql(sqlText).collect()

    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))

    return "\n".join(response)
    

  def createRoles(dbName, schemaName):

    response = []

    ## Database ##
    databaseUsageRole      = "_%s__usage"               % (dbName)

    ## Schema ##
    schemaUsageRole        = "_%s__%s__usage"           % (dbName, schemaName)
    schemaReaderRole       = "_%s__%s__reader"          % (dbName, schemaName)
    schemaWriterRole       = "_%s__%s__writer"          % (dbName, schemaName)
    schemaCreatorRole      = "_%s__%s__creator"         % (dbName, schemaName)
    schemaOwnerRole        = "_%s__%s__owner"           % (dbName, schemaName)

    for role in databaseUsageRole, schemaUsageRole, schemaReaderRole, schemaWriterRole, \
                schemaCreatorRole, schemaOwnerRole:
      sqlText = "create role if not exists {0}".format(role)
      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))

    return "\n".join(response)


  def grantPermissions(dbName, schemaName):

    response = []

    ## Namespace setting ##
    nameSpace = "%s.%s" % (dbName, schemaName)


    ## Database ##
    databaseUsageRole      = "_%s__usage"               % (dbName)

    ## Schema ##
    schemaUsageRole        = "_%s__%s__usage"           % (dbName, schemaName)
    schemaReaderRole       = "_%s__%s__reader"          % (dbName, schemaName)
    schemaWriterRole       = "_%s__%s__writer"          % (dbName, schemaName)
    schemaCreatorRole      = "_%s__%s__creator"         % (dbName, schemaName)
    schemaOwnerRole        = "_%s__%s__owner"           % (dbName, schemaName)

    ## Database usage role default permissions ##

    usageDBGrantSQL = "grant usage on database %s to role %s" % (dbName, databaseUsageRole)

    ## Schema role default creation ##

    ## Database usage ##
    dbToUsageSQL     = "grant role %s to role %s" % (databaseUsageRole, schemaUsageRole)

    ## Schema usage ##
    schemaToUsageSQL = "grant usage on schema %s to role %s" % (nameSpace, schemaUsageRole)

    ## Usage grant to Reader role ##
    usageToReaderSQL = "grant role %s to role %s" % (schemaUsageRole, schemaReaderRole)

    ## Grant select on all existing tables, views and materialized views to reader role ##
    tableGrantSQL   = "grant select on all tables in schema %s to role %s" % (nameSpace, schemaReaderRole)
    viewGrantSQL    = "grant select on all views in schema %s to role %s" % (nameSpace, schemaReaderRole)
    mViewGrantSQL   = "grant select on all materialized views in schema %s to role %s" % (nameSpace, schemaReaderRole)
    dynTabGrantSQL  = "grant select on all dynamic tables in schema %s to role %s" % (nameSpace, schemaReaderRole)

    ## Grant select on all future tables, views and materialized views to reader role ##
    tableFGrantSQL   = "grant select on future tables in schema %s to role %s" % (nameSpace, schemaReaderRole)
    viewFGrantSQL    = "grant select on future views in schema %s to role %s" % (nameSpace, schemaReaderRole)
    mViewFGrantSQL   = "grant select on future materialized views in schema %s to role %s" % (nameSpace, schemaReaderRole)
    dynTabFGrantSQL  = "grant select on future dynamic tables in schema %s to role %s" % (nameSpace, schemaReaderRole)

    ## Grant read on stages to reader role ##
    stageRGrantSQL   = "grant read on all stages in schema %s to role %s"  % (nameSpace, schemaReaderRole)
    stageRFGrantSQL  = "grant read on future stages in schema %s to role %s" % (nameSpace, schemaReaderRole)

    ## Grant reader role to writer role
    readToWriteSQL   = "grant role %s to role %s" % (schemaReaderRole, schemaWriterRole)

    ## Grant insert, update, delete, truncate on existing tables in schema to writer role ##
    writeGrantSQL    = "grant insert, update, delete, truncate on all tables in schema %s to role %s" % (nameSpace, schemaWriterRole)

    ## Grant insert, update, delete, truncate on future tables in schema to writer role ##
    writeFGrantSQL   = "grant insert, update, delete, truncate on future tables in schema %s to role %s" % (nameSpace, schemaWriterRole)

    ## Grant usage on file formats, procedures, functions, sequences, stages to writer role ##
    stageWGrantSQL      = "grant usage on all stages in schema %s to role %s" % (nameSpace, schemaWriterRole)
    stageWFGrantSQL     = "grant usage on future stages in schema %s to role %s" % (nameSpace, schemaWriterRole)
    fFormatWGrantSQL    = "grant usage on all file formats in schema %s to role %s" % (nameSpace, schemaWriterRole)
    fFormatWFGrantSQL   = "grant usage on future file formats in schema %s to role %s" % (nameSpace, schemaWriterRole)
    procedureWGrantSQL  = "grant usage on all procedures in schema %s to role %s" % (nameSpace, schemaWriterRole)
    procedureWFGrantSQL = "grant usage on future procedures in schema %s to role %s" % (nameSpace, schemaWriterRole)
    functionWGrantSQL   = "grant usage on all functions in schema %s to role %s" % (nameSpace, schemaWriterRole)
    functionWFGrantSQL  = "grant usage on future functions in schema %s to role %s" % (nameSpace, schemaWriterRole)
    sequenceWGrantSQL   = "grant usage on all sequences in schema %s to role %s" % (nameSpace, schemaWriterRole)
    sequenceWFGrantSQL  = "grant usage on future sequences in schema %s to role %s" % (nameSpace, schemaWriterRole)

    writeToCreateSQL = "grant role %s to role %s" % (schemaWriterRole, schemaCreatorRole)
    createTableSQL   = "grant create table on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createETableSQL  = "grant create external table on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createViewSQL    = "grant create view on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createMViewSQL   = "grant create materialized view on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createSeqSQL     = "grant create sequence on schema %s to role %s" % (nameSpace, schemaCreatorRole)

    createFunctSQL   = "grant create function on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createProceSQL   = "grant create procedure on schema %s to role %s" % (nameSpace, schemaCreatorRole)

    createFFmtSQL    = "grant create file format on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createStageSQL   = "grant create stage on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createPipeSQL    = "grant create pipe on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createStreamSQL  = "grant create stream on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createTaskSQL    = "grant create task on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createDynTSQL    = "grant create dynamic table on schema {0} to role {1}".format(nameSpace, schemaCreatorRole)

    createToOwnerSQL = "grant role %s to role %s" % (schemaCreatorRole, schemaOwnerRole)
    createMaskSQL    = "grant create masking policy on schema %s to role %s" % (nameSpace, schemaCreatorRole)

    ownerToDBASQL    = "grant role %s to role dba" % (schemaOwnerRole)
    readToGovSQL     = "grant role %s to role bourne_governance" % (schemaReaderRole)


    for sqlText in usageDBGrantSQL, dbToUsageSQL, schemaToUsageSQL, usageToReaderSQL, \
        tableGrantSQL, viewGrantSQL, mViewGrantSQL, dynTabGrantSQL, \
        tableFGrantSQL, viewFGrantSQL, mViewFGrantSQL, dynTabFGrantSQL, \
        stageRGrantSQL, stageRFGrantSQL, \
        readToWriteSQL, writeGrantSQL, writeFGrantSQL, \
        stageWGrantSQL, stageWFGrantSQL, fFormatWGrantSQL, fFormatWFGrantSQL, \
        procedureWGrantSQL, procedureWFGrantSQL, functionWGrantSQL, functionWFGrantSQL, \
        sequenceWGrantSQL, sequenceWFGrantSQL, \
        writeToCreateSQL, createTableSQL, createETableSQL, createViewSQL, createMViewSQL, createSeqSQL, \
        createFunctSQL, createProceSQL, \
        createFFmtSQL, createStageSQL, createPipeSQL, createStreamSQL, createTaskSQL, createDynTSQL, \
        createToOwnerSQL, createMaskSQL, ownerToDBASQL, readToGovSQL:
      
      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))

    return "\n".join(response)


  def setConsumptionLayerAccess(dbName, schemaName):

    response = []

    for role in cicdRoles:
      sqlText = "grant role _{0}__{1}__creator to role {2}".format(dbName, schemaName, role)
      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))

    for env in envSuffix:
      for role in cicdRoles:
        sqlText = "grant role _{0}__{1}__reader to role {2}_{3}".format(dbName, schemaName, role, env)
        result = session.sql(sqlText).collect()

        for record in result:
          for data in record:
            response.append("{0} : {1}".format(sqlText, data))
      
    for role in engrRoleDev, engrRoleDebug:
      sqlText = "grant role _{0}__{1}__reader to role {2}".format(dbName, schemaName, role)
      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))
    
    return "\n".join(response)

  
  def setBaseLayerAccess(dbName, schemaName):

    response = []

    for role in cicdRoles:
      sqlText = "grant role _{0}__{1}__reader to role {2}".format(dbName, schemaName, role)
      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))

    for env in envSuffix:
      for role in cicdRoles:
        sqlText = "grant role _{0}__{1}__reader to role {2}_{3}".format(dbName, schemaName, role, env)
        result = session.sql(sqlText).collect()

        for record in result:
          for data in record:
            response.append("{0} : {1}".format(sqlText, data))
      
    for role in engrRoleDev, engrRoleDebug:
      sqlText = "grant role _{0}__{1}__reader to role {2}".format(dbName, schemaName, role)
      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))
    
      
    return "\n".join(response)

  
  def setdbaAccess(dbName, schemaName):
  
    response = []
      
    sqlText = "grant role _{0}__{1}__owner to role {2}".format(dbName, schemaName, dbaRole)
    result = session.sql(sqlText).collect()

    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))
    
      
    return "\n".join(response)

  
  def setRawLayerAccess(dbName, schemaName):
  
    response = []
      
    sqlText = "grant role _{0}__{1}__reader to role {2}".format(dbName, schemaName, oldDataIntRole)
    result = session.sql(sqlText).collect()

    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))
    
      
    return "\n".join(response)

  
  def setDevelopmentEnvironmentAccess(dbName, schemaName):

    response = []

    env = "DEV"
        
    for role in cicdRoles:
      sqlText = "grant role _{0}__{1}__creator to role {2}_{3}".format(dbName, schemaName, role, env)
      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))

    sqlText = "grant role _{0}__{1}__creator to role {2}".format(dbName, schemaName, engrRoleDev)
    result = session.sql(sqlText).collect()

    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))

    sqlText = "grant role _{0}__{1}__reader to role {2}".format(dbName, schemaName, engrRoleDebug)
    result = session.sql(sqlText).collect()

    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))
      
    return "\n".join(response)

  
  def setQualityAssuranceEnvironmentAccess(dbName, schemaName):
   
    response = []

    env = "QAT"
        
    for role in cicdRoles:
      sqlText = "grant role _{0}__{1}__creator to role {2}_{3}".format(dbName, schemaName, role, env)
      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))
      
    sqlText = "grant role _{0}__{1}__reader to role {2}".format(dbName, schemaName, engrRoleDebug)
    result = session.sql(sqlText).collect()

    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))
     
    return "\n".join(response)

  
  def setProductionEnvironmentAccess(dbName, schemaName):
  
    response = []

    env = "PROD"
        
    for role in cicdRoles:
      sqlText = "grant role _{0}__{1}__creator to role {2}_{3}".format(dbName, schemaName, role, env)
      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))

    sqlText = "grant role _{0}__{1}__reader to role {2}".format(dbName, schemaName, engrRoleDebug)
    result = session.sql(sqlText).collect()

    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))

      
    return "\n".join(response)


  def setMasterDatabaseAccess(dbName, schemaName):

    response = []
    
    for role in cicdRoles:
      sqlText = "grant role _{0}__{1}__reader to role {2}".format(dbName, schemaName, role)
      result = session.sql(sqlText).collect()

      for record in result:
        for data in record:
          response.append("{0} : {1}".format(sqlText, data))

    for env in envSuffix:
      for role in cicdRoles:
        sqlText = "grant role _{0}__{1}__reader to role {2}_{3}".format(dbName, schemaName, role, env)
        result = session.sql(sqlText).collect()

        for record in result:
          for data in record:
            response.append("{0} : {1}".format(sqlText, data))
      
    sqlText = "grant role _{0}__{1}__creator to role {2}".format(dbName, schemaName, engrRoleDev)
    result = session.sql(sqlText).collect()

    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))

    sqlText = "grant role _{0}__{1}__reader to role {2}".format(dbName, schemaName, engrRoleDebug)
    result = session.sql(sqlText).collect()

    for record in result:
      for data in record:
        response.append("{0} : {1}".format(sqlText, data))
      
    return "\n".join(response)

  
## main body of code

  responseArray.append(createSchema(databaseName, schemaName))

  responseArray.append(createRoles(databaseName, schemaName))
  
  responseArray.append(grantPermissions(databaseName, schemaName))

  db = databaseName.upper()

  setdbaAccess(databaseName, schemaName)

  if db in consDBList:
    responseArray.append(setConsumptionLayerAccess(databaseName, schemaName))
  elif db in baseDBList:
    responseArray.append(setBaseLayerAccess(databaseName, schemaName))
  elif db in rawDBList:
    responseArray.append(setRawLayerAccess(databaseName, schemaName))
  elif db.endswith("_DEV"):
    responseArray.append(setDevelopmentEnvironmentAccess(databaseName, schemaName))
  elif db.endswith("_QAT"):
    responseArray.append(setQualityAssuranceEnvironmentAccess(databaseName, schemaName))
  elif db.endswith("_PROD"):
    responseArray.append(setProductionEnvironmentAccess(databaseName, schemaName))
  elif db == masterDB:
    responseArray.append(setMasterDatabaseAccess(databaseName, schemaName))
  else:
    responseArray.append("No grants on schema {0}.{1} to additional roles".format(databaseName, schemaName))

  response = "\n".join(responseArray)

  compDate = time.strftime("%Y-%m-%d %H:%M:%S")

  df = session.create_dataframe([[databaseName, schemaName, response, compDate]], 
       schema = ["DATABASE_NAME", "SCHEMA_NAME", "EXECUTION_LOG", "COMPLETION_TIME"])
  df.write.insert_into(auditTable)
  
  return (response)
  
$$;
