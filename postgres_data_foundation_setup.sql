create schema datafoundation;
set search_path to datafoundation, public;

create table bob (cola int);
drop table bob;

create user datafoundation with password 'df2022RO';
grant connect on database snowflake to datafoundation;
grant usage on schema datafoundation to datafoundation;
alter default privileges in schema datafoundation grant select on tables to datafoundation;

create table view_table_details (
source_database varchar(100),
source_schema varchar(250),
target_database varchar(100),
target_schema varchar(250),
provider varchar(50)
);

select * from view_table_details vtd 
where vtd.source_schema = 'MAESTRO';

update view_table_details set provider = 'BATCH' where source_schema = 'MAESTRO';
update view_table_details set provider = 'STITCH' where source_schema = 'MAESTRO';

delete from view_table_details where source_schema = 'FACEBOOK_HOLIDAY_SALES_LEADS';

select * from view_table_details where source_database = 'WARNER_RAW';

select * from view_table_details;

create table view_table_details_fivetran as select * from view_table_details;
delete from view_table_details where provider = 'FIVETRAN';
select * from view_table_details vtd ;
insert into view_table_details values ('HAVEN_RAW', 'SEAWARE', 'HAVEN_BASE', 'SEAWARE', 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'PLOT', 'HAVEN_BASE', 'PLOT', 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'BRAINTREE', 'HAVEN_BASE', 'BRAINTREE', 'FIVETRAN');
insert into view_table_details values ('HAVEN_RAW', 'ZENDESK', 'HAVEN_BASE', 'ZENDESK', 'FIVETRAN');

insert into view_table_details values ('HAVEN_RAW', 'EQUALISER', 'HAVEN_BASE', 'EQUALISER', 'BATCH');
insert into view_table_details values ('HAVEN_RAW', 'FRESHSALES', 'HAVEN_BASE', 'FRESHSALES', 'BATCH');

insert into view_table_details values ('HAVEN_RAW', 'ICLEAN', 'HAVEN_BASE', 'ICLEAN', 'BATCH');
insert into view_table_details values ('HAVEN_RAW', 'ALIGN_ALYTICS', 'HAVEN_BASE', 'ALIGN_ALYTICS', 'BATCH');

insert into view_table_details values ('BUTLINS_RAW', 'SEAWARE', 'BUTLINS_BASE', 'SEAWARE', 'HVR');
insert into view_table_details values ('BUTLINS_RAW', 'PLOT', 'BUTLINS_BASE', 'PLOT', 'HVR');

insert into view_table_details values ('WARNER_RAW', 'SEAWARE', 'WARNER_BASE', 'SEAWARE', 'HVR');
insert into view_table_details values ('WARNER_RAW', 'SEAWARE_APS', 'WARNER_BASE', 'SEAWARE_APS', 'HVR');

select * from view_table_details where target_schema = 'SEAWARE_APS';
delete from view_table_details where source_database = 'WARNER_RAW_APS';

insert into view_table_details values ('BOURNE_STORE', 'SAS_COMMON', 'HAVEN_BASE', 'SAS_COMMON', 'HVR');
insert into view_table_details values ('HAVEN_STORE', 'SAS_SCV', 'HAVEN_BASE', 'SAS_SCV', 'HVR');


insert into view_table_details values ('BOURNE_RAW', 'CONCUR', 'BOURNE_BASE', 'CONCUR', 'FIVETRAN');
insert into view_table_details values ('BOURNE_RAW', 'COUPA', 'BOURNE_BASE', 'COUPA', 'FIVETRAN');
insert into view_table_details values ('BOURNE_RAW', 'QUALTRICS', 'BOURNE_BASE', 'QUALTRICS', 'FIVETRAN');


insert into view_table_details values ('BOURNE_RAW', 'AZTEC', 'BOURNE_BASE', 'AZTEC', 'HVR');
insert into view_table_details values ('BOURNE_RAW', 'KMSREPORTING', 'BOURNE_BASE', 'KMSREPORTING', 'HVR');
insert into view_table_details values ('BOURNE_RAW', 'ZBSDATA', 'BOURNE_BASE', 'AZTEC', 'HVR');
update view_table_details set target_schema = 'ZBSDATA' where source_schema = 'ZBSDATA';
insert into view_table_details values ('BOURNE_RAW', 'AZTECACTIVITYMANAGEMENT', 'BOURNE_BASE', 'AZTECACTIVITYMANAGEMENT', 'HVR');
insert into view_table_details values ('BOURNE_RAW', 'COUPA', 'BOURNE_BASE', 'COUPA', 'HVR');
update view_table_details set provider = 'FIVETRAN' where source_schema = 'COUPA' and source_database = 'BOURNE_RAW';


