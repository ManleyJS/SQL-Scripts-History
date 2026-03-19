drop table pklogwork.salesorderdetail cascade;
drop table pklogwork.agentname cascade;
drop table pklogwork.agentname_nopk cascade;
drop table pklogwork.lastnames cascade;
drop table pklogwork.lastnames_nopk cascade;
drop table pklogwork.phonenumbers cascade;
drop table pklogwork.phonenumbers_nopk cascade;
drop table pklogwork.uk_towns cascade;
drop table pklogwork.uk_towns_nopk cascade;
--drop table pklogwork.bob;

create table pklogwork.salesorderdetail as select * from dblink('user=postgres password=Public24082021 dbname=advwrksdw host=cdctestinstance.cluster-cgg8jq7kqbjx.eu-west-1.rds.amazonaws.com', 
'SELECT salesorderid, salesorderdetailid, carriertrackingnumber, orderqty, productid, specialofferid, unitprice, unitpricediscount, linetotal, rowguid, modifieddate
FROM sales.salesorderdetail')
as salesdetails (salesorderid int4 , salesorderdetailid int4  , carriertrackingnumber varchar(25) , orderqty int2  , productid int4  , specialofferid int4  , unitprice money  , unitpricediscount money  , linetotal numeric(38, 6) , rowguid varchar(100) , modifieddate timestamp  );

create table pklogwork.agentname as select * from dblink('user=postgres password=Public24082021 dbname=cdcwork host=cdctestinstance.cluster-cgg8jq7kqbjx.eu-west-1.rds.amazonaws.com', 
'select agent_name from original.agentname')
as agent(agent_name text);

create table pklogwork.agentname_nopk as select * from dblink('user=postgres password=Public24082021 dbname=cdcwork host=cdctestinstance.cluster-cgg8jq7kqbjx.eu-west-1.rds.amazonaws.com', 
'select agent_name from original.agentname')
as agent(agent_name text);

create table pklogwork.phonenumbers as select * from dblink('user=postgres password=Public24082021 dbname=cdcwork host=cdctestinstance.cluster-cgg8jq7kqbjx.eu-west-1.rds.amazonaws.com', 
'SELECT p.prefix, p.areaname, p.ofcondescription, p.btareaname FROM original.phonenumbers p')
as phones(prefix text, areaname text, ofcondescription text, btareaname text);

create table pklogwork.phonenumbers_nopk as select * from dblink('user=postgres password=Public24082021 dbname=cdcwork host=cdctestinstance.cluster-cgg8jq7kqbjx.eu-west-1.rds.amazonaws.com', 
'SELECT p.prefix, p.areaname, p.ofcondescription, p.btareaname FROM original.phonenumbers p')
as phones(prefix text, areaname text, ofcondescription text, btareaname text);

create table pklogwork.lastnames as select * from dblink('user=postgres password=Public24082021 dbname=cdcwork host=cdctestinstance.cluster-cgg8jq7kqbjx.eu-west-1.rds.amazonaws.com', 
'SELECT l.name , l.rank, l.count FROM original.lastnames l')
as lastnames(name text, rank INTEGER, namecount integer);

create table pklogwork.lastnames_nopk as select * from dblink('user=postgres password=Public24082021 dbname=cdcwork host=cdctestinstance.cluster-cgg8jq7kqbjx.eu-west-1.rds.amazonaws.com', 
'SELECT l.name , l.rank, l.count FROM original.lastnames l')
as lastnames(name text, rank INTEGER, namecount integer);

create table pklogwork.uk_towns as select * from dblink('user=postgres password=Public24082021 dbname=cdcwork host=cdctestinstance.cluster-cgg8jq7kqbjx.eu-west-1.rds.amazonaws.com', 
'SELECT u.id, u.name, u.county, u.country, u.grid_reference, u.easting, u.northing, u.latitude, u.longitude, u.elevation, u.postcode_sector, u.local_government, u.nuts_region, u.type FROM original.uk_towns u')
as towns(id int, name text, county text, country text, grid_reference text, easting bigint, northing bigint, latitude NUMERIC(15,8), longitude numeric(15,8), elevation integer, postcode_sector text, local_government text, nuts_region text, type text);

create table pklogwork.uk_towns_nopk as select * from dblink('user=postgres password=Public24082021 dbname=cdcwork host=cdctestinstance.cluster-cgg8jq7kqbjx.eu-west-1.rds.amazonaws.com', 
'SELECT u.id, u.name, u.county, u.country, u.grid_reference, u.easting, u.northing, u.latitude, u.longitude, u.elevation, u.postcode_sector, u.local_government, u.nuts_region, u.type FROM original.uk_towns u')
as towns(id int, name text, county text, country text, grid_reference text, easting bigint, northing bigint, latitude NUMERIC(15,8), longitude numeric(15,8), elevation integer, postcode_sector text, local_government text, nuts_region text, type text);

alter table pklogwork.agentname add column pk_id integer GENERATED ALWAYS as IDENTITY;
alter table pklogwork.phonenumbers add column pk_id integer GENERATED ALWAYS as IDENTITY;
alter table pklogwork.lastnames add column pk_id integer GENERATED ALWAYS as IDENTITY;
alter table pklogwork.uk_towns add column pk_id integer GENERATED ALWAYS as IDENTITY;
alter table pklogwork.salesorderdetail add column pk_id integer GENERATED ALWAYS as IDENTITY;

alter table pklogwork.agentname add primary key (pk_id);
alter table pklogwork.phonenumbers add primary key (pk_id);
alter table pklogwork.lastnames add primary key (pk_id);
alter table pklogwork.uk_towns add primary key (pk_id);
alter table pklogwork.salesorderdetai add primary key (pk_id);

alter table pklogwork.uk_towns add column address_field varchar(200);
alter table pklogwork.uk_towns_nopk add column address_field varchar(200);

alter table if exists pklogwork.agentname replica identity full;
alter table if exists pklogwork.phonenumbers replica identity full;
alter table if exists pklogwork.lastnames replica identity full;
alter table if exists pklogwork.uk_towns replica identity full;
--alter table if exists pklogwork.uk_towns_nopk replica identity full;

grant all PRIVILEGES on all tables in schema pklogwork to manleyj;



-- sales.salesorderdetail definition

-- Drop table

-- DROP TABLE sales.salesorderdetail;

