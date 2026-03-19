USE ROLE DBA;

USE SCHEMA HAVEN_STORE_AA_DEV.COMMON;

create view HAVEN_STORE_AA_DEV.COMMON.accounts_audit
   as (
select    
    a.*,
    nvl(dateadd(ms, -1, lag(a.change_dt) over(partition by a.account_id order by a.change_dt desc)), current_timestamp::TIMESTAMP_NTZ)::TIMESTAMP_NTZ as change_dt_to
from 
    haven_base.plot.accounts_audit a
  );

create  view HAVEN_STORE_AA_DEV.COMMON.ARRIVAL_PERIODS(
	ARRIVAL_SEASON,
	ARRIVAL_WEEK_NUMBER,
	ARRIVAL_WEEK_NAME,
	ARRIVAL_PERIOD_NUMBER,
	ARRIVAL_START_DATE,
	ARRIVAL_END_DATE,
	ARRIVAL_PERIOD_NAME
) as
select 
    aa.season           arrival_season,
    aa.weeknumber       arrival_week_number,
    aa.weekname         arrival_week_name,
    aa.periodnumber     arrival_period_number,
    aa.startdate        arrival_start_date,
    aa.v$enddate        arrival_end_date,
    'P'||periodnumber   arrival_period_name
from (
    -- there are a couple of errors in the base data.
    -- we expect that the start/end dates to be contiguous, but in 1 or 2 cases they're
    -- the hack below fixes issues where the enddate is greater or equal to the next start date
    select 
        ap.*,
        lead(startdate::date) over (order by startdate) v$next_date,
        case when enddate>=v$next_date then v$next_date-1 else enddate end v$enddate
    from   
        haven_base.mariner.ArrivalWeeksByPeriod ap
) aa
;

create view HAVEN_STORE_AA_DEV.common.break_day_calendar
   as (
with c_break_calendar as (
    select
        c.day_date,
        c.day_name,
        c.month_name,
        c.day_number,
        month(c.day_date) as month_number,
        datediff('day', '1970-01-01', c.day_date) as epoch_days,
        c.day_date::timestamp_ntz as day_start_datetime,
        dateadd('millisecond', -1, c.day_date + 1) as day_end_datetime,
        c.break_start_date,
        c.break_end_date,
        initcap(c.break_type) as break_type,
        datediff('day', c.break_start_date, c.break_end_date) + 1 as break_duration,
        c.week_number,
        'W' || week_number as week_label,
        c.year_number,
        year_number || week_label as year_week_label,
        case when dayofweek(c.day_date) <> 5 then
            greatest(
                previous_day(c.day_date, 'Friday'),
                date_trunc('year', c.day_date)
            )
        else
            c.day_date
        end as v_week_start_date,
        case when dayofweek(c.day_date) <> 4 then
            least(
                next_day(c.day_date, 'Thursday'),
                last_day(c.day_date, 'year')
            )
        else
            c.day_date
        end as v_week_end_date,
        v_week_start_date::timestamp_ntz as week_start_datetime,
        dateadd('millisecond', -1, v_week_end_date + 1) as week_end_datetime,
        date_trunc('year', c.day_date) as year_start_date,
        last_day(c.day_date, 'year') as year_end_date,
        year_start_date::timestamp_ntz as year_start_datetime,
        dateadd('millisecond', -1, year_end_date + 1) as year_end_datetime
    from
        HAVEN_STORE_AA_DEV.common.dim_calendar c
)
select
    day_date,
    day_name,
    month_name,
    day_number,
    month_number,
    epoch_days,
    day_start_datetime,
    day_end_datetime,
    break_start_date,
    break_end_date,
    break_type,
    break_duration,
    week_number,
    week_label,
    year_number,
    year_week_label,
    v_week_start_date as week_start_date,
    v_week_end_date as week_end_date,
    week_start_datetime,
    week_end_datetime,
    year_start_date,
    year_end_date,
    year_start_datetime,
    year_end_datetime
from
    c_break_calendar
  );

create  view HAVEN_STORE_AA_DEV.common.GRADE_IMAGES as 
select
    aa.grade_code,
    aa.image_index,
    aa.alt_text,
    aa.default_image_url,
    aa.large_image_url,     
    aa.medium_image_url,     
    aa.small_image_url,
    aa.small_image_doc,
    aa.default_image_doc,
    aa.large_image_doc,
    aa.medium_image_doc
