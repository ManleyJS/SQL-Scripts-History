use role accountadmin;

show integrations like '%energy%';

grant usage on integration BLG_ENERGY_CONTROLS_DATA_INTEGRATION to role haven_batch_dataload;

use role securityadmin;

grant role _haven_raw__energy_meters__creator to role haven_batch_dataload;

use role haven_batch_dataload;

use schema haven_raw.energy_meters;

show stages;

create table haven_raw.energy_meters.metered_usage_stage (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR()
);

CREATE OR REPLACE STAGE haven_raw.energy_meters.blg_energy_controls_data_integration_stage
	STORAGE_INTEGRATION = blg_energy_controls_data_integration 
  	URL = 's3://blg-energy-controls-data-s3/';			

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/;

truncate table metered_usage_stage;

-- 20250201
-- 2502_MeterReadings.csv.gz

create or replace table haven_raw.energy_meters.meter_readings (
Pitch varchar(),
Meter_Serial_Number varchar(),
Usage decimal(10,3),
Open_Read_value decimal(10,3),
Open_read_Date date,
Close_Read_value decimal(10,3) ,
Close_read_Date date);

copy into haven_raw.energy_meters.meter_readings from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/2502_MeterReadings.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'YYYYMMDD', skip_header = 1)
on_error = continue;

-- ECBourneGas_
-- 03/03/2025 00:00:00

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneGas_;

create or replace table haven_raw.energy_meters.metered_usage_ecbournegas (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR()
);

copy into haven_raw.energy_meters.metered_usage_ecbournegas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneGas_
file_format = (type = csv, compression = gzip, timestamp_format = 'DD-MON-YYYY HH:MI:SS', skip_header = 1)
on_error = continue;

-- EBourneGas_ date range
-- s3://blg-energy-controls-data-s3/dataload/ECBourneGas_20211009_140010.csv.gz
-- DD/MM/YYYY HH:SS

copy into haven_raw.energy_meters.metered_usage_ecbournegas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneGas_20211009_140010.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;

-- s3://blg-energy-controls-data-s3/dataload/ECBourneGas_20211006_140002.csv.gz
-- DD/MM/YYYY HH:SS

copy into haven_raw.energy_meters.metered_usage_ecbournegas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneGas_20211006_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;

-- s3://blg-energy-controls-data-s3/dataload/ECBourneGas_20211008_140004.csv.gz
-- DD/MM/YYYY HH:SS

copy into haven_raw.energy_meters.metered_usage_ecbournegas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneGas_20211008_140004.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;

-- s3://blg-energy-controls-data-s3/dataload/ECBourneGas_20211005_140002.csv.gz
-- DD/MM/YYYY HH:SS

copy into haven_raw.energy_meters.metered_usage_ecbournegas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneGas_20211005_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;

-- s3://blg-energy-controls-data-s3/dataload/ECBourneGas_20211004_172847.csv.gz
-- DD/MM/YYYY HH:SS

copy into haven_raw.energy_meters.metered_usage_ecbournegas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneGas_20211004_172847.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;

-- s3://blg-energy-controls-data-s3/dataload/ECBourneGas_20211007_140002.csv.gz
-- DD/MM/YYYY HH:SS

copy into haven_raw.energy_meters.metered_usage_ecbournegas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneGas_20211007_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;

-- s3://blg-energy-controls-data-s3/dataload/ECBourneGas_20211010_140003.csv.gz
-- DD/MM/YYYY HH:SS

copy into haven_raw.energy_meters.metered_usage_ecbournegas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneGas_20211010_140003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;

-- s3://blg-energy-controls-data-s3/dataload/ECBourneGas_20211011_140003.csv.gz
-- DD/MM/YYYY HH:SS

copy into haven_raw.energy_meters.metered_usage_ecbournegas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneGas_20211011_140003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;


-- ECBourneLodges
-- 25/03/2025 00:00

create or replace table haven_raw.energy_meters.metered_usage_ecbourneLodges (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR()
);

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges2;

copy into haven_raw.energy_meters.metered_usage_ecbourneLodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges2
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;

