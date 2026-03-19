use role haven_commercial_test_1;

insert into haven_commercial.demouser.bob1 values (3);

use role dba;

show roles like '_haven_store__digital%';

use role bourne_accountadmin;
grant role orgadmin to user jonathanmanley;
revoke role orgadmin from user jonathanmanley;

use role accountadmin;
show databases;
use database bourne_RAW;
show schemas;

use role dba;
describe table haven_raw.seaware.ship;

use schema haven_base.seaware;

show masking policies;

alter view haven_base.seaware.client alter column email unset masking policy;

use role useradmin;
create role _haven_base__seaware__email;
create role _haven_base__seaware__email_provider;

create role _haven_base__seaware__postcode;
create role _haven_base__seaware__postcode_area;
create role _haven_base__seaware__postcode_region;
create role _haven_base__seaware__postcode_sector;

use role dba;

create masking policy _haven_base__seaware__email as (columnValue string) returns string ->
case 
    when is_role_in_session('_HAVEN_BASE__SEAWARE__EMAIL') then columnValue
    when is_role_in_session('_HAVEN_BASE__SEAWARE__EMAIL_PROVIDER') then coalesce(split_part(columnValue, '@', 2), 'None') 
else '########' 
END;

create or replace masking policy _haven_base__seaware__postcode as (columnValue string) returns string ->
case 
    when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE') then columnValue
    when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE_AREA') then coalesce(regexp_substr(columnValue, '^[a-zA-Z][a-zA-Z]?'), 
                                                                                 'None') 
    when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE_REGION') then coalesce(substr(regexp_substr(columnValue, '^[a-zA-Z]+\\d+?\\s\\d+'), 1, length(regexp_substr(columnValue, '^[a-zA-Z]+\\d+?\\s\\d+')) - 1), 'None') 
    when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE_SECTOR') then coalesce(regexp_substr(columnValue, '^[a-zA-Z]+\\d+?\\s\\d+'), 'None') 
else '########' 
END;


use role dba;

alter view haven_base.seaware.client alter column email set masking policy _haven_base__seaware__email;
alter view haven_base.seaware.client alter column email unset masking policy;
alter view haven_base.seaware.cc_client alter column zip set masking policy _haven_base__seaware__postcode__policy;
alter view haven_base.seaware.cc_client alter column zip unset masking policy;

use role securityadmin;

grant role _HAVEN_BASE__SEAWARE__postcode_sector to role haven_commercial_test;
revoke role _HAVEN_BASE__SEAWARE__postcode_sector from role haven_commercial_test;

grant role _HAVEN_BASE__SEAWARE__postcode_region to role haven_commercial_test;
revoke role _HAVEN_BASE__SEAWARE__postcode_region from role haven_commercial_test;

grant role _HAVEN_BASE__SEAWARE__postcode_area to role haven_commercial_test;
revoke role _HAVEN_BASE__SEAWARE__postcode_area from role haven_commercial_test;

use role useradmin;

use role dba;

show masking policies;

drop masking policy _haven_base__seaware__email;
drop masking policy _haven_base__seaware__postcode;


describe masking policy _haven_base__seaware__postcode__policy;


select
case when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE') then zip 
when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE_AREA') then coalesce(regexp_substr(zip, '^[a-zA-Z][a-zA-Z]?'), 'None')  
when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE_REGION') then coalesce(substr(regexp_substr(columnValue, '^[a-zA-Z]+\d+?\s\d+'), 1, length(regexp_substr(columnValue, '^[a-zA-Z]+\d+?\s\d+')) - 1), 'None') 
when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE_SECTOR') then coalesce(regexp_substr(columnValue, '^[a-zA-Z]+\d+?\s\d+'), 'None') 
else '########' END;

use schema haven_base.plot;

select * from account_cars limit 10;

select car_reg_no, coalesce(regexp_substr(car_reg_no, '^[[:alpha:]][[:alpha:]]\\d{2}'), 'personal') from account_cars limit 100;
select car_reg_no, coalesce(regexp_substr(car_reg_no, '^[[:alpha:]]\\d{3}'), 'new style') from account_cars limit 100;
select car_reg_no, coalesce(regexp_substr(car_reg_no, '^[[:alpha:]][[:alpha:]]\\d+|^[[:alpha:]]\\d+'), 'personal') from account_cars limit 100;