from 
    haven_base.common.grade_images aa
;

-- view HAVEN_STORE_AA_DEV.common.grade_reporting_groups did notwork as HAVEN_BASE.SEAWARE.VRES_WEB_PRICE no longer exists 

create view HAVEN_STORE_AA_DEV.common.grade_reporting_groups
   as (
    select
grade as grade_code,
(case
    when pr.grade in ('BRA2', 'BRB2', 'BRC2', 'BRD2', 'SAA2', 'SAB2', 'SAC2', 'SAD2') then 'Accessible'
    when pr.grade in ('BRP2', 'BRP3', 'BRP4', 'SAC2', 'SAD2', 'SAP2', 'SAP3', 'SAP4','SIP2', 'SIP3') then 'Dog Grades'
    when pr.grade in ('BRA2',' BRB2',' BRC2',' BRD2','BRO2','BRO3','BRO4','BRP2','BRP3','BRP4') then 'Bronze'
    when pr.grade in ('GOL2','GOL3') then 'Gold'
    when pr.grade in ('SAA2','SAB2','SAC2','SAD2','SAP2','SAP3','SAP4','SAV2','SAV3') then 'Saver'
    when pr.grade in ('SSG2', 'SSG3', 'SSL2', 'SSL3', 'SSS2', 'SSS3') then 'Signature'
    when pr.grade in ('SIL2', 'SIL3', 'SIP2', 'SIP3') then 'Silver'
    when pr.grade in ('SLL2', 'SLL3', 'SLS2', 'SLS3', 'DIA2', 'DIA3', 'EME2', 'EME3', 'BP3', 'EX02' , 'EX03' , 'FBZ3' , 'LD3' , 'LG3' , 'LL02' , 'LL03' , 'LP2' , 'LP3' , 'SG2' , 'SG3' , 'SP2' , 'SP3' , 'SRG2' ,
    'VG2' , 'VG3' , 'XH2', 'XH3' , 'NLL2' , 'NLL3', 'BRS2','BRS3') then 'Views, Lodges & Select'
    when pr.grade in ( 'GP2' , 'GP3' , 'NPI2' , 'NPI3' , 'NPW2' ,'NPW3' , 'NWL2' , 'NWL3' , 'NWS2' , 'NWS3' , 'PL2' , 'PL3' , 'VP3', 'VP2' ) then 'Platinum'
    when pr.grade in ( 'NPD2' , 'NPD3' , 'RT2' , 'RT3') then 'Prestige Deck'
    when pr.grade in ( 'GO2' ,'GO2P' , 'GO3' , 'GO3P' , 'GO4X' , 'NPR2' , 'NPR3' , 'PP2' , 'PP3') then 'Prestige (inc New)'
    when pr.grade in ( 'LXP2' , 'LXP3' , 'NDL2' , 'NDL3' , 'SI2' , 'SI2P' , 'SI3' , 'SI3P' , 'SI4X') then 'Deluxe (inc New & Dog)'
    when pr.grade in (  '3S2' , '3S3' , '4S2' , '4S3' , 'LUX2' ,  'LUX3' ,  'NST3', 'STA2',  'STA3' ) then 'Standard (inc New)'
    when pr.grade  in ( 'BZ2' ,  'BZ3' ,  'F4S2' ,  'F4S3' ,  'GG2' , 'GG3' ,  'PET2' ,  'PET3' ,  'DD2' , 'DD3' , 'PD2' , 'PD3')then 'Dog Grades'
    when pr.grade in ( 'AB26' ,  'AB38' ,  'AE26' ,  'AG26' , 'AG36' ,  'AG48' ,  'AS26' , 'AS38' ,  'AS48' ,  'AX24' ,  'AX26' , 'CB26' , 'CE26' , 'CG2P' , 'CG2X' , 'CG24' , 'CG26' , 'CG36' , 'CG48' ,  'CS2X' ,         'CS26',  'GEN2')then 'Apts/Chalets'
    when pr.grade in (  'BZ2D' , 'BZWD' , 'GO2D' , 'GOWD' , 'SI2D' ,  'SIWD') then 'Accessible'
    when pr.grade in (  'GE2' ,  'HPO4' ,  'HPO6' , 'SF25' , 'ST3P' , 'ST3S' , 'ST36' , 'YU02' ,  'YU03' ,  'YU04') then 'Glamping'
    // TOURING
    when pr.grade in ('TBG', 'TBGA') then 'Touring - Basic'
    when pr.grade in ('TEGL', 'TEGA', 'TEGW', 'TEH', 'TEHA', 'TEHW', 'TEWH', 'TEXA') then 'Touring- Electric'
    when pr.grade in ('TSHA', 'TSHL') then  'Touring - Super'
    when pr.grade in ('TTEG', 'TTEL', 'TTG') then 'Touring - Tent'
    when pr.grade in ('TUH', 'TUHA', 'TUHL') then 'Touring - Euro'
end) as grade_name
from haven_base.seaware.vres_web_price pr
group by 1,2
  );
   