-- ECBourneLodges_
-- DD-MON-YYYY HH:MI:SS

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_2;

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_2
file_format = (type = csv, compression = gzip, timestamp_format = 'DD-MON-YYYY HH:MI:SS', skip_header = 1)
on_error = continue;

-- 03/03/2025 00:00
-- Correct files with different dates

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211012_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211024_140001.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211014_140009.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211016_140007.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211022_140001.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211008_140004.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211006_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211015_140011.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211007_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211020_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211023_140008.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211021_140010.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211009_140010.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211017_140004.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211013_140005.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211005_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211019_140009.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211011_140003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211010_140003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournelodges from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges_20211018_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

-- ECBourneWater
-- 19-MAY-2021 00:30:00

create or replace table haven_raw.energy_meters.metered_usage_ecbournewater (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR()
);

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneWater_;

copy into haven_raw.energy_meters.metered_usage_ecbournewater from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneWater_
file_format = (type = csv, compression = gzip, timestamp_format = 'DD-MON-YYYY HH:MI:SS', skip_header = 1)
on_error = continue;

-- timestamp mismatch
-- Timestamp '03/10/2021 00:30' is not recognized

copy into haven_raw.energy_meters.metered_usage_ecbournewater from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneWater_20211004_172847.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournewater from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneWater_20211008_140004.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournewater from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneWater_20211007_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournewater from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneWater_20211009_140010.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournewater from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneWater_20211005_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournewater from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneWater_20211006_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_ecbournewater from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneWater_20211010_140003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

-- HALF_HOURLY_USAGE_Bourne_Commercial_Electricity
-- 24/10/2021 00:30

create or replace table haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR()
);

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity;

truncate table haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity;

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity2
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;

-- Files with _ between electricity and date
-- DD-MON-YYYY HH:MI:SS

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_;

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_
file_format = (type = csv, compression = gzip, timestamp_format = 'DD-MON-YYYY HH:MI:SS', skip_header = 1)
on_error = continue;

-- 16/10/2021 00:30
-- Timestamp '11/10/2021 00:30' is not recognized

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211012_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211018_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211020_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211014_140009.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211007_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211015_140011.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211016_140007.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211021_140010.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211023_140008.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211022_140001.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211024_140001.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211008_140004.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211005_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211013_140005.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211006_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211009_140010.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20210819_121511.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211010_140003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211004_172847.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211019_140009.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211017_140004.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_20211011_140003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

-- HALF_HOURLY_USAGE_Bourne_Commercial_Gas_
-- DD-MON-YYYY HH:MI:SS

create or replace table haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Gas (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR()
);

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Gas;

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Gas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Gas
file_format = (type = csv, compression = gzip, timestamp_format = 'DD-MON-YYYY HH:MI:SS', skip_header = 1)
on_error = continue;

---- Timestamp '08/10/2021 00:30' is not recognized
----

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Gas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Gas_20211011_140003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Gas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Gas_20211005_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Gas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Gas_20211004_172847.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Gas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Gas_20211006_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Gas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Gas_20211010_140003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Gas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Gas_20211008_140004.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Gas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Gas_20211009_140010.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

 copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Gas from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Gas_20211007_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

-- HALF_HOURLY_USAGE_Bourne_Commercial_Water_
-- 19-AUG-2021 00:30:00

create or replace table haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Water (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR()
);

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Water;

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Water from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Water
file_format = (type = csv, compression = gzip, timestamp_format = 'DD-MON-YYYY HH:MI:SS', skip_header = 1)
on_error = continue;

-- Timestamp '03/10/2021 00:30' is not recognized

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Water from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Water_20211011_140003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Water from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Water_20211006_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Water from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Water_20211008_140004.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Water from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Water_20211009_140010.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Water from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Water_20211004_172847.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Water from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Water_20211005_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Water from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Water_20211007_140002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Water from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Water_20211010_140003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1);

-- HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water
-- 24/10/2021 00:00

create or replace table haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR()
);

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water;

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;

-- READING_EXTRACT_Bourne_EVC
-- 24/10/2021 00:00

create or replace table haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR()
);

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC;

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1)
on_error = continue;

