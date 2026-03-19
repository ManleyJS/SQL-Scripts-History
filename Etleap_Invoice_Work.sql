use role dba;

SELECT query_id, query_text, start_time, session_id, execution_status, total_elapsed_time,
       compilation_time, execution_time, transaction_blocked_time
  FROM snowflake.account_usage.query_history
  WHERE start_time >= dateadd('hours', -24, current_timestamp())
  AND query_text like '%JDBC:DatabaseMetaData.getColumns()%'
  ORDER BY total_elapsed_time DESC;
use schema haven_raw.coupa_etleap;

show roles like '%caravan%dev';

show grants to role CARAVAN_SALES_PRICING_APPLICATION_DEPLOYMENT_DEV;

show grants to role haven_streamlit_dev;

select max(payment_date)
from haven_base.coupa.invoices;

select * 
from haven_base.coupa.invoices
where date(payment_date) >= '2025-07-04'
order by updated_at;

select * 
from haven_raw.coupa_etleap.invoices
where "invoice-number" = '35364769';

select * 
from haven_raw.coupa_etleap.invoices
where id = 5232482;

select * 
from haven_raw.coupa_etleap.invoices
where PAID = FALSE
ORDER BY "updated-at" desc
LIMIT 100;

select * 
from haven_raw.coupa_etleap.invoices
where "invoice-number" in 
('93226721', '35373746', '25226', '35364769', '1043344', '250146', '1306552', '93690333', '94733744', '35385857', '219110', '35369277', '35385876', '35400884', '35440038', '2023802', '9397')
order by "invoice-number";


desc table haven_raw.coupa_etleap.invoices;

select get_ddl('table', 'haven_raw.coupa_etleap.invoices');

-- 5271139

select * 
from haven_raw.coupa_etleap.invoices
where id = 5271139;

select * 
from haven_raw.coupa_etleap.invoices AT(TIMESTAMP => '2025-07-04 12:00:00')
where id = 5271139;


select * 
from haven_raw.coupa_etleap.invoices
where id = 5271139
union all
select * 
from haven_raw.coupa_etleap.invoices AT(TIMESTAMP => '2025-07-04 12:00:00')
where id = 5271139;


select * 
from haven_base.coupa.invoices
where id = 5271139
union all
select * 
from haven_base.coupa.invoices AT(TIMESTAMP => '2025-07-04 12:00:00')
where id = 5271139;

select * 
from haven_base.coupa.invoices
where id = 5232482
union all
select * 
from haven_base.coupa.invoices AT(TIMESTAMP => '2025-07-04 12:00:00')
where id = 5232482;

use schema haven_raw.coupa_etleap;

show tables;

use role dba;

SELECT query_id, query_text, start_time, session_id, execution_status, total_elapsed_time,
       compilation_time, execution_time, transaction_blocked_time, query_type
  FROM snowflake.account_usage.query_history
  WHERE start_time >= dateadd('hours', -48, current_timestamp())
  --AND transaction_blocked_time > 0
  and role_name = 'HAVEN_ETLEAP_DATALOAD'
  AND query_text like '%INVOICES_invoice-lines%'
  --and query_type not in ('SHOW')
  order by start_time desc;
  --ORDER BY transaction_blocked_time DESC;

  select * 
  from snowflake.account_usage.login_history 
  where user_name = 'HAVEN_ETLEAP_DATALOAD'
  and event_timestamp >= dateadd('hours', -24, current_timestamp())
  order by event_timestamp desc;

  select * from snowflake.account_usage.sessions
  where user_name = 'HAVEN_ETLEAP_DATALOAD'
  and CREATED_ON  >= dateadd('hours', -24, current_timestamp())
  and contains(client_environment, 'COUPA_ETLEAP')
  order by created_on desc;

  show grants to role haven_etleap_dataload;

  select * from snowflake.account_usage.lock_wait_history
  where requested_at   >= dateadd('hours', -24, current_timestamp())
  and schema_name = 'COUPA_ETLEAP'
  ORDER BY  requested_at desc;


  select closed_reason, count(*) from snowflake.account_usage.sessions
  where user_name = 'HAVEN_ETLEAP_DATALOAD'
  and CREATED_ON  >= dateadd('hours', -48, current_timestamp())
  and contains(client_environment, 'COUPA_ETLEAP')
  group by 1
  order by 1;
  
use role accountadmin;

show locks in account ;

use role dba;

use database haven_store_dev;

show schemas;

show roles like '%deployment%';

show grants of role CARAVAN_SALES_PRICING_APPLICATION_DEPLOYMENT_DEV;
show grants to role CARAVAN_SALES_PRICING_APPLICATION_DEPLOYMENT_DEV;

show grants to role _HAVEN_STORE_DEV__CARAVAN_SALES_PRICING_APPLICATION__CREATOR;
show grants to role _HAVEN_STORE_DEV__CARAVAN_SALES_PRICING_APPLICATION__WRITER;
show grants to role _HAVEN_STORE_DEV__CARAVAN_SALES_PRICING_APPLICATION__READER;
show grants to role _HAVEN_STORE_DEV__CARAVAN_SALES_PRICING_APPLICATION__USAGE;

use role dba;

show grants of role caravan_sales_pricing_application_dev;
show grants to role caravan_sales_pricing_application_dev;


use schema haven_store_dev.caravan_sales_pricing_application;

show tables;

use role CARAVAN_SALES_PRICING_APPLICATION_DEPLOYMENT_DEV;