create view HAVEN_STORE_AA_DEV.common.jdw_catering_sessions
(
    "START_TIME" COMMENT $$The start time of the catering session, stored as a time value.
$$, 
    "END_TIME" COMMENT $$The end time of the catering session, stored as a time value.
$$, 
    "CATERING_SESSION" COMMENT $$A concatenated string combining the start and end times with the session name  in the format "(start_time-end_time) session_name".$$
)
   as (
select 
    column1::time as start_time,
    column2::time as end_time,
    concat('(', start_time, '-', end_time, ')', ' ', column3) as catering_session
from values
    ('06:00:00', '12:00:00', 'Breakfast'),
    ('12:00:00', '14:00:00', 'Lunchtime'),
    ('14:00:00', '17:00:00', 'Afternoon'), 
    ('17:00:00', '21:00:00', 'Dinner'),
    ('21:00:00', '23:00:00', 'Evening'),
    ('23:00:00', '23:59:59', 'After Hours'),
    ('00:00:00', '06:00:00', 'Early Hours')
  );

create view HAVEN_STORE_AA_DEV.common.jdw_delivery_times_by_day
(
    "SITE_NAME" COMMENT $$The name of the pub site.
$$, 
    "WEEK_NUMBER" COMMENT $$The week number of the year.
$$, 
    "WEEK_START_DATE" COMMENT $$The start date of the week.
$$, 
    "WEEK_END_DATE" COMMENT $$The end date of the week.
$$, 
    "ORDER_DATE" COMMENT $$The calendar date of the orders.
$$, 
    "DAY_NAME" COMMENT $$The name of the day (e.g., Mon, Tue).
$$, 
    "CATERING_SESSION_DESCRIPTION" COMMENT $$A description of the catering session (e.g., Breakfast, Lunch), derived from the `jdw_delivery_times` model.
$$, 
    "CATEGORY" COMMENT $$The category of the order, either 'FOOD' or 'WET' (drinks).
$$, 
    "PREPARATION_TIME" COMMENT $$The average preparation time (in seconds) for orders on the given day.
$$, 
    "WAIT_TIME" COMMENT $$The average wait time (in seconds) for orders on the given day, calculated as the difference  between total time and preparation time.
$$, 
    "TOTAL_TIME" COMMENT $$The average total time (in seconds) for orders on the given day.
$$, 
    "OVER_TEN_MINS" COMMENT $$A boolean indicating whether the total time exceeded 10 minutes.
$$, 
    "ORDER_COUNT" COMMENT $$The total number of distinct orders on the given day.
$$, 
    "ITEM_COUNT" COMMENT $$The total number of items ordered on the given day.$$
)
   as (
select  
    dd.site_name,
    dd.week_number,
    dd.week_start_date,
    dd.week_end_date,
    dd.day_date as order_date,
    dd.day_name,
    dd.catering_session_description,
    dd.category, 
    dateadd(second, dd.bumped_time_seconds, '00:00:00'::time) as preparation_time,
    dateadd(second, dd.expo_time_seconds - dd.bumped_time_seconds, '00:00:00'::time) as wait_time,
    dateadd(second, dd.expo_time_seconds, '00:00:00'::time) as total_time,
    case
        when dd.expo_time_seconds >= 600 then true else false 
    end as over_ten_mins,
    dd.order_count,
    dd.item_count,
from
    HAVEN_STORE_AA_DEV.common.jdw_delivery_times dd
  );

