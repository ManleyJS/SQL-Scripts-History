USE ROLE SYSADMIN;
USE DATABASE BUTLINS_RAW;
USE SCHEMA SEAWARE;

USE ROLE useradmin;

DROP ROLE butlins_base__seaware__derived;
DROP ROLE butlins_base__seaware__personal;
DROP ROLE butlins_base__seaware__sensitive;
DROP ROLE butlins_base__seaware__financial;

CREATE ROLE _butlins_base__seaware__derived;
CREATE ROLE _butlins_base__seaware__personal;
CREATE ROLE _butlins_base__seaware__sensitive;
CREATE ROLE _butlins_base__seaware__financial;

USE ROLE SYSADMIN;
USE DATABASE HAVEN_BASE;
USE SCHEMA PUBLIC;

DROP MASKING POLICY BUTLINS_BASE.SEAWARE.butlins_base__seaware__derived__policy;
DROP masking policy BUTLINS_BASE.SEAWARE.butlins_base__seaware__personal__policy;
DROP masking policy BUTLINS_BASE.SEAWARE.butlins_base__seaware__sensitive__policy;
DROP masking policy BUTLINS_BASE.SEAWARE.butlins_base__seaware__financial__policy;

USE ROLE SYSADMIN;
USE DATABASE BUTLINS_BASE;
USE SCHEMA SEAWARE;
create masking policy butlins_base__seaware__derived__policy as (columnValue string) returns string -> case when is_role_in_session('_BUTLINS_BASE__SEAWARE__DERIVED') then columnValue else '########' END;
create masking policy butlins_base__seaware__personal__policy as (columnValue string) returns string -> case when is_role_in_session('_BUTLINS_BASE__SEAWARE__PERSONAL') then columnValue else '########' END;
create masking policy butlins_base__seaware__sensitive__policy as (columnValue string) returns string -> case when is_role_in_session('_BUTLINS_BASE__SEAWARE__SENSITIVE') then columnValue else '########' END;
create masking policy butlins_base__seaware__financial__policy as (columnValue string) returns string -> case when is_role_in_session('_BUTLINS_BASE__SEAWARE__FINANCIAL') then columnValue else '########' END;

