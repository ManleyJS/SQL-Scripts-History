--create or replace table training.training.testtable as
with     
c_arrivals as (         
select             xx.*         from             haven_raw.hit_admin.hit_arrivals_list xx     )
select rg.res_id,
	array_agg({'title': cc.title, 'first_name': cc.first_name, 'last_name': cc.last_name, 'age': rg.age, 'addon': case when ao.res_addon_code is not null then 'PLAY PASS' end, 'addon_test': ao.res_addon_code})
	within group (order by rg.guest_seqn) as guests_json,             
	   max(case when rg.guest_seqn = 1 then cc.email end) email,             
	   max(case when rg.guest_seqn = 1 then cc.last_name end) name,             
	   max(case when rg.guest_seqn = 1 then cc.household_id end) household_id,             
	   max(case when rg.guest_seqn = 1 then rg.guest_id end) lead_guest_id         
from haven_raw.seaware.res_guest rg         
join haven_raw.seaware.client cc
	on cc.client_id = rg.client_id 
left join haven_raw.seaware.res_addon ao
    on ao.guest_id = rg.guest_id
    and ao.res_id = rg.res_id
    and ao.res_addon_code in ('FUN PASS INC', 'PLAY PASS')
where rg.res_id in (select xx.resid from c_arrivals xx)         
group by rg.res_id;

select * from haven_raw.seaware.res_guest where res_id = 14355062;
-- 60117269
select * from haven_raw.seaware.res_addon limit 10;


select res_id, guests_json from testtable limit 20;

select res_id, value:addon as addon, count(*)
from testtable,
lateral flatten( input => guests_json )
where addon in ('FUN PASS INC')
group by 1, 2
order by 2 desc
;

select * from testtable; where contains(guests_json, 'FUN PASS INC');
