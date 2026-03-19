use role dba;

USE ROLE sysadmin;

CREATE WAREHOUSE warner_data_management_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _warner_data_management_warehouse_xsmall__warehouse__operator;
create role _warner_data_management_warehouse_xsmall__warehouse__usage;

use role sysadmin;
grant usage, monitor on warehouse warner_data_management_warehouse_xsmall to role _warner_data_management_warehouse_xsmall__warehouse__usage;
grant operate, modify on warehouse warner_data_management_warehouse_xsmall to role _warner_data_management_warehouse_xsmall__warehouse__operator;

use role useradmin;
create role warner_data_management;

create user yogenrana
login_name = 'yogen.rana@bourne-leisure.co.uk'
display_name = 'Yogen Rana'
email = 'yogen.rana@bourne-leisure.co.uk'
comment = 'Warner Head of Data'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

use role securityadmin;

grant role _warner_data_management_warehouse_xsmall__warehouse__usage to role _warner_data_management_warehouse_xsmall__warehouse__operator;
grant role _warner_base__qualtrics__reader to role warner_data_management;
grant role _warner_base__seaware__reader to role warner_data_management;
grant role _warner_base__maestro__reader to role warner_data_management;
grant role _warner_data_management_warehouse_xsmall__warehouse__operator to role warner_data_management;

grant role warner_data_management to user yogenrana;

use role useradmin;

create user shaunkelly
login_name = 'shaun.kelly@bourne-leisure.co.uk'
display_name = 'Shaun Kelly'
email = 'shaun.kelly@bourne-leisure.co.uk'
comment = 'Head of IT Architecture'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

use role securityadmin;

grant role warner_data_management to user shaunkelly;

use ROLE useradmin;

--kevin.judge@bourne-leisure.co.uk
--Kevin Judge
create user KevinJudge
login_name = 'kevin.judge@bourne-leisure.co.uk'
display_name = 'Kevin Judge'
email = 'kevin.judge@bourne-leisure.co.uk'
comment = 'Warner Technology Director'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--nigel.nyatsanza@bourne-leisure.co.uk
--Nigel Nyatsanza
create user NigelNyatsanza
login_name = 'nigel.nyatsanza@bourne-leisure.co.uk'
display_name = 'Nigel Nyatsanza'
email = 'nigel.nyatsanza@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--sanda.ikegulu@bourne-leisure.co.uk
--Sanda Ikegulu

USE ROLE useradmin;
DROP USER sandaIkegulu;

create user SandraIkegulu
login_name = 'sandra.ikegulu@bourne-leisure.co.uk'
display_name = 'Sandra Ikegulu'
email = 'sandra.ikegulu@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--vishal.jakhar@bourne-leisure.co.uk
--Vishal Jakhar
create user VishalJakhar
login_name = 'vishal.jakhar@bourne-leisure.co.uk'
display_name = 'Vishal Jakhar'
email = 'vishal.jakhar@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--pawan.kumar@bourne-leisure.co.uk
--Pawan Kumar
create user PawanKumar
login_name = 'pawan.kumar@bourne-leisure.co.uk'
display_name = 'Pawan Kumar'
email = 'pawan.kumar@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

--von.branton@bourne-leisure.co.uk
--Von Branton
create user VonBranton
login_name = 'von.branton@bourne-leisure.co.uk'
display_name = 'Von Branton'
email = 'von.branton@bourne-leisure.co.uk'
comment = 'Warner Data Management'
default_role = warner_data_management
default_warehouse = warner_data_management_warehouse_xsmall;

USE ROLE securityadmin;
grant role warner_data_management to user KevinJudge;
grant role warner_data_management to user NigelNyatsanza;
grant role warner_data_management to user SandraIkegulu;
grant role warner_data_management to user VishalJakhar;
grant role warner_data_management to user PawanKumar;
grant role warner_data_management to user VonBranton;

