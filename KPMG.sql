USE ROLE sysadmin;

CREATE WAREHOUSE haven_kpmg_analysis_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_kpmg_analysis_warehouse_xsmall__operator;
create role _haven_kpmg_analysis_warehouse_xsmall__usage;

-- Create a new role intended to monitor Snowflake usage.
create role haven_kpmg_analysis;

create role _haven_kpmg_analysis__haven_store__holiday__reader;
create role _haven_kpmg_analysis__haven_store__caravans__reader;
create role _haven_kpmg_analysis__haven_store__retail__reader;
create role _haven_kpmg_analysis__haven_store__common__reader;

create role _haven_kpmg_analysis__haven_base__seaware__reader;
create role _haven_kpmg_analysis__haven_base__identity__reader;
create role _haven_kpmg_analysis__haven_base__amplitude__reader;
create role _haven_kpmg_analysis__haven_base__bloomreach__reader;
create role _haven_kpmg_analysis__haven_base__braintree__reader;
create role _haven_kpmg_analysis__haven_base__qualtrics__reader;

-- lucykearney
-- lucy.kearney@bourne-leisure.co.uk 
-- Data Scientist

create USER lucykearney 
login_name = 'lucy.kearney@bourne-leisure.co.uk'
display_name = 'Lucy Kearney'
email = 'lucy.kearney@bourne-leisure.co.uk'
comment = 'Data Scientist'
default_role =  haven_kpmg_analysis
DEFAULT_WAREHOUSE = haven_kpmg_analysis_warehouse_xsmall;

-- emmacurrie
-- emma.currie@haven.com
-- Data Scientist

create user emmacurrie
login_name = 'emma.currie@haven.com'
display_name = 'Emma Currie'
email = 'emma.currie@haven.com'
comment = 'Data Scientist'
default_role = haven_kpmg_analysis 
DEFAULT_WAREHOUSE = haven_kpmg_analysis_warehouse_xsmall;


USE ROLE securityadmin;

SHOW GRANTS TO ROLE haven_kpmg_analysis;
SHOW grants TO USER lucykearney;

grant usage, monitor on warehouse haven_kpmg_analysis_warehouse_xsmall to role _haven_kpmg_analysis_warehouse_xsmall__usage;
grant role _haven_kpmg_analysis_warehouse_xsmall__usage to role _haven_kpmg_analysis_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_kpmg_analysis_warehouse_xsmall to role _haven_kpmg_analysis_warehouse_xsmall__operator;

GRANT ROLE _haven_kpmg_analysis_warehouse_xsmall__usage TO ROLE haven_kpmg_analysis;

