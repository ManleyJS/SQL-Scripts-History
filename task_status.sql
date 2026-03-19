use role accountadmin;

show tasks like '%blueyonder%';
show tasks in account;

use schema haven_store.digital;

--PX0013_DIGITAL_EXPERIENCE_ARRIVALS_TASK
--BLUEYONDER_INVALID_PRICE_REPORT
--BLUEYONDER_PRICE_OVERRIDE_REPORT

SELECT *
  FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY(
    SCHEDULED_TIME_RANGE_START=>DATEADD('hour',-168,current_timestamp()),
    RESULT_LIMIT => 10,
    TASK_NAME=>'PX0013_DIGITAL_EXPERIENCE_ARRIVALS_TASK')); 

alter task haven_raw.blueyonder.BLUEYONDER_INVALID_PRICE_REPORT resume;
alter task haven_raw.blueyonder.BLUEYONDER_PRICE_OVERRIDE_REPORT resume;


show stages;

ls @PX0013_DIGITAL_EXPERIENCE_ARRIVALS;

show users like '%mut%';