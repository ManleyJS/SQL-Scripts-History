use role securityadmin;

USE ROLE DBA;
use database haven_BASE;
USE SCHEMA AMPLITUDE;

DESC VIEW HAVEN_GUEST_AND_OWNERS;

USE SCHEMA HAVEN_RAW.AMPLITUDE;


create table deleteme clone events_100000957;

( WITH c_temp AS (
    SELECT 
        amplitude_id , 
        event_properties['page url']::string AS page_url 
    FROM 
        haven_raw.amplitude.events_100000957
    WHERE   
        page_url LIKE '%email=%' AND 
        NOT page_url LIKE '%email=&password%'  -- blank params
)
SELECT
    amplitude_id
FROM 
    c_temp
GROUP BY 1
ORDER BY 1);

delete from haven_raw.amplitude.events_100000957 
    WHERE   
        event_properties['page url']::string LIKE '%email=%' AND 
        NOT event_properties['page url']::string LIKE '%email=&password%';  -- blank params



( WITH c_temp AS (
    SELECT 
        amplitude_id , 
        event_properties['page url']::string AS page_url 
    FROM 
        haven_raw.amplitude.deleteme
    WHERE   
        page_url LIKE '%email=%' AND 
        NOT page_url LIKE '%email=&password%'  -- blank params
)
SELECT
    amplitude_id
FROM 
    c_temp
GROUP BY 1
ORDER BY 1);

use role securityadmin;

grant role _haven_raw__dig_playpass__creator to role haven_cdc_dataload;


        