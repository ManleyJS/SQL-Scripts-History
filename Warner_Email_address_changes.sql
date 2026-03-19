--24/05/2024

USE ROLE useradmin;
alter user RhiannonDavies
SET login_name = 'Rhiannon.Davies@warnerhotels.com',
email = 'Rhiannon.Davies@warnerhotels.com';

--28/05/2024

USE ROLE useradmin;
SHOW USERS LIKE 'robcummins';
alter user robcummins
SET login_name = 'rob.cummins@warnerhotels.com',
email = 'rob.cummins@warnerhotels.com';

--28/05/2024

USE ROLE useradmin;
SHOW USERS LIKE 'yogen%';
alter user YOGENRANA
SET login_name = 'yogen.rana@warnerhotels.com',
email = 'yogen.rana@warnerhotels.com';

--01/07/2024

USE ROLE useradmin;
SHOW USERS LIKE '%webb%';
alter user MATTHEWWEBB
SET login_name = 'Matthew.Webb@warnerhotels.com',
email = 'Matthew.Webb@warnerhotels.com';


-- 28/08/2024

SHOW USERS LIKE '%pest%';
alter user RODPESTELL
SET login_name = 'rod.pestell@warnerhotels.com',
email = 'rod.pestell@warnerhotels.com';

-- WARNER_INSIGHTS_ANALYTICS
-- WARNER_INSIGHTS_ANALYTICS_WAREHOUSE_XSMALL

USE ROLE securityadmin; 

GRANT ROLE WARNER_INSIGHTS_ANALYTICS TO USER rodpestell;

USE ROLE useradmin;

alter user RODPESTELL
SET default_role = WARNER_INSIGHTS_ANALYTICS,
default_warehouse = WARNER_INSIGHTS_ANALYTICS_WAREHOUSE_XSMALL;


-- 05/09/2024

USE ROLE useradmin;

SHOW USERS LIKE 'yash%';

alter user YASHVORA
SET login_name = 'yash.vora@warnerhotels.com',
email = 'yash.vora@warnerhotels.com';

-- 05/02/2025


USE ROLE useradmin;

SHOW USERS LIKE 'gyorg%';

alter user GYORGYRACZ
SET login_name = 'gyorgy.racz@warnerhotels.com',
email = 'gyorgy.racz@warnerhotels.com';

SHOW USERS LIKE 'sandra%';

sandra.ikegulu@warnerhotels.com

ALTER USER SANDRAIKEGULU
SET login_name = 'sandra.ikegulu@warnerhotels.com',
email = 'sandra.ikegulu@warnerhotels.com';


-- 06/02/2025

USE ROLE useradmin;

-- Shastiram Rajasekar
-- shastiram.rajasekar@bourne-leisure.co.uk 
-- shastiram.rajasekar@warnerhotels.com

SHOW USERS LIKE 'ShastiramRajasekar';

ALTER USER ShastiramRajasekar
SET login_name = 'shastiram.rajasekar@warnerhotels.com',
email = 'shastiram.rajasekar@warnerhotels.com';


-- Anu Sasi 
-- anu.sasi@bourne-leisure.co.uk 
-- anu.sasi@warnerhotels.com

SHOW USERS LIKE 'AnuSasi';

ALTER USER AnuSasi
SET login_name = 'anu.sasi@warnerhotels.com',
email = 'anu.sasi@warnerhotels.com';

-- Advait Kanitkar
-- advait.kanitkar@bourne-leisure.co.uk
-- advait.kanitkar@warnerhotels.com

SHOW USERS LIKE 'AdvaitKanitkar';

ALTER USER AdvaitKanitkar
SET login_name = 'advait.kanitkar@warnerhotels.com',
email = 'advait.kanitkar@warnerhotels.com';

-- 13/02/2025

USE ROLE useradmin;

SHOW USERS LIKE 'dion%';

ALTER USER DIONFRAGKOULIS
SET login_name = 'dion.fragkoulis@warnerhotels.com',
email = 'dion.fragkoulis@warnerhotels.com';

-- pranay.bagal@warnerhotels.com

SHOW USERS LIKE 'PRAN%';

ALTER USER PRANAYBAGAL
SET login_name = 'pranay.bagal@warnerhotels.com',
email = 'pranay.bagal@warnerhotels.com';


-- Dayasagar.Gandham@warnerhotels.com

SHOW USERS LIKE 'daya%';

ALTER USER DAYASAGARGANDHAM
SET login_name = 'Dayasagar.Gandham@warnerhotels.com',
email = 'Dayasagar.Gandham@warnerhotels.com';

-- 14/02/2025

USE ROLE useradmin;

-- vinod.barot@warnerhotels.com

SHOW USERS LIKE 'vinod%';

ALTER USER VINODBAROT
SET login_name = 'vinod.barot@warnerhotels.com',
email = 'vinod.barot@warnerhotels.com';

-- ankush.jadhav@warnerhotels.com

SHOW USERS LIKE 'ankush%';

ALTER USER ANKUSHJADHAV
SET login_name = 'ankush.jadhav@warnerhotels.com',
email = 'ankush.jadhav@warnerhotels.com';

-- mitesh.malu@warnerhotels.com

SHOW USERS LIKE 'mitesh%';

ALTER USER MITESHMALU
SET login_name = 'mitesh.malu@warnerhotels.com',
email = 'mitesh.malu@warnerhotels.com';

-- alam.khan@warnerhotels.com

SHOW USERS LIKE 'alam%';

ALTER USER alamkhan
SET login_name = 'alam.khan@warnerhotels.com',
email = 'alam.khan@warnerhotels.com';

-- vishal.jakhar@warnerhotels.com

