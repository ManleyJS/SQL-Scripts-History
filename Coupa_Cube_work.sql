use role securityadmin;

grant role _haven_store__coupa_cube__creator to role haven_batch_dataload;

use role haven_batch_dataload;
USE
use warehouse bourne_batch_dataload_xsmall;

use schema haven_store.coupa_cube;

select get_ddl('FILE_FORMAT', 'HAVEN_STORE.OCANDC.OCANDC_FILE_FORMAT');
select get_ddl('STAGE', 'HAVEN_STORE.OCANDC.OCANDC_DATA_STAGE');




CREATE OR REPLACE FILE FORMAT haven_store.coupa_cube.COUPA_CUBE_FILE_FORMAT
	TYPE = csv
	FIELD_DELIMITER = '|'
	ESCAPE = '\\'
    ESCAPE_UNENCLOSED_FIELD = NONE
    FIELD_OPTIONALLY_ENCLOSED_BY = '\"'
    REPLACE_INVALID_CHARACTERS = TRUE
	COMPRESSION = gzip
    RECORD_DELIMITER = '\n'
;

TYPE = CSV
FIELD_DELIMITER = '|'
COMPRESSION = GZIP
RECORD_DELIMITER = '\n'
ESCAPE = '\\'
ESCAPE_UNENCLOSED_FIELD = NONE
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
REPLACE_INVALID_CHARACTERS = TRUE
;
desc stage haven_store.ocandc.ocandc_data_stage;

create stage haven_store.coupa_cube.coupa_cube_data_stage
file_format = haven_store.coupa_cube.COUPA_CUBE_FILE_FORMAT;

show tables;


use role dba;

select * from snowflake.account_usage.query_history
where user_name = 'HAVEN_BATCH_DATALOAD'
and role_Name = 'HAVEN_BATCH_DATALOAD'
and start_time > '2024-12-09 16'
and query_text like '%COPY%'
order by start_time;

use role haven_batch_dataload;

CREATE OR REPLACE FILE FORMAT haven_store.coupa_cube.COUPA_CUBE_FILE_FORMAT
	TYPE = csv
	FIELD_DELIMITER = '|'
	ESCAPE = '\\'
    ESCAPE_UNENCLOSED_FIELD = NONE
    FIELD_OPTIONALLY_ENCLOSED_BY = '\"'
    REPLACE_INVALID_CHARACTERS = TRUE
	COMPRESSION = gzip
;

COPY INTO haven_store.coupa_cube.PO FROM @haven_store.coupa_cube.COUPA_CUBE_DATA_STAGE/PO/;

ls @haven_store.coupa_cube.COUPA_CUBE_DATA_STAGE/PO/;

COPY INTO haven_store.coupa_cube.PO_SUPPLIERITEM_LIVE FROM @haven_store.coupa_cube.COUPA_CUBE_DATA_STAGE/PO_SUPPLIERITEM_LIVE/;

show tables;


COPY INTO haven_store.coupa_cube.INV FROM @haven_store.coupa_cube.COUPA_CUBE_DATA_STAGE/INV/;
COPY INTO haven_store.coupa_cube.inv_createdby FROM @haven_store.coupa_cube.COUPA_CUBE_DATA_STAGE/INV_CREATEDBY/;
COPY INTO haven_store.coupa_cube.INV_SUPPLIERITEM_LIVE FROM @haven_store.coupa_cube.COUPA_CUBE_DATA_STAGE/INV_SUPPLIERITEM_LIVE/;

show tables;

select * from po limit 10;

select po_date_as_date, sum(po_qty), sum(po_qty_rec), sum(po_total), sum(po_receipted), sum(po_unreceipted) from po group by po_date_as_date order by po_date_as_date;

--2024-12-01:4147.00:5445.04:70304.58:37339.92:32964.66
--2024-12-01:4147.00:5135.04:70304.58:27827.71:42476.87
select 37339.92 - 27827.71;
--9512.21
select 32964.66 - 42476.87;

2024-12-02:119684.79:483451.59:1489057.92:679360.86:809697.06
2024-12-03:67981.42:232282.52:1000164.73:384131.45:616033.28
2024-12-04:33602.92:211665.81:881117.52:373984.04:507133.48

2024-12-05:12842.86:517539.31:1161815.42:687672.15:474143.27
2024-12-06:8277.00:88590.21:977646.50:147888.27:829758.23
2024-12-06:8277.00:12730.28:977646.50:32363.50:	945283.00

2024-12-07:6954.00:7152.71:151050.34:7360.62:143689.72
2024-12-08:1149.00:135327.97:374046.73:135558.97:238487.76
2024-12-09:28746.00:110328.73:4004205.44:346854.54:3657350.90


--2024-09-01:19925.00:39245.20:188571.12:185544.83:3026.29
--2024-09-01:19925.00:39245.20:188571.12:185544.83:3026.29

--2024-10-01:62486.00:298929.77:1003419.95:907804.03 :95615.92
--2024-10-01:62486.00:298608.67:1003419.95:907482.934:95937.016