use role useradmin;

create USER aa_batch_service_account
LOGIN_NAME = aa.batch.service.account
email = 'sdee@align-alytics.com'
display_name = 'AA Batch Service Account'
comment = 'AA Batch Service Account'
password = '3cw1651f6pMMSgil'
default_warehouse = alignalytics_pricing_data_warehouse
default_role = haven_revenue_management_pricer
must_change_password = true;

create USER aa_analytics_service_account
LOGIN_NAME = aa.analytics.service.account
email = 'sdee@align-alytics.com'
display_name = 'AA Analytics Service Account'
comment = 'AA Analytics Service Account'
password = 'Y4Wm9ZXNOrebef52'
default_warehouse = alignalytics_pricing_data_warehouse
default_role = haven_revenue_management_pricer
must_change_password = true;

USE ROLE securityadmin;

GRANT ROLE haven_revenue_management_pricer TO USER aa_batch_service_account;
GRANT ROLE haven_revenue_management_pricer TO USER aa_analytics_service_account;

-- 17/09/2025
-- add test AA service account

use ROLE useradmin;

create OR replace USER aa_analytics_dev_service_account
LOGIN_NAME = 'aa.analytics.dev.service.account'
email = 'sdee@align-alytics.com'
display_name = 'AA Analytics Development Service Account'
comment = 'AA Analytics Development Service Account'
default_warehouse = alignalytics_pricing_data_warehouse
default_role = HAVEN_REVENUE_MANAGEMENT_PRICER_VALIDATION
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn8lAE51J9a25y0lM/2B8
uvBAdPCLCvFRLTdjV3JTDEgvL0gn/0qGmKEWKYl46mkUqV9QMdQXOMdO1rIiFW98
p0D8A0CjgBcFKjBuu6kwmpUolz5yjTrX1f2kt/bwEsAXikflE/rHCpMrr7JKnP1M
v3coIrnXBnhuyV1ILcVESYfMu/dgJ1PfKEPBzYFvgz5aQnFMJG6mRxT4aJjpctba
SwJwRkclXc0MBxquz3ks8P0gscpx22ztBiLxqDRzCa82dY7R2RrC2XDDP1XjDdh8
HhpGx491Ltdy9uux4vUa+qD61E3Ozr/ME07+uFZ2jWqNgIIpssoyMc7XMzx7+G44
dwIDAQAB'
;

alter USER aa_analytics_dev_service_account
SET LOGIN_NAME = 'aa.analytics.dev.service.account';


USE ROLE securityadmin;

GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER_VALIDATION TO USER aa_analytics_dev_service_account;
GRANT ROLE HAVEN_REVENUE_MANAGEMENT_PRICER TO USER aa_analytics_dev_service_account;

-- 22/10/2025

use ROLE useradmin;

create OR replace USER aa_analytics_dev_environment_service_account
LOGIN_NAME = 'aa.analytics.dev.environment.service.account'
email = 'sdee@align-alytics.com'
display_name = 'AA Analytics Development Environment Service Account'
comment = 'AA Analytics Development Environment Service Account'
default_warehouse = HAVEN_DBT_DEVELOPMENT_ALIGN_ALYTICS_WAREHOUSE_XSMALL 
default_role = haven_dbt_development_align_alytics
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAo4rtTsEkxoxPhyjyBD86
UKootbutSAypTM67c/l0j5t79GcxMzcANdGtzfp463EQQRk5wM7Peq6vmgN2xg6c
vOMIrB5eBCQdoCH6/SJ5wDMSZvFfh+Rv7R+rBOlz4W2ekqfk/XQp+XInHqM2/m3/
DITRFtUknX6kSVUuEoToehCzDUSs/Xd/R1hhusJB2QAxrb7QxCku5pHrkzuKR0cP
nFk+61iNymfOdUlj5sFY0RQsBrbQCO1xTLFOyKAXUl1IXOgbxn06py8XVyp9d4Zp
QG6P2bWFMmlCRDAWL7NkCBEJfNO0ZjsP3aSD/4cO2gm9zY1b8aVFsd5G67Yc5/y0
zwIDAQAB'
;


USE ROLE securityadmin;

GRANT ROLE haven_dbt_development_align_alytics TO USER aa_analytics_dev_environment_service_account;
