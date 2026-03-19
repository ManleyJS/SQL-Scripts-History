-- All DEAD source schemas

-- aac_onparkwifi_public (added 18/09/2024)
-- acceptanceofrisk_public
-- activities_bookings_public
-- activities_capacity_public
-- activities_payments_audit
-- activities_payments_public
-- activities_playpass_public
-- activities_pricing_public 
-- activities_service_public
-- arrivals_holiday_bookings_public
-- arrivals_public
-- arrivals_transportations_public
-- fb_eagleeye_public
-- fb_entertainment_public (entertainment and schedule - added 18/09/2024)
-- fb_table_booking_public
-- owners_arrivals_public

-- All Identity source schema

-- found_contact_prefs_public
-- found_hid_public



-- 18/09/2024 
-- DIGITAL OWNER ARRIVALS

USE ROLE dba;

CREATE VIEW  HAVEN_BASE.DIG_OWNERS_ARRIVALS.CLAIM
( ID, SHORTCODE, HID, ISLEADGUEST, ISCLAIMED, CREATEDAT, UPDATEDAT, DELETEDAT )
AS SELECT ID, SHORTCODE, HID, ISLEADGUEST, ISCLAIMED, CREATEDAT, UPDATEDAT, DELETEDAT
FROM HAVEN_RAW.DIG_OWNERS_ARRIVALS.CLAIM;


-- 18/09/2024 New DEAD schema to review
-- activities_favourites_public (not now as data does not appear useful)
-- arrivals_park_areas_public (not sure as this appears to be static data)
-- arrivals_transportations_drizzle (not now as data does not appear useful)
-- dmscontrol (AWS DMS metadata)
-- fb_entertainment_import (empty schema)
-- fb_experience_admin_auth_public (metadata about permissions)
-- public (Postgres default schema)
-- team_venue_disruption_drizzle (not now as data does not appear useful)
-- team_venue_disruption_public (not now as data does not appear useful)

-- Extended datatype <<_uuid>> in column 'events' of table 'schedule_session' in capture location 'havendigprd' 
-- encountered without parameter CaptureExpression to map it to a type which Fivetran supports directly. 
-- For more information please refer to the documentation page 'Extended Data Type Support'.


-- F_JR0557 Extended datatype <<_uuid>> in column 'events' of table 'schedule_session' in capture location 'havendigprd' encountered without parameter CaptureExpression to map it to a type which Fivetran supports directly. For more information please refer to the documentation page 'Extended Data Type Support'.
