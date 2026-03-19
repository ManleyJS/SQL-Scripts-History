use role dba;
use schema haven_base.seaware;
select zip from haven_base.seaware.cc_client 
--where zip like 'WA8%'
;

select * from haven_raw.seaware.cc_client ;
-- where zip like 'WA8%'
;

show masking policies;
desc masking policy _haven_base__seaware__registration__policy;

use role securityadmin;

show roles like '_haven_base__seaware__postcode%';

grant role _haven_base__seaware__postcode to role haven_commercial_test;

show roles like '_haven_base__seaware__%';

select * from haven_raw.seaware.client where birthday is not null limit 100;

select client_id, birthday,
ntile(10) over (partition by birthday order by client_id) 
from haven_raw.seaware.client where birthday is not null;

use role dba;
select birthday, datediff(year, birthday, current_date),
case when datediff(year, birthday, current_date) between 0 and 9 then '0-9'
when datediff(year, birthday, current_date) between 10 and 19 then '10-19'
when datediff(year, birthday, current_date) between 20 and 29 then '20-29'
when datediff(year, birthday, current_date) between 30 and 39 then '30-39'
when datediff(year, birthday, current_date) between 40 and 49 then '40-49'
when datediff(year, birthday, current_date) between 50 and 59 then '50-59'
when datediff(year, birthday, current_date) between 60 and 69 then '60-69'
when datediff(year, birthday, current_date) between 70 and 79 then '70-79'
when datediff(year, birthday, current_date) between 80 and 89 then '80-89'
when datediff(year, birthday, current_date) between 90 and 99 then '90-99'
when datediff(year, birthday, current_date) > 100 then '100'
else 'not set'
end
from haven_base.seaware.client 
--where birthday is not null
;

select birthday, datediff(year, birthday, current_date),
case when datediff(year, birthday, current_date) between 0 and 19 then 'not set'
when datediff(year, birthday, current_date) between 20 and 29 then '20-29'
when datediff(year, birthday, current_date) between 30 and 39 then '30-39'
when datediff(year, birthday, current_date) between 40 and 49 then '40-49'
when datediff(year, birthday, current_date) between 50 and 59 then '50-59'
when datediff(year, birthday, current_date) between 60 and 69 then '60-69'
when datediff(year, birthday, current_date) between 70 and 79 then '70-79'
when datediff(year, birthday, current_date) between 80 and 89 then '80-89'
when datediff(year, birthday, current_date) between 90 and 99 then '90-99'
when datediff(year, birthday, current_date) > 100 then '100'
else 'not set'
end
from haven_base.seaware.client ;

use role dba;;

select zip from haven_base.seaware.cc_client;

SHOW GRANTS TO ROLE haven_commercial_test;

use role securityadmin;
revoke role _haven_base__seaware__postcode_sector from role haven_commercial_test;
grant role _haven_base__seaware__postcode_area to role haven_commercial_test;

revoke role _haven_base__seaware__email from role haven_commercial_test;
grant role _haven_base__seaware__email_provider to role haven_commercial_test;

use role dba;
select * from table(information_schema.policy_references(ref_entity_name => 'haven_base.seaware.client', ref_entity_domain => 'view'));

alter view HAVEN_BASE.SEAWARE.CLIENT modify column EMAIL unset masking policy;
alter view HAVEN_BASE.SEAWARE.CLIENT modify column EMAIL set masking policy _HAVEN_BASE__SEAWARE__email__policy;
alter view HAVEN_BASE.SEAWARE.CLIENT modify column EMAIL unset masking policy;

use role dba;

show roles like '%governance%';
use role bourne_governance;

select * from haven_base.braintree.apple_pay_card limit 1;
select * from apple_pay_card limit 1;
use schema haven_base.braintree;

use schema haven_base.seaware;
show masking policies;
desc masking policy _haven_base__seaware__postcode__policy;
select * from table(information_schema.policy_references(ref_entity_name => 'haven_base.seaware.cc_client', ref_entity_domain => 'view'));

use role haven_commercial;

use role haven_revenue_management;






