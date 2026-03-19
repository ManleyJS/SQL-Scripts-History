use role useradmin;
CREATE ROLE warner_data_transform_SunilSharma;
CREATE ROLE warner_data_transform_DeepakGaikwad;
CREATE ROLE warner_data_transform_SumitGupta;
CREATE ROLE warner_data_transform_AnuSasi;

-- Anu.Sasi@bourne-leisure.co.uk
-- Anu Sasi
create user AnuSasi
login_name = 'Anu.Sasi@bourne-leisure.co.uk'
display_name = 'Anu Sasi'
email = 'Anu.Sasi@bourne-leisure.co.uk'
comment = 'Test Lead'
default_role = warner_data_transform_SumitGupta
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

-- Deepak.Gaikwad@bourne-leisure.co.uk
-- Deepak Gaikwad
create user DeepakGaikwad
login_name = 'Deepak.Gaikwad@bourne-leisure.co.uk'
display_name = 'Deepak Gaikwad'
email = 'Deepak.Gaikwad@bourne-leisure.co.uk'
comment = 'Senior data engineer'
default_role = warner_data_transform_DeepakGaikwad
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

-- Sunil.Sharma@bourne-leisure.co.uk
-- Sunil Sharma
create user SunilSharma
login_name = 'Sunil.Sharma@bourne-leisure.co.uk'
display_name = 'Sunil Sharma'
email = 'Sunil.Sharma@bourne-leisure.co.uk'
comment = 'Senior data engineer'
default_role = warner_data_transform_SunilSharma
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

-- Sumit.Gupta@bourne-leisure.co.uk
-- Sumit Gupta
create user SumitGupta
login_name = 'Sumit.Gupta@bourne-leisure.co.uk'
display_name = 'Sumit Gupta'
email = 'Sumit.Gupta@bourne-leisure.co.uk'
comment = 'Lead Data Engineer'
default_role = warner_data_transform_SumitGupta
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

use role securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_SunilSharma;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_DeepakGaikwad;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_SumitGupta;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_AnuSasi;

GRANT ROLE warner_data_transform TO ROLE warner_data_transform_SunilSharma;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_DeepakGaikwad;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_SumitGupta;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_AnuSasi;

GRANT ROLE warner_data_transform_SunilSharma TO USER SunilSharma;
GRANT ROLE warner_data_transform_DeepakGaikwad TO USER DeepakGaikwad; 
GRANT ROLE warner_data_transform_SumitGupta TO USER SumitGupta; 
GRANT ROLE warner_data_transform_AnuSasi TO USER AnuSasi;

SHOW GRANTS OF ROLE warner_data_transform;

-- new users 29-09-2023

use role useradmin;
CREATE ROLE warner_data_transform_AvinashRaut;
CREATE ROLE warner_data_transform_AbhijeetJaptap;

-- avinash.raut@bourne-leisure.co.uk
-- Avinash Raut
create user AvinashRaut
login_name = 'avinash.raut@bourne-leisure.co.uk'
display_name = 'Avinash Raut'
email = 'avinash.raut@bourne-leisure.co.uk'
comment = 'Data Test Engineer'
default_role = warner_data_transform_AvinashRaut
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

-- abhijeet.japtap@bourne-leisure.co.uk
-- Abhijeet Japtap
create user AbhijeetJaptap
login_name = 'abhijeet.japtap@bourne-leisure.co.uk'
display_name = 'Abhijeet Japtap'
email = 'abhijeet.japtap@bourne-leisure.co.uk'
comment = 'Senior BI developer'
default_role = warner_data_transform_AbhijeetJaptap
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

use role securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_AvinashRaut;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_AbhijeetJaptap;

GRANT ROLE warner_data_transform TO ROLE warner_data_transform_AvinashRaut;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_AbhijeetJaptap;

GRANT ROLE warner_data_transform_AvinashRaut TO USER AvinashRaut;
GRANT ROLE warner_data_transform_AbhijeetJaptap TO USER AbhijeetJaptap; 

use ROLE useradmin;

CREATE ROLE warner_data_transform_ArunyaMalar;

--Arunya Malar 
--Arunya.Malar@bourne-leisure.co.uk 

create user ArunyaMalar
login_name = 'Arunya.Malar@bourne-leisure.co.uk'
display_name = 'Arunya Malar'
email = 'Arunya.Malar@bourne-leisure.co.uk'
comment = 'Senior Test Engineer'
default_role = warner_data_transform_ArunyaMalar
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

use role securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_ArunyaMalar;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_ArunyaMalar;

