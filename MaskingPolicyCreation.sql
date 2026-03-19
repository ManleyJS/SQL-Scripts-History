USE ROLE tag_admin;

create or replace masking policy training.derived_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('derived_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy personal_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('personal_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy sensitive_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('sensitive_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy financial_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('financial_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy address_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('address_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy telephone_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('telephone_masking_policiy_role') then columnValue
                else '########' END;

create or replace masking policy email_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('email_masking_policy_role') then columnValue
                when is_role_in_session('email_masking_policy_provider_role') then coalesce(split_part(columnValue, '@', 2), 'None')
                else '########' END;

create or replace masking policy postcode_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('postcode_masking_policy_role') then columnValue
                when is_role_in_session('postcode_masking_policy_area_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z][a-zA-Z]?'), 'None') 
                when is_role_in_session('postcode_masking_policy_region_role') then coalesce(substr(regexp_substr(columnValue, '^[a-zA-Z]+\\\\d+?\\\\s\\\\d+'),
                1, length(regexp_substr(columnValue, '^[a-zA-Z]+\\\\d+?\\\\s\\\\d+')) - 1), 'None')
                when is_role_in_session('postcode_masking_policy_sector_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z]+\\\\d+?\\\\s\\\\d+'), 'None')
                else '########' END;

create or replace masking policy car_license_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('car_license_masking_policy_role') then columnValue
                when is_role_in_session('car_license_masking_policy_location_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z][a-zA-Z]'), 'None')
                when is_role_in_session('car_license_masking_policy_location_year_role') then coalesce(substring(regexp_substr(columnValue, '^[a-zA-Z]{2}[0-9]{2}'), 3, 2), 'None')
                when is_role_in_session('car_license_masking_policy_year_role') then coalesce(regexp_substr(columnValue, '^[a-zA-Z]{2}[0-9]{2}'), 'None')
                else '########' END;

create or replace masking policy third_party_masking_policy as (columnValue string)
                returns string -> case when is_role_in_session('third_party_masking_policy_role') then columnValue
                else '########' END;

create or replace masking policy birthday_masking_policy as (columnValue string)
                returns string -> case
                when is_role_in_session('birthday_masking_policy_role') then cast(columnValue as string)
                when is_role_in_session('birthday_masking_policy_age_data_role') then
                cast(coalesce(datediff(year, to_timestamp_ntz(columnValue), current_date), 0) as string)
                when is_role_in_session('birthday_masking_policy_age_data_range_role') then
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
                else 'not set' end)
                else '##########' END;
                
