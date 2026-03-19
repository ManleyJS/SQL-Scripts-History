use role dba;

use warehouse dba_wh;

use schema training.training;

show tables;

alter table client_source modify column email set tag haven_master.tag_admin.email = 'email_address';

select email, web_login_name from client_source;

select system$get_tag('haven_master.tag_admin.email', 'client_source.email', 'column');

alter table client_source modify column email unset tag haven_master.tag_admin.email;

select system$get_tag('haven_master.tag_admin.email', 'client_source.email', 'column');

alter table client_source modify column web_login_name set tag haven_master.tag_admin.email = 'web_login_address';

select system$get_tag('haven_master.tag_admin.email', 'client_source.email', 'column');

alter table client_source modify column email set tag haven_master.tag_admin.email = 'email_address';

select system$get_tag('haven_master.tag_admin.email', 'client_source.email', 'column');
select system$get_tag('haven_master.tag_admin.email', 'client_source.web_login_name', 'column');

select email, web_login_name from client_target limit 50;

select * from snowflake.account_usage.tag_references
order by object_name, object_database, object_schema, column_name, tag_name;

SELECT
   OBJECT_DATABASE,
   OBJECT_SCHEMA,
   OBJECT_NAME
FROM
   TABLE(
       SNOWFLAKE.ACCOUNT_USAGE.TAG_REFERENCES_WITH_LINEAGE('HAVEN_MASTER.TAG_ADMIN.PII')
   )
WHERE
   TAG_VALUE = 'personal';
