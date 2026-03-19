use role sysadmin;

CREATE WAREHOUSE haven_performance_marketing_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';


use role useradmin;

create role _haven_performance_marketing_warehouse_xsmall__operator;
create role _haven_performance_marketing_warehouse_xsmall__usage;

create role haven_performance_marketing;

-- Natalia Mutanova
-- natalia.mutanova@haven.com
-- Media Planning Lead

alter user NataliaMutanova
set default_role = haven_performance_marketing,
DEFAULT_WAREHOUSE = haven_performance_marketing_warehouse_xsmall;

create user haven_performance_marketing_sigma_service_account
LOGIN_NAME = 'haven.performance.marketing.sigma.service._account'
default_warehouse = haven_performance_marketing_warehouse_xsmall
default_role = haven_performance_marketing
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6YSK1NH/rwokczjHLRGb
sQyK6sClMYE1h+sAa2pkgIj217UYyxmmpVcKDxKUrAoCXDi4sLzMjkV3oAoRZqGQ
dZl3xDP9vqwWHO9YrDcnBR+ZOSBaXqmLt3Vy6DkMVhP8qu9lNqNsB094hbn10X+3
vMLpvJy3MByqUGlS1kH4ANTO7ppibqhRX9MoHeh/ilqT7Cht/sW32P2FZigEJGjp
9oc7Iq5I3DcKRJzJV4phAoL1GiTzSpfVq+DwQ9IBan+z3CuEee3/r4YRthvQfo2r
gk78AGQqCUOB2y3zwTV9ElDVTPLTBcnzJ8m21FCOhnB35+YE0hvPP1ZGiy1U1yMa
SwIDAQAB';


create role _haven_performance_marketing_haven_store__holiday__reader;
create role _haven_performance_marketing_haven_base__seaware__reader;
create role _haven_performance_marketing_haven_store__caravans__reader;
create role _haven_performance_marketing_haven_store__common__reader;
create role _haven_performance_marketing_haven_base__identity__reader;
create role _haven_performance_marketing_haven_base__bloomreach__reader;

use role securityadmin;

grant select on table haven_store.holiday.fct_holiday_bookings to role _haven_performance_marketing_haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_booking_status to role _haven_performance_marketing_haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_booking_source_channel to role _haven_performance_marketing_haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_booking_referral_source to role _haven_performance_marketing_haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_package_type to role _haven_performance_marketing_haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_grade to role _haven_performance_marketing_haven_store__holiday__reader;
grant select on table haven_store.holiday.dim_payment_plan to role _haven_performance_marketing_haven_store__holiday__reader;
grant select on table haven_store.holiday.fct_holiday_addons to role _haven_performance_marketing_haven_store__holiday__reader;
grant select on table haven_base.seaware.res_guest to role _haven_performance_marketing_haven_base__seaware__reader;
grant select on table haven_store.caravans.fct_signup to role _haven_performance_marketing_haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_sale_event to role _haven_performance_marketing_haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_pitch_history to role _haven_performance_marketing_haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_van_history to role _haven_performance_marketing_haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_sale_status to role _haven_performance_marketing_haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_sale_type_scd1 to role _haven_performance_marketing_haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_owner_account_history to role _haven_performance_marketing_haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_finance_company to role _haven_performance_marketing_haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_holiday_home_advisor_scd1 to role _haven_performance_marketing_haven_store__caravans__reader;
grant select on table haven_store.caravans.dim_sale_source_scd1 to role _haven_performance_marketing_haven_store__caravans__reader;
grant select on table haven_store.caravans.caravan_sale_completion to role _haven_performance_marketing_haven_store__caravans__reader;
grant select on table haven_store.common.dim_park to role _haven_performance_marketing_haven_store__common__reader;
grant select on table haven_store.common.dim_calendar to role _haven_performance_marketing_haven_store__common__reader;
grant select on table haven_base.identity.hid_to_seaware_client to role _haven_performance_marketing_haven_base__identity__reader;
grant select on table haven_base.identity.hid_to_plot_owner to role _haven_performance_marketing_haven_base__identity__reader;

