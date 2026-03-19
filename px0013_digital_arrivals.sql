USE ROLE accountadmin;

DESCRIBE integration aws_s3_aps_warner_load_data_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration aws_s3_aps_warner_load_data_integration TO ROLE warner_terraform_transform_dev;

USE ROLE dba;

USE SCHEMA training.training;
USE SCHEMA haven_store.digital;

create or replace view PX0013_DIGITAL_ARRIVALS as 
with     c_arrivals as (         
select             xx.*         from             haven_raw.hit_admin.hit_arrivals_list xx     ),     
c_guests as (         
select             rg.res_id,
	array_agg(                 {'title': cc.title, 'first_name': cc.first_name, 'last_name': cc.last_name, 'age': rg.age}             ) 
	within group (order by rg.guest_seqn) as guests_json,             
	max(case when rg.guest_seqn = 1 then cc.email end) email,             
	max(case when rg.guest_seqn = 1 then cc.last_name end) name,             
	max(case when rg.guest_seqn = 1 then cc.household_id end) household_id,             
	max(case when rg.guest_seqn = 1 then rg.guest_id end) lead_guest_id         
from              haven_raw.seaware.res_guest rg         
join             haven_raw.seaware.client cc
	on                 cc.client_id = rg.client_id         
	where             rg.res_id in (                 select xx.resid from c_arrivals xx             )         
	group by             rg.res_id     ) 
select      aa.resid,     aa.altresid,     aa.parkcode,     aa.pitchnumber,     aa.resstatus,     aa.vantype,     aa.lastminute,     
aa.arrivaldate,     aa.duration::number(10,0) duration,     aa.arrivalgroup,     aa.arrival_foreground,     aa.arrival_background,     
rg.name, --aa.name,     'False' hccg,     null hccgval,     iff(aa.resstatus='BK', 'N', null) hideaway,     
hp.phone_number,     rg.email,     rg.guests_json guests 
from      c_arrivals aa 
left join      c_guests rg     
on rg.res_id = aa.resid  
left join     haven_base.seaware.household_phone hp
	on          hp.household_id = rg.household_id 
	and         hp.phone_type = 'PRIMARY' 
	qualify     -- potential dupes due to household phone number     
	row_number() over (partition by aa.resid order by null) = 1 
order by     aa.resid ;
	
SELECT * FROM PX0013_DIGITAL_ARRIVALS WHERE resid = 13806807;
SELECT * FROM haven_raw.hit_admin.hit_arrivals_list WHERE resid = 13806807;

SELECT * FROM haven_raw.hit_admin.hit_arrivals_list WHERE resid IN (13806807, 14156933, 14169656, 14284205, 13926041, 14072374, 13990835, 14102890, 14115225, 13956243);

SELECT * FROM haven_store.DIGITAL.PX0013_DIGITAL_ARRIVALS  WHERE resid IN (13806807, 14156933, 14169656, 14284205, 13926041, 14072374, 13990835, 14102890, 14115225, 13956243);

SELECT * FROM haven_raw.seaware.res_header WHERE res_id IN (13806807, 14156933, 14169656, 14284205, 13926041, 14072374, 13990835, 14102890, 14115225, 13956243);

SELECT count(*) FROM PX0013_DIGITAL_ARRIVALS ;
-- 10534

USE SCHEMA haven_store.digital;

SHOW tasks;

DESC TASK PX0013_DIGITAL_EXPERIENCE_ARRIVALS_TASK;

call px0013_export_digitial_arrivals();

DESC PROCEDURE px0013_export_digitial_arrivals();

SELECT arrivaldate, count(*)
-- 2854
--SELECT *
FROM PX0013_DIGITAL_ARRIVALS 
WHERE ARRIVALDATE LIKE '%08-MAR-24%'
GROUP BY 1
ORDER BY 1 asc
;

SELECT count(*) FROM haven_raw.hit_admin.hit_arrivals_list;


SELECT count(*)
-- 2854
--SELECT *
FROM PX0013_DIGITAL_ARRIVALS 
WHERE ARRIVALDATE LIKE '%08-MAR-24%'
;

SHOW tasks;

EXECUTE TASK PX0013_DIGITAL_EXPERIENCE_ARRIVALS_TASK;

SELECT *
  FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY())
  ORDER BY SCHEDULED_TIME;

SHOW STAGES;

LS @PX0013_DIGITAL_EXPERIENCE_ARRIVALS;