GRANT ROLE warner_data_transform_ArunyaMalar TO USER ArunyaMalar; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER ArunyaMalar;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER ArunyaMalar;

USE ROLE useradmin;

CREATE ROLE WARNER_DATA_TRANSFORM_shaunkelly;

USE ROLE securityadmin;
GRANT ROLE WARNER_DATA_TRANSFORM TO ROLE WARNER_DATA_TRANSFORM_shaunkelly;
GRANT ROLE _WARNER_DATA_TRANSFORM__schema TO ROLE WARNER_DATA_TRANSFORM_shaunkelly;

GRANT ROLE WARNER_DATA_TRANSFORM_shaunkelly TO USER shaunkelly;

----
--dayasagar.gandham@bourne-leisure.co.uk
--Senior Data Engineer
--DayasagarGandham

use ROLE useradmin;

CREATE ROLE warner_data_transform_DayasagarGandham;

create user DayasagarGandham
login_name = 'dayasagar.gandham@bourne-leisure.co.uk'
display_name = 'Dayasagar Gandham'
email = 'dayasagar.gandham@bourne-leisure.co.uk'
comment = 'Senior Data Engineer'
default_role = warner_data_transform_dayasagargandham
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

use role securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_DayasagarGandham;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_DayasagarGandham;

GRANT ROLE warner_data_transform_DayasagarGandham TO USER DayasagarGandham; 

GRANT ROLE WARNER_BASE_DEV_DBT_RW TO USER DayasagarGandham;
GRANT ROLE WARNER_BASE_DEV_terraform_RW TO USER DayasagarGandham;

USE ROLE securityadmin;

SHOW GRANTS TO USER arunyamalar;
SHOW GRANTS TO USER AnkushJadhav;
SHOW GRANTS TO USER DAYASAGARGANDHAM;
SHOW USERS LIKE '%AnkushJadhav%';

SHOW GRANTS TO ROLE WARNER_DATA_TRANSFORM_ANKUSHJADHAV;

SHOW USERS LIKE '%Dayasagar%';

-- 
--AnkushJadhav

use ROLE useradmin;

CREATE ROLE warner_data_transform_AnkushJadhav;

use role securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_AnkushJadhav;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_AnkushJadhav;

GRANT ROLE warner_data_transform_AnkushJadhav TO USER AnkushJadhav; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER AnkushJadhav;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER AnkushJadhav;


use ROLE useradmin;

CREATE ROLE warner_data_transform_AnkushJadhav;


--sumitkokate
--sumit.kokate@bourne-leisure.co.uk

USE ROLE useradmin;

create role warner_data_transform_sumitkokate;

create user sumitkokate
login_name = 'sumit.kokate@bourne-leisure.co.uk'
display_name = 'Sumit Kokate'
email = 'sumit.kokate@bourne-leisure.co.uk'
comment = 'Dataction'
default_role = warner_data_transform_sumitkokate
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

--jayanthipandiyan
--jayanthi.pandiyan@bourne-leisure.co.uk

create role warner_data_transform_jayanthipandiyan;

create user jayanthipandiyan
login_name = 'jayanthi.pandiyan@bourne-leisure.co.uk'
display_name = 'Jayanthi Pandiyan'
email = 'jayanthi.pandiyan@bourne-leisure.co.uk'
comment = 'Dataction BI Tester'
default_role = warner_data_transform_jayanthipandiyan
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

--MimuMajumdar
--Mimu.Majumdar@bourne-leisure.co.uk

create role warner_data_transform_MimuMajumdar;

create user MimuMajumdar
login_name = 'Mimu.Majumdar@bourne-leisure.co.uk'
display_name = 'Mimu Majumdar'
email = 'Mimu.Majumdar@bourne-leisure.co.uk'
comment = 'Dataction BI Tester'
default_role = warner_data_transform_MimuMajumdar
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

--Advaitkanitkar
--Advait.kanitkar@bourne-leisure.co.uk

create role warner_data_transform_Advaitkanitkar;

create user Advaitkanitkar
login_name = 'Advait.kanitkar@bourne-leisure.co.uk'
display_name = 'Advait Kanitkar'
email = 'Advait.kanitkar@bourne-leisure.co.uk'
comment = 'Dataction Test Consultant'
default_role = warner_data_transform_Advaitkanitkar
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;


use role securityadmin;
--warner_data_transform_sumitkokate
--sumitkokate

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_sumitkokate;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_sumitkokate;

GRANT ROLE warner_data_transform_sumitkokate TO USER sumitkokate; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER sumitkokate;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER sumitkokate;