grant select on table haven_store.holiday.fct_holiday_bookings to role _haven_kpmg_analysis__haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_booking_status to role _haven_kpmg_analysis__haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_booking_source_channel to role _haven_kpmg_analysis__haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_booking_referral_source to role _haven_kpmg_analysis__haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_package_type to role _haven_kpmg_analysis__haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_grade to role _haven_kpmg_analysis__haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_payment_plan to role _haven_kpmg_analysis__haven_store__holiday__reader;
grant select on table haven_store.holiday.fct_holiday_addons to role _haven_kpmg_analysis__haven_store__holiday__reader;
grant select on table haven_base.seaware.res_guest to role _haven_kpmg_analysis__haven_base__seaware__reader;
grant select on table haven_base.seaware.client to role _haven_kpmg_analysis__haven_base__seaware__reader;
grant select on table haven_base.seaware.household_address to role _haven_kpmg_analysis__haven_base__seaware__reader;
grant select on table haven_store.caravans.fct_signup to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_sale_event to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_pitch_history to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_van_history to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_sale_status to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_sale_type_scd1 to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_owner_account_history to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_finance_company to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_holiday_home_advisor_scd1 to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_sale_source_scd1 to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.caravans.caravan_sale_completion to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.caravans.owner_detail to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant select on table haven_store.common.dim_park to role _haven_kpmg_analysis__haven_store__common__reader;
grant select on table haven_store.common.dim_calendar to role _haven_kpmg_analysis__haven_store__common__reader;
grant select on table haven_base.identity.hid_to_seaware_client to role _haven_kpmg_analysis__haven_base__identity__reader;
grant select on table haven_base.identity.hid_to_plot_owner to role _haven_kpmg_analysis__haven_base__identity__reader;
grant select on table haven_base.identity.hid_to_profile to role _haven_kpmg_analysis__haven_base__identity__reader;
grant select on table haven_base.identity.hid_to_email to role _haven_kpmg_analysis__haven_base__identity__reader;
grant select on table haven_base.amplitude.haven_guest_and_owners to role _haven_kpmg_analysis__haven_base__amplitude__reader;
grant select on table haven_base.bloomreach.event_campaign to role _haven_kpmg_analysis__haven_base__bloomreach__reader;
grant select on table haven_base.bloomreach.event_customer to role _haven_kpmg_analysis__haven_base__bloomreach__reader;
grant select on table haven_base.bloomreach.event_enquiry to role _haven_kpmg_analysis__haven_base__bloomreach__reader;
grant select on table haven_base.braintree.customer_address to role _haven_kpmg_analysis__haven_base__braintree__reader;
grant select on table haven_base.braintree.registered_customer to role _haven_kpmg_analysis__haven_base__braintree__reader;
grant select on table haven_base.braintree.transaction to role _haven_kpmg_analysis__haven_base__braintree__reader;
grant select on table haven_base.braintree.transactions to role _haven_kpmg_analysis__haven_base__braintree__reader;
grant select on table haven_base.braintree.unregistered_customer to role _haven_kpmg_analysis__haven_base__braintree__reader;
grant select on table haven_base.qualtrics.qualtrics_responses_sv_266o3uvz0vlancz to role _haven_kpmg_analysis__haven_base__qualtrics__reader;
grant select on table haven_base.qualtrics.qualtrics_responses_sv_6kznitncdvqnmdj to role _haven_kpmg_analysis__haven_base__qualtrics__reader;
grant select on table haven_base.qualtrics.qualtrics_responses_sv_b4a4lpsmhbxzftr to role _haven_kpmg_analysis__haven_base__qualtrics__reader;
grant select on table haven_base.qualtrics.qualtrics_responses_sv_dbv4mj8i6ufutxf to role _haven_kpmg_analysis__haven_base__qualtrics__reader;
grant select on table haven_base.qualtrics.qualtrics_responses_sv_edamu3bie0oel9h to role _haven_kpmg_analysis__haven_base__qualtrics__reader;
grant select on table haven_base.qualtrics.qualtrics_responses_sv_em60vfgtlwhmfth to role _haven_kpmg_analysis__haven_base__qualtrics__reader;
grant select on table haven_store.retail.fct_retail_sales to role _haven_kpmg_analysis__haven_store__retail__reader;
grant select on table haven_store.retail.dim_epos_venue to role _haven_kpmg_analysis__haven_store__retail__reader;
grant select on table haven_store.retail.dim_epos_product to role _haven_kpmg_analysis__haven_store__retail__reader;
grant select on table haven_store.retail.dim_owner_pass to role _haven_kpmg_analysis__haven_store__retail__reader;
grant select on table haven_store.common.dim_reporting_calendar to role _haven_kpmg_analysis__haven_store__common__reader;

grant role _haven_base__dig_activities__reader to role haven_kpmg_analysis;
grant role _haven_base__dig_bookings__reader to role haven_kpmg_analysis;
grant role _haven_base__dig_owners_arrivals__reader to role haven_kpmg_analysis;
grant role _haven_base__dig_fb_table_booking__reader to role haven_kpmg_analysis;

grant role _haven_kpmg_analysis__haven_store__holiday__reader to role haven_kpmg_analysis;
grant role _haven_kpmg_analysis__haven_store__caravans__reader to role haven_kpmg_analysis;
grant role _haven_kpmg_analysis__haven_store__retail__reader to role haven_kpmg_analysis;
grant role _haven_kpmg_analysis__haven_store__common__reader to role haven_kpmg_analysis;

