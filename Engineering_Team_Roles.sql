use role securityadmin;

show users like 'dan%carter';

grant role haven_dbt_development to user JosephMcdonald;
grant role haven_dbt_development to user AndrewDawson;
grant role haven_dbt_development to user DonatasGedgaudas;
grant role haven_dbt_development to user JohnPering;
grant role haven_dbt_development to user NarayanaVelaga;
grant role haven_dbt_development to user AbdulKahare;
grant role haven_dbt_development to user DanielCarter;
grant role haven_dbt_development to user IanMcKay;
grant role haven_dbt_development to user DillonSim;
grant role haven_dbt_development to user DonovanRansome;

grant role haven_dbt_development to user JudyShao;
grant role haven_dbt_development to user GregTaylor;

grant role haven_data_engineering to user JosephMcdonald;
grant role haven_data_engineering to user AndrewDawson;
grant role haven_data_engineering to user DonatasGedgaudas;
grant role haven_data_engineering to user JohnPering;
grant role haven_data_engineering to user NarayanaVelaga;
grant role haven_data_engineering to user AbdulKahare;
grant role haven_data_engineering to user DanielCarter;
grant role haven_data_engineering to user IanMcKay;
grant role haven_data_engineering to user DillonSim;
grant role haven_data_engineering to user DonovanRansome;

grant role haven_data_engineering to user JudyShao;
grant role haven_data_engineering to user GregTaylor;

show roles like '%darius%';

show grants to role HAVEN_REVENUE_MANAGEMENT_DILLONSIM;
show grants to role HAVEN_REVENUE_MANAGEMENT;

grant create application pa



use role dba;

use database haven_raw;

select * from information_schema.tables LIMIT 10;

select count(*) from information_schema.tables;

show grants of role haven_create_application_packages_role;

show grants to user dariustinca;

grant role haven_create_application_packages_role to role HAVEN_REVENUE_MANAGEMENT_DARIUSTINCA;