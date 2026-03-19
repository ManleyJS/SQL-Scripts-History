USE ROLE securityadmin;

show GRANTS TO ROLE haven_commercial;

USE ROLE useradmin;

CREATE ROLE _haven_commercial__haven_store__ma_mart__reader;
CREATE ROLE _haven_commercial__haven_store__sas_scv__reader;

USE ROLE securityadmin;

grant select on table HAVEN_STORE.MA_MART.CAMEO_INCOME to role _haven_commercial__haven_store__ma_mart__reader;
grant select on table HAVEN_STORE.MA_MART.CAMEO_INCOME_CATEGORY to role _haven_commercial__haven_store__ma_mart__reader;
grant select on table HAVEN_STORE.MA_MART.CAMEO_INCOME_GROUP to role _haven_commercial__haven_store__ma_mart__reader;
grant select on table HAVEN_STORE.MA_MART.CAMEO_INCOME_TYPE to role _haven_commercial__haven_store__ma_mart__reader;
grant select on table HAVEN_STORE.MA_MART.HVN_ENHANCE_COM_DETAIL to role _haven_commercial__haven_store__ma_mart__reader;
grant select on table HAVEN_STORE.MA_MART.MA_HOLIDAY_CONTACT to role _haven_commercial__haven_store__ma_mart__reader;
grant select on table HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON to role _haven_commercial__haven_store__ma_mart__reader;
grant select on table HAVEN_STORE.MA_MART.PARK_PROSPECT_PREF to role _haven_commercial__haven_store__ma_mart__reader;
grant select on table HAVEN_STORE.MA_MART.SN_ADDRESS_SEGMENTATION to role _haven_commercial__haven_store__ma_mart__reader;
grant select on table HAVEN_STORE.MA_MART.SN_ADDRESS_SEGMENTATION_HIST to role _haven_commercial__haven_store__ma_mart__reader;
grant select on table HAVEN_STORE.MA_MART.SN_SOCIO_ECON to role _haven_commercial__haven_store__ma_mart__reader;
grant select on table HAVEN_STORE.SAS_SCV.BOOKING_APC_SCHEDULE to role _haven_commercial__haven_store__sas_scv__reader;
grant select on table HAVEN_STORE.SAS_SCV.BOOKING_CURRENT to role _haven_commercial__haven_store__sas_scv__reader;
grant select on table HAVEN_STORE.SAS_SCV.BOOKING_HIST to role _haven_commercial__haven_store__sas_scv__reader;
grant select on table HAVEN_STORE.SAS_SCV.BOOKING_ORIGINAL to role _haven_commercial__haven_store__sas_scv__reader;
grant select on table HAVEN_STORE.SAS_SCV.SN_CAMPAIGN to role _haven_commercial__haven_store__sas_scv__reader;
grant select on table HAVEN_STORE.SAS_SCV.SN_COMMUNICATION to role _haven_commercial__haven_store__sas_scv__reader;
grant select on table HAVEN_STORE.SAS_SCV.SN_CONTACT_HISTORY to role _haven_commercial__haven_store__sas_scv__reader;

grant role _haven_commercial__haven_store__sas_scv__reader to role haven_commercial;
grant role _haven_commercial__haven_store__ma_mart__reader to role haven_commercial;

revoke select on table HAVEN_STORE.MA_MART.CAMEO_INCOME from role haven_commercial;
revoke select on table HAVEN_STORE.MA_MART.CAMEO_INCOME_CATEGORY from role haven_commercial;
revoke select on table HAVEN_STORE.MA_MART.CAMEO_INCOME_GROUP from role haven_commercial;
revoke select on table HAVEN_STORE.MA_MART.CAMEO_INCOME_TYPE from role haven_commercial;
revoke select on table HAVEN_STORE.MA_MART.HVN_ENHANCE_COM_DETAIL from role haven_commercial;
revoke select on table HAVEN_STORE.MA_MART.MA_HOLIDAY_CONTACT from role haven_commercial;
revoke select on table HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON from role haven_commercial;
revoke select on table HAVEN_STORE.MA_MART.PARK_PROSPECT_PREF from role haven_commercial;
revoke select on table HAVEN_STORE.MA_MART.SN_ADDRESS_SEGMENTATION from role haven_commercial;
revoke select on table HAVEN_STORE.MA_MART.SN_ADDRESS_SEGMENTATION_HIST from role haven_commercial;
revoke select on table HAVEN_STORE.MA_MART.SN_SOCIO_ECON from role haven_commercial;
revoke select on table HAVEN_STORE.SAS_SCV.BOOKING_APC_SCHEDULE from role haven_commercial;
revoke select on table HAVEN_STORE.SAS_SCV.BOOKING_CURRENT from role haven_commercial;
revoke select on table HAVEN_STORE.SAS_SCV.BOOKING_HIST from role haven_commercial;
revoke select on table HAVEN_STORE.SAS_SCV.BOOKING_ORIGINAL from role haven_commercial;
revoke select on table HAVEN_STORE.SAS_SCV.SN_CAMPAIGN from role haven_commercial;
revoke select on table HAVEN_STORE.SAS_SCV.SN_COMMUNICATION from role haven_commercial;
revoke select on table HAVEN_STORE.SAS_SCV.SN_CONTACT_HISTORY from role haven_commercial;

SHOW GRANTS TO ROLE haven_commercial;

REVOKE ROLE _haven_store__ma_mart__usage FROM role haven_commercial;

revoke role _haven_commercial__haven_store__ma_mart__reader from role haven_commercial;