grant role _haven_kpmg_analysis__haven_base__seaware__reader to role haven_kpmg_analysis;
grant role _haven_kpmg_analysis__haven_base__identity__reader to role haven_kpmg_analysis;
grant role _haven_kpmg_analysis__haven_base__amplitude__reader to role haven_kpmg_analysis;
grant role _haven_kpmg_analysis__haven_base__bloomreach__reader to role haven_kpmg_analysis;
grant role _haven_kpmg_analysis__haven_base__braintree__reader to role haven_kpmg_analysis;
grant role _haven_kpmg_analysis__haven_base__qualtrics__reader to role haven_kpmg_analysis;

GRANT ROLE haven_kpmg_analysis TO USER lucykearney;
GRANT ROLE haven_kpmg_analysis TO USER emmacurrie;
GRANT ROLE haven_kpmg_analysis TO role dba;
GRANT ROLE haven_kpmg_analysis TO USER donovanransome;

-- 06/11/2024

revoke role _haven_store__holiday__usage from role haven_kpmg_analysis;
revoke role _haven_store__caravans__reader from role haven_kpmg_analysis;
revoke role _haven_store__retail__reader from role haven_kpmg_analysis;
revoke role _haven_store__common__reader from role haven_kpmg_analysis;

revoke role _haven_base__seaware__reader from role haven_kpmg_analysis;
revoke role _haven_base__identity__reader from role haven_kpmg_analysis;
revoke role _haven_base__amplitude__reader from role haven_kpmg_analysis;
revoke role _haven_base__bloomreach__reader from role haven_kpmg_analysis;
revoke role _haven_base__braintree__reader from role haven_kpmg_analysis;
revoke role _haven_base__qualtrics__reader from role haven_kpmg_analysis;

grant role _haven_store__holiday__usage to role haven_kpmg_analysis;
grant role _haven_store__caravans__usage to role haven_kpmg_analysis;
grant role _haven_store__retail__usage to role haven_kpmg_analysis;
grant role _haven_store__common__usage to role haven_kpmg_analysis;

grant role _haven_base__seaware__usage to role haven_kpmg_analysis;
grant role _haven_base__identity__usage to role haven_kpmg_analysis;
grant role _haven_base__amplitude__usage to role haven_kpmg_analysis;
grant role _haven_base__bloomreach__usage to role haven_kpmg_analysis;
grant role _haven_base__braintree__usage to role haven_kpmg_analysis;
grant role _haven_base__qualtrics__usage to role haven_kpmg_analysis;

-- 13/11/2024

USE ROLE useradmin;

CREATE ROLE _haven_kpmg_analysis__haven_store_uat__prospects__reader;
CREATE ROLE _haven_kpmg_analysis__haven_store__survey__reader;
CREATE ROLE _haven_kpmg_analysis__haven_base__consent_and_preference__reader;

USE ROLE securityadmin;

revoke role _haven_store__holiday__usage from role haven_kpmg_analysis;
revoke role _haven_store__caravans__usage from role haven_kpmg_analysis;
revoke role _haven_store__retail__usage from role haven_kpmg_analysis;
revoke role _haven_store__common__usage from role haven_kpmg_analysis;

revoke role _haven_base__seaware__usage from role haven_kpmg_analysis;
revoke role _haven_base__identity__usage from role haven_kpmg_analysis;
revoke role _haven_base__amplitude__usage from role haven_kpmg_analysis;
revoke role _haven_base__bloomreach__usage from role haven_kpmg_analysis;
revoke role _haven_base__braintree__usage from role haven_kpmg_analysis;
revoke role _haven_base__qualtrics__usage from role haven_kpmg_analysis;


grant role _haven_store__holiday__usage to role _haven_kpmg_analysis__haven_store__holiday__reader;
grant role _haven_store__caravans__usage to role _haven_kpmg_analysis__haven_store__caravans__reader;
grant role _haven_store__retail__usage to role _haven_kpmg_analysis__haven_store__retail__reader;
grant role _haven_store__common__usage to role _haven_kpmg_analysis__haven_store__common__reader;

