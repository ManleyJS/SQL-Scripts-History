use ROLE sysadmin;

CREATE DATABASE haven_master_dev;
CREATE DATABASE haven_master_qat;

use ROLE useradmin;

CREATE ROLE _haven_master_dev__usage;
CREATE ROLE _haven_master_dev__schema;

CREATE ROLE _haven_master_qat__usage;
CREATE ROLE _haven_master_qat__schema;

use ROLE securityadmin;

GRANT usage ON DATABASE haven_master_dev TO ROLE _haven_master_dev__usage;
GRANT CREATE SCHEMA ON DATABASE haven_master_dev TO ROLE _haven_master_dev__schema;

GRANT CREATE Stream ON DATABASE haven_master_dev TO ROLE _haven_master_dev__schema;

GRANT usage ON DATABASE haven_master_qat TO ROLE _haven_master_qat__usage;
GRANT CREATE SCHEMA ON DATABASE haven_master_qat TO ROLE _haven_master_qat__schema;
GRANT CREATE SCHEMA ON DATABASE haven_master_qat TO ROLE _haven_master_qat__schema;

