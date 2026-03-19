USE ROLE sysadmin;

CREATE DATABASE bourne_dream_analysis;

CREATE WAREHOUSE bourne_dream_analysis_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _bourne_dream_analysis_warehouse_xsmall__warehouse__operator;
create role _bourne_dream_analysis_warehouse_xsmall__warehouse__usage;
create role bourne_dream_analysis;
create role bourne_dream_analysis_PrasathNatarajan;
create role bourne_dream_analysis_PrabhuramRamaiyanrengia;

CREATE ROLE _bourne_dream_analysis__usage;
CREATE ROLE _bourne_dream_analysis__schema;


--Prabhuram Ramaiyanrengia
--prabhuram.ramaiyanrengia@bourne-leisure.co.uk
create user PrabhuramRamaiyanrengia
login_name = 'prabhuram.ramaiyanrengia@bourne-leisure.co.uk'
display_name = 'Prabhuram Ramaiyan Rengia'
email = 'prabhuram.ramaiyanrengia@bourne-leisure.co.uk'
comment = 'Data Engineer'
default_role = bourne_dream_analysis
default_warehouse = bourne_dream_analysis_warehouse_xsmall;

--Prasath Natarajan
--prasath.natarajan@haven.com
create user PrasathNatarajan
login_name = 'prasath.natarajan@haven.com'
display_name = 'Prasath Natarajan'
email = 'prasath.natarajan@haven.com'
comment = 'Data Engineer'
default_role = bourne_dream_analysis
default_warehouse = bourne_dream_analysis_warehouse_xsmall;

use role securityadmin;

grant usage, monitor on warehouse bourne_dream_analysis_warehouse_xsmall to role _bourne_dream_analysis_warehouse_xsmall__warehouse__usage;
GRANT ROLE _bourne_dream_analysis_warehouse_xsmall__warehouse__usage TO ROLE _bourne_dream_analysis_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse bourne_dream_analysis_warehouse_xsmall to role _bourne_dream_analysis_warehouse_xsmall__warehouse__operator;

GRANT ROLE _bourne_dream_analysis_warehouse_xsmall__warehouse__usage TO ROLE bourne_dream_analysis;
GRANT ROLE _haven_base__plot__reader TO ROLE bourne_dream_analysis;
GRANT ROLE _haven_base__aztec_complex__reader TO ROLE bourne_dream_analysis;
GRANT ROLE _haven_base__aztec_retail__reader TO ROLE bourne_dream_analysis;
GRANT ROLE _bourne_base__aztec__reader TO ROLE bourne_dream_analysis;
grant role _haven_base__dream_rockleyboatpark__reader to role bourne_dream_analysis;
GRANT ROLE _warner_base__maestro__reader TO ROLE bourne_dream_analysis;
--GRANT ROLE _bourne_base__dream__reader TO ROLE bourne_dream_analysis;

GRANT ROLE bourne_dream_analysis TO ROLE dba;

GRANT USAGE ON DATABASE bourne_dream_analysis TO ROLE _bourne_dream_analysis__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE bourne_dream_analysis TO ROLE _bourne_dream_analysis__usage;
GRANT ROLE _bourne_dream_analysis__usage TO ROLE _bourne_dream_analysis__schema;
GRANT CREATE SCHEMA ON DATABASE bourne_dream_analysis TO ROLE _bourne_dream_analysis__schema;
GRANT SELECT ON future TABLES IN DATABASE bourne_dream_analysis TO ROLE _bourne_dream_analysis__usage;
GRANT SELECT ON future VIEWS IN DATABASE bourne_dream_analysis TO ROLE _bourne_dream_analysis__usage;
GRANT SELECT ON all VIEWS IN DATABASE bourne_dream_analysis TO ROLE _bourne_dream_analysis__usage;
GRANT USAGE ON future STAGES IN DATABASE bourne_dream_analysis TO ROLE _bourne_dream_analysis__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE bourne_dream_analysis TO ROLE _bourne_dream_analysis__usage;
GRANT USAGE ON ALL FILE FORMATS IN DATABASE bourne_dream_analysis TO ROLE _bourne_dream_analysis__usage;

GRANT ROLE  _bourne_dream_analysis__schema TO ROLE dba;
USE ROLE dba;
CREATE SCHEMA bourne_dream_analysis.staging_data;

use role securityadmin;
GRANT CREATE TASK ON SCHEMA bourne_dream_analysis.staging_data TO ROLE _bourne_dream_analysis__schema;
GRANT CREATE STAGE ON SCHEMA bourne_dream_analysis.staging_data TO ROLE _bourne_dream_analysis__schema;
GRANT CREATE PIPE ON SCHEMA bourne_dream_analysis.staging_data TO ROLE _bourne_dream_analysis__schema;
GRANT CREATE FILE format ON SCHEMA bourne_dream_analysis.staging_data TO ROLE _bourne_dream_analysis__schema;
GRANT CREATE stream ON SCHEMA bourne_dream_analysis.staging_data TO ROLE _bourne_dream_analysis__schema;


grant create file format on schema  to role %s" % (nameSpace, schemaCreatorRole)
    createStageSQL   = "grant create stage on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createPipeSQL    = "grant create pipe on schema %s to role %s" % (nameSpace, schemaCreatorRole)
    createStreamSQL  = "grant create stream on schema %s to role %s" % (nam

GRANT ROLE bourne_dream_analysis TO ROLE bourne_dream_analysis_PrasathNatarajan;
GRANT ROLE _bourne_dream_analysis__schema TO ROLE bourne_dream_analysis_PrasathNatarajan;
GRANT ROLE bourne_dream_analysis TO ROLE bourne_dream_analysis_PrabhuramRamaiyanrengia;
GRANT ROLE _bourne_dream_analysis__schema TO ROLE bourne_dream_analysis_PrabhuramRamaiyanrengia;

GRANT ROLE bourne_dream_analysis_PrabhuramRamaiyanrengia TO USER PrabhuramRamaiyanrengia;
GRANT ROLE bourne_dream_analysis_PrasathNatarajan TO USER PrasathNatarajan