grant role _haven_base__seaware__usage to role _haven_kpmg_analysis__haven_base__seaware__reader;
grant role _haven_base__identity__usage to role _haven_kpmg_analysis__haven_base__identity__reader;
grant role _haven_base__amplitude__usage to role _haven_kpmg_analysis__haven_base__amplitude__reader;
grant role _haven_base__bloomreach__usage to role _haven_kpmg_analysis__haven_base__bloomreach__reader;
grant role _haven_base__braintree__usage to role _haven_kpmg_analysis__haven_base__braintree__reader;
grant role _haven_base__qualtrics__usage to role _haven_kpmg_analysis__haven_base__qualtrics__reader;


GRANT ROLE _haven_store_uat__prospects__usage TO ROLE _haven_kpmg_analysis__haven_store_uat__prospects__reader;
GRANT ROLE _haven_store__survey__usage TO ROLE _haven_kpmg_analysis__haven_store__survey__reader;
GRANT ROLE _haven_base__consent_and_preference__usage TO ROLE _haven_kpmg_analysis__haven_base__consent_and_preference__reader;

GRANT SELECT ON TABLE haven_store_uat.prospects.fct_caravan_sales_deals TO ROLE  _haven_kpmg_analysis__haven_store_uat__prospects__reader;
GRANT SELECT ON TABLE haven_store_uat.prospects.dim_caravan_sales_contacts TO ROLE _haven_kpmg_analysis__haven_store_uat__prospects__reader;
GRANT SELECT ON TABLE haven_store.survey.owners_leaver_survey TO ROLE _haven_kpmg_analysis__haven_store__survey__reader;
GRANT SELECT ON TABLE haven_store.survey.owners_survey_response TO ROLE _haven_kpmg_analysis__haven_store__survey__reader;
GRANT SELECT ON TABLE haven_store.survey.post_holiday_survey TO ROLE _haven_kpmg_analysis__haven_store__survey__reader;
GRANT SELECT ON TABLE haven_base.consent_and_preference.customertopic TO ROLE _haven_kpmg_analysis__haven_base__consent_and_preference__reader;
GRANT SELECT ON TABLE haven_base.consent_and_preference.customerchannel TO ROLE _haven_kpmg_analysis__haven_base__consent_and_preference__reader;
GRANT SELECT ON TABLE haven_store.caravans.park_distance TO ROLE _haven_kpmg_analysis__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.common.postcode_directory TO ROLE _haven_kpmg_analysis__haven_store__common__reader;

GRANT ROLE _haven_kpmg_analysis__haven_store_uat__prospects__reader TO ROLE haven_kpmg_analysis;
GRANT ROLE _haven_kpmg_analysis__haven_store__survey__reader TO ROLE haven_kpmg_analysis;
GRANT ROLE _haven_kpmg_analysis__haven_base__consent_and_preference__reader TO ROLE haven_kpmg_analysis;

-- 15/11/2024

USE ROLE useradmin;

CREATE ROLE _haven_kpmg_analysis__haven_base__plot__reader;

USE ROLE securityadmin;

GRANT ROLE _haven_base__plot__usage TO ROLE _haven_kpmg_analysis__haven_base__plot__reader;
GRANT SELECT ON haven_base.plot.ACCOUNTS TO ROLE _haven_kpmg_analysis__haven_base__plot__reader;
GRANT SELECT ON haven_base.plot.OWNERS TO ROLE _haven_kpmg_analysis__haven_base__plot__reader;

REVOKE SELECT ON haven_base.plot.OWNERS FROM ROLE _haven_kpmg_analysis__haven_base__plot__reader;

GRANT ROLE _haven_kpmg_analysis__haven_base__plot__reader TO ROLE haven_kpmg_analysis;

REVOKE ROLE _haven_kpmg_analysis__haven_store_uat__prospects__reader FROM ROLE haven_kpmg_analysis;

-- 19/11/2024

USE ROLE securityadmin;

REVOKE SELECT ON haven_base.plot.OWNERS FROM ROLE _haven_kpmg_analysis__haven_base__plot__reader;

GRANT SELECT ON haven_base.plot.OWNERS TO ROLE _haven_kpmg_analysis__haven_base__plot__reader;
GRANT SELECT ON haven_base.plot.OWNERS_AUDIT TO ROLE _haven_kpmg_analysis__haven_base__plot__reader;

USE ROLE haven_kpmg_analysis;

SHOW WAREHOUSES;

