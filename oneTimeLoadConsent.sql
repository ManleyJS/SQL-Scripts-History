USE ROLE dba;
USE DATABASE HAVEN_STORE;
USE SCHEMA CONSENT_AND_PREFERENCE;

create or replace table full_consent_preferences_initial_load (
    havenid varchar(12) ,
    email_address varchar(256) ,
    email varchar(1) ,
    holiday varchar(1) ,
    cs varchar(1) ,
    preference_dt number(18, 0)
);

SELECT date(preference_dt) FROM full_consent_preferences_initial_load LIMIT 100;

USE ROLE accountadmin;
--SHOW tasks in account;
--USE ROLE dba;
SHOW tasks in account;
--SHOW tasks IN DATABASE;

CREATE OR REPLACE VIEW haven_store.CONSENT_AND_PREFERENCE.FULL_CONSENT_PREFERENCES(
	HAVENID,
	EMAIL_ADDRESS,
	EMAIL,
	HOLIDAY,
	CS,
	PREFERENCE_DT
) as SELECT 
	HAVENID, EMAIL_ADDRESS, EMAIL, HOLIDAY, CS, PREFERENCE_DT 
FROM haven_store.CONSENT_AND_PREFERENCE.full_consent_preferences_initial_load;

USE ROLE dba;
TRUNCATE TABLE haven_store.CONSENT_AND_PREFERENCE.full_consent_preferences_initial_load;

SELECT count(*) FROM haven_store.CONSENT_AND_PREFERENCE.FULL_CONSENT_PREFERENCES;

SELECT * FROM haven_store.CONSENT_AND_PREFERENCE.FULL_CONSENT_PREFERENCES 
LIMIT 100;
-- "HAVEN_STORE"."CONSENT_AND_PREFERENCE"."FULL_CONSENT_PREFERENCES" source

