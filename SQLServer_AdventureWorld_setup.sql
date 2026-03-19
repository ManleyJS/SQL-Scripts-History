create schema sales;
create schema person;
create schema guest;
create schema purchasing;
create schema production;
create schema humanresources;

alter table productsubcategory alter column rowguid set data type varchar(100);
alter table productmodel alter column catalogdescription set data type varchar(65535);
alter table productphoto alter column largephoto set data type blob;


select * from password ;