USE WAREHOUSE HAVEN_KPMG_ANALYSIS_WAREHOUSE_XSMALL;
SELECT * FROM HAVEN_BASE.PLOT.OWNERS LIMIT 20;
SELECT * FROM HAVEN_BASE.PLOT.OWNERS_AUDIT LIMIT 20;

USE ROLE useradmin;

DROP ROLE _haven_kpmg_analysis__haven_store_uat__prospects__reader;

USE ROLE securityadmin;

GRANT ROLE _haven_store__kpmg_uat__reader TO ROLE haven_kpmg_analysis;

USE ROLE dba;

USE SCHEMA haven_store.kpmg_uat;

CREATE VIEW haven_store.kpmg_uat.DIM_CARAVAN_SALES_CONTACTS
( FLAG_EMAIL_FIRST_DATETIME, FLAG_EMAIL_LAST_DATETIME, FLAG_FRESHSALES_LAST_DATETIME, FLAG_DUPLICATE_WEB_SOURCE_UIDS, TIERED_ID, EMAIL, 
FRESHSALES_CONTACT_ID, PLOT_OWNER_ID, ANALYTICS_ID, WEB_SOURCE_UID, CREATED_DATETIME, DATA_SOURCE, APPOINTMENT_TYPE, ENQUIRY_BUCKET, 
TEMP__SOURCE_SUB_CODE, TEMP___REFERER, TEMP___TYPE, TEMP___SOURCE_DESCRIPTION, TEMP___SOURCE_SUB_DESCRIPTION, TEMP___SOURCE_SUB_CODE, 
TEMP___CF_EQUALIZER_SUB_SOURCE, TEMP___CF_EQUALIZER_SOURCE, TEMP___CF_PARK_SOURCE, TEMP___LEAD_SOURCE_NAME )
AS SELECT FLAG_EMAIL_FIRST_DATETIME, FLAG_EMAIL_LAST_DATETIME, FLAG_FRESHSALES_LAST_DATETIME, FLAG_DUPLICATE_WEB_SOURCE_UIDS, TIERED_ID, EMAIL, FRESHSALES_CONTACT_ID, PLOT_OWNER_ID, ANALYTICS_ID, WEB_SOURCE_UID, CREATED_DATETIME, DATA_SOURCE, APPOINTMENT_TYPE, ENQUIRY_BUCKET, TEMP__SOURCE_SUB_CODE, TEMP___REFERER, TEMP___TYPE, TEMP___SOURCE_DESCRIPTION, TEMP___SOURCE_SUB_DESCRIPTION, TEMP___SOURCE_SUB_CODE, TEMP___CF_EQUALIZER_SUB_SOURCE, TEMP___CF_EQUALIZER_SOURCE, TEMP___CF_PARK_SOURCE, TEMP___LEAD_SOURCE_NAME
FROM HAVEN_STORE_UAT.PROSPECTS.DIM_CARAVAN_SALES_CONTACTS;

CREATE VIEW haven_store.kpmg_uat.FCT_CARAVAN_SALES_DEALS
( TIERED_ID, EMAIL, FRESHSALES_CONTACT_ID, FRESHSALES_DEAL_ID, PLOT_OWNER_ID, PLOT_PROSPECT_DETAIL_ID, FACEBOOK_LEAD_ID, ANALYTICS_ID, 
FRESHSALES_DEAL_PIPELINE_ID, FRESHSALES_DEAL_STAGE_ID, CREATED_DATETIME, PARK_ID, PARK_CODE, DATE_OF_APPOINTMENT_MADE, DATE_OF_APPOINTMENT_SCHEDULED, 
DATE_OF_SIGNUP, APPOINTMENT_SHOW_YN, APPOINTMENT_OUTCOME, FLAG_SIGNUP_YN, FLAG_RECORD_DEDUPS_ORDER, FLAG_COUNT_AS_WEB_FORM_COMPLETE_YN, FLAG_COUNT_AS_ENQUIRY_YN, FLAG_ACTIVE_LAST_TWO_YEARS_YN )
AS SELECT TIERED_ID, EMAIL, FRESHSALES_CONTACT_ID, FRESHSALES_DEAL_ID, PLOT_OWNER_ID, PLOT_PROSPECT_DETAIL_ID, FACEBOOK_LEAD_ID, ANALYTICS_ID, FRESHSALES_DEAL_PIPELINE_ID, FRESHSALES_DEAL_STAGE_ID, CREATED_DATETIME, PARK_ID, PARK_CODE, DATE_OF_APPOINTMENT_MADE, DATE_OF_APPOINTMENT_SCHEDULED, DATE_OF_SIGNUP, APPOINTMENT_SHOW_YN, APPOINTMENT_OUTCOME, FLAG_SIGNUP_YN, FLAG_RECORD_DEDUPS_ORDER, FLAG_COUNT_AS_WEB_FORM_COMPLETE_YN, FLAG_COUNT_AS_ENQUIRY_YN, FLAG_ACTIVE_LAST_TWO_YEARS_YN
FROM HAVEN_STORE_UAT.PROSPECTS.FCT_CARAVAN_SALES_DEALS;

