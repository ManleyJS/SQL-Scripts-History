use role useradmin;

create role call_centre_work;

use role securityadmin;

grant role _training__call_centre__creator to role call_centre_work;
show roles like '_haven_cdc_migration_%';

use role accountadmin;

CREATE OR REPLACE API INTEGRATION GITHUB_INTEGRATION_CALL_CENTER_DEMO
    api_provider = git_https_api
    api_allowed_prefixes = ('https://github.com/Snowflake-Labs/')
    enabled = true
    comment='Git integration with Snowflake-Labs Github Repository.';

grant create git repository on schema training.call_centre to role call_centre_work;

use role securityadmin;

grant usage on integration GITHUB_INTEGRATION_CALL_CENTER_DEMO to role call_centre_work;

use role call_centre_work;

use schema training.call_centre;

show schemas;

CREATE GIT REPOSITORY GITHUB_REPO_CALL_CENTER_DEMO
	ORIGIN = 'https://github.com/Snowflake-Labs/sfguide-building-cortex-aisql-powered-callcentre-analytics' 
	API_INTEGRATION = 'GITHUB_INTEGRATION_CALL_CENTER_DEMO' 
	COMMENT = 'Github Repository from Snowflake-Labs with a demo for Call Center Analytics.';

use warehouse haven_cdc_migration_wh;

CREATE STAGE IF NOT EXISTS AUDIO_FILES
    ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE')
    DIRECTORY = ( ENABLE = true )
    COMMENT = 'Used to store recordings';

ls @training.call_centre.GITHUB_REPO_CALL_CENTER_DEMO/branches/main/audio_files/;

COPY FILES
  INTO @AUDIO_FILES
  FROM @training.call_centre.GITHUB_REPO_CALL_CENTER_DEMO/branches/main/audio_files/
  PATTERN='.*[.]mp3';    

  show databases;
  show warehouses;

use role securityadmin;

grant role call_centre_work to role haven_data_engineering;
revoke role call_centre_work from role haven_data_engineering;

grant database role snowflake.cortex_user to role call_centre_work;


use role accountadmin;

show models;

show parameters;

ALTER ACCOUNT SET CORTEX_ENABLED_CROSS_REGION = 'ANY_REGION';

show parameters like '%enable%';

use role dba;

use schema training.call_centre;

ls @audio_files;

ALTER STAGE AUDIO_FILES REFRESH;

SELECT * FROM DIRECTORY(@AUDIO_FILES);

select ai_transcribe(TO_FILE('@audio_files', '2024-11-11/audiofile23.mp3'), {'timestamp_granularity': 'speaker'});
select ai_transcribe(TO_FILE('@audio_files', '2024-11-11/audiofile23.mp3'));

CREATE OR REPLACE TABLE RAW_TRANSCRIPTIONS AS
WITH CALL_CENTER_TRANSCRIPTIONS AS (
    SELECT
        -- Extract metadata from path
        split(RELATIVE_PATH,'/')[0]::DATE AS DATE,
        split(RELATIVE_PATH,'/')[1]::string AS AUDIO_FILE,
        RELATIVE_PATH AS AUDIOFILE_RELATIVE_PATH,
        
        -- Transcribe audio file
        AI_TRANSCRIBE(TO_FILE('@AUDIO_FILES', RELATIVE_PATH)) AS TRANSCRIPTION,
        TRANSCRIPTION['text']::VARCHAR AS TRANSCRIPTION_RAW_TEXT,
        TRANSCRIPTION['audio_duration']::FLOAT AS TRANSCRIPTION_DURATION_SECONDS,
        GET_PRESIGNED_URL('@AUDIO_FILES', RELATIVE_PATH) AS PRESIGNED_URL
    FROM DIRECTORY('@AUDIO_FILES')
)
SELECT 
    DATE,
    AUDIO_FILE,
    AUDIOFILE_RELATIVE_PATH,
    TRANSCRIPTION_RAW_TEXT,
    TRANSCRIPTION_DURATION_SECONDS,
    PRESIGNED_URL
FROM
    CALL_CENTER_TRANSCRIPTIONS;

SELECT * from RAW_TRANSCRIPTIONS;



show parameters;

use role accountadmin;

ALTER ACCOUNT SET CORTEX_MODELS_ALLOWLIST = 'All';

grant database role snowflake.cortex_user to role dba;

use role call_centre_work;

use role dba;

select AI_TRANSCRIBE(TO_FILE('@audio_files', '2024-11-11/audiofile23.mp3'));

ls @audio_files;

SHOW FUNCTIONS LIKE 'AI_%';


show tables;

select * from transcriptions;

select * from raw_transcriptions;

CALL training.call_centre.transcribe_audio_files();

describe table transcriptions;

CALL training.call_centre.transcribe_audio_files();

select * from transcriptions;

show procedures;

desc procedure transcribe_audio_files();

CALL training.call_centre.transcribe_audio_files();

select * from transcriptions;

use role dba;
drop procedure transcribe_audio_files();
drop table transcriptions;

use role call_centre_work;

CALL training.call_centre.transcribe_audio_files();

select * from transcriptions;

LIST @training.call_centre.audio_files;

use role dba;

