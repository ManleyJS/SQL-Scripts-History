use role securityadmin;
grant role _haven_base__qualtrics__owner to role dba;

use role dba;

use database warner_base;
use schema qualtrics;

create or replace view count_of_keys 
as select key, count(*) as rowcount from warner_base.qualtrics.survey_embedded_data
group by 1 order by 1;


use role warner_qualtrics_management;

use role haven_commercial;

use role dba;

show grants to user saimanasir;

"HAVEN_RAW"."BIGQUERY"."PRODUCT_IMPRESSIONS_AND_BOOKINGS_BY_PERIOD";

use role haven_commercial;

show grants to user lukemurphy;

show grants to role haven_commercial_lukemurphy;

use role dba;
SELECT searches_and_bookings_DATE AS DATE, SEARCHES, ARRIVAL_PERIOD, PARK_CODE, BOOKINGS, ARRIVAL_DATE, HOLIDAY_TYPE
FROM HAVEN_RAW.BIGQUERY.SEARCHES_AND_BOOKINGS_SUMMARY
order by searches_and_bookings_DATE desc;


use role dba;


use role securityadmin;
grant role _haven_store__plotreprs__creator to role haven_batch_dataload;

show grants to role haven_commercial;

use role securityadmin;

revoke role _warner_raw__rotaready__creator from role warner_batch_dataload;
grant role _warner_raw__rotaready__creator to role warner_rotaready_dataload;

show grants to role warner_rotaready_dataload;
"HAVEN_RAW"."AZTECACTIVITYMANAGEMENT_COMPLEX"
"HAVEN_RAW"."AZTEC_COMPLEX"
"HAVEN_RAW"."AZTEC_RETAIL"

use role securityadmin;

grant role _haven_store__financial_cube__creator to role haven_batch_dataload;

use role haven_activities_reporting;

show roles like '%_johnpering';

grant role _haven_base__dig_activities__reader to role DATA_ENGINEERING_JOHNPERING;

use role securityadmin;

grant role _haven_base__aztecactivitymanagement_complex__reader to role haven_commercial;
grant role _haven_base__aztec_complex__reader to role haven_commercial;
grant role _haven_base__aztec_retail__reader to role haven_commercial;
grant role _haven_base__zbsdata_complex__reader to role haven_commercial;
grant role _haven_base__zbsdata_retail__reader to role haven_commercial;

show roles like 'haven_%';

grant role _haven_base__aztecactivitymanagement_complex__reader to role haven_zonal_discovery;
grant role _haven_base__aztec_complex__reader to role haven_zonal_discovery;
grant role _haven_base__aztec_retail__reader to role haven_zonal_discovery;
grant role _haven_base__zbsdata_complex__reader to role haven_zonal_discovery;
grant role _haven_base__zbsdata_retail__reader to role haven_zonal_discovery;
