USE SCHEMA haven_raw.competitor;
USE ROLE dba;

SELECT count(*) FROM (
SELECT SITE, "TYPE", RATE, RATE_TYPE, NIGHTS, CHECK_IN_DATE, "LOCATION", PARK, BEDS, SLEEPS, BOOKING_SAVINGS, REMAINING_INVENTORY, 
prop_name,
CASE
	WHEN REGEXP_like(prop_type, 'caravan.', 'i') THEN 
		CASE 
            WHEN REGEXP_like(prop_name, 'signature.', 'i') THEN 'Signature'
            WHEN REGEXP_like(prop_name, 'bronze.', 'i') THEN 'Bronze'
            WHEN REGEXP_like(prop_name, 'lodge.', 'i') THEN 'Lodge'
            ELSE prop_name
        END             
     ELSE prop_type
END,
prop_type, pets_allowed,
to_date(extracted_date), DATEDIFF(DAY, check_in_date, to_date(EXTRACTED_DATE)),

        to_date(check_in_date, 'DY') AS Check_in_Day,
        YEAR(check_in_date) AS Season,
        MONTH(check_in_date) AS Arrival_Month,
        to_date(extracted_date, 'YYYY--MM') AS Book_Month,
        weekiso(extracted_date) AS Iso_Week_Booked_Date
--,       to_date(extracted_date, '%Y-%V') AS Iso_Year_Week_Booked_Date

FROM HAVEN_RAW.COMPETITOR.HAVEN_DETAILS
WHERE to_date(extracted_date) = '2022-06-12'
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
13,
14,
15, 16,
17, 18,
19, 20, 21, 22, 23
--, 24
)
;

SELECT "LOCATION", park FROM  HAVEN_RAW.COMPETITOR.HAVEN_DETAILS
WHERE to_date(extracted_date) = '2022-06-12'
GROUP BY 1,2 ORDER BY 1,2