USE ROLE securityadmin;

SHOW GRANTS TO ROLE _haven_kpmg_analysis__haven_base__seaware__reader;

GRANT SELECT ON VIEW haven_base.seaware.VCS_LOG_FIELD TO ROLE _haven_kpmg_analysis__haven_base__seaware__reader;
GRANT SELECT ON VIEW haven_base.seaware.VCS_LOG_RECORD TO ROLE _haven_kpmg_analysis__haven_base__seaware__reader;

-- 21/11/2024

USE ROLE useradmin;

-- Mark Breen
-- mark.breen@bourne-leisure.co.uk
-- Data Scientist

create USER MarkBreen 
login_name = 'mark.breen@bourne-leisure.co.uk'
display_name = 'Mark Breen'
email = 'mark.breen@bourne-leisure.co.uk'
comment = 'Data Scientist'
default_role =  haven_kpmg_analysis
DEFAULT_WAREHOUSE = haven_kpmg_analysis_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_kpmg_analysis TO USER MarkBreen;

-- 22/11/2024

USE ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.caravans.leavers TO ROLE _haven_kpmg_analysis__haven_store__caravans__reader;
GRANT SELECT ON TABLE haven_store.caravans.OWNERS_POINT_IN_TIME TO ROLE _haven_kpmg_analysis__haven_store__caravans__reader;

-- 28/11/2024

USE ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.prospects.fct_caravan_sales_deals TO ROLE _haven_kpmg_analysis__haven_store_uat__prospects__reader; 
GRANT SELECT ON TABLE haven_store.prospects.dim_caravan_sales_contacts TO ROLE _haven_kpmg_analysis__haven_store_uat__prospects__reader;

-- 29/11/2024

USE ROLE useradmin;

CREATE ROLE _haven_kpmg_analysis__haven_store__prospects__reader;


USE ROLE securityadmin;

GRANT ROLE _haven_store__ma_mart__reader TO ROLE haven_kpmg_analysis;
GRANT ROLE _haven_store__prospects__usage TO ROLE _haven_kpmg_analysis__haven_store__prospects__reader;
GRANT SELECT ON TABLE haven_store.prospects.fct_caravan_sales_deals TO ROLE _haven_kpmg_analysis__haven_store__prospects__reader; 
GRANT SELECT ON TABLE haven_store.prospects.dim_caravan_sales_contacts TO ROLE _haven_kpmg_analysis__haven_store__prospects__reader;

GRANT ROLE _haven_kpmg_analysis__haven_store__prospects__reader TO ROLE haven_kpmg_analysis; 

-- 04/12/2024

USE ROLE sysadmin;

CREATE OR REPLACE WAREHOUSE  haven_kpmg_analysis_snowpark_warehouse_medium 
WITH
  WAREHOUSE_SIZE = 'MEDIUM'
  WAREHOUSE_TYPE = 'SNOWPARK-OPTIMIZED';
  AUTO_SUSPEND = 60 
  AUTO_RESUME = TRUE 
  MIN_CLUSTER_COUNT = 1 
  MAX_CLUSTER_COUNT = 1 
  SCALING_POLICY = 'STANDARD';

USE ROLE useradmin;

