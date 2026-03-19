		       CREATE TABLE work.firstnames (
		       	yearofbirth varchar(4) NULL,
		       	sexofchild char(1) NULL,
		       	firstname varchar(50) NULL,
		       	countofname int NULL,
		       	namerank int NULL,
		       	nameposition varchar(10) NULL
		       );

		       CREATE TABLE work.fullpostcodedetails (
		       	postcode varchar(100) ,
		       	in_use varchar(30) ,
		       	latitude numeric(15, 8) ,
		       	longitude numeric(15, 8) ,
		       	easting varchar(20) ,
		       	northing varchar(20) ,
		       	grid_reference varchar(100) ,
		       	county varchar(250) ,
		       	district varchar(250) ,
		       	ward varchar(250) ,
		       	district_code varchar(120) ,
		       	ward_code varchar(120) ,
		       	country varchar(120) ,
		       	county_code varchar(120) ,
		       	constituency varchar(250) ,
		       	introduced_date date NULL,
		       	terminated_date date NULL,
		       	parish varchar(250) ,
		       	nationalpark varchar(250) ,
		       	population varchar(100) ,
		       	households varchar(100) ,
		       	built_up_area varchar(250) ,
		       	built_up_sub_division varchar(250) ,
		       	lower_layer_super_output_area varchar(250) ,
		       	rural_urban varchar(250) ,
		       	region varchar(250) ,
		       	altitude varchar(20) ,
		       	london_zone varchar(120) ,
		       	lsoa_code varchar(120) ,
		       	local_authority varchar(250) ,
		       	msoa_code varchar(120) ,
		       	middle_layer_super_output_area varchar(250) ,
		       	parish_code varchar(250) ,
		       	census_output_area varchar(120) ,
		       	constituency_code varchar(120) ,
		       	index_of_multiple_deprivation varchar(100) ,
		       	quality varchar(100) ,
		       	user_type varchar(100) ,
		       	last_updated varchar(120) 
		       );
		      
	       CREATE TABLE work.lastnames (
		       	name varchar(50) NULL,
		       	rank_val int NULL,
		       	count int NULL
		       );

		       CREATE TABLE work.phonenumbers_orig (
		       	prefix varchar(10) NULL,
		       	areaname varchar(50) NULL,
		       	ofcondescription varchar(250) NULL,
		       	btareaname varchar(50) NULL
		       );

		      
		       CREATE TABLE work.uk_towns (
		       	id int NULL,
		       	name varchar(100) NULL,
		       	county varchar(50) NULL,
		       	country varchar(20) NULL,
		       	grid_reference varchar(20) NULL,
		       	easting int NULL,
		       	northing int NULL,
		       	latitude numeric(15, 8) NULL,
		       	longitude numeric(15, 8) NULL,
		       	elevation int NULL,
		       	postcode_sector varchar(10) NULL,
		       	local_government varchar(50) NULL,
		       	nuts_region varchar(50) NULL,
		       	typecd varchar(50) NULL
		       );
		       
		       
		       -- work.uk_towns_and_counties definition
		       
		       -- Drop table
		       
		       -- DROP TABLE work.uk_towns_and_counties;
		       
		       CREATE TABLE work.uk_towns_and_counties (
		       	id int NULL,
		       	town varchar(100) NULL,
		       	county varchar(50) NULL
);		  

drop table work.agentnames;
		       CREATE TABLE work.agentnames (
		       	agent_name varchar(100) NULL
		       );

		      
select * from work.all_postcodes limit 10;

select distinct region as region from work.postcode_regions;


select count(distinct firstname) from work.firstnames f ;


truncate table work.firstname ;
insert into work.firstname select distinct firstname from work.firstnames limit 20000;
select * from work.firstname;
select * from work.firstnames;

insert into work.firstname select F.FIRSTNAME FROM
(select G.firstname as FIRSTNAME, sum(G.countofname) from work.firstnames G 
group by G.firstname order by sum(G.countofname) desc) F
limit 20000;

select count(*) from work.lastnames;

select * from work.lastname;

select * from work.agentname_old a ;

create table work.agentname_old as select upper(agent_name) from work.agentname;

truncate table work.agentname;

alter table work.agentname_old rename column `upper(agent_name)` to agent_name;  

insert into work.agentname 
select agent_name from work.agentnames
union
select agent_name from work.agentname_old;

select * from work.agentname a ;

select * from work.location_data;

select distinct prefix as prefix from work.phonenumbers;

select count(distinct prefix) from work.phonenumbers p ;
select count(*) from work.phonenumbers_orig po ;


select * from lastname f where Last_name in ('De', 'Se', 'Ho', 'La', 'Ly');