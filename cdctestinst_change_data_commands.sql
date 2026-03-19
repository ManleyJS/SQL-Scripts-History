select * from agentname;

update agentname set agent_name = lower(agent_name) where pk_id = 3;

begin transaction;
update agentname set agent_name = lower(agent_name) where pk_id = 4;
update lastnames set name = initcap(name) where pk_id <= 5;
commit;

set schema pklogbased;

begin transaction;
update agentname set agent_name = initcap(agent_name) where pk_id = 1003;
update lastnames set name = lower(name) where pk_id = 1003;
update lastnames_nopk set name = initcap(name) where rank = 1003;
delete from phonenumbers where pk_id = 623;
update lastnames set name = upper(name) where pk_id = 1004;
update uk_towns set address_field = initcap(name||', '||county||', '||country) where id = 1023;
commit;

select * from phonenumbers;



update lastnames set name = initcap(name) where pk_id between 4001 and 4100;

begin transaction;
update uk_towns set address_field = initcap(name||', '||county||', '||country) where pk_id between 6100 and 7200;
delete from uk_towns where pk_id between 200 and 256;
commit;

select * from salesorderdetail order by pk_id limit 10;

update salesorderdetail set orderqty = orderqty + 1, linetotal = orderqty * unitprice where salesorderid = 43660;

update pklogwork.salesorderdetail set orderqty = orderqty + 1, linetotal = orderqty * unitprice where salesorderid = 43659;


select count(*) from salesorderdetail where salesorderid = 43659;