GRANT SELECT ON TABLE haven_base.bloomreach.event_campaign TO ROLE _haven_performance_marketing_haven_base__bloomreach__reader;
GRANT SELECT ON TABLE haven_base.bloomreach.event_enquiry TO ROLE _haven_performance_marketing_haven_base__bloomreach__reader;

grant role _haven_store__holiday__usage to role     _haven_performance_marketing_haven_store__holiday__reader;
grant role _haven_base__seaware__usage  to role     _haven_performance_marketing_haven_base__seaware__reader;
grant role _haven_store__caravans__usage to role     _haven_performance_marketing_haven_store__caravans__reader;
grant role _haven_store__common__usage  to role     _haven_performance_marketing_haven_store__common__reader;
grant role _haven_base__identity__usage to role     _haven_performance_marketing_haven_base__identity__reader;
grant role _haven_base__bloomreach__usage to role     _haven_performance_marketing_haven_base__identity__reader;


grant role _haven_store__performance_marketing__reader	to role haven_performance_marketing;
grant role _haven_store_uat__performance_marketing__reader to role haven_performance_marketing;
grant role _haven_performance_marketing_haven_store__holiday__reader to role haven_performance_marketing;
grant role _haven_performance_marketing_haven_base__seaware__reader to role haven_performance_marketing;
grant role _haven_performance_marketing_haven_store__caravans__reader to role haven_performance_marketing;
grant role _haven_performance_marketing_haven_store__common__reader to role haven_performance_marketing;
grant role _haven_performance_marketing_haven_base__identity__reader to role haven_performance_marketing;
GRANT ROLE _haven_performance_marketing_haven_base__bloomreach__reader TO ROLE haven_performance_marketing;


grant usage, monitor on warehouse haven_performance_marketing_warehouse_xsmall to role _haven_performance_marketing_warehouse_xsmall__usage;
grant role _haven_performance_marketing_warehouse_xsmall__usage to role _haven_performance_marketing_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_performance_marketing_warehouse_xsmall to role _haven_performance_marketing_warehouse_xsmall__operator;


GRANT ROLE _haven_performance_marketing_warehouse_xsmall__usage TO ROLE haven_performance_marketing;

GRANT ROLE haven_performance_marketing TO USER NataliaMutanova;

GRANT ROLE haven_performance_marketing TO ROLE dba;

GRANT ROLE haven_performance_marketing TO USER haven_performance_marketing_sigma_service_account;

REVOKE role _haven_store_uat__performance_marketing__reader from role haven_performance_marketing;

GRANT ROLE haven_performance_marketing TO USER donovanransome;

-- 01/10/2025

use ROLE dba;

SHOW GRANTS TO ROLE haven_performance_marketing;

use ROLE securityadmin;

GRANT ROLE _haven_store_qat__performance_marketing__reader TO ROLE haven_performance_marketing;

SHOW GRANTS TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_BASE__IDENTITY__READER;

GRANT SELECT on haven_base.IDENTITY.hid_to_seaware_client TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_BASE__IDENTITY__READER;
GRANT SELECT on haven_base.IDENTITY.hid_to_plot_owner TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_BASE__IDENTITY__READER;

SHOW GRANTS TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_BASE__IDENTITY__READER;

SHOW GRANTS TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;

GRANT SELECT ON TABLE haven_store.caravans.dim_owner_account_type TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_charge_type TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_letting_contract_type TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_pitch_grade_scd1 TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_pitch_scd1 TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_pitch_status TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_van_attributes_type TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.dim_van_order_details TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_account_history TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_pitch_charges TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_pitch_status TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_pitch_utilities TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_sale_invoice TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_van_attributes TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
GRANT SELECT ON TABLE haven_store.caravans.fct_van_history TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;

SHOW GRANTS TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;

-- correct table name

use ROLE securityadmin;

GRANT SELECT ON TABLE haven_store.caravans.dim_account_owner_type TO ROLE _HAVEN_PERFORMANCE_MARKETING_HAVEN_STORE__CARAVANS__READER;