create view HAVEN_STORE_AA_DEV.common.jdw_delivery_times_by_week
(
    "SITE_NAME" COMMENT $$The name of the pub site.
$$, 
    "WEEK_NUMBER" COMMENT $$The week number of the year.
$$, 
    "WEEK_START_DATE" COMMENT $$The start date of the week.
$$, 
    "WEEK_END_DATE" COMMENT $$The end date of the week.
$$, 
    "CATERING_SESSION_DESCRIPTION" COMMENT $$A description of the catering session (e.g., Breakfast, Lunch), derived from the `jdw_delivery_times` model.
$$, 
    "CATEGORY" COMMENT $$The category of the order, either 'FOOD' or 'WET' (drinks).
$$, 
    "PREPARATION_TIME" COMMENT $$The average preparation time (in seconds) for orders during the week.
$$, 
    "WAIT_TIME" COMMENT $$The average wait time (in seconds) for orders during the week, calculated as the difference  between total time and preparation time.
$$, 
    "TOTAL_TIME" COMMENT $$The average total time (in seconds) for orders during the week.
$$, 
    "TOTAL_OVER_TEN_MINS" COMMENT $$A boolean indicating whether the total time exceeded 10 minutes.
$$, 
    "LATE_ORDER_PERCENTAGE" COMMENT $$The percentage of late orders (preparation time exceeding 600 seconds) during the week.
$$, 
    "ITEM_COUNT" COMMENT $$The total number of items ordered during the week.
$$, 
    "ORDER_COUNT" COMMENT $$The total number of distinct orders during the week.$$
)
   as (
with 
    c_aggregated_by_week as (
        select 
            ww.site_name,
            ww.week_number,
            ww.week_start_date,
            ww.week_end_date,
            ww.catering_session_description,
            ww.category,
            avg(ww.bumped_time_seconds) as preparation_time, 
            avg(ww.expo_time_seconds) - avg(ww.bumped_time_seconds) as wait_time, 
            avg(ww.expo_time_seconds) as total_time,
            sum(ww.order_count) as order_count,
            sum(ww.item_count) as item_count,
            sum(ww.late_order_percentage) / sum(ww.item_count) * 100 as late_order_percentage,
        from
            HAVEN_STORE_AA_DEV.common.jdw_delivery_times ww
        group by
            ww.site_name,
            ww.catering_session_description,
            ww.category,
            ww.week_number,
            ww.week_start_date,
            ww.week_end_date
    )
select 
    gg.site_name,
    gg.week_number,
    gg.week_start_date,
    gg.week_end_date,
    gg.catering_session_description,
    gg.category,
    dateadd(second, gg.preparation_time, '00:00:00'::time) as preparation_time,
    dateadd(second, gg.wait_time, '00:00:00'::time) as wait_time,
    dateadd(second, gg.total_time, '00:00:00'::time) as total_time,
    case
        when gg.total_time >= 600 then true else false 
    end as total_over_ten_mins,
    round(gg.late_order_percentage, 2) as late_order_percentage,
    gg.item_count,
    gg.order_count
from
    c_aggregated_by_week gg
  );

create view HAVEN_STORE_AA_DEV.common.jdw_logwood_sites
(
    "SITE_XID" COMMENT $$A unique identifier for the site.
$$, 
    "PUB_NUMBER" COMMENT $$The numeric identifier for the pub.
$$, 
    "PUB_NAME" COMMENT $$The name of the pub.
$$, 
    "SITE_CODE" COMMENT $$A short code representing the site.
$$, 
    "PUB_NAME_LONG" COMMENT $$A concatenated string combining the pub number and pub name in the format "pub_number - pub_name".$$
)
   as (
select 
    column1 as site_xid,
    column2 as pub_number,
    column3 as pub_name,
    column4 as site_code,
    concat(pub_number, ' - ', pub_name) as pub_name_long,  
from values
    (1, 7901, 'The Five Stones', 'PV'),
    (2, 7907, 'The Humber Stone', 'TP'),
    (3, 7906, 'The Sir Thomas Haggerston', 'HA'),
    (4, 7910, 'The London Stone', 'AH'),
    (5, 7901, 'The Red Rocks', 'DE')
  );