-- Number of columns in file (13) does not match that of the corresponding table (6), use file format option error_on_column_count_mismatch=false to ignore this error
-- 20240115
-- 00:00:02

create table haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC_expanded (
Customer_ID varchar(),
First_Name varchar(),
Last_Name varchar(),
Serial_Number  varchar(),
Reading_Date date,
Reading_Time time,
Rate1_kWh decimal(10,3),
Rate2_kWh decimal(10,3),
Rate3_kWh decimal(10,3),
Rate4_kWh decimal(10,3),
Reverse_kWh decimal(10,3),
Total_kWh decimal(10,3),
GroupName varchar() );

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC_expanded from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240116_210837.csv.gz
file_format = (type = csv, compression = gzip, date_format = 'YYYYMMDD', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC_expanded from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240102_210902.csv.gz
file_format = (type = csv, compression = gzip, date_format = 'YYYYMMDD', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC_expanded from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20231226_210904.csv.gz
file_format = (type = csv, compression = gzip, date_format = 'YYYYMMDD', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC_expanded from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240109_210905.csv.gz
file_format = (type = csv, compression = gzip, date_format = 'YYYYMMDD', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC_expanded from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20231219_210855.csv.gz
file_format = (type = csv, compression = gzip, date_format = 'YYYYMMDD', skip_header = 1);

-- Timestamp '19/02/20243  00:00:02' is not recognized

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240101.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI:SS', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240205.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI:SS', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240108.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI:SS', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240212.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI:SS', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240115.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI:SS', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240219.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI:SS', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240122.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI:SS', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240226.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI:SS', skip_header = 1);

copy into haven_raw.energy_meters.metered_usage_READING_EXTRACT_Bourne_EVC from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/READING_EXTRACT_Bourne_EVC_20240129.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI:SS', skip_header = 1);

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage;

-- Fix files with extra column

-- HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water
-- 24/10/2021 00:00

create or replace table haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR(),
estimated varchar()
);

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water;

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water20250323_031002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water20250325_031002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water20250322_031002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water20250321_031002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water20250324_031002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water20250327_031003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water20250326_031003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water20250328_031003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water20250319_031002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water20250320_031002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

-- HALF_HOURLY_USAGE_Bourne_Commercial_Electricity
-- 24/10/2021 00:30

create or replace table haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR(),
estimated varchar()
);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity20250320_030502.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity20250324_030502.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);


copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity20250328_030502.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity20250321_030502.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity20250323_030507.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity20250326_030503.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity20250322_030502.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity20250319_030502.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity20250327_030503.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity20250325_030502.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

-- ECBourneLodges
-- 25/03/2025 00:00

create or replace table haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates (
Customer varchar(),
Meter VARCHAR(),
Channel_Type varchar(),
METER_Timestamp TIMESTAMP_NTZ,
A_Plus VARCHAR(),
A_minus VARCHAR(),
estimated varchar()
);

copy into haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges20250322_030002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);


copy into haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges20250325_030002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges20250319_030002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges20250328_030003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges20250320_030002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges20250321_030002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges20250327_030003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges20250324_030002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges20250323_030002.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/dataload/ECBourneLodges20250326_030003.csv.gz
file_format = (type = csv, compression = gzip, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

ls @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/;

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water_estimates 
from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/HALF_HOURLY_USAGE_Bourne_Gas_Heat_Water2
file_format = (type = csv, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_HALF_HOURLY_USAGE_Bourne_Commercial_Electricity_estimates 
from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/HALF_HOURLY_USAGE_Bourne_Commercial_Electricity2
file_format = (type = csv, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

copy into haven_raw.energy_meters.metered_usage_ecbourneLodges_estimates 
from @haven_raw.energy_meters.blg_energy_controls_data_integration_stage/ECBourneLodges2
file_format = (type = csv, timestamp_format = 'DD/MM/YYYY HH:MI', skip_header = 1, error_on_column_count_mismatch = false);

show tables;

show stages;

ls @BLG_ENERGY_CONTROLS_DATA_INTEGRATION_STAGE;