insert into view_table_details values ('BOURNE_RAW', 'AZTEC', 'WARNER_BASE', 'AZTEC', 'HVR');
insert into view_table_details values ('BOURNE_RAW', 'KMSREPORTING', 'WARNER_BASE', 'KMSREPORTING', 'HVR');
insert into view_table_details values ('BOURNE_RAW', 'ZBSDATA', 'WARNER_BASE', 'ZBSDATA', 'HVR');
insert into view_table_details values ('BOURNE_RAW', 'AZTECACTIVITYMANAGEMENT', 'WARNER_BASE', 'AZTECACTIVITYMANAGEMENT', 'HVR');


insert into view_table_details values ('HAVEN_STORE', 'ZBSDATA_COMPLEX', 'HAVEN_BASE', 'ZBSDATA_COMPLEX', 'HVR');
insert into view_table_details values ('HAVEN_STORE', 'ZBSDATA_RETAIL', 'HAVEN_BASE', 'ZBSDATA_RETAIL', 'HVR');

insert into view_table_details values ('HAVEN_RAW', 'DIG_BOOKINGS', 'HAVEN_BASE', 'DIG_BOOKINGS', 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'DIG_CAPACITY', 'HAVEN_BASE', 'DIG_CAPACITY', 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'DIG_PAYMENTS', 'HAVEN_BASE', 'DIG_PAYMENTS', 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'DIG_PRICING' , 'HAVEN_BASE', 'DIG_PRICING' , 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'DIG_PLAYPASS' , 'HAVEN_BASE', 'DIG_PLAYPASS' , 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'DIG_FB_EAGLEEYE' , 'HAVEN_BASE', 'DIG_FB_EAGLEEYE' , 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'DIG_ACCEPTANCE_OF_RISK' , 'HAVEN_BASE', 'DIG_ACCEPTANCE_OF_RISK' , 'HVR');

insert into view_table_details values ('HAVEN_RAW', 'DIG_FB_ENTERTAINMENT' , 'HAVEN_BASE', 'DIG_FB_ENTERTAINMENT' , 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'DIG_AAC_ONPARKWIFI' , 'HAVEN_BASE', 'DIG_AAC_ONPARKWIFI' , 'HVR');

insert into view_table_details values ('HAVEN_RAW', 'QUALTRICS', 'HAVEN_BASE', 'QUALTRICS', 'FIVETRAN');

insert into view_table_details values ('HAVEN_RAW', 'DIG_ARRIVALS' , 'HAVEN_BASE', 'DIG_ARRIVALS' , 'HVR');

insert into view_table_details values ('HAVEN_RAW', 'AMPLITUDE', 'HAVEN_BASE', 'AMPLITUDE', 'BATCH');

insert into view_table_details values ('HAVEN_RAW', 'GOOGLE_INTEGRATION', 'HAVEN_BASE', 'GOOGLE_INTEGRATION', 'BATCH');
insert into view_table_details values ('HAVEN_RAW', 'ERPX', 'HAVEN_BASE', 'ERPX', 'BATCH');

insert into view_table_details values ('HAVEN_RAW', 'PLOT_DREAM', 'HAVEN_BASE', 'PLOT_DREAM', 'HVR');
insert into view_table_details values ('BOURNE_RAW', 'DREAM', 'BOURNE_BASE', 'DREAM', 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'DREAM_ROCKLEYBOATPARK' , 'HAVEN_BASE', 'DREAM_ROCKLEYBOATPARK' , 'HVR');
insert into view_table_details values ('BOURNE_RAW', 'DREAM_EVERGREEN', 'HAVEN_BASE', 'DREAM_EVERGREEN', 'HVR');


delete from view_table_details where source_schema = 'GOOGLE_INTEGRATE';