drop role _haven_kpmg_analysis_snowpark_warehouse_xsmall__operator;
drop role _haven_kpmg_analysis_snowpark_warehouse_xsmall__usage;

create role _haven_kpmg_analysis_snowpark_warehouse_medium__operator;
create role _haven_kpmg_analysis_snowpark_warehouse_medium__usage;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_kpmg_analysis_snowpark_warehouse_medium to role _haven_kpmg_analysis_snowpark_warehouse_medium__usage;
grant role _haven_kpmg_analysis_snowpark_warehouse_medium__usage to role _haven_kpmg_analysis_snowpark_warehouse_medium__operator;
grant operate, modify on warehouse haven_kpmg_analysis_snowpark_warehouse_medium to role _haven_kpmg_analysis_snowpark_warehouse_medium__operator;

GRANT ROLE _haven_kpmg_analysis_snowpark_warehouse_medium__usage TO ROLE haven_kpmg_analysis;

USE ROLE haven_kpmg_analysis;

SHOW WAREHOUSES;

-- 21/01/2025

USE ROLE dba;
USE WAREHOUSE dba_wh;
USE SCHEMA haven_store.kpmg_uat;

CREATE VIEW HAVEN_STORE.KPMG_UAT.FCT_HOLIDAY_BOOKINGS
( SNAPSHOT_DATE, BOOKING_HEADER_ID, BOOKING_ID, GROUP_ID, BOOKING_TYPE, SEASON, SOURCE_CODE, BOOKING_STATUS_XID, BOOKING_SOURCE_CHANNEL_XID, BOOKING_REFERRAL_SOURCE_XID, PITCH_HISTORY_XID, PARK_XID, PACKAGE_TYPE_XID, ALLOCATED_GRADE_XID, PAID_GRADE_XID, REQUESTED_GRADE_XID, PAYMENT_PLAN_XID, BOOKING_DATE_XID, ARRIVAL_DATE_XID, DEPARTURE_DATE_XID, CANCELLATION_DATE_XID, TOTAL_GUESTS, ADULTS, CHILDREN, INFANTS, VAN_ALLOCATION_TYPE, ARRIVAL_TIMESLOT, ARRIVAL_TIMESLOT_TYPE, FANDB_VOUCHER_AMOUNT, FANDB_VOUCHER_PAID_AMOUNT, BROCHURE_PRICE, TOTAL_ACCOMMODATION_VALUE, TOTAL_DEPOSIT_VALUE, TOTAL_DISCOUNT_VALUE, TOTAL_ADDON_VALUE, TOTAL_CHARGE_VALUE, TOTAL_PAID_VALUE, GROSS_BILLING_VALUE, TOTAL_COMMISSION_VALUE, NETT_BILLING_VALUE, PRE_CANCELLATION_BROCHURE_PRICE, PRE_CANCELLATION_TOTAL_ACCOMMODATION_VALUE, PRE_CANCELLATION_TOTAL_DEPOSIT_VALUE, PRE_CANCELLATION_TOTAL_DISCOUNT_VALUE, PRE_CANCELLATION_TOTAL_ADDON_VALUE, PRE_CANCELLATION_TOTAL_CHARGE_VALUE, PRE_CANCELLATION_TOTAL_PAID_VALUE, PRE_CANCELLATION_GROSS_BILLING_VALUE, PRE_CANCELLATION_TOTAL_COMMISSION_VALUE, PRE_CANCELLATION_NETT_BILLING_VALUE, TOTAL_DELEGATE_CHARGE_VALUE, IS_FULLY_PAID )
AS SELECT SNAPSHOT_DATE, BOOKING_HEADER_ID, BOOKING_ID, GROUP_ID, BOOKING_TYPE, SEASON, SOURCE_CODE, BOOKING_STATUS_XID, BOOKING_SOURCE_CHANNEL_XID, BOOKING_REFERRAL_SOURCE_XID, PITCH_HISTORY_XID, PARK_XID, PACKAGE_TYPE_XID, ALLOCATED_GRADE_XID, PAID_GRADE_XID, REQUESTED_GRADE_XID, PAYMENT_PLAN_XID, BOOKING_DATE_XID, ARRIVAL_DATE_XID, DEPARTURE_DATE_XID, CANCELLATION_DATE_XID, TOTAL_GUESTS, ADULTS, CHILDREN, INFANTS, VAN_ALLOCATION_TYPE, ARRIVAL_TIMESLOT, ARRIVAL_TIMESLOT_TYPE, FANDB_VOUCHER_AMOUNT, FANDB_VOUCHER_PAID_AMOUNT, BROCHURE_PRICE, TOTAL_ACCOMMODATION_VALUE, TOTAL_DEPOSIT_VALUE, TOTAL_DISCOUNT_VALUE, TOTAL_ADDON_VALUE, TOTAL_CHARGE_VALUE, TOTAL_PAID_VALUE, GROSS_BILLING_VALUE, TOTAL_COMMISSION_VALUE, NETT_BILLING_VALUE, PRE_CANCELLATION_BROCHURE_PRICE, PRE_CANCELLATION_TOTAL_ACCOMMODATION_VALUE, PRE_CANCELLATION_TOTAL_DEPOSIT_VALUE, PRE_CANCELLATION_TOTAL_DISCOUNT_VALUE, PRE_CANCELLATION_TOTAL_ADDON_VALUE, PRE_CANCELLATION_TOTAL_CHARGE_VALUE, PRE_CANCELLATION_TOTAL_PAID_VALUE, PRE_CANCELLATION_GROSS_BILLING_VALUE, PRE_CANCELLATION_TOTAL_COMMISSION_VALUE, PRE_CANCELLATION_NETT_BILLING_VALUE, TOTAL_DELEGATE_CHARGE_VALUE, IS_FULLY_PAID
FROM HAVEN_STORE_UAT.HOLIDAY.FCT_HOLIDAY_BOOKINGS;