--warner_data_transform_jayanthipandiyan
--jayanthipandiyan

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_jayanthipandiyan;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_jayanthipandiyan;

GRANT ROLE warner_data_transform_jayanthipandiyan TO USER jayanthipandiyan; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER jayanthipandiyan;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER jayanthipandiyan;

--warner_data_transform_MimuMajumdar
--MimuMajumdar

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_MimuMajumdar;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_MimuMajumdar;

GRANT ROLE warner_data_transform_MimuMajumdar TO USER MimuMajumdar; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER MimuMajumdar;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER MimuMajumdar;

--warner_data_transform_Advaitkanitkar
--Advaitkanitkar

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_Advaitkanitkar;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_Advaitkanitkar;

GRANT ROLE warner_data_transform_Advaitkanitkar TO USER Advaitkanitkar; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER Advaitkanitkar;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER Advaitkanitkar;

SHOW GRANTS TO USER Advaitkanitkar;

---- 13052024

--Nikunj Mistry
--nikunj.mistry@bourne-leisure.co.uk
--Project Manager

USE ROLE useradmin;

create role warner_data_transform_NikunjMistry;

create user NikunjMistry
login_name = 'nikunj.mistry@bourne-leisure.co.uk'
display_name = 'Nikunj Mistry'
email = 'nikunj.mistry@bourne-leisure.co.uk'
comment = 'Project Manager'
default_role = warner_data_transform_NikunjMistry
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_NikunjMistry;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_NikunjMistry;

GRANT ROLE warner_data_transform_NikunjMistry TO USER NikunjMistry; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER NikunjMistry;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER NikunjMistry;

--Pranay Bagal
--pranay.bagal@bourne-leisure.co.uk
--Developer
USE ROLE useradmin;

create role warner_data_transform_PranayBagal;

create USER PranayBagal 
login_name = 'pranay.bagal@bourne-leisure.co.uk'
display_name = 'Pranay Bagal'
email = 'pranay.bagal@bourne-leisure.co.uk'
comment = 'Developer'
default_role = warner_data_transform_PranayBagal
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_PranayBagal;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_PranayBagal;

GRANT ROLE warner_data_transform_PranayBagal TO USER PranayBagal; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER PranayBagal;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER PranayBagal;

--Alam Khan
--alam.khan@bourne-leisure.co.uk 
--SAS Consultant
USE ROLE useradmin;

create role warner_data_transform_AlamKhan;

create USER AlamKhan 
login_name = 'alam.khan@bourne-leisure.co.uk'
display_name = 'Alam Khan'
email = 'alam.khan@bourne-leisure.co.uk'
comment = 'SAS Consultant'
default_role = warner_data_transform_AlamKhan
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_AlamKhan;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_AlamKhan;

GRANT ROLE warner_data_transform_AlamKhan TO USER AlamKhan; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER AlamKhan;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER AlamKhan;

--Abhijeet Japtap
--abhijeet.japtap@bourne-leisure.co.uk
--BI Developer
USE ROLE useradmin;

SHOW USERS LIKE 'AbhijeetJaptap';

SHOW GRANTS TO USER AbhijeetJaptap;

create role warner_data_transform_AbhijeetJaptap;

create user AbhijeetJaptap
login_name = 'abhijeet.japtap@bourne-leisure.co.uk'
display_name = 'Abhijeet Japtap'
email = 'abhijeet.japtap@bourne-leisure.co.uk'
comment = 'BI Developer'
default_role = warner_data_transform_AbhijeetJaptap
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_AbhijeetJaptap;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_AbhijeetJaptap;

GRANT ROLE warner_data_transform_AbhijeetJaptap TO USER AbhijeetJaptap; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER AbhijeetJaptap;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER AbhijeetJaptap;

--Sunil Markandeya
--sunil.markandeya@bourne-leisure.co.uk
--Senior Snowflake Engineer
USE ROLE useradmin;

create role warner_data_transform_SunilMarkandeya;

create user SunilMarkandeya
login_name = 'sunil.markandeya@bourne-leisure.co.uk'
display_name = 'Sunil Markandeya'
email = 'sunil.markandeya@bourne-leisure.co.uk'
comment = 'Senior Snowflake Engineer'
default_role = warner_data_transform_SunilMarkandeya
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_SunilMarkandeya;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_SunilMarkandeya;

GRANT ROLE warner_data_transform_SunilMarkandeya TO USER SunilMarkandeya; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER SunilMarkandeya;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER SunilMarkandeya;


--03/06/2024