select * from view_table_details where target_schema = 'QUALTRICS';

insert into view_table_details values ('WARNER_RAW', 'QUALTRICS' , 'WARNER_BASE', 'QUALTRICS' , 'FIVETRAN');
insert into view_table_details values ('HAVEN_RAW', 'DIG_ACTIVITIES' , 'HAVEN_BASE', 'DIG_ACTIVITIES' , 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'DIG_OWNERS_ARRIVALS' , 'HAVEN_BASE', 'DIG_OWNERS_ARRIVALS' , 'HVR');

select * from view_table_details ;

insert into view_table_details values ('HAVEN_RAW', 'WORKFORCE_SAM' , 'HAVEN_BASE', 'WORKFORCE_SAM' , 'FIVETRAN');


insert into view_table_details values ('HAVEN_RAW', 'AZTECACTIVITYMANAGEMENT_COMPLEX' , 'HAVEN_BASE', 'AZTECACTIVITYMANAGEMENT_COMPLEX' , 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'AZTEC_COMPLEX' , 'HAVEN_BASE', 'AZTEC_COMPLEX' , 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'AZTEC_RETAIL' , 'HAVEN_BASE', 'AZTEC_RETAIL' , 'HVR');
insert into view_table_details values ('HAVEN_STORE', 'KMSREPORTING_COMPLEX' , 'HAVEN_BASE', 'KMSREPORTING_COMPLEX' , 'HVR');

select * from view_table_details vtd where source_schema like 'ZBSDATA_%';

insert into view_table_details values ('HAVEN_RAW', 'ZBSDATA_COMPLEX' , 'HAVEN_BASE', 'ZBSDATA_COMPLEX' , 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'ZBSDATA_RETAIL' , 'HAVEN_BASE', 'ZBSDATA_RETAIL' , 'HVR');

insert into view_table_details values ('HAVEN_RAW', 'ZBSDATA_COMPLEX' , 'HAVEN_STORE', 'ZBSDATA_COMPLEX' , 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'ZBSDATA_RETAIL' , 'HAVEN_STORE', 'ZBSDATA_RETAIL' , 'HVR');

delete from view_table_details vtd where source_database = 'HAVEN_STORE' and source_schema like 'ZBSDATA_%';

insert into view_table_details values ('HAVEN_RAW', 'FACEBOOK_CARAVAN_SALES', 'HAVEN_BASE', 'FACEBOOK_CARAVAN_SALES', 'STITCH');
insert into view_table_details values ('HAVEN_RAW', 'FACEBOOK_HOLIDAY_SALES', 'HAVEN_BASE', 'FACEBOOK_HOLIDAY_SALES', 'STITCH');
insert into view_table_details values ('HAVEN_RAW', 'FACEBOOK_CARAVAN_SALES_LEADS', 'HAVEN_BASE', 'FACEBOOK_CARAVAN_SALES_LEADS', 'STITCH');
insert into view_table_details values ('HAVEN_RAW', 'TIKTOK_ADS', 'HAVEN_BASE', 'TIKTOK_ADS', 'STITCH');



insert into view_table_details values ('HAVEN_RAW', 'IDENTITY' , 'HAVEN_BASE', 'IDENTITY' , 'HVR');
insert into view_table_details values ('HAVEN_RAW', 'CONSENT_AND_PREFERENCE' , 'HAVEN_BASE', 'CONSENT_AND_PREFERENCE' , 'HVR');

select * from view_table_details vtd where source_database = 'WARNER_RAW';

update view_table_details set source_database = 'WARNER_RAW' where source_database = 'WARNER_STORE';

insert into view_table_details values ('WARNER_STORE', 'SAS_SCV' , 'WARNER_BASE', 'SAS_SCV' , 'HVR');
insert into view_table_details values ('WARNER_STORE', 'MA_MART' , 'WARNER_BASE', 'MA_MART' , 'HVR');

insert into view_table_details values ('HAVEN_RAW', 'DIG_FB_TABLE_BOOKING' , 'HAVEN_BASE', 'DIG_FB_TABLE_BOOKING' , 'HVR');

insert into view_table_details values ('WARNER_RAW', 'DREAM' , 'WARNER_BASE', 'DREAM' , 'FIVETRAN');

