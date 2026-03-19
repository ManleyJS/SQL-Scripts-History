         select 
            max(event_timestamp) as event_timestamp
         from  
             HAVEN_PIPELINE.bloomreach.state__session
         where
             event_key = 'customer::seaware_primary_number_sms'
;

with    
     c_timestamp as (
         select 
            '2024-11-21 07:46:08.000' as event_timestamp
     ) ,
    c_base_phone as (
        SELECT
            lr.source_id as household_phone_id,
            count_if(lr.action = 'I') > 0 as new_number,
            min(case when lr.action = 'I' then lr.date_modified end) as new_number_timestamp,
            count_if(lf.field_name = 'PHONE_NUMBER') > 0 as was_phone_number_updated,
            max(lr.date_modified) as update_timestamp
        from 
            haven_raw.seaware.vcs_log_record_swap lr
            --haven_base.seaware.vcs_log_record lr
        join
            haven_raw.seaware.vcs_log_field_fieldname lf
            --haven_base.seaware.vcs_log_field lf 
            on  lf.log_record_id = lr.log_record_id and
            lf.field_name in ('PHONE_NUMBER')
        where
            lr.table_name = 'HOUSEHOLD_PHONE' and
            lr.date_modified > (select max(event_timestamp) from c_timestamp) 
        group by
            lr.source_id
    ),
    c_base_2 as (
        SELECT
            hp.Household_ID,
            cl.client_id,
            cp.new_number,
            new_number or was_phone_number_updated as is_phone_updated_or_new,
            coalesce(cp.new_number_timestamp, cp.update_timestamp) as update_timestamp,
            hp.phone_number primary_phone_number,
            cp.was_phone_number_updated
        FROM
            haven_base.seaware.household_phone hp 
            --haven_base.seaware.household_phone hp
        join    
            c_base_phone cp 
            on hp.household_phone_id = cp.household_phone_id
        join
            haven_base.seaware.client cl   
            --haven_base.seaware.client cl 
            on cl.household_id = hp.household_id
        where 
            hp.phone_number like '07%' and   
            cl.web_login_name is not null
        order by 
            cl.client_id
    ),
    c_latest_phone as (
        select
            cp.*
        from 
            c_base_2 cp
        qualify
            -- this is getting the latest client.
            row_number() over (partition by client_id order by update_timestamp desc) = 1
    ),
    c_active_clients as (
        select distinct
            rc.client_id
        from
            haven_base.seaware.res_header as rh
        join
            haven_base.seaware.res_guest as rc
            on  rc.res_id = rh.res_id and
                rc.guest_seqn = 1
        where
            rh.sail_date_from > '2019-01-01'::date
    )
    select
        aa.household_id,
        aa.client_id,
        case when aa.primary_phone_number like '07%' then concat('+44', substr(aa.primary_phone_number,2)) else '' end primary_number,
        aa.is_phone_updated_or_new,
        aa.update_timestamp
    from 
        c_latest_phone aa 
    where
        -- only need to check active clients if it's the initial load
        -- if the timestamp date is prior to 1900 we assume it's the first run.
        (
            (select max(xx.event_timestamp) from c_timestamp xx) > '1900-01-01'::date
            or
            aa.update_timestamp > '2019-01-01'::date
            or
            aa.client_id in (
                select xx.client_id from c_active_clients xx
            )
        )
        ;