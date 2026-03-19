USE ROLE useradmin;

CREATE ROLE haven_commercial_DiegoUsai;

--diego.usai@haven.com
-- Diego Usai

create user DiegoUsai
login_name = 'diego.usai@haven.com'
display_name = 'Diego Usai'
email = 'diego.usai@haven.com'
comment = 'BI & Data Lead'
default_role = haven_commercial
DEFAULT_WAREHOUSE = haven_commercial_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_commercial TO ROLE haven_commercial_DiegoUsai;
GRANT ROLE _haven_commercial__schema  TO ROLE haven_commercial_DiegoUsai;
GRANT ROLE haven_commercial_DiegoUsai TO USER DiegoUsai; 

-- 22/01/2025 

-- videesh.reddy
-- videesh.reddy@haven.com
-- Data Analyst

USE ROLE useradmin;

CREATE ROLE haven_commercial_videeshreddy;

create user videeshreddy
login_name = 'videesh.reddy@haven.com'
display_name = 'Videesh Reddy'
email = 'videesh.reddy@haven.com'
comment = 'Data Analyst'
default_role = haven_commercial
DEFAULT_WAREHOUSE = haven_commercial_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_commercial TO ROLE haven_commercial_videeshreddy;
GRANT ROLE _haven_commercial__schema  TO ROLE haven_commercial_videeshreddy;
GRANT ROLE haven_commercial_videeshreddy TO USER videeshreddy; 


-- 12/02/2025

-- ahsanmiah
-- ahsan.miah@bourne-leisure.co.uk
-- Data & Reporting Analyst

USE ROLE useradmin;

CREATE ROLE haven_commercial_ahsanmiah;

create user ahsanmiah
login_name = 'ahsan.miah@bourne-leisure.co.uk'
display_name = 'Ahsan Miah'
email = 'ahsan.miah@bourne-leisure.co.uk'
comment = 'Data & Reporting Analyst'
default_role = haven_commercial
DEFAULT_WAREHOUSE = haven_commercial_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_commercial TO ROLE haven_commercial_ahsanmiah;
GRANT ROLE _haven_commercial__schema  TO ROLE haven_commercial_ahsanmiah;
GRANT ROLE haven_commercial_ahsanmiah TO USER ahsanmiah; 


-- 21/02/2025

-- victoremovon
-- victor.emovon@haven.com
-- BI Analyst

USE ROLE useradmin;

CREATE ROLE haven_commercial_victoremovon;

create user victoremovon
login_name = 'victor.emovon@haven.com'
display_name = 'Victor Emovon'
email = 'victor.emovon@haven.com'
comment = 'BI Analyst'
default_role = haven_commercial
DEFAULT_WAREHOUSE = haven_commercial_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_commercial TO ROLE haven_commercial_victoremovon;
GRANT ROLE _haven_commercial__schema  TO ROLE haven_commercial_victoremovon;
GRANT ROLE haven_commercial_victoremovon TO USER victoremovon; 


-- 

--
--
--

USE ROLE useradmin;

CREATE ROLE haven_commercial_;

create user 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = haven_commercial
DEFAULT_WAREHOUSE = haven_commercial_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_commercial TO ROLE haven_commercial_;
GRANT ROLE _haven_commercial__schema  TO ROLE haven_commercial_;
GRANT ROLE haven_commercial_ TO USER ; 