UPDATE view_table_details SET PROVIDER = 'HVR' WHERE SOURCE_SCHEMA = 'DIG_ACTIVITIES';

select * from view_table_details vtd ;


create table view_provider_ignore (
provider varchar(50),
prefix_type char(1),
suffix_prefix char(1),
ignore_string varchar(50)
);

insert into view_provider_ignore values('HVR', 'T', 'P', 'HVR_ST');
insert into view_provider_ignore values('HVR', 'T', 'S', '__B');
insert into view_provider_ignore values('HVR', 'T', 'S', '_CLONE');
insert into view_provider_ignore values('FIVETRAN', 'P', 'S', '__');


select * from view_table_details vtd ; 



delete from view_provider_ignore where ignore_string = 'FIVETRAN_';

select * from view_provider_ignore;

create table view_provider_table_ignore (
provider varchar(50),
table_to_ignore varchar(250)
);

insert into view_provider_table_ignore values ('FIVETRAN', 'FIVETRAN_AUDIT');
insert into view_provider_table_ignore values ('STITCH', '_SDC_REJECTED');

select * from view_provider_table_ignore;

create table view_provider_column_ignore (
provider varchar(50),
column_to_ignore varchar(250)
);

insert into view_provider_column_ignore values ('FIVETRAN', '_FIVETRAN_SYNCED');
insert into view_provider_column_ignore values ('STITCH', '_SDC_BATCHED_AT');
insert into view_provider_column_ignore values ('STITCH', '_SDC_RECEIVED_AT');
insert into view_provider_column_ignore values ('STITCH', '_SDC_SEQUENCE');
insert into view_provider_column_ignore values ('STITCH', '_SDC_TABLE_VERSION');
insert into view_provider_column_ignore values ('STITCH', '_SDC_EXTRACTED_AT');

create table bob as 
select provider, column_to_ignore
from view_provider_column_ignore
group by 1, 2;

truncate table view_provider_column_ignore;

insert into view_provider_column_ignore select * from bob;

select * from view_provider_column_ignore;

select * from view_provider_ignore vpi ;

delete from view_provider_ignore where provider = 'FIVETRAN';
insert into view_provider_ignore values('FIVETRAN', 'P', 'S', '__');

select * from view_provider_table_ignore vpti ;

delete from view_provider_table_ignore where table_to_ignore = 'FIVETRAN_AUDIT';
insert into view_provider_table_ignore values ('FIVETRAN', 'FIVETRAN_AUDIT');
insert into view_provider_table_ignore values ('FIVETRAN', 'FIVETRAN_AUDIT');

select * from view_table_details vtd ;

create table build_view_if_empty (
database_name varchar(50),
schema_name varchar(50),
table_name varchar(50));

insert into build_view_if_empty values ('BUTLINS_BASE', 'SEAWARE', 'GROUP_COMMISSION_DETAIL');

SELECT TABLE_NAME FROM snowflake.datafoundation.BUILD_VIEW_IF_EMPTY WHERE DATABASE_NAME = 'BUTLINS_BASE' AND SCHEMA_NAME = 'SEAWARE';

select * from view_table_details vtd ;


select * from view_table_details vtd ;

delete from view_table_details where source_schema = 'MAESTRO';
insert into view_table_details values ('WARNER_RAW', 'MAESTRO', 'WARNER_BASE', 'MAESTRO', 'STITCH');

select * from view_provider_column_ignore vpci ;

select * from view_provider_ignore vpi ;

select * from view_provider_table_ignore vpti ;
 
insert into view_provider_column_ignore values ('FIVETRAN', '_FIVETRAN_DELETED')


insert into view_provider_ignore values('BATCH', 'T', 'P', '_');

select * from view_provider_ignore vpi ;


insert into view_provider_ignore values('HVR', 'T', 'P', 'HVR_IB');
insert into view_provider_ignore values('HVR', 'T', 'P', 'HVR_IS');
insert into view_provider_ignore values('HVR', 'T', 'P', 'HVR_IC');


select coalesce(cast(null as decimal(6,2)), 0);

select * from view_table_details vtd ;

set search_path = 'snowflake.datafoundation';
select * from snowflake.datafoundation.view_provider_table_ignore;