-- Utsav Solanki
-- utsav.solanki@warnerhotels.com
-- Senior BI developer

USE ROLE useradmin;

create role warner_data_transform_UtsavSolanki;

create user UtsavSolanki
login_name = 'utsav.solanki@warnerhotels.com'
display_name = 'Utsav Solanki'
email = 'utsav.solanki@warnerhotels.com'
comment = 'Senior BI developer'
default_role = warner_data_transform_UtsavSolanki
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_UtsavSolanki;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_UtsavSolanki;

GRANT ROLE warner_data_transform_UtsavSolanki TO USER UtsavSolanki; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER UtsavSolanki;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER UtsavSolanki;

-- Balaji Santhanam
-- balaji.santhanam@bourne-leisure.co.uk
-- Data Business Analyst

USE ROLE useradmin;

create role warner_data_transform_BalajiSanthanam;

create user BalajiSanthanam
login_name = 'balaji.santhanam@bourne-leisure.co.uk'
display_name = 'Balaji Santhanam'
email = 'balaji.santhanam@bourne-leisure.co.uk'
comment = 'Data Business Analyst'
default_role = warner_data_transform_BalajiSanthanam
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_BalajiSanthanam;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_BalajiSanthanam;

GRANT ROLE warner_data_transform_BalajiSanthanam TO USER BalajiSanthanam; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER BalajiSanthanam;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER BalajiSanthanam;

-- 06/06/2024

-- Nitish Pradhan
-- nitish.pradhan@warnerhotels.com
-- Sr. Snowflake Engineer

USE ROLE useradmin;

create role warner_data_transform_NitishPradhan;

create user NitishPradhan
login_name = 'nitish.pradhan@warnerhotels.com'
display_name = 'Nitish Pradhan'
email = 'nitish.pradhan@warnerhotels.com'
comment = 'Sr. Snowflake Engineer'
default_role = warner_data_transform_NitishPradhan
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_NitishPradhan;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_NitishPradhan;

GRANT ROLE warner_data_transform_NitishPradhan TO USER NitishPradhan; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER NitishPradhan;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER NitishPradhan;

-- Chandra Javaraiah
-- chandra.javaraiah@warnerhotels.com
-- Sr. Snowflake Engineer

USE ROLE useradmin;

create role warner_data_transform_ChandraJavaraiah;

create USER ChandraJavaraiah
login_name = 'chandra.javaraiah@warnerhotels.com'
display_name = 'Chandra Javaraiah'
email = 'chandra.javaraiah@warnerhotels.com'
comment = 'Sr. Snowflake Engineer'
default_role = warner_data_transform_ChandraJavaraiah
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_ChandraJavaraiah;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_ChandraJavaraiah;

GRANT ROLE warner_data_transform_ChandraJavaraiah TO USER ChandraJavaraiah; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER ChandraJavaraiah;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER ChandraJavaraiah;

--18/06/2024
USE ROLE securityadmin;

GRANT ROLE WARNER_DBT_TRANSFORM_DEV TO USER ChandraJavaraiah;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM_DEV TO USER ChandraJavaraiah;

GRANT ROLE WARNER_DBT_TRANSFORM_DEV TO USER NITISHPRADHAN;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM_DEV TO USER NITISHPRADHAN;

--03/07/2024

-- Sonika Jain
-- sonika.jain@bourne-leisure.co.uk
-- Sr. Snowflake Engineer (MDM)

USE ROLE useradmin;

create role warner_data_transform_SonikaJain;

create USER SonikaJain
login_name = 'sonika.jain@bourne-leisure.co.uk'
display_name = 'Sonika Jain'
email = 'sonika.jain@bourne-leisure.co.uk'
comment = 'Sr. Snowflake Engineer (MDM)'
default_role = warner_data_transform_SonikaJain
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_SonikaJain;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_SonikaJain;

GRANT ROLE warner_data_transform_SonikaJain TO USER SonikaJain; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER SonikaJain;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER SonikaJain;

-- Preetam Kulkarni
-- preetam.kulkarni1@bourne-leisure.co.uk
-- Sr. Snowflake Engineer (MDM)

USE ROLE useradmin;

create role warner_data_transform_PreetamKulkarni;

create USER PreetamKulkarni
login_name = 'preetam.kulkarni1@bourne-leisure.co.uk'
display_name = 'Preetam Kulkarni'
email = 'preetam.kulkarni1@bourne-leisure.co.uk'
comment = 'Sr. Snowflake Engineer (MDM)'
default_role = warner_data_transform_PreetamKulkarni
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_PreetamKulkarni;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_PreetamKulkarni;

