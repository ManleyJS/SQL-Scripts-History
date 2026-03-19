USE ROLE sysadmin;

CREATE WAREHOUSE haven_plot_development_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE DATABASE haven_plot_development;
CREATE OR REPLACE SCHEMA haven_plot_development.staging_data;

use role useradmin;

create role _haven_plot_development_warehouse_xsmall__warehouse__operator;
create role _haven_plot_development_warehouse_xsmall__warehouse__usage;

create role haven_plot_development;

CREATE ROLE _haven_plot_development__usage;
CREATE ROLE _haven_plot_development__schema;

create role haven_plot_development_SandraHarding;
create role haven_plot_development_DavinaRenouf;
create role haven_plot_development_PhilHall;
create role haven_plot_development_AvaisBashir;
create role haven_plot_development_LukeWaller;
create role haven_plot_development_RichardSavage;
create role haven_plot_development_testuser;


-- Sandra Harding
-- sandra.harding@bourne-leisure.co.uk

create user SandraHarding
login_name = 'sandra.harding@bourne-leisure.co.uk'
display_name = 'Sandra Harding'
email = 'sandra.harding@bourne-leisure.co.uk'
comment = 'Haven Plot Development Assistant'
default_role = haven_plot_development_sandraharding
default_warehouse = haven_plot_development_warehouse_xsmall
;

ALTER USER SandraHarding
SET default_role = haven_plot_development_SandraHarding,
comment = 'Haven Plot Development Assistant',
default_warehouse = haven_plot_development_warehouse_xsmall;

-- Davina Renouf
-- davina.renouf@bourne-leisure.co.uk

create user DavinaRenouf
login_name = 'davina.renouf@bourne-leisure.co.uk'
display_name = 'Davina Renouf'
email = 'davina.renouf@bourne-leisure.co.uk'
comment = 'Haven Plot Product Manager'
default_role = haven_plot_development_DavinaRenouf
default_warehouse = haven_plot_development_warehouse_xsmall
;

-- Phil Hall
-- phil.hall@bourne-leisure.co.uk

create user PhilHall
login_name = 'phil.hall@bourne-leisure.co.uk'
display_name = 'Phil Hall'
email = 'phil.hall@bourne-leisure.co.uk'
comment = 'Haven Plot External Support'
default_role = haven_plot_development_PhilHall
default_warehouse = haven_plot_development_warehouse_xsmall
;

-- Avais Bashir
-- avais.bashir@haven.com

create user AvaisBashir
login_name = 'avais.bashir@haven.com'
display_name = 'Avais Bashir'
email = 'avais.bashir@haven.com'
comment = 'Haven Plot Tester'
default_role = haven_plot_development_AvaisBashir
default_warehouse = haven_plot_development_warehouse_xsmall
;

-- Luke Waller
-- luke.waller@haven.com

create user LukeWaller
login_name = 'luke.waller@haven.com'
display_name = 'Luke Waller'
email = 'luke.waller@haven.com'
comment = 'Haven Plot Product Operations'
default_role = haven_plot_development_LukeWaller
default_warehouse = haven_plot_development_warehouse_xsmall
;

-- Richard Savage
-- richard.savage@bourne-leisure.co.uk

create user RichardSavage
login_name = 'richard.savage@bourne-leisure.co.uk'
display_name = 'Richard Savage'
email = 'richard.savage@bourne-leisure.co.uk'
comment = 'Haven Plot Senior Product Operations'
default_role = haven_plot_development_RichardSavage
default_warehouse = haven_plot_development_warehouse_xsmall
;

use role securityadmin;

grant usage, monitor on warehouse haven_plot_development_warehouse_xsmall to role _haven_plot_development_warehouse_xsmall__warehouse__usage;
GRANT ROLE _haven_plot_development_warehouse_xsmall__warehouse__usage TO ROLE _haven_plot_development_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_plot_development_warehouse_xsmall to role _haven_plot_development_warehouse_xsmall__warehouse__operator;

GRANT ROLE _haven_plot_development_warehouse_xsmall__warehouse__usage TO ROLE haven_plot_development;
GRANT ROLE _haven_base__plot__reader TO ROLE haven_plot_development;

GRANT USAGE ON DATABASE haven_plot_development TO ROLE _haven_plot_development__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_plot_development TO ROLE _haven_plot_development__usage;
GRANT USAGE ON all SCHEMAS IN DATABASE haven_plot_development TO ROLE _haven_plot_development__usage;
GRANT ROLE _haven_plot_development__usage TO ROLE _haven_plot_development__schema;
GRANT CREATE SCHEMA ON DATABASE haven_plot_development TO ROLE _haven_plot_development__schema;
GRANT SELECT ON future TABLES IN DATABASE haven_plot_development TO ROLE _haven_plot_development__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_plot_development TO ROLE _haven_plot_development__usage;
GRANT SELECT ON all VIEWS IN DATABASE haven_plot_development TO ROLE _haven_plot_development__usage;
GRANT USAGE ON future STAGES IN DATABASE haven_plot_development TO ROLE _haven_plot_development__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE haven_plot_development TO ROLE _haven_plot_development__usage;
GRANT USAGE ON ALL FILE FORMATS IN DATABASE haven_plot_development TO ROLE _haven_plot_development__usage;
GRANT CREATE TASK ON SCHEMA haven_plot_development.staging_data TO ROLE _haven_plot_development__schema;
GRANT ROLE taskadmin TO ROLE  _haven_plot_development__schema;

grant role _haven_plot_development__usage to role haven_plot_development;
REVOKE ROLE haven_plot_development from USER SandraHarding;

grant role _haven_plot_development__schema to role haven_plot_development_SandraHarding;
grant role haven_plot_development to role haven_plot_development_SandraHarding;
grant role _haven_plot_development__schema to role haven_plot_development_DavinaRenouf;
grant role haven_plot_development to role haven_plot_development_DavinaRenouf;
grant role _haven_plot_development__schema to role haven_plot_development_PhilHall;
grant role haven_plot_development to role haven_plot_development_PhilHall;
grant role _haven_plot_development__schema to role haven_plot_development_AvaisBashir;
grant role haven_plot_development to role haven_plot_development_AvaisBashir;
grant role _haven_plot_development__schema to role haven_plot_development_LukeWaller;
grant role haven_plot_development to role haven_plot_development_LukeWaller;
grant role _haven_plot_development__schema to role haven_plot_development_RichardSavage;
grant role haven_plot_development to role haven_plot_development_RichardSavage;

grant role haven_plot_development_SandraHarding to user SandraHarding;
grant role haven_plot_development_DavinaRenouf to user DavinaRenouf;
grant role haven_plot_development_PhilHall to user PhilHall;
grant role haven_plot_development_AvaisBashir to user AvaisBashir;
grant role haven_plot_development_LukeWaller to user LukeWaller;
grant role haven_plot_development_RichardSavage to user	RichardSavage;

grant role _haven_plot_development__schema to role haven_plot_development_testuser;
grant role haven_plot_development to role haven_plot_development_testuser;
GRANT ROLE haven_plot_development_testuser TO ROLE dba;