select car_reg_no, 
case 
    when regexp_substr(car_reg_no, '^[[:alpha:]][[:alpha:]]\\d{2}') is not null then 'new style'
    when regexp_substr(car_reg_no, '^[[:alpha:]]\\d{3}') is not null then 'old style'
    else 'personalised'
end
from account_cars;

use schema haven_base.seaware;

show masking policies;


USE SCHEMA HAVEN_BASE.ZENDESK;

CREATE OR REPLACE VIEW HAVEN_BASE.ZENDESK."GROUP" AS SELECT "ID", "NAME", "CREATED_AT", "UPDATED_AT", "URL" FROM HAVEN_RAW.ZENDESK."GROUP";

SELECT * FROM "HAVEN_RAW"."ZENDESK"."GROUP";

use role securityadmin;
revoke role _haven_base__seaware__postcode from role haven_commercial_test;

grant role warner_commercial to user robcummins;
grant role _warner_base__maestro__reader to role warner_commercial;

use schema haven_base.seaware;

-- select birthday, datediff(year, birthday, current_date),

create masking policy _haven_base__seaware__postcode as (columnValue string) returns string ->
case 
    when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE') then columnValue
    when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE_AREA') then coalesce(regexp_substr(columnValue, '^[a-zA-Z][a-zA-Z]?'), 
                                                                                 'None') 
    when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE_REGION') then coalesce(substr(regexp_substr(columnValue, '^[a-zA-Z]+\\d+?\\s\\d+'), 1, length(regexp_substr(columnValue, '^[a-zA-Z]+\\d+?\\s\\d+')) - 1), 'None') 
    when is_role_in_session('_HAVEN_BASE__SEAWARE__POSTCODE_SECTOR') then coalesce(regexp_substr(columnValue, '^[a-zA-Z]+\\d+?\\s\\d+'), 'None') 
else '########' 
END;

use database haven_base;
use schema seaware;
use role dba;

create or replace masking policy _haven_base__seaware__birthdate_policy as (columnValue string) returns string ->
case 
    when is_role_in_session('_HAVEN_BASE__SEAWARE__birthdate') then cast(columnValue as string)
    when is_role_in_session('_HAVEN_BASE__SEAWARE__age') then  
            cast(coalesce(datediff(year, to_timestamp_ntz(columnValue), current_date), 0) as string)
    when is_role_in_session('_HAVEN_BASE__SEAWARE__age_range') then 
        (case when datediff(year, to_timestamp_ntz(columnValue), current_date) between 0 and 9 then '0-9'
            when datediff(year, to_timestamp_ntz(columnValue), current_date) between 10 and 19 then '10-19'
            when datediff(year, to_timestamp_ntz(columnValue), current_date) between 20 and 29 then '20-29'
            when datediff(year, to_timestamp_ntz(columnValue), current_date) between 30 and 39 then '30-39'
            when datediff(year, to_timestamp_ntz(columnValue), current_date) between 40 and 49 then '40-49'
            when datediff(year, to_timestamp_ntz(columnValue), current_date) between 50 and 59 then '50-59'
            when datediff(year, to_timestamp_ntz(columnValue), current_date) between 60 and 69 then '60-69'
            when datediff(year, to_timestamp_ntz(columnValue), current_date) between 70 and 79 then '70-79'
            when datediff(year, to_timestamp_ntz(columnValue), current_date) between 80 and 89 then '80-89'
            when datediff(year, to_timestamp_ntz(columnValue), current_date) between 90 and 99 then '90-99'
            when datediff(year, to_timestamp_ntz(columnValue), current_date) > 100 then '100+'
            else 'not set'
        end)
    else '##########'
end;

create view haven_base.seaware.client_test as select client_id, last_name, cast(birthday as string) as birthday from haven_raw.seaware.client;
show masking policies;
drop masking policy _haven_base__seaware__birthdate;

alter view haven_base.seaware.client_test modify column birthday set masking policy _haven_base__seaware__birthdate_policy;