ALTER USER vishaljakhar 
SET login_name = 'vishal.jakhar@warnerhotels.com',
email = 'vishal.jakhar@warnerhotels.com';

-- 17/02/2025

-- anup.khobragade@warnerhotels.com

USE ROLE useradmin;

SHOW USERS LIKE 'anup%';

ALTER USER ANUPKHOBRAGADE
SET login_name = 'anup.khobragade@warnerhotels.com',
email = 'anup.khobragade@warnerhotels.com';


-- abhijeet.japtap@warnerhotels.com

USE ROLE useradmin;

SHOW USERS LIKE 'abhijeetjaptap';

ALTER USER abhijeetjaptap 
SET login_name = 'abhijeet.japtap@warnerhotels.com',
email = 'abhijeet.japtap@warnerhotels.com';


-- 18/02/2025

USE ROLE useradmin;

--Ashwin Namewar 
-- ashwin.namewar@warnerhotels.com

SHOW USERS LIKE 'AshwinNamewar';

ALTER USER AshwinNamewar
SET login_name = 'ashwin.namewar@warnerhotels.com',
email = 'ashwin.namewar@warnerhotels.com';

--Jayanthi Pandiyan 
-- jayanthi.pandiyan@warnerhotels.com

SHOW USERS LIKE 'JayanthiPandiyan';

ALTER USER JayanthiPandiyan
SET login_name = 'jayanthi.pandiyan@warnerhotels.com',
email = 'jayanthi.pandiyan@warnerhotels.com';

--Naren Patel 
-- naren.patel@warnerhotels.com

SHOW USERS LIKE 'NarenPatel';

ALTER USER NarenPatel
SET login_name = 'naren.patel@warnerhotels.com',
email = 'naren.patel@warnerhotels.com';

--Sunil Sharma 
-- sunil.sharma@warnerhotels.com

SHOW USERS LIKE 'SunilSharma';

ALTER USER SunilSharma
SET login_name = 'sunil.sharma@warnerhotels.com',
email = 'sunil.sharma@warnerhotels.com';

--Sunil Shinde 
-- sunil.shinde@warnerhotels.com

SHOW USERS LIKE 'SunilShinde';

ALTER USER SunilShinde
SET login_name = 'sunil.shinde@warnerhotels.com',
email = 'sunil.shinde@warnerhotels.com';

-- 19/02/2025

-- ravindersingh
-- ravinder.singh@warnerhotels.com

USE ROLE useradmin;

SHOW USERS LIKE 'ravindersingh';

ALTER USER ravindersingh
SET login_name = 'ravinder.singh@warnerhotels.com',
email = 'ravinder.singh@warnerhotels.com';

-- 21/02/2025

-- sumitkokate
-- sumit.kokate@warnerhotels.com 

USE ROLE useradmin;

SHOW USERS LIKE 'sumitkokate';

ALTER USER sumitkokate
SET login_name = 'sumit.kokate@warnerhotels.com',
email = 'sumit.kokate@warnerhotels.com';

-- 11/03/2025

-- creating Tableau Service account

USE ROLE useradmin;

create user warner_tableau_service_account
login_name = 'warner.tableau.service.account'
display_name = 'Warner Tableau Service Account'
email = 'Ravinder.Singh@warnerhotels.com'
comment = 'Warner Tableau Service Account'
default_role = warner_bi_team
default_warehouse = WARNER_DBT_TRANSFORM_DEV_WAREHOUSE_XSMALL
TYPE = SERVICE
RSA_PUBLIC_KEY = 'MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA7Hv9faccQ/6ovvCTKGeZ
INp/JSzNZDFAlr1/b/uUEh48++T/8cD4aopdBD1OUFx7W1iqPvZGYVOYxWDqIdRi
AAQDXKRd9bISuChuD5tXcA/Xo3t6KTbauRIIH9EfxadcHVJxNjXkoaiz2lePhevl
YwW1NyYPd+NuoTS6wjwKuqDh5YFbfWx0pO7CbhnIcUcn5aco4ascOdVKb0e2uvw4
Fg4USFEolvjCorbG60B+Jqrm8YDFj+JtyAxuvhkWodb71BX7RpCnafke8CWISM33
zDbGCbeY3PxX+OrmgHfmybdaaumFHDkgBKs24sess6W/SU1lVB3MHzCav54WSR4W
ckx508uuhBQ1YQWsqsBxzMtSkvFv7D3E9uOxVHTe2nv7IgalpCeMKaPhBWElskXb
XBCXiSoovdE/refneUQNTLogzk5iVKK1mC8uS8Lo1Cyx54+1R3Rt0RbpwCIgzVow
2Grmn5F9SW8OkifraF5UKv7WduBjtHZvAN0XFcF/oF7DSTLbX/9eE+ID2kdCd4gF
sW3EM6+nHJ7D9DslXyx9QWWrX67AQcNZfxhtCkUlvqUMk1C0ZTA07e/Y6UieuIPN
l5fkXh0tev3ktLYosu3U++AP/TwtLUznZQugN4NJ6JVjMEIFCKqpFPWtD/Efauqd
uEDcUDugn3mFFWfC1LB/Z3UCAwEAAQ==';

USE ROLE securityadmin;

GRANT ROLE warner_bi_team TO USER warner_tableau_service_account;


-- 12/03/2025

-- amend user warner_tableau_service_account to have password

USE ROLE useradmin;

ALTER USER warner_tableau_service_account
SET password = '<REDACTED>',
TYPE = legacy_service;

------

USE ROLE useradmin;

SHOW USERS LIKE '';

ALTER USER 
SET login_name = '',
email = '',
TYPE = PERSON;
