use role accountadmin;

show tasks in account;

show storage integrations;

use role haven_commercial;

use schema haven_store.digital;

show stages;

show functions like '%copy$';

describe procedure HAVEN_STORE.DIGITAL.PX0013_EXPORT_DIGITIAL_ARRIVALS();

use role dba;

create or replace view HAVEN_STORE.DIGITAL.PX0013_DIGITAL_ARRIVALS(
	RESID,
	ALTRESID,
	PARKCODE,
	PITCHNUMBER,
	RESSTATUS,
	VANTYPE,
	LASTMINUTE,
	ARRIVALDATE,
	DURATION,
	ARRIVALGROUP,
	ARRIVAL_FOREGROUND,
	ARRIVAL_BACKGROUND,
	NAME,
	HCCG,
	HCCGVAL,
	HIDEAWAY,
	PHONE_NUMBER,
	EMAIL,
	PLAY_PASS,
	GUESTS
) as
with
    c_arrivals as (
        select
            xx.*
        from
            haven_raw.hit_admin.hit_arrivals_list xx
    ),
    c_playpass as (
        select
            ra.res_id,
            count(*) has_play_pass,
            min(ra.amenity_code) play_pass_type
        from
            haven_base.seaware.res_addon ra
        where
            ra.amenity_code in ('FUN PASS INC.', 'FUN PASS INC', 'PLAY PASS')  and
            ra.res_id in (
                select xx.resid from c_arrivals xx
            ) 
        group by
            ra.res_id
    ),
    c_guests as (
        select
            rg.res_id,
            array_agg(
                {'title': cc.title, 'first_name': cc.first_name, 'last_name': cc.last_name, 'age': rg.age, 'seqn': rg.guest_seqn}
            ) within group (order by rg.guest_seqn) as guests_json,
            max(case when rg.guest_seqn = 1 then cc.email end) email,
            max(case when rg.guest_seqn = 1 then cc.last_name end) name,
            max(case when rg.guest_seqn = 1 then cc.household_id end) household_id,
            max(case when rg.guest_seqn = 1 then rg.guest_id end) lead_guest_id,
            count_if(coalesce(rg.age, 99) >= 3) v_playpass_count
        from 
            haven_raw.seaware.res_guest rg
        left join
            haven_raw.seaware.client cc
            on
                cc.client_id = rg.client_id
        where
            rg.res_id in (
                select xx.resid from c_arrivals xx
            )
        group by
            rg.res_id
    )
select 
    aa.resid,
    aa.altresid,
    aa.parkcode,
    aa.pitchnumber,
    aa.resstatus,
    aa.vantype,
    aa.lastminute,
    aa.arrivaldate,
    aa.duration::number(10,0) duration,
    aa.arrivalgroup,
    aa.arrival_foreground,
    aa.arrival_background,
    rg.name, --aa.name,
    'False' hccg,
    null hccgval,
    iff(aa.resstatus='BK', 'N', null) hideaway,
    hp.phone_number,
    replace(rg.email, '\n','') email,
    case
        when aa.resstatus in ('BK','CL','TM') and pp.has_play_pass is not null then v_playpass_count
    end play_pass,
    rg.guests_json guests
from 
    c_arrivals aa
left join 
    c_guests rg
    on
        rg.res_id = aa.resid 
left join
    c_playpass pp
    on
        pp.res_id = aa.resid
left join
    haven_base.seaware.res_header rh
    on
        aa.resid = rh.res_id
left join
    haven_base.seaware.household_phone hp
    on 
        hp.household_id = rg.household_id and
        hp.phone_type = 'PRIMARY'
qualify
    -- potential dupes due to household phone number
    row_number() over (partition by aa.resid order by null) = 1
order by
    aa.resid
;

select * from HAVEN_STORE.DIGITAL.PX0013_DIGITAL_ARRIVALS;

-- 21/08/2024

use ROLE dba;

USE SCHEMA haven_store.digital;

SHOW views;


create or replace view HAVEN_STORE.DIGITAL.PX0013_DIGITAL_ARRIVALS(
	RESID,
	ALTRESID,
	PARKCODE,
	PITCHNUMBER,
	RESSTATUS,
	VANTYPE,
	LASTMINUTE,
	ARRIVALDATE,
	DURATION,
	ARRIVALGROUP,
	ARRIVAL_FOREGROUND,
	ARRIVAL_BACKGROUND,
	NAME,
	HCCG,
	HCCGVAL,
	HIDEAWAY,
	PHONE_NUMBER,
	EMAIL,
	PLAY_PASS,
	GUESTS
) as
with
    c_arrivals as (
        select
            xx.*
        from
            haven_raw.hit_admin.hit_arrivals_list xx
    ),
    c_playpass as (
        select
            ra.res_id,
            count(*) has_play_pass,
            min(ra.amenity_code) play_pass_type
        from
            haven_base.seaware.res_addon ra
        where
            ra.amenity_code in ('FUN PASS INC.', 'FUN PASS INC', 'PLAY PASS')  and
            ra.res_id in (
                select xx.resid from c_arrivals xx
            ) 
        group by
            ra.res_id
    ),
    c_guests as (
        select
            rg.res_id,
            array_agg(
                {'title': cc.title, 'first_name': cc.first_name, 'last_name': cc.last_name, 'age': rg.age, 'seqn': rg.guest_seqn}
            ) within group (order by rg.guest_seqn) as guests_json,
            max(case when rg.guest_seqn = 1 then cc.email end) email,
            max(case when rg.guest_seqn = 1 then cc.last_name end) name,
            max(case when rg.guest_seqn = 1 then cc.household_id end) household_id,
            max(case when rg.guest_seqn = 1 then rg.guest_id end) lead_guest_id,
            count_if(coalesce(rg.age, 99) >= 3) v_playpass_count
        from 
            haven_raw.seaware.res_guest rg
        left join
            haven_raw.seaware.client cc
            on
                cc.client_id = rg.client_id
        where
            rg.res_id in (
                select xx.resid from c_arrivals xx
            )
        group by
            rg.res_id
    )
select 
    aa.resid,
    aa.altresid,
    aa.parkcode,
    aa.pitchnumber,
    aa.resstatus,
    aa.vantype,
    aa.lastminute,
    aa.arrivaldate,
    aa.duration::number(10,0) duration,
    aa.arrivalgroup,
    aa.arrival_foreground,
    aa.arrival_background,
    rg.name, --aa.name,
    'False' hccg,
    null hccgval,
    iff(aa.resstatus='BK', 'N', null) hideaway,
    hp.phone_number,
    trim(replace(rg.email, '\n','')) email,
    case
        when aa.resstatus in ('BK','CL','TM') and pp.has_play_pass is not null then v_playpass_count
    end play_pass,
    rg.guests_json guests
from 
    c_arrivals aa
left join 
    c_guests rg
    on
        rg.res_id = aa.resid 
left join
    c_playpass pp
    on
        pp.res_id = aa.resid
left join
    haven_base.seaware.res_header rh
    on
        aa.resid = rh.res_id
left join
    haven_base.seaware.household_phone hp
    on 
        hp.household_id = rg.household_id and
        hp.phone_type = 'PRIMARY'
qualify
    -- potential dupes due to household phone number
    row_number() over (partition by aa.resid order by null) = 1
order by
    aa.resid
;

SELECT top 200 * FROM HAVEN_STORE.DIGITAL.PX0013_DIGITAL_ARRIVALS;