use role dba;
drop view haven_base.seaware.client_test;
drop masking policy _haven_base__seaware__birthdate_policy;

select * from haven_base.seaware.client_test;

use schema training.training;

create or replace masking policy _haven_base__seaware__birthdate_policy as (columnValue string) returns string ->
case 
    when is_role_in_session('_HAVEN_BASE__SEAWARE__birthdate') then cast(columnValue as string)
    when is_role_in_session('_HAVEN_BASE__SEAWARE__age') then  
            cast(coalesce(datediff(year, (columnValue), current_date), 0) as string)
    when is_role_in_session('_HAVEN_BASE__SEAWARE__age_range') then 
        (case when datediff(year, (columnValue), current_date) between 0 and 9 then '0-9'
            when datediff(year, (columnValue), current_date) between 10 and 19 then '10-19'
            when datediff(year, (columnValue), current_date) between 20 and 29 then '20-29'
            when datediff(year, (columnValue), current_date) between 30 and 39 then '30-39'
            when datediff(year, (columnValue), current_date) between 40 and 49 then '40-49'
            when datediff(year, (columnValue), current_date) between 50 and 59 then '50-59'
            when datediff(year, (columnValue), current_date) between 60 and 69 then '60-69'
            when datediff(year, (columnValue), current_date) between 70 and 79 then '70-79'
            when datediff(year, (columnValue), current_date) between 80 and 89 then '80-89'
            when datediff(year, (columnValue), current_date) between 90 and 99 then '90-99'
            when datediff(year, (columnValue), current_date) > 100 then '100+'
            else columnValue
        end)
    else '##########'
end;

create view training.training.client_test as select client_id, last_name, cast(birthday as string) as birthday from haven_raw.seaware.client;
alter view training.training.client_test modify column birthday set masking policy _haven_base__seaware__birthdate_policy;
alter view training.training.client_test modify column birthday unset masking policy;
show masking policies;

use role useradmin;
create role _HAVEN_BASE__SEAWARE__birthdate;
create role _HAVEN_BASE__SEAWARE__age;
create role _HAVEN_BASE__SEAWARE__age_range;

use role securityadmin;
grant role _HAVEN_BASE__SEAWARE__age_range to role dba;

use role dba;
select * from training.training.client_test where birthday is not null order by client_id, last_name desc limit 10000;;

select client_id, last_name, cast(birthday as string), cast(coalesce(datediff(year, birthday, current_date), 0) as string),
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
            when datediff(year, birthday, current_date) > 100 then '100+'
            else 'not set'
end
from haven_base.seaware.client
where birthday is not null 
order by client_id, last_name desc
limit 10000;


create or replace masking policy _haven_base__seaware__birthdate as (columnValue string) returns string -> case
                 when is_role_in_session('_haven_base__seaware__birthdate_all') then cast(columnValue as string)
                 when is_role_in_session('_haven_base__seaware__birthdate_year') then
					cast(coalesce(datediff(year, to_timestamp_ntz(columnValue), current_date), 0) as string)
				when is_role_in_session('_haven_base__seaware__birthdate_range') then
					(case when datediff(year, to_timestamp_ntz(columnValue), current_date) between 0 and 9 then '0-9'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 10 and 19 then '10-19'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 20 and 29 then '20-29'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 30 and 39 then '30-39'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 40 and 49 then '40-49'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 50 and 59 then '50-59'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 60 and 69 then '60-69'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 70 and 79 then '70-79'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 80 and 89 then '80-89'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 90 and 99 then '90-99'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) > 100 then '100+'" \
					else 'not set' end)
                     				when is_role_in_session('_haven_base__seaware__birthdate_nochild') then
					(case when datediff(year, to_timestamp_ntz(columnValue), current_date) between 0 and 17 then 'Not Set'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 18 and 29 then 'youth'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 30 and 39 then '30-39'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 40 and 49 then '40-49'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 50 and 59 then '50-59'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 60 and 69 then '60-69'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 70 and 79 then '70-79'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 80 and 89 then '80-89'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) between 90 and 99 then '90-99'
						when datediff(year, to_timestamp_ntz(columnValue), current_date) > 100 then '100+'" \
					else 'not set' end)
                 else '##########' END
;

