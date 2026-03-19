use role dba;

select
    convert_timezone('Europe/London', 'UTC', to_timestamp_ntz('09:02', 'HH24:MI') ),
    convert_timezone('Europe/London', 'UTC', to_timestamp_ntz('09:02', 'HH24:MI') )::time,
    (convert_timezone('Europe/London', 'UTC', to_timestamp_ntz('09:02', 'HH24:MI') )::time)::time
;

select
    '2023-06-04'::date my_date,
    '13:00:00'::time my_time,
    concat(my_date, ' ', my_time)::timestamp_ntz my_datetime,
    convert_timezone('UTC', 'Europe/London', my_datetime) ;

USE ROLE haven_batch_dataload;
USE WAREHOUSE bourne_batch_dataload_xsmall;
USE SCHEMA haven_raw.wetherspoons;
SELECT order_date, order_time, concat(order_date, ' ', order_time)::TIMESTAMP_NTZ 
FROM haven_raw.wetherspoons.drink_orders;

select current_time();

use role haven_batch_dataload;
use warehouse bourne_batch_dataload_xsmall;
use schema haven_raw.wetherspoons;


CREATE OR REPLACE TABLE haven_raw.wetherspoons.drink_orders (
Site_Id int,
Order_Date date,
ORDER_Time time,
Aztec_Check_No bigint,
Item_Name varchar(),
Bumped_time_seconds int,
Expo_time_seconds int
);

CREATE OR REPLACE TABLE haven_raw.wetherspoons.food_orders (
Site_Id int,
Order_Date date,
ORDER_Time time,
Aztec_Check_No bigint,
Item_Name varchar(),
Bumped_time_seconds int,
Expo_time_seconds int
)
;

ls @haven_raw.wetherspoons.wetherspoons_integration_stage/Food_Orders_20240614.gz;

ls @haven_raw.wetherspoons.wetherspoons_integration_stage/Food;

TRUNCATE TABLE haven_raw.wetherspoons.drink_orders;

COPY INTO haven_raw.wetherspoons.drink_orders
FROM @haven_raw.wetherspoons.wetherspoons_integration_stage/Drink_Orders_20240616.gz;

select * from drink_orders limit 10;

SELECT order_date, count(*)
FROM drink_orders
group by 1 order by 1 desc;

truncate table haven_raw.wetherspoons.food_orders;

COPY INTO haven_raw.wetherspoons.food_orders
FROM @haven_raw.wetherspoons.wetherspoons_integration_stage/Food_Orders_20240616.gz;

SELECT order_date, count(*)
FROM food_orders
group by 1 order by 1 desc;

SELECT * FROM food_orders_loaded limit 10;

alter table food_orders rename to food_orders_loaded;
alter table drink_orders rename to drink_orders_loaded;

create table food_orders like food_orders_loaded;
create table drink_orders like drink_orders_loaded;

insert into food_orders select * from food_orders_loaded order by order_date, order_time;
insert into drink_orders select * from drink_orders_loaded order by order_date, order_time;

drop table food_orders_loaded;
drop table drink_orders_loaded;

copy files into @haven_raw.wetherspoons.wetherspoons_integration_stage/archive/Food/ from @haven_raw.wetherspoons.wetherspoons_integration_stage/Food;
copy files into @haven_raw.wetherspoons.wetherspoons_integration_stage/archive/Drink/ from @haven_raw.wetherspoons.wetherspoons_integration_stage/Drink;

ls @haven_raw.wetherspoons.wetherspoons_integration_stage;

rm @haven_raw.wetherspoons.wetherspoons_integration_stage/Food;
rm @haven_raw.wetherspoons.wetherspoons_integration_stage/Drink;

set sql_delimiter='/';

CREATE OR REPLACE TASK haven_raw.wetherspoons.loadFoodAndDrinkData
  warehouse = bourne_batch_dataload_xsmall
  schedule = 'USING CRON 15 8 * * * UTC'
  AS
    BEGIN
      COPY INTO haven_raw.wetherspoons.food_orders FROM @haven_raw.wetherspoons.wetherspoons_integration_stage/Food_Orders_;
      copy files into @haven_raw.wetherspoons.wetherspoons_integration_stage/archive/Food/ from @haven_raw.wetherspoons.wetherspoons_integration_stage/Food;
      rm @haven_raw.wetherspoons.wetherspoons_integration_stage/Food;
      COPY INTO haven_raw.wetherspoons.drink_orders FROM @haven_raw.wetherspoons.wetherspoons_integration_stage/Drink_Orders_;
      copy files into @haven_raw.wetherspoons.wetherspoons_integration_stage/archive/Drink/ from @haven_raw.wetherspoons.wetherspoons_integration_stage/Drink;
      rm @haven_raw.wetherspoons.wetherspoons_integration_stage/Drink;
    END;/
;
set sql_delimiter=';';
drop task haven_raw.wetherspoons.loadFoodAndDrinkData;

show tasks;

use role dba;

drop task haven_raw.wetherspoons.loadFoodAndDrinkData;

set sql_delimiter='/';

CREATE OR REPLACE TASK haven_raw.wetherspoons.load_logwoods_Food_Drink_Data
  warehouse = bourne_batch_dataload_xsmall
  schedule = 'USING CRON 15 8 * * * UTC'
  AS
    BEGIN
      COPY INTO haven_raw.wetherspoons.food_orders FROM @haven_raw.wetherspoons.wetherspoons_integration_stage/Food_Orders_;
      copy files into @haven_raw.wetherspoons.wetherspoons_integration_stage/archive/Food/ from @haven_raw.wetherspoons.wetherspoons_integration_stage/Food;
      rm @haven_raw.wetherspoons.wetherspoons_integration_stage/Food;
      COPY INTO haven_raw.wetherspoons.drink_orders FROM @haven_raw.wetherspoons.wetherspoons_integration_stage/Drink_Orders_;
      copy files into @haven_raw.wetherspoons.wetherspoons_integration_stage/archive/Drink/ from @haven_raw.wetherspoons.wetherspoons_integration_stage/Drink;
      rm @haven_raw.wetherspoons.wetherspoons_integration_stage/Drink;
    END;/
;
set sql_delimiter=';';

show tasks;

execute task haven_raw.wetherspoons.loadFoodAndDrinkData;
  
ls @haven_raw.wetherspoons.wetherspoons_integration_stage/archive/Food;

show tasks;

alter task haven_raw.wetherspoons.load_logwoods_Food_Drink_Data resume;

show tasks;

select * from table(INFORMATION_SCHEMA.TASK_HISTORY())
  ORDER BY SCHEDULED_TIME;

ls @haven_raw.wetherspoons.wetherspoons_integration_stage;

-- 19/08/2025

ls @haven_raw.wetherspoons.wetherspoons_integration_stage;
