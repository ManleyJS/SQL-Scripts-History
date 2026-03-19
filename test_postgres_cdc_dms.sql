create table city_orig as select * from city;
create table country_orig as select * from country;
create table countrylanguage_orig as select * from countrylanguage;

alter table pklogwork.country add column pk_id integer GENERATED ALWAYS as IDENTITY;
alter table pklogwork.country add primary key (pk_id);
alter table if exists pklogwork.country replica identity full;

alter table pklogwork.countrylanguage  add column pk_id integer GENERATED ALWAYS as IDENTITY;
alter table pklogwork.countrylanguage  add primary key (pk_id);
alter table if exists pklogwork.countrylanguage  replica identity full;

alter table pklogwork.city add column pk_id integer GENERATED ALWAYS as IDENTITY;
alter table pklogwork.city add primary key (pk_id);
alter table if exists pklogwork.city replica identity full;

select a.*, b.*, c.* from country a 
inner join countrylanguage b
on a.code = b.countrycode 
inner join city c 
on a.code = c.countrycode;

alter table pklogwork.city rename column "Name" to city_name;
alter table pklogwork.country rename column "Name" to country_name;
alter table pklogwork.countrylanguage rename column "Language" to country_language;

alter table pklogwork.country add column country_data_changes varchar(100);
alter table pklogwork.countrylanguage  add column language_data_changes varchar(100);
alter table pklogwork.city add column city_data_changes varchar(100);

rollback;
begin transaction;
update country set country_data_changes = initcap(country_name||', '||continent||', '||region) where code = 'ARG';
update city set city_data_changes = lower(city_name||', '||district) where countrycode =  'ARG';
--update countrylanguage  set language_data_changes = initcap(country_language||', '||countrycode) where countrycode =  'BTN';
commit;
 

select a.*, b.*, c.* 
from country a
inner join city b
on a.code = b.countrycode 
inner join countrylanguage c
on a.code = c.countrycode 
where a.code = 'BHS';

select * from salesorderdetail where salesorderid = 44499;


update city set city_data_changes = initcap(city_name||', '||district) 
where countrycode =  'BRA'
and city_name = 'Olinda';

update city set city_data_changes = initcap(city_name||' '||district) 
where countrycode =  'ARG';
