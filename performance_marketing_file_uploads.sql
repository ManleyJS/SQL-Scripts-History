-- DEV environment set up

use role streamlit_file_upload_application_dev;

use warehouse bourne_batch_dataload_xsmall;

use database haven_staging_dev;  
use schema performance_marketing_file_uploads;  

-- Create the file_metadata configuration table
CREATE or REPLACE TABLE  file_metadata (
    file_name VARCHAR(255) NOT NULL,
    database_name VARCHAR(255) NOT NULL,
    schema_name VARCHAR(255) NOT NULL,
    table_name VARCHAR(255) NOT NULL,
    staging_table VARCHAR(255) NOT NULL,
    json_schema OBJECT NOT NULL,
    -- json_schema VARIANT NOT NULL,
    description VARCHAR(500),
    created_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- Add comments to the table
COMMENT ON TABLE file_metadata IS 'Configuration table for CSV file upload app - stores file metadata and validation schemas';
COMMENT ON COLUMN file_metadata.file_name IS 'Name of the CSV file to be uploaded (case-insensitive)';
COMMENT ON COLUMN file_metadata.database_name IS 'Target Snowflake database name';
COMMENT ON COLUMN file_metadata.schema_name IS 'Target Snowflake schema name';
COMMENT ON COLUMN file_metadata.table_name IS 'Target Snowflake table name where data will be loaded';
COMMENT ON COLUMN file_metadata.staging_table IS 'Staging table name where raw data will be loaded first';
COMMENT ON COLUMN file_metadata.json_schema IS 'JSON schema for validating CSV rows';
COMMENT ON COLUMN file_metadata.description IS 'Optional description of the file and its purpose';
COMMENT ON COLUMN file_metadata.created_at IS 'Timestamp when the configuration was created';
COMMENT ON COLUMN file_metadata.updated_at IS 'Timestamp when the configuration was last updated';


INSERT INTO file_metadata (file_name, database_name, schema_name, table_name, staging_table, json_schema, description)
SELECT 
    'performance_marketing_budget_.csv',
    'HAVEN_STAGING_DEV', 
    'PERFORMANCE_MARKETING_FILE_UPLOADS',
    'PERFORMANCE_MARKETING_BUDGET',
    'PERFORMANCE_MARKETING_BUDGET_STAGING',
      PARSE_JSON('{
    "type": "object",
    "properties": {
      "DATE_XID": {
        "type": "string",
        "pattern": "^[0-9]{8}$",
        "description": "Date in YYYYMMDD format"
      },
      "HAVEN_BRAND": {
        "type": "string",
        "minLength": 1,
        "maxLength": 100,
        "description": "Brand name"
      },
      "CHANNEL": {
        "type": "string",
        "enum": ["ppc","paid social","organic","email","direct"],
        "description": "Marketing channel"
      },
      "SUB_CHANNEL": {
        "type": "string",
        "minLength": 1,
        "maxLength": 100,
        "description": "Sub-channel name"
      },
      "BUDGET_DAILY": {
        "type": ["number", "null"],
        "minimum": 0,
        "description": "Daily budget amount (optional)"
      },
      "COST_RAW": {
        "type": "number",
        "minimum": 0,
        "description": "Raw cost amount"
      },
      "COST_INCLUDING_FEES": {
        "type": "number",
        "minimum": 0,
        "description": "Cost including fees"
      }
    },
    "required": ["DATE_XID", "HAVEN_BRAND", "CHANNEL", "SUB_CHANNEL", "COST_RAW", "COST_INCLUDING_FEES"],
    "additionalProperties": false
  }'),
    'Marketing budget and cost data';


-- Budget staging table
CREATE OR REPLACE TABLE PERFORMANCE_MARKETING_BUDGET_STAGING (
    FILENAME VARCHAR(255),
    LOADED_BY VARCHAR(255),
    LOADED_TS TIMESTAMP_NTZ,
    PAYLOAD VARIANT
);

-- production role setup

use role streamlit_file_upload_application;

use warehouse bourne_batch_dataload_xsmall;

use database haven_staging;  
use schema performance_marketing_file_uploads;  

-- Create the file_metadata configuration table
CREATE or REPLACE TABLE  file_metadata (
    file_name VARCHAR(255) NOT NULL,
    database_name VARCHAR(255) NOT NULL,
    schema_name VARCHAR(255) NOT NULL,
    table_name VARCHAR(255) NOT NULL,
    staging_table VARCHAR(255) NOT NULL,
    json_schema OBJECT NOT NULL,
    -- json_schema VARIANT NOT NULL,
    description VARCHAR(500),
    created_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- Add comments to the table
COMMENT ON TABLE file_metadata IS 'Configuration table for CSV file upload app - stores file metadata and validation schemas';
COMMENT ON COLUMN file_metadata.file_name IS 'Name of the CSV file to be uploaded (case-insensitive)';
COMMENT ON COLUMN file_metadata.database_name IS 'Target Snowflake database name';
COMMENT ON COLUMN file_metadata.schema_name IS 'Target Snowflake schema name';
COMMENT ON COLUMN file_metadata.table_name IS 'Target Snowflake table name where data will be loaded';
COMMENT ON COLUMN file_metadata.staging_table IS 'Staging table name where raw data will be loaded first';
COMMENT ON COLUMN file_metadata.json_schema IS 'JSON schema for validating CSV rows';
COMMENT ON COLUMN file_metadata.description IS 'Optional description of the file and its purpose';
COMMENT ON COLUMN file_metadata.created_at IS 'Timestamp when the configuration was created';
COMMENT ON COLUMN file_metadata.updated_at IS 'Timestamp when the configuration was last updated';


INSERT INTO file_metadata (file_name, database_name, schema_name, table_name, staging_table, json_schema, description)
SELECT 
    'performance_marketing_budget_.csv',
    'HAVEN_STAGING', 
    'PERFORMANCE_MARKETING_FILE_UPLOADS',
    'PERFORMANCE_MARKETING_BUDGET',
    'PERFORMANCE_MARKETING_BUDGET_STAGING',
      PARSE_JSON('{
    "type": "object",
    "properties": {
      "DATE_XID": {
        "type": "string",
        "pattern": "^[0-9]{8}$",
        "description": "Date in YYYYMMDD format"
      },
      "HAVEN_BRAND": {
        "type": "string",
        "minLength": 1,
        "maxLength": 100,
        "description": "Brand name"
      },
      "CHANNEL": {
        "type": "string",
        "enum": ["ppc","paid social","organic","email","direct"],
        "description": "Marketing channel"
      },
      "SUB_CHANNEL": {
        "type": "string",
        "minLength": 1,
        "maxLength": 100,
        "description": "Sub-channel name"
      },
      "BUDGET_DAILY": {
        "type": ["number", "null"],
        "minimum": 0,
        "description": "Daily budget amount (optional)"
      },
      "COST_RAW": {
        "type": "number",
        "minimum": 0,
        "description": "Raw cost amount"
      },
      "COST_INCLUDING_FEES": {
        "type": "number",
        "minimum": 0,
        "description": "Cost including fees"
      }
    },
    "required": ["DATE_XID", "HAVEN_BRAND", "CHANNEL", "SUB_CHANNEL", "COST_RAW", "COST_INCLUDING_FEES"],
    "additionalProperties": false
  }'),
    'Marketing budget and cost data';


-- Budget staging table
CREATE OR REPLACE TABLE PERFORMANCE_MARKETING_BUDGET_STAGING (
    FILENAME VARCHAR(255),
    LOADED_BY VARCHAR(255),
    LOADED_TS TIMESTAMP_NTZ,
    PAYLOAD VARIANT
);


