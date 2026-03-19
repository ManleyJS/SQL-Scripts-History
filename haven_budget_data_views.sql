USE ROLE dba;

USE SCHEMA HAVEN_COMMERCIAL.FT_DEV;

SHOW TABLES;
USE SCHEMA haven_store.budget_data;

CREATE TABLE HAVEN_STORE.BUDGET_DATA.budgets_retail CLONE HAVEN_COMMERCIAL.FT_DEV."Budgets_Retail";

CREATE TABLE HAVEN_STORE.BUDGET_DATA.budgets_activities CLONE HAVEN_COMMERCIAL.FT_DEV."Budgets_Activities";
CREATE TABLE HAVEN_STORE.BUDGET_DATA.budgets_bingo CLONE HAVEN_COMMERCIAL.FT_DEV."Budgets_Bingo";

SELECT * FROM budgets_bingo;
SELECT * FROM budgets_retail LIMIT 100;
SELECT * FROM budgets_activities LIMIT 100;

SHOW GRANTS OF ROLE _haven_store__budget_data__reader;

