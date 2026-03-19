USE ROLE accountadmin;

-- blg-energy-controls-data-s3
-- arn:aws:iam::328265102953:role/blg-energy-controls-static-data-role
-- BD78472_SFCRole=2_75uPZr6XKFctVgnB39fXN05xo3mO
-- blg_energy_controls_data_integration


create storage integration blg_energy_controls_data_integration
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::328265102953:role/blg-energy-controls-static-data-role'
  enabled = TRUE
  storage_aws_external_id = 'BD78472_SFCRole=2_75uPZr6XKFctVgnB39fXN05xo3mO'
  storage_allowed_locations = ('s3://blg-energy-controls-data-s3/');

DESC integration blg_energy_controls_data_integration;

USE ROLE securityadmin;

GRANT USAGE ON integration blg_energy_controls_data_integration TO ROLE dba;
--GRANT USAGE ON integration blg_energy_controls_data_integration TO ROLE HAVEN_DATA_TRANSFORM;

USE ROLE dba;

SHOW integrations;

USE SCHEMA training.training;

CREATE OR REPLACE STAGE training.training.blg_energy_controls_data_integration_stage
	STORAGE_INTEGRATION = blg_energy_controls_data_integration 
  	URL = 's3://blg-energy-controls-data-s3/';			
	--list @PRICING_AND_AVAILABILITY__STAGE;  see the external stage from within snowflake)

LS @training.training.blg_energy_controls_data_integration_stage;
