use role dba;

truncate table trooper.spg_Trawler_09;
copy into trooper.spg_Trawler_09  
  from 'azure://jsmstoreaccount.blob.core.windows.net/holdnewfiles/spg_Trawler_09_'
    credentials=(azure_sas_token='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
  ;

truncate table trooper.spg_Trawler_10;
copy into trooper.spg_Trawler_10  
  from 'azure://jsmstoreaccount.blob.core.windows.net/holdnewfiles/spg_Trawler_10_'
    credentials=(azure_sas_token='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
  ;

truncate table trooper.spg_Trawler_11;
copy into trooper.spg_Trawler_11  
  from 'azure://jsmstoreaccount.blob.core.windows.net/holdnewfiles/spg_Trawler_11_'
    credentials=(azure_sas_token='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
  ;

truncate table trooper.spg_Trawler_12;
copy into trooper.spg_Trawler_12  
  from 'azure://jsmstoreaccount.blob.core.windows.net/holdnewfiles/spg_Trawler_12_'
    credentials=(azure_sas_token='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
  ;

truncate table trooper.spg_Trawler_13;
copy into trooper.spg_Trawler_13  
  from 'azure://jsmstoreaccount.blob.core.windows.net/holdnewfiles/spg_Trawler_13_'
    credentials=(azure_sas_token='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
  ;

truncate table trooper.spg_Trawler_14;
copy into trooper.spg_Trawler_14  
  from 'azure://jsmstoreaccount.blob.core.windows.net/holdnewfiles/spg_Trawler_14_'
    credentials=(azure_sas_token='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
  ;

truncate table trooper.spg_Trawler_15;
copy into trooper.spg_Trawler_15  
  from 'azure://jsmstoreaccount.blob.core.windows.net/holdnewfiles/spg_Trawler_15_'
    credentials=(azure_sas_token='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
  ;

truncate table trooper.spg_Trawler_16;
copy into trooper.spg_Trawler_16  
  from 'azure://jsmstoreaccount.blob.core.windows.net/holdnewfiles/spg_Trawler_16_'
    credentials=(azure_sas_token='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
  ;

truncate table trooper.spg_Trawler_17;
copy into trooper.spg_Trawler_17  
  from 'azure://jsmstoreaccount.blob.core.windows.net/holdnewfiles/spg_Trawler_17_'
    credentials=(azure_sas_token='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
  ;

truncate table trooper.spg_Trawler_18;
copy into trooper.spg_Trawler_18  
  from 'azure://jsmstoreaccount.blob.core.windows.net/holdnewfiles/spg_Trawler_18_'
    credentials=(azure_sas_token='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
  ;

truncate table trooper.spg_Trawler_19;
copy into trooper.spg_Trawler_19  
  from 'azure://jsmstoreaccount.blob.core.windows.net/holdnewfiles/spg_Trawler_19_'
    credentials=(azure_sas_token='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
  ;
  
 copy into TROOPER.SPG_TRAWLER  
  from 's3://aws-blg-revenue-raw-s3/haven/trawler/dbo/spg_trawler/08-02-2021/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
;

copy into TROOPER.SPG_TRAWLER_20  
  from 's3://aws-blg-revenue-raw-s3/haven/trawler/dbo/spg_trawler_20/08-02-2021/'
  credentials=(aws_key_id='<REDACTED>' aws_secret_key='<REDACTED>')
  file_format = (compression = gzip type = csv field_delimiter = '|' skip_header = 0 EMPTY_FIELD_AS_NULL = TRUE FIELD_OPTIONALLY_ENCLOSED_BY = '"' encoding = 'iso-8859-1' ESCAPE_UNENCLOSED_FIELD=NONE)
;