create  view HAVEN_STORE_AA_DEV.common.PARK_GRADES as 
SELECT
    aa.park_code,
    aa.grade,
    aa.grade_type,
    aa.pets_allowed,
    aa.accessible,
    aa.rooms,
    aa.is_parent_grade,
    aa.grade_name
from haven_base.common.PARK_GRADEs aa;
;

create   view HAVEN_STORE_AA_DEV.COMMON.pitches_audit
   as (
with 
    c$_pitches_audit_cleansed as (
        select
            p.* exclude(longitude,latitude),
            TRIM(p.longitude, ' \r\n\t\xA0')::number(9,6) as longitude_cleansed,
            TRIM(p.latitude, ' \r\n\t\xA0')::number(9,6) as latitude_cleansed,
            (case when longitude_cleansed > latitude_cleansed then latitude_cleansed  else longitude_cleansed end) as longitude,
            (case when longitude_cleansed > latitude_cleansed then longitude_cleansed  else latitude_cleansed end) as latitude,
            nvl(dateadd(ms, -1, lag(p.change_dt) over(partition by p.pitch_id order by p.change_dt desc)), current_timestamp::TIMESTAMP_NTZ)::TIMESTAMP_NTZ as change_dt_to
        from 
            haven_base.plot.pitches_audit p 
    )
select
    c.* exclude(longitude_cleansed,latitude_cleansed)
from 
    c$_pitches_audit_cleansed c
  );

create    view HAVEN_STORE_AA_DEV.common.postcode_directory
(
    "COMPRESSED_POSTCODE" COMMENT $$$$, 
    "FORMATTED_POSTCODE" COMMENT $$$$, 
    "MOSAIC_GROUP_NUMERIC_CODE" COMMENT $$$$, 
    "MOSAIC_GROUP_ALPHA_CODE" COMMENT $$$$, 
    "MOSAIC_TYPE_CODE" COMMENT $$$$, 
    "MOSAIC_CODE" COMMENT $$$$, 
    "MOSAIC_GROUP_NAME" COMMENT $$$$, 
    "MOSAIC_GROUP_CODED_NAME" COMMENT $$$$, 
    "MOSAIC_TYPE_NAME" COMMENT $$$$, 
    "MOSAIC_TYPE_CODED_NAME" COMMENT $$$$, 
    "BBC_TV_REGION_CODE" COMMENT $$$$, 
    "BBC_TV_REGION_NAME" COMMENT $$$$, 
    "CHANNEL4_TV_REGION_CODE" COMMENT $$$$, 
    "CHANNEL4_TV_REGION_NAME" COMMENT $$$$, 
    "POSTCODE_LATITUDE" COMMENT $$$$, 
    "POSTCODE_LONGITUDE" COMMENT $$$$, 
    "POSTCODE_COORDINATES" COMMENT $$$$
)
   as (
with
    c_base as (
        select 
            a.compressed_postcode_standard_8_bytes      as compressed_postcode,
            a.postcode_format4                          as formatted_postcode,
            a.pc_mosaic_uk7_group_numeric               as mosaic_group_numeric_code,
            a.pc_mosaic_uk7_group                       as mosaic_group_alpha_code,
            a.pc_mosaic_uk7_type                        as mosaic_type_code,
            concat(
                a.pc_mosaic_uk7_group,
                a.pc_mosaic_uk7_type
            )                                           as mosaic_code,
            substr(a.pc_mosaic_uk7_group_label, 3)      as mosaic_group_name,
            a.pc_mosaic_uk7_group_label                 as mosaic_group_coded_name,
            substr(a.pc_mosaic_uk7_type_label, 5)       as mosaic_type_name,
            a.pc_mosaic_uk7_type_label                  as mosaic_type_coded_name,
            a.bbc_tv_code                               as bbc_tv_region_code,
            case a.bbc_tv_code
                when '503' then 'East of England'
                when '504' then 'West'
                when '505' then 'South West'
                when '506' then 'South'
                when '507' then 'Yorkshire and Lincolnshire'
                when '508' then 'North East and Cumbria'
                when '509' then 'North West'
                when '510' then 'Scotland'
                when '511' then 'Ulster'
                when '512' then 'Wales'
                when '513' then 'Midlands West'
                when '514' then 'Midlands East'
                when '515' then 'London'
                when '516' then 'South East'
                else a.bbc_tv_code
            end                                         as bbc_tv_region_name,
            a.channel_4_area                            as channel4_tv_region_code,
            case a.channel_4_area
                when '01' then 'London'
                when '02' then 'London & Midlands & South'
                when '03' then 'London & South'
                when '04' then 'Midlands'
                when '05' then 'Midlands & North'
                when '06' then 'Midlands & North & South'
                when '07' then 'Midlands & South'
                when '08' then 'Midlands & South & Wales'
                when '09' then 'Midlands & Wales'
                when '10' then 'North'
                when '11' then 'North & Scotland'
                when '12' then 'North & Wales'
                when '13' then 'Scotland'
                when '14' then 'South'
                when '15' then 'South & North'
                when '16' then 'South & Wales'
                when '17' then 'Wales'
                when '18' then 'Northern Ireland'
                else a.channel_4_area
            end                                         as channel4_tv_region_name,
            a.experian_postcode_wgs84_latitude          as postcode_latitude,
            a.experian_postcode_wgs84_longitude         as postcode_longitude,
            st_makepoint(
                try_to_decimal(a.experian_postcode_wgs84_longitude, 10, 6),
                try_to_decimal(a.experian_postcode_wgs84_latitude, 10, 6)
            )                                           as postcode_coordinates
        from
            haven_base.experian.client_haven_pc_directory a
    )
select *
from c_base
  );