CALL training.call_centre.transcribe_audio_files();

use role call_centre_work;

CALL training.call_centre.transcribe_audio_files();

select * from transcriptions;

select count(*) from transcriptions;

show tables;

show tasks;

select * from transcriptions;

SELECT *
  FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY(
    SCHEDULED_TIME_RANGE_START=>DATEADD('day',-7, current_timestamp()),
    RESULT_LIMIT => 10,
    TASK_NAME=>'PROCESS_NEW_AUDIO_FILES'));


select SYSTEM$PIPE_STATUS( 'audio_file_pipe' );

use role dba;

select SYSTEM$PIPE_STATUS( 'audio_file_pipe' );

create or replace TABLE RAW_TRANSCRIPTIONS (
	DATE DATE,
	AUDIO_FILE VARCHAR(16777216),
	AUDIOFILE_RELATIVE_PATH VARCHAR(16777216),
    	TRANSCRIPTION_RAW_TEXT VARCHAR(16777216),
	TRANSCRIPTION_DURATION_SECONDS FLOAT,
	PRESIGNED_URL VARCHAR(16777216)
);

select * from raw_transcriptions;

use role call_centre_work;

CALL training.call_centre.separate_speakers();

show tables;

select * from separated_transcriptions;

CALL training.call_centre.separate_speakers_sequential();

use role call_centre_work;

use role dba;

drop table audio_file_queue;

drop from audio_file_stream;

show tables;

select * from transcription_audit;

truncate table transcription_audit;

show tables;

drop table processed_audio_files;

select * from sequential_transcriptions where conversation_id = 20 order by sequence_number;

rm @audio_files/audiofileCopy01.mp3.gz;
rm @audio_files/audiofileCopy02.mp3.gz;

ls @audio_files;

show tables;

select * from processed_files;

show tasks;

use role call_centre_work;

show tasks;


SELECT *
  FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY(
    SCHEDULED_TIME_RANGE_START=>DATEADD('day',-7, current_timestamp()),
    RESULT_LIMIT => 10,
    TASK_NAME=>'AUTO_PROCESS_AUDIO_TASK'));

ls @audio_files;

-- CALL training.call_centre.transcribe_single_file('@training.call_centre.audio_files', '2024-11-11/audiofile24.mp3');

select * from transcriptions;

rm @audio_files/audiofileCopy01.mp3;
rm @audio_files/audiofileCopy02.mp3;


select * from processed_files
order by processed_timestamp;

truncate table processed_files;

show tasks;

alter task AUTO_PROCESS_AUDIO_TASK suspend;

SELECT *
  FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY(
    SCHEDULED_TIME_RANGE_START=>DATEADD('day',-7, current_timestamp()),
    RESULT_LIMIT => 10,
    TASK_NAME=>'AUTO_PROCESS_AUDIO_TASK'));



-- 08/12/2025

rm @audio_files/;

ls @audio_files;

COPY FILES
  INTO @AUDIO_FILES
  FROM @training.call_centre.GITHUB_REPO_CALL_CENTER_DEMO/branches/main/audio_files/
  PATTERN='.*[.]mp3';    

ls @audio_files;

ALTER STAGE AUDIO_FILES REFRESH;

SELECT * FROM DIRECTORY(@AUDIO_FILES);

select ai_transcribe(TO_FILE('@audio_files', '2024-11-11/audiofile23.mp3'), {'timestamp_granularity': 'speaker'});
select ai_transcribe(TO_FILE('@audio_files', '2024-11-11/audiofile23.mp3'));


ls @audio_files;

select ai_transcribe(TO_FILE('@audio_files', 'mp3/16df778d-1bef-47f4-adc2-ead632026dcd.mp316df778d-1bef-47f4-adc2-ead632026dcd.mp3'), {'timestamp_granularity': 'speaker'});
select ai_transcribe(TO_FILE('@audio_files', 'activitycall2.mp3'), {'timestamp_granularity': 'speaker'});
select ai_transcribe(TO_FILE('@audio_files', 'salescall1.mp3'), {'timestamp_granularity': 'speaker'});

show tables;

select * from sequential_transcriptions where conversation_id = 1;

select * from raw_transcriptions;



rm  @audio_files/activitycall2.mp3.gz;
rm @audio_files/salescall1.mp3.gz;

CALL training.call_centre.transcribe_single_file('@training.call_centre.audio_files', 'activitycall2.mp3');

show procedures;

-- SEPARATE_SPEAKERS_SEQUENTIAL

select * from transcriptions;

create table raw_transcriptions_clone clone raw_transcriptions; 

truncate table raw_transcriptions;

insert into raw_transcriptions (date, audio_file, audiofile_relative_path, transcription_raw_text)
select '2025-12-09', file_name, file_name, transcribed_text
from transcriptions
where file_name = 'activitycall2.mp3';

select * from raw_transcriptions;

call SEPARATE_SPEAKERS_SEQUENTIAL();

select * from sequential_transcriptions;

-- 16/12/2025

ls @audio_files;

rm @audio_files;

select ai_transcribe(TO_FILE('@audio_files', 'audiofile1.mp3'), {'timestamp_granularity': 'speaker'});

