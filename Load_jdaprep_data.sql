copy into JDAPREP.TABIN235_MASTER
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabin235_master/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;

copy into JDAPREP.TABIN204_MASTER
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabin204_master/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;

copy into JDAPREP.TABIN280_MASTER
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabin280_master/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;

copy into JDAPREP.TABIN203_MASTER
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabin203_master/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;

copy into JDAPREP.TABIN293_MASTER
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabin293_master/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;

copy into JDAPREP.TABIN238_MASTER
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabin238_master/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;

copy into JDAPREP.TABIN226_MASTER
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabin226_master/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;
  
copy into JDAPREP.TABIN245_MASTER
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabin245_master/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;

copy into JDAPREP.TABIN_INV_AVAIL_HEADER
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabin_inv_avail_header/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;

copy into JDAPREP.TABOUT057_MASTER 
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabout057_master/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;

copy into JDAPREP.TABOUT059_MASTER 
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabout059_master/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;   

 copy into JDAPREP.TABOUT100_MASTER 
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabout100_master/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;   

copy into JDAPREP.TABIN_INV_AVAIL_HIST 
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabin_inv_avail_hist/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;

copy into JDAPREP.TABIN_BLL_GRADE_PRICE 
  from 's3://aws-blg-reporting-raw-s3/haven/troliv/jdaprep/tabin_bll_grade_price/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' FIELD_OPTIONALLY_ENCLOSED_BY = '"' ESCAPE = '\\')
;