create   view HAVEN_STORE_AA_DEV.COMMON.sale_signups
   as (
with 
    c_sale_type as (
        select 
            st.sale_type_enum,
            iff(st.sale_type_code in ('N', 'NPX', 'PET'), 'NEW', st.sale_type_code) as sale_type_group_code,
            st.sale_type_code,
            sale_type_desc as sale_type
        from
            haven_base.plot.sales_types st
    ),
    c_sales as (
        select
            sa.sale_id,
            last_value(sale_id) over(partition by account_id order by sale_id) as lastest_sale_id,
            sa.csi_no,
            sa.destination_pitch_id, 
            sa.van_id,
            sa.park_id,
            sa.account_id,
            sa.original_validation_dt::date as original_validation_date,
            sa.validation_date::date as validation_date,
            sa.completion_date::date as completion_date,
            sa.cancellation_date::date as cancellation_date,
            sa.cancellation_sale_id,
            st.sale_type_group_code,
            st.sale_type_code,
            st.sale_type,
            sa.sale_status_enum,
            sa.csp_id,
            iff(sa.finance_amount > 0, true, false) as is_financing,
            sa.transferred_from_sale_id,
            sa.posting_date::date as posting_date,
            case 
                when sa.validation_date is not null and 
                     sale_status_enum = 4
                then -1
                when sa.validation_date is not null and 
                     sale_status_enum in (2,3)
                then 1
                else 0
            end as net_signup,
            reason_cancelled_id,
            dc.week_start_date,
            dc.week_end_date,
            dc.year_number,
            dc.week_number
        from 
            haven_base.plot.sales sa
        join   
            c_sale_type st 
            on st.sale_type_enum = sa.sale_type_enum
        left join
            HAVEN_STORE_AA_DEV.common.reporting_day_calendar dc
            on dc.day_date = sa.posting_date
        where
            sa.created_dt >= dateadd(year, -10, current_date) 
            -- and account_id = 63674 --63674.0
    ),
    c_sale_signup_range_step01 as (
        select 
            sa.account_id,
            sa.csi_no,
            sa.sale_id,
            sa.lastest_sale_id
        from 
            c_sales sa
        qualify
            sum(sa.net_signup) 
                over(partition by sa.account_id, sa.sale_type_group_code, 
                sa.year_number, sa.week_number
            ) <> 0
    ),
    c_sale_signup_range as (
        select 
            sr.account_id,
            sr.sale_id as min_sale_id,
            nvl(
                lead(sr.sale_id -1) over(partition by sr.account_id order by sr.sale_id),
                lastest_sale_id 
            ) as max_sale_id
        from 
            c_sale_signup_range_step01 sr
    ),
    c_signup_date_sale_range as (
        select 
            sa.sale_id,
            sa.csi_no,
            nvl(
                min(sa.original_validation_date) 
                over(partition by sa.account_id, sr.min_sale_id),
                min(sa.validation_date) 
                over(partition by sa.account_id, sr.min_sale_id)
            ) as signup_date
        from
            c_sales sa
        left join
            c_sale_signup_range sr 
            on sr.account_id = sa.account_id and 
            sa.sale_id between sr.min_sale_id and sr.max_sale_id
    )
        select 
            sa.csi_no, 
            min(sd.signup_date) as signup_date
        from 
            c_sales sa
        join 
            c_signup_date_sale_range sd 
            on sd.sale_id = sa.sale_id
        group by
            sa.csi_no
  );


