-- blg-havdevserv-kappture-s3  
-- arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-kappture-role
-- blg_havdevserv_kappture_s3_integration

use ROLE accountadmin;

create storage integration blg_havdevserv_kappture_s3_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-kappture-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=2_Bo0AxE4Bn/xypSFy1E/HSso0W+M='
  storage_allowed_locations = ('s3://blg-havdevserv-kappture-s3/');

DESC integration blg_havdevserv_kappture_s3_integration;

use ROLE securityadmin;

GRANT USAGE ON integration blg_havdevserv_kappture_s3_integration TO ROLE dba;

-- 10/06/2025

use ROLE accountadmin;

-- BD78472_SFCRole=2_OeYTq3RF9UOAEjX1TVSC6kynfAuR

ALTER storage integration blg_havdevserv_kappture_s3_integration
SET storage_aws_external_id = 'BD78472_SFCRole=2_OeYTq3RF9UOAEjX1TVSC6kynfAuR';


use schema haven_raw.kappture;

show tables;

show stages;

use role accountadmin;

show integrations;

use role securityadmin;

grant usage on integration BLG_HAVDEVSERV_KAPPTURE_S3_INTEGRATION to role haven_batch_dataload;

use role dba;

desc integration BLG_HAVDEVSERV_KAPPTURE_S3_INTEGRATION;

-- s3://blg-havdevserv-kappture-s3/
-- BLG_HAVDEVSERV_KAPPTURE_S3_INTEGRATION
-- BD78472_SFCRole=2_Bo0AxE4Bn/xypSFy1E/HSso0W+M=
-- arn:aws:iam::756108221014:role/blg-havdevserv-snowflake-kappture-role

-- BD78472_SFCRole=2_OeYTq3RF9UOAEjX1TVSC6kynfAuR

use role haven_batch_dataload;

create stage haven_raw.kappture.BLG_HAVDEVSERV_KAPPTURE_S3_INTEGRATION_stage
storage_integration = BLG_HAVDEVSERV_KAPPTURE_S3_INTEGRATION,
URL = 's3://blg-havdevserv-kappture-s3/';

ls @BLG_HAVDEVSERV_KAPPTURE_S3_INTEGRATION_stage;

show grants to role haven_commercial;

-- BLG_HAVDEVSERV_KAPPTURE_S3_INTEGRATION

use ROLE accountadmin;
-- BD78472_SFCRole=2_Bo0AxE4Bn/xypSFy1E/HSso0W+M=

ALTER storage integration blg_havdevserv_kappture_s3_integration
SET storage_aws_external_id = 'BD78472_SFCRole=2_Bo0AxE4Bn/xypSFy1E/HSso0W+M=';

use ROLE dba;

use SCHEMA haven_raw.kappture;
ls @BLG_HAVDEVSERV_KAPPTURE_S3_INTEGRATION_stage;

USE ROLE SECURITYADMIN;

GRANT ROLE _HAVEN_RAW__KAPPTURE__CREATOR TO ROLE HAVEN_BATCH_DATALOAD;

USE ROLE HAVEN_BATCH_DATALOAD;

usE SCHEMA HAVEN_RAW.KAPPTURE;

create table ORDER_DATA (
OrderId	integer,
LocalOrderId	Integer comment 'unique incremental ID within Kappture per transaction',
OrderTypeId	 Integer comment '1 = sale, 2 = refund',
DateTime	timestamp_ntz,
SiteId	Integer,
Site	varchar(),
OutletId	Integer,
Outlet	varchar() comment 'individual bar or restaurant',
OutletExternalReference1	varchar(),
OutletExternalReference2	 varchar(),
OutletExternalReference3	varchar(),
TerminalId	Integer,
Terminal	varchar() comment 'POS terminal',
TerminalReference	varchar(),
OperatorId	Integer,
Operator	varchar(),
ProductId	Integer,
Product	varchar(),
Reference	varchar(),
ExternalReference1	varchar(),
ExternalReference2	varchar(),
ProductGroupId	Integer,
ProductGroup	varchar(),
ProductGropExternalReference1	varchar(),
ProductGropExternalReference2	varchar(),
ProductGropExternalReference3	varchar(),
Line	Integer comment 'individual line level products on that order',
Quantity	Integer,
Gross	decimal(8,2),
TotalGross	decimal(8,2),
Net	decimal(8,2),
TotalNet	decimal(8,2),
TotalTax	decimal(8,2),
Tax  decimal(8,2)
);