GRANT ROLE warner_data_transform_PreetamKulkarni TO USER PreetamKulkarni; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER PreetamKulkarni;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER PreetamKulkarni;

-- 16/07/2024

-- Ravinder Singh
-- ravinder.singh@bourne-leisure.co.uk
-- BI Business Analyst

USE ROLE useradmin;

create role warner_data_transform_RavinderSingh;

create USER RavinderSingh
login_name = 'ravinder.singh@bourne-leisure.co.uk'
display_name = 'Ravinder Singh'
email = 'ravinder.singh@bourne-leisure.co.uk'
comment = 'BI Business Analyst'
default_role = warner_data_transform_RavinderSingh
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_RavinderSingh;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_RavinderSingh;

GRANT ROLE warner_data_transform_RavinderSingh TO USER RavinderSingh; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER RavinderSingh;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER RavinderSingh;


-- 01/08/2024

-- mdsaif
-- md.saif@warnerhotels.com
-- BI Developer

USE ROLE useradmin;

create role warner_data_transform_mdsaif;

create USER mdsaif 
login_name = 'md.saif@warnerhotels.com'
display_name = 'Md Saif'
email = 'md.saif@warnerhotels.com'
comment = 'BI Developer'
default_role = warner_data_transform_mdsaif
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_mdsaif;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_mdsaif;

GRANT ROLE warner_data_transform_mdsaif TO USER mdsaif; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER mdsaif;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER mdsaif;

USE ROLE useradmin;

ALTER USER mdsaif
SET login_name = 'md.saif@bourne_leisure.co.uk';

ALTER USER mdsaif
SET login_name = 'md.saif@warnerhotels.com';


-- 01/08/2024

-- vinod.barot
-- vinod.barot@bourne-leisure.co.uk
-- Test Engineer

USE ROLE useradmin;

create role warner_data_transform_vinodbarot;

create USER vinodbarot 
login_name = 'vinod.barot@bourne-leisure.co.uk'
display_name = 'Vinod Barot'
email = 'vinod.barot@bourne-leisure.co.uk'
comment = 'Test Engineer'
default_role = warner_data_transform_vinodbarot
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_vinodbarot;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_vinodbarot;

GRANT ROLE warner_data_transform_vinodbarot TO USER vinodbarot; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER vinodbarot;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER vinodbarot;

-- 21/08/2024

-- Yash Vora
-- yash.vora@warnerhotels.com
-- Sr. Snowflake Engineer

USE ROLE useradmin;

create role warner_data_transform_YashVora;

create USER  YashVora
login_name = 'yash.vora@warnerhotels.com'
display_name = 'Yash Vora'
email = 'yash.vora@warnerhotels.com'
comment = 'Sr. Snowflake Engineer'
default_role = warner_data_transform_YashVora
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

-- 27/08/2024
ALTER USER YashVora
SET login_name = 'vora.yash@bourne-leisure.co.uk',
email = 'vora.yash@bourne-leisure.co.uk';


USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_YashVora;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_YashVora;

GRANT ROLE warner_data_transform_YashVora TO USER YashVora; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER YashVora;
GRANT ROLE WARNER_BASE_DEV_terraform_RO TO USER YashVora;

GRANT ROLE WARNER_DBT_TRANSFORM_DEV TO USER YashVora;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM_DEV TO USER YashVora;


-- 
-- 
-- 

USE ROLE useradmin;

create role warner_data_transform_;

create USER  
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = warner_data_transform_
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_;

GRANT ROLE warner_data_transform_ TO USER ; 

GRANT ROLE WARNER_BASE_DEV_DBT_RW TO USER ;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RW TO USER ;
GRANT ROLE WARNER_DBT_TRANSFORM TO USER ;
GRANT ROLE WARNER_STORE_DEV_DBT_RW TO USER ;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RW TO USER ;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM TO USER ;

-- 20/09/2024

-- Akshay Narula
-- akshay.narula@bourne-leisure.co.uk
-- Sr Data Engineer (Integration)

USE ROLE useradmin;

SHOW GRANTS TO user sunilsharma;

create role warner_data_transform_AkshayNarula;

create USER  AkshayNarula
login_name = 'akshay.narula@bourne-leisure.co.uk'
display_name = 'Akshay Narula'
email = 'akshay.narula@bourne-leisure.co.uk'
comment = 'Sr Data Engineer (Integration)'
default_role = warner_data_transform_AkshayNarula
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;
GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_AkshayNarula;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_AkshayNarula;

