USE ROLE sysadmin;

CREATE DATABASE bourne_governance;

USE ROLE useradmin;

CREATE ROLE _bourne_governance__usage;
CREATE ROLE _bourne_governance__schema;
CREATE ROLE bourne_governance_simonjones;

USE ROLE SECURITYadmin;

SHOW USERS LIKE 'simon%';
GRANT USAGE ON DATABASE bourne_governance TO ROLE _bourne_governance__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE bourne_governance TO ROLE _bourne_governance__usage;
GRANT ROLE _bourne_governance__usage TO ROLE _bourne_governance__schema;
GRANT CREATE SCHEMA ON DATABASE bourne_governance TO ROLE _bourne_governance__schema;
GRANT SELECT ON future TABLES IN DATABASE bourne_governance TO ROLE _bourne_governance__usage;
GRANT SELECT ON all TABLES IN DATABASE bourne_governance TO ROLE _bourne_governance__usage;
GRANT SELECT ON future VIEWS IN DATABASE bourne_governance TO ROLE _bourne_governance__usage;
GRANT SELECT ON all VIEWS IN DATABASE bourne_governance TO ROLE _bourne_governance__usage;

REVOKE ROLE bourne_governance FROM USER simonjones;
GRANT ROLE bourne_governance TO ROLE bourne_governance_simonjones;
GRANT ROLE _bourne_governance__schema TO ROLE bourne_governance_simonjones;
GRANT ROLE bourne_governance_simonjones TO USER simonjones;

USE ROLE useradmin;

ALTER USER simonjones SET DEFAULT_ROLE = bourne_governance_simonjones;


USE ROLE useradmin;

CREATE ROLE bourne_governance_DonovanRansome;

-- donovan.ransome@haven.com
-- Donovan Ransome

create user DonovanRansome
login_name = 'donovan.ransome@haven.com'
display_name = 'Donovan Ransome'
email = 'donovan.ransome@haven.com'
comment = 'Senior Product Manager - Data Foundation'
default_warehouse = BOURNE_GOVERNANCE_WAREHOUSE_XSMALL
default_role = bourne_governance_DonovanRansome;

USE ROLE securityadmin;

GRANT ROLE bourne_governance TO ROLE bourne_governance_DonovanRansome;
GRANT ROLE _bourne_governance__schema TO ROLE bourne_governance_DonovanRansome;
GRANT ROLE bourne_governance_DonovanRansome TO USER DonovanRansome;


-- 06/05/2025

USE ROLE useradmin;

CREATE ROLE bourne_governance_iancoleman;

-- Ian Coleman
-- ian.coleman@haven.com
-- Business Analyst

create user iancoleman
login_name = 'ian.coleman@haven.com'
display_name = 'Ian Coleman'
email = 'ian.coleman@haven.com'
comment = 'Business Analyst'
default_warehouse = BOURNE_GOVERNANCE_WAREHOUSE_XSMALL
default_role = bourne_governance_IanColeman;

USE ROLE securityadmin;

GRANT ROLE bourne_governance TO ROLE bourne_governance_iancoleman;
GRANT ROLE _bourne_governance__schema TO ROLE bourne_governance_iancoleman;
GRANT ROLE bourne_governance_iancoleman TO USER iancoleman;