USE ROLE haven_kpmg_analysis;

SHOW WAREHOUSES;

USE WAREHOUSE HAVEN_KPMG_ANALYSIS_WAREHOUSE_XSMALL;

SELECT * FROM HAVEN_STORE.KPMG_UAT.FCT_HOLIDAY_BOOKINGS LIMIT 10;

-- 22/01/2024

USE ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.prospects.fct_caravan_sales_deals TO ROLE _haven_kpmg_analysis__haven_store__prospects__reader; 
GRANT SELECT ON TABLE haven_store.prospects.dim_caravan_sales_contacts TO ROLE _haven_kpmg_analysis__haven_store__prospects__reader;


-- 23/01/2024

USE ROLE dba;

USE SCHEMA haven_store.prospects;

SHOW TABLES;

USE ROLE securityadmin;


GRANT SELECT ON TABLE haven_store.prospects.fct_caravan_sales_deals TO ROLE _haven_kpmg_analysis__haven_store__prospects__reader; 
GRANT SELECT ON TABLE haven_store.prospects.dim_caravan_sales_contacts TO ROLE _haven_kpmg_analysis__haven_store__prospects__reader;


-- 24/01/2024

USE ROLE dba;

USE SCHEMA haven_store.prospects;

SHOW TABLES;

USE ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.prospects.fct_caravan_sales_deals TO ROLE _haven_kpmg_analysis__haven_store__prospects__reader; 
GRANT SELECT ON TABLE haven_store.prospects.dim_caravan_sales_contacts TO ROLE _haven_kpmg_analysis__haven_store__prospects__reader;

USE ROLE haven_kpmg_analysis;


-- 27/01/2024

USE ROLE dba;

USE SCHEMA haven_store.prospects;

SHOW TABLES;

USE ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.prospects.fct_caravan_sales_deals TO ROLE _haven_kpmg_analysis__haven_store__prospects__reader; 
GRANT SELECT ON TABLE haven_store.prospects.dim_caravan_sales_contacts TO ROLE _haven_kpmg_analysis__haven_store__prospects__reader;

USE ROLE haven_kpmg_analysis;

SHOW TABLES;


-- 
--  
-- 





create USER  
login_name = ''
display_name = ''
email = ''
comment = ''
default_role =  haven_kpmg_analysis
DEFAULT_WAREHOUSE = haven_kpmg_analysis_warehouse_xsmall;

USE ROLE securityadmin;

GRANT ROLE haven_kpmg_analysis TO USER 