INSERT INTO "HAVEN_STORE_DEV"."caravan_sales_pricing_application".audit_logs 
        ("TIMESTAMP", "USERNAME", "USER_ROLE", "TARGET_TABLE", "RECORD_IDENTIFIER", "FIELD_NAME", "OLD_VALUE", "NEW_VALUE", "CHANGE_TYPE", "STATUS")
        VALUES (current_timestamp(), ?, ?, 'haven_base.plot.vans', ?, ?, ?, ?, 'PROPOSE', 'PENDING');

INSERT INTO haven_store_dev.caravan_sales_pricing_application.audit_logs 
        ("TIMESTAMP", "USERNAME", "USER_ROLE", "TARGET_TABLE", "RECORD_IDENTIFIER", "FIELD_NAME", "OLD_VALUE", "NEW_VALUE", "CHANGE_TYPE", "STATUS")
        VALUES (current_timestamp(), ?, ?, 'haven_base.plot.vans', ?, ?, ?, ?, 'PROPOSE', 'PENDING') ;       

INSERT INTO HAVEN_STORE_DEV.CARAVAN_SALES_PRICING_APPLICATION.AUDIT_LOGS
(LOG_ID, TIMESTAMP, USERNAME, USER_ROLE, TARGET_TABLE, RECORD_IDENTIFIER, FIELD_NAME, OLD_VALUE, NEW_VALUE, CHANGE_TYPE, STATUS, APPLIED_TIMESTAMP, REFERENCE_LOG_ID)
VALUES(0, CURRENT_TIMESTAMP(), '', '', '', '', '', '', '', '', 'PENDING', CURRENT_TIMESTAMP(), 0);
delete from HAVEN_STORE_DEV.CARAVAN_SALES_PRICING_APPLICATION.AUDIT_LOGS;

select * from snowflake.account_usage.query_history
where user_name = 'DILLONSIM'
and start_time > dateadd('hours', -1, current_timestamp())
and query_type = 'EXECUTE_STREAMLIT'
order by start_time desc;

show grants to role CARAVAN_SALES_PRICING_APPLICATION_DEV;

select current_role();

select * from audit_logs;

desc table audit_logs;

use role securityadmin;

grant role caravan_sales_pricing_application_dev to user abbiejohnson;

use role securityadmin;

grant role _haven_raw__iclean_etleap__creator to role haven_etleap_dataload;

grant role caravan_sales_pricing_application_dev to user marcusbialik;

use role dba;

use schema haven_store_dev.caravan_sales_pricing_application;

use role securityadmin;

grant role haven_etleap_dataload to user jadenorth;

use role dba;

    select get_ddl('table', 'haven_store_dev.caravan_sales_pricing_application.audit_logs');


create or replace TABLE AUDIT_LOGS (
	LOG_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
	TIMESTAMP TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP(),
	USERNAME VARCHAR(16777216) NOT NULL,
	USER_ROLE VARCHAR(16777216) NOT NULL,
	TARGET_TABLE VARCHAR(16777216) NOT NULL,
	RECORD_IDENTIFIER VARCHAR(16777216) NOT NULL,
	FIELD_NAME VARCHAR(16777216) NOT NULL,
	OLD_VALUE VARCHAR(16777216),
	NEW_VALUE VARCHAR(16777216),
	CHANGE_TYPE VARCHAR(16777216) NOT NULL,
	STATUS VARCHAR(16777216) DEFAULT 'PENDING',
	APPLIED_TIMESTAMP TIMESTAMP_NTZ(9),
	REFERENCE_LOG_ID NUMBER(38,0),
	constraint AUDIT_LOGS_PK primary key (LOG_ID)
);    

use schema haven_store_dev.caravan_sales_pricing_application;

show tables;

desc table active_submissions;

use role dba;

use schema haven_raw.identity_etleap;

show tables;

desc table hid_to_email;

select * from hid_to_email
where hid in 
('14009120',
'14187016',
'14252081',
'14318507',
'14669620',
'14005211');

select * from hid_to_password
where hid in 
('14009120',
'14187016',
'14252081',
'14318507',
'14669620',
'14005211');

select * from hid_to_profile
where hid in 
('14009120',
'14187016',
'14252081',
'14318507',
'14669620',
'14005211');

select * from hid_to_plot_owner
where hid in 
('14009120',
'14187016',
'14252081',
'14318507',
'14669620',
'14005211');

select * from hid_to_seaware_client
where hid in 
('14009120',
'14187016',
'14252081',
'14318507',
'14669620',
'14005211');

use role useradmin;

show users like 'lucy%';

use role dba;

select system$whitelist();

use role accountadmin;

SELECT SYSTEM$GET_SNOWFLAKE_PLATFORM_INFO();

use role dba;

use schema snowflake.account_usage;

select * from tables limit 20;

use database haven_master;

show schemas;

use role 

use schema haven_raw.iceberg_etleap_poc;

show tables;

select get_ddl('table', '"CLIENT_5hnlRW3p"');


create or replace ICEBERG TABLE "CLIENT_5hnlRW3p" 
 EXTERNAL_VOLUME = 'ETLEAP_ICEBERG_EXTERNAL_VOLUME'
 CATALOG = 'ETLEAP_ICEBERG_CATALOG'
 CATALOG_TABLE_NAME = 'client'
 CATALOG_NAMESPACE = 'etleapicebergintegrationdatabase';

 select * from "CLIENT_5hnlRW3p" limit 10;

 select * from CLIENT limit 10;

 show views;