create or replace view HAVEN_STORE.CONSENT_AND_PREFERENCE.FULL_CONSENT_PREFERENCES(
	HAVENID,
	EMAIL_ADDRESS,
	EMAIL,
	HOLIDAY,
	CS,
	PREFERENCE_DT
) as    
with 
    --email preferences for owners
    c_owner_email_pref as (
        select 
            cp.type_ref as owner_id ,
            cp.valid_from_dttm as optin_dt ,
            cp.contact_yn
        from 
            haven_base.sas_common.contact_preferences cp
        where 
            cp.type_name = 'OWNERID' and
            cp.category_code = 'SAL' and 
            cp.contact_method = 'EMAIL'
        and 
            year(valid_from_dttm) between year(current_date) - 5 and year(current_date) 
    ) ,
    -- email preferences for holidays and eclients
    c_hol_email_pref as
    (
        select 
            trim(lower(replace(em.email_address, '\n', ''))) as email_address ,
            em.email_id ,
            cp.valid_from_dttm as optin_dt ,
            cp.contact_yn as contact_yn
        from 
            haven_base.sas_common.contact_preferences cp
        join 
            haven_base.sas_common.email em
            on  cp.type_ref = em.email_id
        where 
            em.email_address like '%@%.%' and
            cp.type_name = 'EMAILID' and 
            cp.category_code = 'GEN' and 
            cp.contact_method = 'EMAIL' and 
            cp.brand_ref = 1 and 
            year(cp.valid_from_dttm) between year(current_date) - 5 and year(current_date) 
        qualify
            row_number() over (partition by trim(lower(replace(em.email_address, '\n', ''))) order by cp.valid_from_dttm desc) = 1
    ) ,
    -- getting the preference for the latest owner where there are many ownerids who have the same email.
    c_latest_owner as (
        select
            trim(lower(replace(ow.email,'\n',''))) as email_address ,
            ow.owner_id ,
            ow.created_dt
        from 
            haven_base.plot.owners ow
        where 
            ow.email like '%@%.%'
        qualify
            row_number() over (partition by email_address order by ow.created_dt desc) = 1
    ) ,
    c_plot_email as (
        select 
            trim(lower(replace(ow.email,'\n',''))) as email_address ,
            case when oe.contact_yn = 'Y' then 'Y' else 'N' end as email_preference ,
            oe.optin_dt as email_preference_dt , 
            case when ac.account_id is not null then 'OWNER' else 'CS' end as topic ,
            'PLOT_OWNER' as source_system ,
            ow.owner_id as source_id
        from 
            haven_base.plot.owners ow
        join 
            c_latest_owner lo 
            on  lo.owner_id = ow.owner_id
        left join 
            haven_base.plot.accounts ac
            on  ac.owner_id = ow.owner_id
        join 
            c_owner_email_pref oe 
            on ow.owner_id = oe.owner_id
        where 
            ac.account_id is null and
            ow.email like '%@%.%' 
    ) ,
    c_hol_cp_base as (
        select
            em.email_id ,
            ep.email_address ,
            case so.src_sys_name 
                when 'SEAWARE' then 'SEAWARE_CLIENT' 
                when 'SEAWARE-CP' then 'SEAWARE_CLIENT' 
                when 'SEAWARE-SH' then 'SAVED_HOLIDAY'
                when 'EQUALIZER' then 'EQUALIZER'
                when 'SEAWARE-EC' then 'SEAWARE_ECLIENT'
                when 'TROOPER' then 'SEAWARE-CLIENT'
            end as source_system ,
            max(so.src_sys_ref::number(12, 0)) as source_id 
        from 
            haven_base.sas_common.email em
        join 
            haven_base.sas_common.person_email pe
            on  em.ref = pe.email_ref
        left join
            haven_base.sas_common.person_sources so
            on  so.person_id = pe.person_id
        join 
            haven_base.sas_common.person_email_sources ps
            on  ps.person_email_ref = pe.ref
        join 
            c_hol_email_pref ep 
            on  em.email_id = ep.email_id
        where 
            ps.source in ('SEAWARE', 'SEAWARE-CP', 'SEAWARE-EC', 'SEAWARE-SH', 'EQUALIZER', 'TROOPER') and
            ps.brand_ref = 1
        group by 
            em.email_id ,
            ep.email_address ,
            source_system 
    ) ,
    c_hol_email as (
        select
            cb.email_address ,
            case when ep.contact_yn = 'Y' then 'Y' else 'N' end as email_preference ,
            ep.optin_dt as email_preference_dt ,
            'HOLIDAYS' as topic ,
            cb.source_system ,
            cb.source_id 
        from 
            c_hol_cp_base cb
        join
            c_hol_email_pref ep 
            on  cb.email_id = ep.email_id
    ) ,
    c_cs_eclient_email as (
        select
            trim(lower(replace(em.email_address, '\n', ''))) as email_address ,
            case when ep.contact_yn = 'Y' THEN 'Y' ELSE 'N' END as email_preference ,
            ep.optin_dt as email_preference_dt ,
            'CS' as topic ,
            'CS-ECLIENT' as source_system ,
            em.email_id as source_id
        from 
            haven_base.sas_common.email em
        join 
            haven_base.sas_common.person_email pe
            on  em.ref = pe.email_ref
        join 
            haven_base.sas_common.person_email_sources ps
            on  ps.person_email_ref = pe.ref
        join 
            c_hol_email_pref ep on em.email_id = ep.email_id
        left join 
            c_plot_email pl 
            on  trim(pl.email_address) = trim(lower(replace(em.email_address, '\n', '')))
        where 
            ps.source in ('CS-EC','CS-LEADS','CS_LEADS','CS-ALERT') and 
            em.email_address like '%@%.%' and 
            (
                pl.email_address is null or
                ep.optin_dt > pl.email_preference_dt
            ) and 
            ps.brand_ref = 1
    ) ,
    c_cs_preference as (
        select * from c_plot_email
        union all
        select * from c_cs_eclient_email
    ) ,
    c_cs_distinct as (
        select 
            *
        from     
            c_cs_preference
        qualify
            row_number() over (partition by email_address order by email_preference_dt desc)  = 1
    ) ,
    c_all_emails as (
        select * from c_cs_distinct
        union all
        select * from c_hol_email
    ) , 
    c_consent_event_base as (
        select 
            nvl(hi.hid, '') as havenid ,
            sp.email_address ,
            sp.email_preference ,
            sp.email_preference_dt ,
            sp.topic ,
            sp.source_system as source_type,
            sp.source_id ,
            current_timestamp as write_date
        from 
            c_all_emails sp
        left join
            haven_base.identity.hid_to_email hi
            on  hi.email = sp.email_address
        qualify
            row_number() over (partition by havenid, topic order by email_preference_dt desc) = 1
    ) , 
    c_consent_base as (
        select 
            sp.havenid ,
            sp.email_address ,
            sp.email_preference ,
            sp.email_preference_dt ,
            sp.topic ,
            sp.source_type ,
            sp.source_id ,
            current_timestamp as write_date
        from 
            c_consent_event_base sp
    ) ,
    c_havenid as (
        select  distinct
            eb.havenid as havenid ,
            eb.email_address 
        from
            c_consent_base eb
    ) ,
    c_base as (
        select
            eb.email_address ,
            eb.email_preference ,
            case when topic = 'HOLIDAYS' then email_preference else '-' end as holiday_preference ,
            case when topic = 'CS' then email_preference else '-' end as cs_preference ,
            case when topic = 'HOLIDAYS' then email_preference else 'N' end as holiday ,
            case when topic = 'CS' then email_preference else 'N' end as cs ,
            case when topic = 'HOLIDAYS' then email_preference_dt else '1901-01-01'::date end as holiday_preference_dt ,
            case when topic = 'CS' then email_preference_dt else '1901-01-01'::date end as cs_preference_dt ,
            eb.write_date
        from
            c_consent_base eb
    ) , 
    c_prefs as (
        select
            ch.havenid ,
            cb.email_address ,
            max(cb.holiday_preference) || max(cb.cs_preference) as prefs_combined ,
            max(cb.holiday) as holiday ,
            max(cb.cs) as cs ,
            max(greatest(cb.holiday_preference_dt, cb.cs_preference_dt)) as preference_dt ,
            max(write_date) as write_date
        from
            c_base cb
        join
            c_havenid ch 
            on  cb.email_address = ch.email_address
        group by
            ch.havenid ,
            cb.email_address 
    )
select 
    cp.havenid as HavenID ,
    cp.email_address as email_address ,
    case when cp.prefs_combined in ('YY', 'YN', 'NY', 'Y-', '-Y') then 'Y' else 'N' end as email ,
    cp.holiday as holiday ,
    cp.cs as cs ,
    date_part(epoch, preference_dt::date) as preference_dt 
from
    c_prefs cp
where
    email_address not like '% %';