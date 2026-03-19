use ROLE dba;

use SCHEMA haven_base.oecd;

--for haven_base.oecd
 
create or replace view CONSUMER_CONFIDENCE_INDEX as
(
with src as (
select 
    parse_json(datasets) as ds, 
    parse_json(structures) as st 
from 
    haven_raw.OECD.CONSUMER_CONFIDENCE_INDEX  
where 
    datasets is not null
)
,
-- Flatten the observations
obs AS (
  SELECT 
    SPLIT_PART(obs_flat.key, ':', 10)::int as obs_time_key,
    obs_flat.value[0]::float   AS CONSUMER_CONFIDENCE_INDEX 
  FROM 
    src,
    LATERAL FLATTEN(input => ds) ds_flat,
    LATERAL FLATTEN(input => ds_flat.value:observations) obs_flat
)
,
-- Flatten the TIME_PERIOD values
time_dim AS (
  SELECT 
    timeperiod_flat.index as time_key,
    timeperiod_flat.value['name']::string as TIME_PERIOD
  FROM 
    src,
    LATERAL FLATTEN(input => st[0]:dimensions.observation) st_flat,
    LATERAL FLATTEN(input => st_flat.value:values) timeperiod_flat
  WHERE 
    st_flat.value:id = 'TIME_PERIOD'
) 
--join obs to time_period by key
select 
    TIME_PERIOD, 
    CONSUMER_CONFIDENCE_INDEX 
from 
    obs aa
join 
    time_dim bb on aa.obs_time_key = bb.time_key
);

SELECT * FROM CONSUMER_CONFIDENCE_INDEX
LIMIT 100;

create or replace view CONSUMER_PRICE_INDEX as
(
with src as (
select 
    parse_json(datasets) as ds, 
    parse_json(structures) as st 
from 
    haven_raw.oecd.CONSUMER_PRICE_INDEX 
where 
    datasets is not null
)
,
-- Flatten the observations
obs AS (
  SELECT 
    SPLIT_PART(obs_flat.key, ':', 9)::int as obs_time_key,
    obs_flat.value[0]::float   AS CONSUMER_PRICE_INDEX
  FROM src,
       LATERAL FLATTEN(input => ds) ds_flat,
       LATERAL FLATTEN(input => ds_flat.value:observations) obs_flat
)
--select * from obs;
,
-- Flatten the TIME_PERIOD values
time_dim AS (
  SELECT 
    timeperiod_flat.index as time_key,
    timeperiod_flat.value['name']::string as TIME_PERIOD
  FROM src,
       LATERAL FLATTEN(input => st[0]:dimensions.observation) st_flat,
       LATERAL FLATTEN(input => st_flat.value:values) timeperiod_flat
  WHERE st_flat.value:id = 'TIME_PERIOD'
) 
--join obs to time_period by key
select 
    TIME_PERIOD, 
    CONSUMER_PRICE_INDEX 
from 
    obs aa
join 
    time_dim bb on aa.obs_time_key = bb.time_key
)
;

SELECT * FROM CONSUMER_PRICE_INDEX
LIMIT 100;

create or replace view INTEREST_RATES as
(
with src as (
select 
    parse_json(datasets) as ds, 
    parse_json(structures) as st 
from 
    haven_raw.OECD.INTEREST_RATES_SHORT_TERM 
where 
    datasets is not null
)
,
-- Flatten the observations
obs AS (
  SELECT 
    SPLIT_PART(obs_flat.key, ':', 10)::int as obs_time_key,
    obs_flat.value[0]::float  AS INTEREST_RATES
  FROM src,
       LATERAL FLATTEN(input => ds) ds_flat,
       LATERAL FLATTEN(input => ds_flat.value:observations) obs_flat
)
,
-- Flatten the TIME_PERIOD values
time_dim AS (
  SELECT 
    timeperiod_flat.index as time_key,
    timeperiod_flat.value['name']::string as TIME_PERIOD
  FROM src,
       LATERAL FLATTEN(input => st[0]:dimensions.observation) st_flat,
       LATERAL FLATTEN(input => st_flat.value:values) timeperiod_flat
  WHERE 
    st_flat.value:id = 'TIME_PERIOD'
) 
--join obs to time_period by key
select 
    TIME_PERIOD, 
    INTEREST_RATES 
from 
    obs aa
join 
    time_dim bb on aa.obs_time_key = bb.time_key
)
; 
 
SELECT * FROM INTEREST_RATES
LIMIT 100;

create or replace view UNEMPLOYMENT as (
with src as (
select 
    parse_json(datasets) as ds, 
    parse_json(structures) as st 
from 
    haven_raw.OECD.UNEMPLOYMENT 
where 
    datasets is not null
),
-- Flatten the observations
obs AS (
  SELECT 
    SPLIT_PART(obs_flat.key, ':', 10)::int as obs_time_key,
    obs_flat.value[0]::float   AS UNEMPLOYMENT
  FROM src,
       LATERAL FLATTEN(input => ds) ds_flat,
       LATERAL FLATTEN(input => ds_flat.value:observations) obs_flat
)
--select * from obs;
,
-- Flatten the TIME_PERIOD values
time_dim AS (
  SELECT 
    timeperiod_flat.index as time_key,
    timeperiod_flat.value['name']::string as TIME_PERIOD
  FROM src,
       LATERAL FLATTEN(input => st[0]:dimensions.observation) st_flat,
       LATERAL FLATTEN(input => st_flat.value:values) timeperiod_flat
  WHERE st_flat.value:id = 'TIME_PERIOD'
) 
--join obs to time_period by key
select 
    TIME_PERIOD, 
    UNEMPLOYMENT
from 
    obs aa
join 
    time_dim bb on aa.obs_time_key = bb.time_key
);

SELECT * FROM UNEMPLOYMENT
LIMIT 100;

-- 12/09/2025

use ROLE dba;

use SCHEMA haven_base.oecd;


create or replace view CONSUMER_CONFIDENCE_INDEX_CPI as
(
with src as (
select 
    parse_json(datasets) as ds, 
    parse_json(structures) as st 
from 
    haven_raw.OECD.CONSUMER_CONFIDENCE_INDEX_CPI  
where 
    datasets is not null
)
,
-- Flatten the observations
obs AS (
  SELECT 
    SPLIT_PART(obs_flat.key, ':', 10)::int as obs_time_key,
    obs_flat.value[0]::float   AS CONSUMER_CONFIDENCE_INDEX_CPI 
  FROM 
    src,
    LATERAL FLATTEN(input => ds) ds_flat,
    LATERAL FLATTEN(input => ds_flat.value:observations) obs_flat
)
,
-- Flatten the TIME_PERIOD values
time_dim AS (
  SELECT 
    timeperiod_flat.index as time_key,
    timeperiod_flat.value['name']::string as TIME_PERIOD
  FROM 
    src,
    LATERAL FLATTEN(input => st[0]:dimensions.observation) st_flat,
    LATERAL FLATTEN(input => st_flat.value:values) timeperiod_flat
  WHERE 
    st_flat.value:id = 'TIME_PERIOD'
) 
--join obs to time_period by key
select 
    TIME_PERIOD, 
    CONSUMER_CONFIDENCE_INDEX_CPI 
from 
    obs aa
join 
    time_dim bb on aa.obs_time_key = bb.time_key
);

SELECT * FROM CONSUMER_CONFIDENCE_INDEX_CPI
LIMIT 100;
