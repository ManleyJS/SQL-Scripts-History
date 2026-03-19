USE ROLE useradmin;

CREATE ROLE haven_crm_service_account;

create USER haven_crm_service_account
LOGIN_NAME = haven.crm.service.account
password = '<REDACTED>'
default_warehouse = haven_crm_management_warehouse_xsmall
default_role = haven_crm_service_account
default_namespace = haven_store.identity;

ALTER USER haven_crm_service_account SET default_namespace = haven_store.consent_and_preference;


USE ROLE securityadmin;

GRANT ROLE _haven_crm_management_warehouse_xsmall__warehouse__usage TO ROLE haven_crm_service_account;
GRANT ROLE _haven_store__identity__reader TO ROLE haven_crm_service_account;
revoke ROLE _haven_store__identity__reader from ROLE haven_crm_service_account;
GRANT ROLE _haven_store__consent_and_preference__reader TO ROLE haven_crm_service_account;


GRANT ROLE haven_crm_service_account TO USER haven_crm_service_account;

ALTER USER haven_crm_service_account
SET rsa_public_key =
"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0zBLVaMmk2a1ANuz/LhYDKZGuUfko+vmKK3K4ea3zSSSCxwkaO3fkruHtId0FicZqloQ9zNxznXxRDlx/YOj8vcb/L80beCihR8d1qYdT7x5iORJfU9B7vXwuOgKRzVxrAci8CkJTLyQ9+Yma42bwSYX1TdOxgAUh0LApwedMGyc4ypr0b1e5AXNXWrpbKT1GMpaztj210nWwSJKSYL8vnEPVfpeW1uTDndGam+azYtLts8SHNmKvHs3NKHMr5/A7Vkaz4LnfDHijxwH/W/rPMZMCI93zOfFpUjH06vQ13katSILwY6uxWjOGaUW9zNtS8mnC5Hzpe3G7rCDNw+kBwIDAQAB";

USE ROLE dba;

USE DATABASE haven_store;
USE SCHEMA consent_and_preference;

create or replace view haven_store.consent_and_preference.full_consent_preferences as
WITH 
--email preferences for owners
OWNER_EMAIL_PREF AS
(
SELECT distinct
type_ref as owner_id
,valid_from_dttm as optin_dt
,contact_yn
from haven_base.SAS_COMMON.contact_preferences
where type_name = 'OWNERID' 
AND category_code = 'SAL'
and contact_method = 'EMAIL'
and year(to_date(valid_from_dttm)) between year(current_date) -5 and year(current_date) 
)
,

-- email preferences for holidays and eclients
HOL_EMAIL_PREF AS
(
SELECT distinct
max(e.email_address) as email_address
,e.email_id
,max(to_date(valid_from_dttm)) as optin_dt
,max(contact_yn) as contact_yn
from haven_base.SAS_COMMON.contact_preferences cp
join haven_base.sas_common.email e on cp.type_ref = e.email_id
where type_name = 'EMAILID' 
AND category_code = 'GEN'
and contact_method = 'EMAIL'
and brand_ref = 1
and year(to_date(valid_from_dttm)) between year(current_date) -5 and year(current_date) 
group by email_id)
,
-- getting the preference for the latest owner where there are many ownerids who have the same email.
LATEST_OWNER AS(
SELECT distinct 

  o.EMAIL AS email_address
  ,MAX(OWNER_ID) as owner_id
  ,MAX(CREATED_DT) as created_dt
from haven_base.PLOT.owners o
where o.email like '%@%'
group by o.email
)
,
PLOT_EMAIL AS(
SELECT distinct 
  o.EMAIL AS email_address
, case when oe.contact_yn = 'Y' THEN 'Y' ELSE 'N' END as email
, to_date(oe.optin_dt) email_Preference_dt
, case when p.owner = 'Y' THEN 'OWNER' ELSE 'CS' END as TOPIC
from haven_base.PLOT.owners o
join latest_owner lo on lo.owner_id = o.owner_id
join HAVEN_STORE.ma_mart.park_prospect_pref p on o.owner_id =p.owner_id 
join OWNER_EMAIL_PREF oe on o.owner_id = oe.owner_id

where trim(o.email) <> ''
and p.owner = 'N')
,
HOL_EMAIL AS(
SELECT distinct 

e.email_address
,case when hep.contact_yn = 'Y' THEN 'Y' ELSE 'N' END as email
,hep.optin_dt as email_Preference_dt
,'HOLIDAYS' AS TOPIC
from haven_base.sas_common.email e
join haven_base.sas_common.person_email pe on e.ref = pe.email_ref
join haven_base.sas_common.person_email_sources ps on ps.person_email_ref = pe.ref
join hol_email_pref hep on e.email_id = hep.email_id
left join PLOT_EMAIL ce on  trim(ce.email_address) = trim(e.email_address)
where ps.source not in ('CS-EC','CS-LEADS','CS_LEADS','CS-ALERT','PLOT')
and trim(e.email_address) <> ''
and ps.brand_ref = 1
and e.email_id <> 5966164
)
,
CSEC_EMAIL AS(
SELECT distinct 
e.email_address
,case when hep.contact_yn = 'Y' THEN 'Y' ELSE 'N' END as email
,hep.optin_dt as email_Preference_dt
,'CS' AS TOPIC
from haven_base.sas_common.email e
join haven_base.sas_common.person_email pe on e.ref = pe.email_ref
join haven_base.sas_common.person_email_sources ps on ps.person_email_ref = pe.ref
join hol_email_pref hep on e.email_id = hep.email_id

left join plot_email pl on trim(pl.email_address) = trim(e.email_address)
where ps.source in ('CS-EC','CS-LEADS','CS_LEADS','CS-ALERT')
and e.email_id <> 5966164
and pl.email_address is null
and ps.brand_ref = 1
)
,
CS_preference as (
select * from PLOT_EMAIL
union all
select * from csec_email
)
,
all_emails as (
select distinct email_address from PLOT_EMAIL
union
select distinct email_address from csec_email
union 
select distinct email_address from hol_email
)
,
sas_preference as
(
select e.email_address

       ,case when hp.email ='Y' and cp.email = 'Y' then 'Y'
             when hp.email ='Y' and cp.email = 'N' then 'Y' 
             when hp.email ='N' and cp.email = 'Y' then 'Y' 
             when hp.email ='Y' and cp.email is null then 'Y' 
             when hp.email is null and cp.email = 'Y' then 'Y'  
             else 'N' end as email
        ,case when hp.topic is not null then 'Y' else 'N' end as Holiday
       ,case when cp.topic is not null then 'Y' else 'N' end as CS
       , greatest(coalesce(hp.email_preference_dt, cp.email_preference_dt)) as preference_dt
from all_emails e
left join CS_preference  cp on e.email_address = cp.email_address
left join hol_email hp  on e.email_address = hp.email_address
   

)

select * from sas_preference;