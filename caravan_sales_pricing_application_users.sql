use ROLE useradmin;


-- Simon Cole
-- simon.cole@haven.com
-- Pitch Profitability Manager

create user simoncole
login_name = 'simon.cole@haven.com'
display_name = 'Simon Cole'
email = 'simon.cole@haven.com'
comment = 'Pitch Profitability Manager'
default_role = CARAVAN_SALES_PRICING_APPLICATION
;

-- Samuel Clarke
-- Samuel.Clarke@haven.com		
-- Commercial Strategy Manager

create user SamuelClarke
login_name = 'Samuel.Clarke@haven.com'
display_name = 'Samuel Clarke'
email = 'Samuel.Clarke@haven.com'
comment = 'Commercial Strategy Manager'
default_role = CARAVAN_SALES_PRICING_APPLICATION
;

-- Melu Mpande
-- Melu.Mpande@haven.com
-- Assistant Accountant - Reporting

create user MeluMpande
login_name = 'Melu.Mpande@haven.com'
display_name = 'Melu Mpande'
email = 'Melu.Mpande@haven.com'
comment = 'Assistant Accountant - Reporting'
default_role = CARAVAN_SALES_PRICING_APPLICATION
;



use role securityadmin;

;
GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION TO USER simoncole;
GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION TO USER SamuelClarke;
GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION TO USER MeluMpande;

-- 19/09/2025

use ROLE useradmin

ALTER user simoncole 
SET default_role = CARAVAN_SALES_PRICING_APPLICATION_DEV
;

alter user SamuelClarke
SET default_role = CARAVAN_SALES_PRICING_APPLICATION_DEV
;

ALTER user MeluMpande
SET default_role = CARAVAN_SALES_PRICING_APPLICATION_DEV
;

use ROLE securityadmin;

REVOKE ROLE CARAVAN_SALES_PRICING_APPLICATION FROM USER simoncole;
REVOKE ROLE CARAVAN_SALES_PRICING_APPLICATION FROM USER SamuelClarke;
REVOKE ROLE CARAVAN_SALES_PRICING_APPLICATION FROM USER MeluMpande;

GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION_DEV TO USER simoncole;
GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION_DEV TO USER SamuelClarke;
GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION_DEV TO USER MeluMpande;


-- 08/10/2025

use ROLE useradmin;

-- Matthew Evans 
-- Matthew.Evans@haven.com
-- Caravan Stock & Pricing Manager

create user MatthewEvans
login_name = 'Matthew.Evans@haven.com'
display_name = 'Matthew Evans'
email = 'Matthew.Evans@haven.com'
comment = 'Caravan Stock & Pricing Manager'
default_role = CARAVAN_SALES_PRICING_APPLICATION
;

use role securityadmin;

GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION TO USER MatthewEvans;
GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION_DEV TO USER MatthewEvans;

-- 16/10/2025 

use role securityadmin;

GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION TO USER MeluMpande;




-----------

create user 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = CARAVAN_SALES_PRICING_APPLICATION
;

use role securityadmin;

GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION TO USER ;
GRANT ROLE CARAVAN_SALES_PRICING_APPLICATION_DEV TO USER ;

