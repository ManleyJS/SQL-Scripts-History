USE ROLE sysadmin;

CREATE WAREHOUSE haven_holidays_restricted_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

CREATE DATABASE haven_holidays_restricted;

USE ROLE useradmin;

create role haven_holidays_restricted;

create OR REPLACE role _haven_holidays_restricted_warehouse_xsmall__operator;
create OR REPLACE role _haven_holidays_restricted_warehouse_xsmall__usage;

CREATE ROLE _haven_holidays_restricted__usage;
CREATE ROLE _haven_holidays_restricted__schema;

CREATE ROLE _haven_holidays_restricted__haven_base__seaware__reader;

USE ROLE securityadmin;

grant usage, monitor on warehouse haven_holidays_restricted_warehouse_xsmall to role _haven_holidays_restricted_warehouse_xsmall__usage;
grant role _haven_holidays_restricted_warehouse_xsmall__usage to role _haven_holidays_restricted_warehouse_xsmall__operator;
grant operate, modify on warehouse haven_holidays_restricted_warehouse_xsmall to role _haven_holidays_restricted_warehouse_xsmall__operator;

GRANT role _haven_holidays_restricted_warehouse_xsmall__usage TO ROLE haven_holidays_restricted;
GRANT ROLE haven_holidays_restricted TO ROLE DBA;


GRANT USAGE ON DATABASE haven_holidays_restricted TO ROLE _haven_holidays_restricted__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_holidays_restricted TO ROLE _haven_holidays_restricted__usage;
GRANT SELECT ON future TABLES IN DATABASE haven_holidays_restricted TO ROLE _haven_holidays_restricted__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_holidays_restricted TO ROLE _haven_holidays_restricted__usage;
GRANT SELECT ON future MATERIALIZED VIEWS IN DATABASE haven_holidays_restricted TO ROLE _haven_holidays_restricted__usage;
GRANT USAGE ON future STAGES IN DATABASE haven_holidays_restricted TO ROLE _haven_holidays_restricted__usage;
GRANT USAGE ON future FILE FORMATS IN DATABASE haven_holidays_restricted TO ROLE _haven_holidays_restricted__usage;
GRANT ROLE _haven_holidays_restricted__usage TO ROLE _haven_holidays_restricted__schema;
GRANT CREATE SCHEMA ON DATABASE haven_holidays_restricted TO ROLE _haven_holidays_restricted__schema;

GRANT ROLE _haven_base__seaware__usage TO ROLE _haven_holidays_restricted__haven_base__seaware__reader;
GRANT SELECT ON TABLE haven_base.seaware.res_hist_trans TO ROLE _haven_holidays_restricted__haven_base__seaware__reader;
GRANT SELECT ON TABLE haven_base.seaware.res_header TO ROLE _haven_holidays_restricted__haven_base__seaware__reader;
GRANT SELECT ON TABLE haven_base.seaware.user_login TO ROLE _haven_holidays_restricted__haven_base__seaware__reader;
GRANT SELECT ON TABLE haven_base.seaware.res_guest TO ROLE _haven_holidays_restricted__haven_base__seaware__reader;
GRANT SELECT ON TABLE haven_base.seaware.client TO ROLE _haven_holidays_restricted__haven_base__seaware__reader;


GRANT ROLE _haven_holidays_restricted__haven_base__seaware__reader TO ROLE haven_holidays_restricted;
GRANT ROLE _haven_holidays_restricted__schema TO ROLE haven_holidays_restricted;

GRANT ROLE haven_holidays_restricted TO ROLE dba;
GRANT ROLE haven_holidays_restricted TO USER donovanransome;
GRANT ROLE haven_holidays_restricted TO USER davidparsons;

-- 02/12/2024

USE ROLE useradmin;

CREATE ROLE haven_holidays_restricted_davidparsons;

USE ROLE securityadmin;

REVOKE ROLE haven_holidays_restricted FROM USER davidparsons;
REVOKE ROLE _haven_holidays_restricted__schema FROM ROLE haven_holidays_restricted;


GRANT ROLE _haven_holidays_restricted__usage to ROLE haven_holidays_restricted;


GRANT ROLE _haven_holidays_restricted__schema to ROLE haven_holidays_restricted_davidparsons;
GRANT ROLE haven_holidays_restricted TO ROLE haven_holidays_restricted_davidparsons;

GRANT ROLE haven_holidays_restricted_davidparsons TO USER davidparsons;

SHOW GRANTS TO USER davidparsons;

SHOW GRANTS TO ROLE HAVEN_HOLIDAYS_RESTRICTED_DAVIDPARSONS;

show GRANTS TO ROLE HAVEN_HOLIDAYS_RESTRICTED;

SHOW GRANTS TO ROLE _HAVEN_HOLIDAYS_RESTRICTED__HAVEN_BASE__SEAWARE__READER;

USE ROLE useradmin;

CREATE ROLE _haven_holidays_restricted__haven_base__mariner__reader;

USE ROLE securityadmin;

GRANT ROLE _haven_holidays_restricted__haven_base__mariner__reader TO ROLE haven_holidays_restricted;

grant select on view haven_base.mariner.email_change_history to role _haven_holidays_restricted__haven_base__mariner__reader;
grant select on view haven_base.mariner.v_group_agency_trans to role _haven_holidays_restricted__haven_base__mariner__reader;
grant select on view haven_base.seaware.acc_trans_detail to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.acc_trans_history to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.acc_trans_type to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.agency to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.atd_pr_grp to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.atd_pr_res to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.cc_auto_payments_dtl to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.cc_auto_payments_hdr to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.cc_client to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.cc_pending_trans to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.cc_trans_status to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.client to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.fax_queue to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.group_booking to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.group_invoice_item to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.gtb_request to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.household_address to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.household_phone to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.office_location to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_addon to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_addon_code to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_commission_detail to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_event to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_guest to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_header to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_hist_trans to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_inv_total to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_invoice_item to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_status to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.rv_all_acc_trans to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.rv_statement_agen_bank to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.ship to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.user_login to role _haven_holidays_restricted__haven_base__seaware__reader;



grant select on view haven_base.mariner.v_group_agency_trans to role _haven_holidays_restricted__haven_base__mariner__reader;
grant select on view haven_base.seaware.atd_pr_grp to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.atd_pr_res to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.cc_trans_status to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_addon_code to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.res_inv_total to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.rv_all_acc_trans to role _haven_holidays_restricted__haven_base__seaware__reader;
grant select on view haven_base.seaware.rv_statement_agen_bank to role _haven_holidays_restricted__haven_base__seaware__reader;