insert into snowflake.datafoundation.view_provider_table_ignore
values ('ETLEAP', '_etleap');

select * from datafoundation.view_table_details vtd where source_schema = 'WORKFORCE_SAM';

update datafoundation.view_table_details vtd set provider = 'ETLEAP'
where source_schema = 'WORKFORCE_SAM';

select * from view_table_details vtd where target_database = 'WARNER_BASE';

update view_table_details set source_database = 'WARNER_RAW'
--select * from view_table_details
where source_database = 'BOURNE_RAW'
and source_schema in ('AZTEC', 'KMSREPORTING', 'ZBSDATA')
and target_database = 'WARNER_BASE';


-- 18/02/2025

SELECT * FROM view_provider_table_ignore;

select * from view_table_details where provider = 'ETLEAP';

insert into view_table_details values ('HAVEN_RAW', 'WORKFORCE_SAM' , 'HAVEN_BASE', 'WORKFORCE_SAM' , 'FIVETRAN');


insert into view_table_details values ('HAVEN_RAW', 'CONSENT_AND_PREFERENCE_ETLEAP', 'HAVEN_BASE', 'CONSENT_AND_PREFERENCE_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'DIG_AAC_ONPARKWIFI_ETLEAP', 'HAVEN_BASE', 'DIG_AAC_ONPARKWIFI_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'DIG_ACCEPTANCE_OF_RISK_ETLEAP', 'HAVEN_BASE', 'DIG_ACCEPTANCE_OF_RISK_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'DIG_ACTIVITIES_ETLEAP', 'HAVEN_BASE', 'DIG_ACTIVITIES_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'DIG_ARRIVALS_ETLEAP', 'HAVEN_BASE', 'DIG_ARRIVALS_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'DIG_BOOKINGS_ETLEAP', 'HAVEN_BASE', 'DIG_BOOKINGS_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'DIG_CAPACITY_ETLEAP', 'HAVEN_BASE', 'DIG_CAPACITY_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'DIG_OWNERS_ARRIVALS_ETLEAP', 'HAVEN_BASE', 'DIG_OWNERS_ARRIVALS_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'DIG_PAYMENTS_ETLEAP', 'HAVEN_BASE', 'DIG_PAYMENTS_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'DIG_PRICING_ETLEAP', 'HAVEN_BASE', 'DIG_PRICING_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'FACEBOOK_ETLEAP', 'HAVEN_BASE', 'FACEBOOK' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'IDENTITY_ETLEAP', 'HAVEN_BASE', 'IDENTITY_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'TIKTOK_ETLEAP', 'HAVEN_BASE', 'TIKTOK' , 'ETLEAP');

-- 21/02/2025
insert into view_table_details values ('HAVEN_RAW', 'DIG_OWNERSHIP_OWNERS', 'HAVEN_BASE', 'DIG_OWNERSHIP_OWNERS' , 'ETLEAP');

commit;

select * from view_table_details where provider = 'ETLEAP';

-- 04/03/2025

set search_path to datafoundation, public;

select * from view_table_details where provider = 'ETLEAP';

insert into view_table_details values ('HAVEN_RAW', 'PLOT_ETLEAP', 'HAVEN_BASE', 'PLOT_DREAM_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'PLOT_RDS_TEST', 'HAVEN_BASE', 'PLOT_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'SEAWARE_ETLEAP', 'HAVEN_BASE', 'SEAWARE_ETLEAP' , 'ETLEAP');

update view_table_details set source_schema = 'PLOT_DREAM_ETLEAP' where target_schema = 'PLOT_DREAM_ETLEAP' and provider = 'ETLEAP';

insert into view_table_details values ('HAVEN_RAW', 'HIT_ADMIN_ETLEAP', 'HAVEN_BASE', 'HIT_ADMIN_ETLEAP' , 'ETLEAP');

-- 07/03/2025

set search_path to datafoundation, public;

insert into view_table_details values ('HAVEN_RAW', 'JDAADMIN_ETLEAP', 'HAVEN_BASE', 'JDAADMIN_ETLEAP' , 'ETLEAP');
insert into view_table_details values ('HAVEN_RAW', 'MARINER_ETLEAP', 'HAVEN_BASE', 'MARINER_ETLEAP' , 'ETLEAP');