GRANT ROLE warner_data_transform_AkshayNarula TO USER AkshayNarula; 

GRANT ROLE WARNER_BASE_DEV_DBT_RW TO USER AkshayNarula;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RW TO USER AkshayNarula;
GRANT ROLE WARNER_DBT_TRANSFORM TO USER AkshayNarula;
GRANT ROLE WARNER_STORE_DEV_DBT_RW TO USER AkshayNarula;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RW TO USER AkshayNarula;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM TO USER AkshayNarula;

GRANT ROLE WARNER_DBT_TRANSFORM_DEV TO USER AkshayNarula;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM_DEV TO USER AkshayNarula;

-- 03/10/2024

use role sysadmin;

grant ownership on warehouse WARNER_BASE_DEV_DWH to role warner_terraform_transform_dev copy current grants;
grant ownership on warehouse WARNER_BASE_SIT_DWH to role warner_terraform_transform_dev copy current grants;
grant ownership on warehouse WARNER_BUS_DEV_DWH to role warner_terraform_transform_dev copy current grants;
grant ownership on warehouse WARNER_BUS_SIT_DWH to role warner_terraform_transform_dev copy current grants;
grant ownership on warehouse WARNER_RAW_DEV_DWH to role warner_terraform_transform_dev copy current grants;
grant ownership on warehouse WARNER_RAW_SIT_DWH to role warner_terraform_transform_dev copy current grants;
grant ownership on warehouse WARNER_STORE_DEV_DWH to role warner_terraform_transform_dev copy current grants;
grant ownership on warehouse WARNER_STORE_SIT_DWH to role warner_terraform_transform_dev copy current grants;

CREATE WAREHOUSE warner_data_testing_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _warner_data_testing_warehouse_xsmall__warehouse__operator;
create role _warner_data_testing_warehouse_xsmall__warehouse__usage;

use role securityadmin;

grant usage, monitor on warehouse warner_data_testing_warehouse_xsmall to role _warner_data_testing_warehouse_xsmall__warehouse__usage;
grant role _warner_data_testing_warehouse_xsmall__warehouse__usage to role _warner_data_testing_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse warner_data_testing_warehouse_xsmall to role _warner_data_testing_warehouse_xsmall__warehouse__operator;

grant role _warner_data_testing_warehouse_xsmall__warehouse__usage to role warner_testing_team;
grant role _warner_data_engineering__warehouse__usage to role warner_developement_team;

-- 14/10/2024

use ROLE securityadmin;
GRANT ROLE WARNER_DBT_TRANSFORM_DEV TO USER sunilsharma;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM_DEV TO USER sunilsharma;

-- 15/10/2024

show grants TO USER sunilsharma;

--WARNER_API_INTEGRATION
--WARNER_BASE_DEV_DBT_RW
--WARNER_BASE_DEV_TERRAFORM_RW
--WARNER_DATA_TRANSFORM_SUNILSHARMA
--WARNER_DBT_TRANSFORM
--WARNER_DBT_TRANSFORM_DEV
--WARNER_STORE_DEV_DBT_RW
--WARNER_STORE_DEV_TERRAFORM_RW
--WARNER_TERRAFORM_TRANSFORM
--WARNER_TERRAFORM_TRANSFORM_DEV

show grants TO USER pranaybagal;

use ROLE securityadmin;

--GRANT ROLE WARNER_API_INTEGRATION TO USER pranaybagal; 
GRANT ROLE WARNER_BASE_DEV_DBT_RW TO USER pranaybagal;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RW TO USER pranaybagal;
GRANT ROLE WARNER_DBT_TRANSFORM TO USER pranaybagal;
GRANT ROLE WARNER_DBT_TRANSFORM_DEV TO USER pranaybagal;
GRANT ROLE WARNER_STORE_DEV_DBT_RW TO USER pranaybagal;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RW TO USER pranaybagal;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM TO USER pranaybagal;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM_DEV TO USER pranaybagal;

show grants TO USER alamkhan;
GRANT ROLE WARNER_BASE_DEV_DBT_RW TO USER alamkhan;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RW TO USER alamkhan;
GRANT ROLE WARNER_DBT_TRANSFORM TO USER alamkhan;
GRANT ROLE WARNER_DBT_TRANSFORM_DEV TO USER alamkhan;
GRANT ROLE WARNER_STORE_DEV_DBT_RW TO USER alamkhan;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RW TO USER alamkhan;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM TO USER alamkhan;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM_DEV TO USER alamkhan;

show grants TO USER alamkhan;

