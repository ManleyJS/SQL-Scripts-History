use role dba;

use schema haven_raw.dig_acceptance_of_risk;

show tables;

desc table acceptance;

select id from acceptance limit 10;

select * from acceptance where id = '78f17bf4-a9ee-4b9e-a2f7-310ac4846e4b'
union all
select * from haven_raw.dig_acceptance_of_risk_etleap.acceptance where id = '78f17bf4-a9ee-4b9e-a2f7-310ac4846e4b';

use schema haven_raw.identity;

select * from hid limit 10;

select * from hid where hid = 'TKW1YKSR55GB'
union all
select * from haven_raw.identity_etleap.hid where hid = 'TKW1YKSR55GB'

use schema dig_arrivals_etleap;

show tables;

use schema haven_raw.dig_capacity;

show tables;

desc table capacities;

select * from capacities where id = '5f4caadb-c298-41dd-a5fb-4ad87e7d08b0'
union all
select * from haven_raw.dig_capacity_etleap.capacities where id = '5f4caadb-c298-41dd-a5fb-4ad87e7d08b0';

use schema haven_base.dig_team_card;

show views;

use schema warner_raw.seaware;

desc table Ferry_Request;

select max(date_dep) from seaware_aps.ferry_request;

use role haven_dbt_development;

show warehouses;

use role dba;

select 'SEAWARE_APS', entity_id, status, confirmation_number from warner_base.seaware_aps.ferry_request where entity_id in (13201514)
union all
select 'SEAWARE', entity_id, status, confirmation_number from warner_base.seaware.ferry_request where entity_id in (13201514);

select max(HVR_INTEGRATE_TIMESTAMP) from warner_base.seaware_aps.ferry_request;

use schema haven_raw.coupa_etleap;

desc table invoices;

select * from bourne_raw.coupa.invoice_header  where id = 337;
select * from haven_raw.coupa_etleap.invoices  where id = 337;

select * from bourne_raw.coupa.invoice_header  where invoice_number = 'S3073684/3a';
select * from haven_raw.coupa_etleap.invoices  where "invoice-number" = 'S3073684/3a';


use role securityadmin;

grant role _bourne_base__coupa__reader to role haven_data_transform;
grant role _bourne_raw__coupa__reader to role haven_data_transform;
grant role _haven_raw__coupa_etleap__reader to role haven_data_transform;

use role dba;

-- 153087

select * from bourne_raw.coupa.invoice_header  where id = 153087;
select * from haven_raw.coupa_etleap.invoices  where id = 153087;

desc table bourne_raw.coupa.invoice_header;
desc table invoices;

select CONVERT_TIMEZONE( 'UTC' , 'Europe/London', '2014-01-30 13:38:44.000'::timestamp_ntz );
select CONVERT_TIMEZONE( 'Europe/London' , 'Europe/London', '2014-01-30 13:38:44.000'::timestamp_ltz );

