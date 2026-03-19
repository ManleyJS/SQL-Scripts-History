use role dba;
use warehouse dba_wh;

use database haven_store;

use schema budget_data;

show tables;

create table caravan_sales_budget_daily
clone HAVEN_COMMERCIAL.AN_DEV.CS_BUDGET_DAILY;

create table caravan_sales_budget_weekly
clone HAVEN_COMMERCIAL.ML_DEV.BUDGETS_CARAVAN_SALES;

show tables;

create or replace table BUDGETS_ACTIVITIES
clone HAVEN_COMMERCIAL.FT_DEV."Budgets_Activities";

create or replace table BUDGETS_BINGO
clone HAVEN_COMMERCIAL.FT_DEV."Budgets_Bingo";

create or replace table BUDGETS_RETAIL
clone HAVEN_COMMERCIAL.FT_DEV."Budgets_Retail";

create table BUDGETS_POOL_RETAIL
clone HAVEN_COMMERCIAL.FT_DEV."Budgets_Pool_Retail";