-- ashwinnamewar
-- ashwin.namewar@bourne-leisure.co.uk
-- Data Delivery Manager

USE ROLE useradmin;

create role warner_data_transform_ashwinnamewar;

create USER ashwinnamewar
login_name = 'ashwin.namewar@bourne-leisure.co.uk'
display_name = 'Ashwin Namewar'
email = 'ashwin.namewar@bourne-leisure.co.uk'
comment = 'Data Delivery Manager'
default_role = warner_data_transform_ashwinnamewar
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_ashwinnamewar;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_ashwinnamewar;

GRANT ROLE warner_data_transform_ashwinnamewar TO USER ashwinnamewar; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER ashwinnamewar;
GRANT ROLE WARNER_BASE_DEV_DBT_RW TO USER ashwinnamewar;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RO TO USER ashwinnamewar;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RW TO USER ashwinnamewar;
GRANT ROLE WARNER_DBT_TRANSFORM TO USER ashwinnamewar;
GRANT ROLE WARNER_DBT_TRANSFORM_DEV TO USER ashwinnamewar;
GRANT ROLE WARNER_OPERATIONS_TEAM TO USER ashwinnamewar;
GRANT ROLE WARNER_STORE_DEV_DBT_RW TO USER ashwinnamewar;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RW TO USER ashwinnamewar;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM TO USER ashwinnamewar;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM_DEV TO USER ashwinnamewar;

show grants TO USER ashwinnamewar;

-- anupkhobragade
-- anup.khobragade@bourne-leisure.co.uk
-- BI Support Engineer

USE ROLE useradmin;

create role warner_data_transform_anupkhobragade;

create USER  anupkhobragade
login_name = 'anup.khobragade@bourne-leisure.co.uk'
display_name = 'Anup Khobragade'
email = 'anup.khobragade@bourne-leisure.co.uk'
comment = 'BI Support Engineer'
default_role = warner_data_transform_anupkhobragade
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_anupkhobragade;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_anupkhobragade;

GRANT ROLE warner_data_transform_anupkhobragade TO USER anupkhobragade; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER anupkhobragade;
GRANT ROLE WARNER_BASE_DEV_DBT_RW TO USER anupkhobragade;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RO TO USER anupkhobragade;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RW TO USER anupkhobragade;
GRANT ROLE WARNER_DBT_TRANSFORM TO USER anupkhobragade;
GRANT ROLE WARNER_DBT_TRANSFORM_DEV TO USER anupkhobragade;
GRANT ROLE WARNER_OPERATIONS_TEAM TO USER anupkhobragade;
GRANT ROLE WARNER_STORE_DEV_DBT_RW TO USER anupkhobragade;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RW TO USER anupkhobragade;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM TO USER anupkhobragade;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM_DEV TO USER 	anupkhobragade;

show grants TO user anupkhobragade;

-- 25/10/2024

-- Pavan Mishra
-- pavan.mishra@warnerhotels.com
-- Data Architect

USE ROLE useradmin;

create role warner_data_transform_PavanMishra;

create USER PavanMishra  
login_name = 'pavan.mishra@warnerhotels.com'
display_name = 'Pavan Mishra'
email = 'pavan.mishra@warnerhotels.com'
comment = 'Data Architect'
default_role = warner_data_transform_PavanMishra
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_PavanMishra;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_PavanMishra;

GRANT ROLE warner_data_transform_PavanMishra TO USER PavanMishra; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER PavanMishra;
GRANT ROLE WARNER_BASE_DEV_DBT_RW TO USER PavanMishra;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RO TO USER PavanMishra;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RW TO USER PavanMishra;
GRANT ROLE WARNER_DBT_TRANSFORM TO USER PavanMishra;
GRANT ROLE WARNER_DBT_TRANSFORM_DEV TO USER PavanMishra;
GRANT ROLE WARNER_OPERATIONS_TEAM TO USER PavanMishra;
GRANT ROLE WARNER_STORE_DEV_DBT_RW TO USER PavanMishra;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RW TO USER PavanMishra;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM TO USER PavanMishra;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM_DEV TO USER PavanMishra;

SHOW GRANTS TO USER PavanMishra;

-------------------------------

-- 
-- 
-- 

USE ROLE useradmin;

create role warner_data_transform_;

create USER  
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = warner_data_transform_
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_;