create   view HAVEN_STORE_AA_DEV.COMMON.vans_audit
   as (
with 
    c$_dedupe as (
        select  
            v.*
        from 
            haven_base.plot.vans_audit v
            qualify row_number() over(partition by v.van_id, v.change_dt order by v.pk_vans_audit desc) = 1
    ),
    c$_van_grade_backfill as (
        select
            v.van_id,
            min(v.change_dt) as van_grade_backfill_cut_off_date,
            min_by(v.van_grade_id,v.change_dt) as van_grade_id_backfill
        from 
            c$_dedupe v
        where 
            v.van_grade_id is not null
        group by 
            v.van_id
    )
select
    v.* exclude van_grade_id,
    (case when v.change_dt < bf.van_grade_backfill_cut_off_date then bf.van_grade_id_backfill else v.van_grade_id end) as van_grade_id,
    nvl(dateadd(ms, -1, lag(v.change_dt) over(partition by v.van_id order by v.change_dt desc)), current_timestamp::TIMESTAMP_NTZ)::TIMESTAMP_NTZ as change_dt_to
from  
    c$_dedupe v
left join 
    c$_van_grade_backfill bf 
    on v.van_id = bf.van_id
  );

-- View HAVEN_STORE_AA_DEV.COMMON.vans_values_all_history did not work due to caravan_sales and caravan_sales_test not being present

create   view HAVEN_STORE_AA_DEV.COMMON.vans_values_all_history
   as (
with 
    c$_scd_effective_date as (
        select  
            min(vs.dbt_valid_from) as scd_effective_date
        from 
            HAVEN_STORE_AA_DEV.caravan_sales.van_values_scd vs
),
    c$_append_sales_bottom_book_values_to_scd as (
select
    vs.van_id,
    vs.van_stock_no,
    vs.base_trade_value as bottom_book_value,
    vs.web_package_price,
    vs.dbt_valid_from as change_dt_from,
    coalesce(vs.dbt_valid_to,current_timestamp) as change_dt_to
from 
    HAVEN_STORE_AA_DEV.caravan_sales.van_values_scd vs
--get bottom_book_value history from sales
union all
select  
    s.van_id,
    v.van_stock_no,
    s.van_bbv as bottom_book_value,
    null as web_package_price,
    s.edit_dt as change_dt_from,
    nvl(dateadd(ms, -1, lag(s.edit_dt) over(partition by s.van_id order by s.edit_dt desc)), current_timestamp)::TIMESTAMP_NTZ as change_dt_to
from
    haven_base.plot.sales s
join    
    haven_base.plot.vans v
    on s.van_id = v.van_id
where 
    s.edit_dt < (select sc.scd_effective_date from c$_scd_effective_date sc)
    and s.sale_status_enum in (2,3)
qualify row_number() over(partition by s.van_id, s.edit_dt order by s.sale_id desc) = 1
    )
--handle overlapping periods    
select
    s.van_id,
    s.van_stock_no,
    s.bottom_book_value,
    s.web_package_price,
    s.change_dt_from,
    nvl(dateadd(ms, -1, lag(s.change_dt_from) over(partition by s.van_id order by s.change_dt_from desc)), current_timestamp)::TIMESTAMP_NTZ as change_dt_to,
    row_number() over(partition by s.van_id order by s.change_dt_from) as first_recording
from 
    c$_append_sales_bottom_book_values_to_scd s
  );