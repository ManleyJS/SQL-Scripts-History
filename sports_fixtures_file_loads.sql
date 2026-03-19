use ROLE haven_batch_dataload;

use SCHEMA haven_raw.sports_fixtures;

SHOW warehouses;

use warehouse BOURNE_BATCH_DATALOAD_XSMALL;

CREATE STAGE haven_raw.sports_fixtures.sports_fixture_data;

ls @haven_raw.sports_fixtures.sports_fixture_data;
rm @haven_raw.sports_fixtures.sports_fixture_data;


SELECT t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, NULL, t.$7, replace(split_part(metadata$filename, '_', 1), '-', ' '), replace(split_part(metadata$filename, '_', 2), '-', ' ')  
FROM @haven_raw.sports_fixtures.sports_fixture_data/competition/ t
limit 100;

CREATE file FORmat sports_fixture_file_format
skip_header = 1, FIELD_OPTIONALLY_ENCLOSED_BY = '"';

ls @haven_raw.sports_fixtures.sports_fixture_data/tournament;

SELECT t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, 
replace(split_part(split_part(metadata$filename, '/', 2), '_', 1), '-', ' '), 
replace(split_part(metadata$filename, '_', 2), '-', ' ')  
FROM @haven_raw.sports_fixtures.sports_fixture_data/tournament/ 
--(file_format => 'sports_fixture_file_format', pattern => '.cricket_.*[.]csv.gz') t
(file_format => 'sports_fixture_file_format') t
--limit 100
;


SELECT replace(split_part(metadata$filename, '_', 1), '-', ' '),
replace(substr(split_part(split_part(metadata$filename, '_', 2), '.', 1), 1, regexp_instr(split_part(split_part(metadata$filename, '_', 2), '.', 1), '[-][^-]*$') - 1), '-', ' '), 
count(*)
FROM @haven_raw.sports_fixtures.sports_fixture_data t
GROUP BY 1,2  ORDER BY 1,2 ;
 
CREATE OR replace TABLE sports_fixtures (
Match_NUMBER varchar(),	
Round_Number varchar(),	
Date	varchar(),
Location	 varchar(),
Home_Team	 varchar(),
Away_Team	 varchar(),
qualifying_GROUP varchar(),
Result	 varchar(),
sport	 varchar(),
competition  varchar()
);

CREATE OR replace TABLE sports_fixtures_groups (
Match_NUMBER varchar(),	
Round_Number varchar(),	
Date	varchar(),
Location	 varchar(),
Home_Team	 varchar(),
Away_Team	 varchar(),
qualifying_GROUP varchar(),
Result	 varchar());

SELECT current_role();
SELECT current_database();
SELECT current_schema();


TRUNCATE TABLE haven_raw.sports_fixtures.sports_fixtures;

copy INTO haven_raw.sports_fixtures.sports_fixtures from
(
	SELECT t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, NULL, t.$7, 
	replace(split_part(split_part(metadata$filename, '/', 2), '_', 1), '-', ' '), 
--	replace(substr(split_part(split_part(metadata$filename, '_', 2), '.', 1), 1, regexp_instr(split_part(split_part(metadata$filename, '_', 2), '.', 1), '[-][^-]*$') - 1), '-', ' ')
	split_part(split_part(metadata$filename, '_', 2), '.', 1)
	FROM @haven_raw.sports_fixtures.sports_fixture_data/competition/ 
	(file_format => 'sports_fixture_file_format')
	t ) 
;

SELECT * FROM haven_raw.sports_fixtures.sports_fixtures;


copy INTO haven_raw.sports_fixtures.sports_fixtures_groups
FROM @haven_raw.sports_fixtures.sports_fixture_data/tournament/ 
file_format = (format_name = 'sports_fixture_file_format')
validation_mode = RETURN_ALL_ERRORS
;

copy INTO haven_raw.sports_fixtures.sports_fixtures from
(
	SELECT t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8,
	replace(split_part(split_part(metadata$filename, '/', 2), '_', 1), '-', ' '), 
	split_part(split_part(metadata$filename, '_', 2), '.', 1)
	FROM @haven_raw.sports_fixtures.sports_fixture_data/tournament/ 
	(file_format => 'sports_fixture_file_format')
	t 
) 
;


ls @haven_raw.sports_fixtures.sports_fixture_data/tournament;

SELECT * FROM sports_fixtures;

use ROLE dba;

use SCHEMA haven_base.sports_fixtures;


CREATE OR REPLACE VIEW haven_base.sports_fixtures.sports_fixtures
( MATCH_NUMBER, ROUND_NUMBER, EVENT_DATE, LOCATION, HOME_TEAM, AWAY_TEAM, QUALIFYING_GROUP, RESULT, SPORT, COMPETITION, TIMEZONE )
AS SELECT MATCH_NUMBER, ROUND_NUMBER, DATE, LOCATION, HOME_TEAM, AWAY_TEAM, QUALIFYING_GROUP, RESULT, SPORT, 
replace(substr(COMPETITION, 1, regexp_instr(competition, '[-][^-]*$') - 1), '-', ' '),
substr(COMPETITION, regexp_instr(competition, '[-][^-]*$') + 1)
FROM HAVEN_RAW.SPORTS_FIXTURES.SPORTS_FIXTURES;

SELECT * FROM haven_base.sports_fixtures.sports_fixtures;

USE ROLE HAVEN_DATA_SCIENCE;

USE ROLE SECURITYADMIN;

GRANT ROLE _HAVEN_BASE__SPORTS_FIXTURES__READER TO ROLE HAVEN_DATA_SCIENCE;

SELECT * FROM haven_base.sports_fixtures.sports_fixtures
WHERE sport = 'cricket'
AND qualifying_group IS NOT null;

use ROLE haven_data_science;

use SCHEMA haven_base.sports_fixtures;

SHOW warehouses;

use warehouse HAVEN_DATA_SCIENCE_WAREHOUSE_XSMALL;

SELECT * FROM sports_fixtures;

use ROLE securityadmin;

GRANT ROLE _haven_base__sports_fixtures__reader TO ROLE haven_data_science_dev;

use ROLE haven_data_science_DEV;

use SCHEMA haven_base.sports_fixtures;

SHOW warehouses;

use warehouse HAVEN_DATA_SCIENCE_DEV_WAREHOUSE_XSMALL;

SELECT * FROM sports_fixtures;