GRANT ROLE warner_data_transform_ TO USER ; 

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER ;
GRANT ROLE WARNER_BASE_DEV_DBT_RW TO USER ;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RO TO USER ;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RW TO USER ;
GRANT ROLE WARNER_DBT_TRANSFORM TO USER ;
GRANT ROLE WARNER_DBT_TRANSFORM_DEV TO USER ;
GRANT ROLE WARNER_OPERATIONS_TEAM TO USER ;
GRANT ROLE WARNER_STORE_DEV_DBT_RW TO USER ;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RW TO USER ;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM TO USER ;
GRANT ROLE WARNER_TERRAFORM_TRANSFORM_DEV TO USER ;

-- 07/11/2023

USE ROLE useradmin;

CREATE ROLE warner_data_transform_PriyatharshiniSubash;

-- Priyatharshini Subash 
-- priyatharshini.subash@warnerhotels.com
-- Data Tester

create user PriyatharshiniSubash
login_name = 'priyatharshini.subash@warnerhotels.com'
display_name = 'Priyatharshini Subash'
email = 'priyatharshini.subash@warnerhotels.com'
comment = 'Data Tester'
default_role = warner_data_transform_PriyatharshiniSubash
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_PriyatharshiniSubash;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_PriyatharshiniSubash;

GRANT ROLE warner_data_transform_PriyatharshiniSubash TO USER PriyatharshiniSubash;

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER PriyatharshiniSubash;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RO TO USER PriyatharshiniSubash;
GRANT ROLE WARNER_STORE_DEV_DBT_RO TO USER PriyatharshiniSubash;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RO TO USER PriyatharshiniSubash;
GRANT ROLE WARNER_TESTING_TEAM TO USER PriyatharshiniSubash;

USE ROLE useradmin;

CREATE ROLE warner_data_transform_ShastiramRajasekar;

-- Shastiram Rajasekar
-- shastiram.rajasekar@bourne-leisure.co.uk
-- Test Engineer

create user ShastiramRajasekar
login_name = 'shastiram.rajasekar@bourne-leisure.co.uk'
display_name = 'Shastiram Rajasekar'
email = 'shastiram.rajasekar@bourne-leisure.co.uk'
comment = 'Test Engineer'
default_role = warner_data_transform_ShastiramRajasekar
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_ShastiramRajasekar;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_ShastiramRajasekar;

GRANT ROLE warner_data_transform_ShastiramRajasekar TO USER ShastiramRajasekar;

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER ShastiramRajasekar;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RO TO USER ShastiramRajasekar;
GRANT ROLE WARNER_STORE_DEV_DBT_RO TO USER ShastiramRajasekar;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RO TO USER ShastiramRajasekar;
GRANT ROLE WARNER_TESTING_TEAM TO USER ShastiramRajasekar;

USE ROLE useradmin;

CREATE ROLE warner_data_transform_VrushaliKulkarni;

-- Vrushali Kulkarni
-- vrushali.kulkarni@bourne-leisure.co.uk
-- QA Engineer

create user VrushaliKulkarni
login_name = 'vrushali.kulkarni@bourne-leisure.co.uk'
display_name = 'Vrushali Kulkarni'
email = 'vrushali.kulkarni@bourne-leisure.co.uk'
comment = 'QA Engineer'
default_role = warner_data_transform_VrushaliKulkarni
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USE ROLE securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_VrushaliKulkarni;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_VrushaliKulkarni;

GRANT ROLE warner_data_transform_VrushaliKulkarni TO USER VrushaliKulkarni;

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER VrushaliKulkarni;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RO TO USER VrushaliKulkarni;
GRANT ROLE WARNER_STORE_DEV_DBT_RO TO USER VrushaliKulkarni;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RO TO USER VrushaliKulkarni;
GRANT ROLE WARNER_TESTING_TEAM TO USER VrushaliKulkarni;

----------------------------------------------------------------

USE ROLE useradmin;

CREATE ROLE warner_data_transform_;

-- 
-- 
-- 

create user 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = warner_data_transform_
DEFAULT_WAREHOUSE = warner_data_trasform_warehouse_xsmall
;

USER ROLE securityadmin;

GRANT ROLE _warner_data_transform__schema TO ROLE warner_data_transform_;
GRANT ROLE warner_data_transform TO ROLE warner_data_transform_;

GRANT ROLE warner_data_transform_ TO USER ;

GRANT ROLE WARNER_BASE_DEV_DBT_RO TO USER ;
GRANT ROLE WARNER_BASE_DEV_TERRAFORM_RO TO USER ;
GRANT ROLE WARNER_STORE_DEV_DBT_RO TO USER ;
GRANT ROLE WARNER_STORE_DEV_TERRAFORM_RO TO USER ;
GRANT ROLE WARNER_TESTING_TEAM TO USER ;

