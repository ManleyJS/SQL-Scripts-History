select LICENSE_PLATE,
coalesce(regexp_substr(LICENSE_PLATE, '^[a-zA-Z][a-zA-Z]'), 'None'),
coalesce(regexp_substr(LICENSE_PLATE, '^[a-zA-Z]{2}[0-9]{2}'), 'None'),
coalesce(substring(regexp_substr(LICENSE_PLATE, '^[a-zA-Z]{2}[0-9]{2}'), 3, 2), 'None')
from haven_base.seaware.CLIENT_CAR_REGISTRATION;





create or replace masking policy _haven_base__plot__registration__policy as (columnValue string) 
returns string -> case 
when is_role_in_session('_haven_base__plot__registration') then columnValue 
when is_role_in_session('_haven_base__plot__registration_location') then coalesce(regexp_substr(columnValue, '^[a-zA-Z][a-zA-Z]'), 'None') 
when is_role_in_session('_haven_base__plot__registration_locnyear') then coalesce(substring(regexp_substr(columnValue, '^[a-zA-Z]{2}[0-9]{2}'), 3, 2), 'None') 
when is_role_in_session('_haven_base__plot__registration_year')     then coalesce(regexp_substr(columnValue, '^[a-zA-Z]{2}[0-9]{2}'), 'None') 
else '########' END;

use schema haven_base.seaware;

show masking policies;
use role sysadmin;
drop masking policy WARNER_BASE__SEAWARE__financial__POLICY;

select distinct(coupon_class) from butlins_BASE.SEAWARE.ACC_COUPON_CLASS 
union
select distinct(coupon_class) from warner_BASE.SEAWARE.ACC_COUPON_CLASS 
union
select distinct(coupon_class) from haven_BASE.SEAWARE.ACC_COUPON_CLASS ;

select * from  butlins_base.plot.PITCH_GRADES;

use schema butlins_raw.seaware;
SELECT TABLE_NAME, ROW_COUNT FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_CATALOG = 'BUTLINS_RAW' AND TABLE_SCHEMA = 'SEAWARE' AND ROW_COUNT > 0 
AND NOT IS_TRANSIENT AND NOT STARTSWITH(TABLE_NAME, 'HVR_ST') AND NOT ENDSWITH(TABLE_NAME, '__B') 
AND NOT ENDSWITH(TABLE_NAME, '_CLONE')  
AND TABLE_NAME NOT IN ('GROUP_COMMISSION_DETAIL')  ORDER BY TABLE_NAME;




SELECT TABLE_NAME, ROW_COUNT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_CATALOG = 'BUTLINS_RAW' AND TABLE_SCHEMA = 'SEAWARE'  AND TABLE_NAME IN ('GROUP_COMMISSION_DETAIL')  ORDER BY TABLE_NAME;


use schema haven_base.plot;

show masking policies;

select * from table(information_schema.policy_references(policy_name => 'haven_base.seaware._haven_base__seaware__postcode__policy'));

show grants to role haven_commercial_test;



select *
  from table(information_schema.policy_references(ref_entity_name => 'haven_base.seaware.cc_client', ref_entity_domain => 'view'));
  
select * from table(information_schema.policy_references(ref_entity_name => 'HAVEN_BASE.SEAWARE.ACC_RECONCILIATION_CODE', ref_entity_domain => 'view'));


use role securityadmin;


