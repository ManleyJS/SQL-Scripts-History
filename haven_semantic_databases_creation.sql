use ROLE sysadmin;

CREATE DATABASE haven_semantic_dev;
CREATE DATABASE haven_semantic_qat;
CREATE DATABASE haven_semantic;


use ROLE useradmin;

CREATE ROLE _haven_semantic_dev__usage;
CREATE ROLE _haven_semantic_qat__usage;
CREATE ROLE _haven_semantic__usage;

CREATE ROLE _haven_semantic_dev__schema;
CREATE ROLE _haven_semantic_qat__schema;
CREATE ROLE _haven_semantic__schema;

use ROLE securityadmin;

GRANT USAGE ON DATABASE haven_semantic_dev TO ROLE _haven_semantic_dev__usage;
GRANT USAGE ON DATABASE haven_semantic_qat TO ROLE _haven_semantic_qat__usage;
GRANT USAGE ON DATABASE haven_semantic TO ROLE _haven_semantic__usage;

GRANT CREATE SCHEMA ON DATABASE haven_semantic_dev TO ROLE _haven_semantic_dev__SCHEMA;
GRANT CREATE SCHEMA ON DATABASE haven_semantic_qat TO ROLE _haven_semantic_qat__schema;
GRANT CREATE SCHEMA ON DATABASE haven_semantic TO ROLE _haven_semantic__schema;

GRANT ROLE _haven_semantic_dev__usage TO ROLE _haven_semantic_dev__SCHEMA;
GRANT ROLE _haven_semantic_qat__usage TO ROLE _haven_semantic_qat__SCHEMA;
GRANT ROLE _haven_semantic__usage TO ROLE _haven_semantic__SCHEMA;

GRANT ROLE _haven_semantic__SCHEMA TO ROLE haven_schema_setup;
GRANT ROLE _haven_semantic_dev__SCHEMA TO ROLE haven_schema_setup;
GRANT ROLE _haven_semantic_qat__SCHEMA TO ROLE haven_schema_setup;


-- 16/10/2025
-- AA DEV Semantic layer

use ROLE sysadmin;

CREATE DATABASE haven_semantic_aa_dev;

use ROLE useradmin;

CREATE ROLE _haven_semantic_aa_dev__usage;
CREATE ROLE _haven_semantic_aa_dev__schema;

use ROLE securityadmin;

GRANT USAGE ON DATABASE haven_semantic_aa_dev TO ROLE _haven_semantic_aa_dev__usage;
GRANT CREATE SCHEMA ON DATABASE haven_semantic_aa_dev TO ROLE _haven_semantic_aa_dev__SCHEMA;
GRANT ROLE _haven_semantic_aa_dev__usage TO ROLE _haven_semantic_aa_dev__SCHEMA;
GRANT ROLE _haven_semantic_aa_dev__SCHEMA TO ROLE haven_schema_setup;

-- 21/10/2025

use ROLE securityadmin;

GRANT ROLE _haven_semantic_dev__SCHEMA TO ROLE haven_schema_setup;
GRANT ROLE _haven_semantic_qat__SCHEMA TO ROLE haven_schema_setup;
GRANT ROLE _haven_semantic__SCHEMA TO ROLE haven_schema_setup;

