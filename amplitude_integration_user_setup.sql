-- 17/10/202502a 

-- new view setup

use ROLE dba;

use SCHEMA haven_base.amplitude;

CREATE VIEW haven_base.amplitude.haven_corporate
( AMPLITUDE_ID, MERGED_AMPLITUDE_ID, MERGE_EVENT_TIME, MERGE_SERVER_TIME )
AS SELECT AMPLITUDE_ID, MERGED_AMPLITUDE_ID, MERGE_EVENT_TIME, MERGE_SERVER_TIME
FROM HAVEN_RAW.AMPLITUDE.MERGE_IDS_100027343;

SELECT get_ddl('schema', 'amplitude');


CREATE OR replace VIEW haven_base.amplitude.haven_team
( AMPLITUDE_ATTRIBUTION_IDS, AMPLITUDE_ID, APP, CITY, CLIENT_EVENT_TIME, CLIENT_UPLOAD_TIME, COUNTRY, DATA, DEVICE_CARRIER, DEVICE_FAMILY, DEVICE_ID, DEVICE_TYPE, DMA, EVENT_ID, EVENT_PROPERTIES, EVENT_TIME, EVENT_TYPE, GROUP_PROPERTIES, GROUPS, IP_ADDRESS, "LANGUAGE", LIBRARY, LOCATION_LAT, LOCATION_LNG, OS_NAME, OS_VERSION, PAYING, PLATFORM, PROCESSED_TIME, REGION, SAMPLE_RATE, SERVER_RECEIVED_TIME, SERVER_UPLOAD_TIME, SESSION_ID, START_VERSION, USER_ID, USER_PROPERTIES, UUID, VERSION_NAME, USER_CREATION_TIME )
AS SELECT AMPLITUDE_ATTRIBUTION_IDS, AMPLITUDE_ID, APP, CITY, CLIENT_EVENT_TIME, CLIENT_UPLOAD_TIME, COUNTRY, "DATA", DEVICE_CARRIER, DEVICE_FAMILY, DEVICE_ID, DEVICE_TYPE, DMA, EVENT_ID, EVENT_PROPERTIES, EVENT_TIME, EVENT_TYPE, GROUP_PROPERTIES, GROUPS, IP_ADDRESS, "LANGUAGE", LIBRARY, LOCATION_LAT, LOCATION_LNG, OS_NAME, OS_VERSION, PAYING, PLATFORM, PROCESSED_TIME, REGION, SAMPLE_RATE, SERVER_RECEIVED_TIME, SERVER_UPLOAD_TIME, SESSION_ID, START_VERSION, USER_ID, USER_PROPERTIES, UUID, VERSION_NAME, USER_CREATION_TIME
FROM HAVEN_RAW.AMPLITUDE.EVENTS_100000959;

SELECT date(CLIENT_UPLOAD_TIME), count(*) 
FROM haven_base.amplitude.haven_team
GROUP BY 1 ORDER BY 1;

-- 02a - Haven Team - PROD 
-- (project ID 100000959)02 Haven Team

use ROLE useradmin;

CREATE USER haven_team_service_account
login_name = 'haven.team.service.account'
default_warehouse = BOURNE_BATCH_DATALOAD_XSMALL
default_namespace = HAVEN_RAW.AMPLITUDE
default_role = HAVEN_AMPLITUDE_INTEGRATION
default_secondary_roles = ()
comment = '02a - Haven Team - PROD'
TYPE = SERVICE
email = 'jonathan.manley@haven.com';

ALTER USER haven_team_service_account
SET RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwKfrcwH0ow6L2Cwx7NC6NEOr2Y5c5kYntLipDBw/YOoUBWG7O4uFx+yIAiI84cUjgcXl+ypbHPyx1LwkyQhQf8Z7loxJTNwJ4QKle56gUw4DxyNY4IsjRIW35Iyj7H7Ry9YkSWNAPLVwjrft5jJvEhsFAWfFYTlnoJg7tKnn9UD9U2+TEJ7m2LpxZnJYjUkDcr0LZxFAcs2vj52x3X8tclZ9S+o9JJaoHUrWBMNcPwO1ZoKFgNQh6cBLv1prXhXpCIOjN/ZdoBaYOitPwIpBxc+hxIBPg/lX1P22Hv9e8XnwHMpKY+FqB6eYz74Jrc7i13LpSSwbgMH867S2qVwomwIDAQAB';

ALTER USER "haven.team.service.account" UNSET PASSWORD;

use ROLE securityadmin;

GRANT ROLE HAVEN_AMPLITUDE_INTEGRATION TO USER haven_team_service_account;


-- 05a - Haven Corporate - PROD
-- project ID 100027343

use ROLE useradmin;

CREATE USER haven_corporate_service_account
login_name = 'haven.corporate.service.account'
default_warehouse = BOURNE_BATCH_DATALOAD_XSMALL
default_namespace = HAVEN_RAW.AMPLITUDE
default_role = HAVEN_AMPLITUDE_INTEGRATION
default_secondary_roles = ()
comment = '05a - Haven Corporate - PROD'
TYPE = SERVICE
email = 'jonathan.manley@haven.com';

use ROLE securityadmin;

GRANT ROLE HAVEN_AMPLITUDE_INTEGRATION TO USER haven_corporate_service_account;

use ROLE useradmin;

ALTER USER haven_corporate_service_account
SET RSA_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiQjaBSbeSR/qaq9w1ZIlWDdXdoOnkt4IAZnUXD8kATuCO0MSK+4Wy6V252SX0dCBX4fO7R0R2dNyEFeCpXNH0fi2PcZc7qPMCC9ZZWQ94eIk4KA2fzM4rGw27njDhGP0/LYRBjIwfNcs6z27qHMGjE0kb+GJNhLDhDIemXwN/cMqmZl9lGCF9mYU/pZ6kaV1CjAkcUHAJp2/W8KsjzWx5Qu/fRkS4ocsNI9+/8iwy9jlpjlZbp7sMnoRDsAN663XGYztPVHjI2alLQFOFPe8YLQSaveQzrifSUtZ70+w4QY9aBKiR6EiYl/ZsC4ZioG1XH3ULWWBAaZTXkkfn8hvAwIDAQAB";


-- 15/10/2025

-- initial setup

use ROLE useradmin;

SHOW users LIKE '%amplitude%';

-- HAVEN.AMPLITUDE.INTEGRATION
-- Haven Amplitude Integration
-- Haven Amplitude Integration credentials
-- BOURNE_BATCH_DATALOAD_XSMALL
-- HAVEN_RAW
-- HAVEN_AMPLITUDE_INTEGRATION
-- SERVICE
-- TRVDULB-DQ93660


-- 01a - Haven Guests & Owners - PROD >>> HAVEN_GUEST_AND_OWNERS

CREATE USER haven_guests_owners_service_account
login_name = 'haven.guests.owners.service.account'
default_warehouse = BOURNE_BATCH_DATALOAD_XSMALL
default_namespace = HAVEN_RAW.AMPLITUDE
default_role = HAVEN_AMPLITUDE_INTEGRATION
default_secondary_roles = ()
comment = '01a - Haven Guests & Owners - PROD >>> HAVEN_GUEST_AND_OWNERS'
TYPE = SERVICE
email = 'jonathan.manley@haven.com'
RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiD1ULnmnI5h1dLlUpZASUMmA+k/6hJnkN+HT11F4F98y58ULgGCrgqZYBStz5s00WSalCG4LG4dW/mFkiDzxKq8m7YA/LnyncPglrEHeS6uPWALMMsAQffiHW/10u5H2heH0b8VKwhUBYmfTJzI83AXBkMza5UobKy1wyrr4nzb80U1c1fFdhOu+gIhHqrrWyINkklKlWqXDGLwzEfdAcL+j8wWAGA/GnxN9f7ivTkuhPpO1NsYP17uumo7Qnp1bX+uXwfpn+jriq/Ogf5f1gpdAELUjg9EvNcTWavIjqJLCPDJkF4y+wC0Ppwr0tXpAGP3gh5AC0xeKVFP1Y1kvcQIDAQAB';


-- ALTER USER "haven.amplitude.integration" SET RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiD1ULnmnI5h1dLlUpZASUMmA+k/6hJnkN+HT11F4F98y58ULgGCrgqZYBStz5s00WSalCG4LG4dW/mFkiDzxKq8m7YA/LnyncPglrEHeS6uPWALMMsAQffiHW/10u5H2heH0b8VKwhUBYmfTJzI83AXBkMza5UobKy1wyrr4nzb80U1c1fFdhOu+gIhHqrrWyINkklKlWqXDGLwzEfdAcL+j8wWAGA/GnxN9f7ivTkuhPpO1NsYP17uumo7Qnp1bX+uXwfpn+jriq/Ogf5f1gpdAELUjg9EvNcTWavIjqJLCPDJkF4y+wC0Ppwr0tXpAGP3gh5AC0xeKVFP1Y1kvcQIDAQAB';
-- ALTER USER "haven.guests.owners.service.account" UNSET PASSWORD;

-- 03a - Haven Experience QR Codes - PROD >>> HAVEN_EXPERIENCE_QR_CODES

CREATE USER haven_experience_qr_codes_service_account
login_name = 'haven.experience.qr.codes.account'
default_warehouse = BOURNE_BATCH_DATALOAD_XSMALL
default_namespace = HAVEN_RAW.AMPLITUDE
default_role = HAVEN_AMPLITUDE_INTEGRATION
default_secondary_roles = ()
comment = '03a - Haven Experience QR Codes - PROD >>> HAVEN_EXPERIENCE_QR_CODES'
TYPE = SERVICE
email = 'jonathan.manley@haven.com'
;

ALTER USER haven_experience_qr_codes_service_account
SET RSA_PUBLIC_KEY = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp81/JGZ/Rdg7m89G8WMhX9WfF0NuJJpSedjwtqb/3WeYf0F6uuPGgOydJSdGFAMnmvDypeidyWwmwo/htd0OlJ7TiHKxpVblnJdPBwwiU0JVdZ4Pwirf5F/G8x6ogwHm4+rhMTvGcNGOmkTQg0zfyIDrixj3rv+7bYTZTtREbx8KG2JcGCAFizHKJd+SfFj3AepPYzrigudZgO3VT+sAeW6VAGr/E82g7cm+iagPFB3JqXuZ/eT4UJQq5kEutE4C56lrj6XvwB90dADt+WbBgK7IPUAhHQ2Ze/snZc+xCkaCQOrHmA2ljn3qhoE55s0sCn+0K3fUFrdGUI7py723WwIDAQAB';


-- 04a - Haven Newsroom - PROD >>> HAVEN_NEWSROOM

CREATE USER haven_newsroom_service_account
login_name = 'haven.newsroom.service.account'
default_warehouse = BOURNE_BATCH_DATALOAD_XSMALL
default_namespace = HAVEN_RAW.AMPLITUDE
default_role = HAVEN_AMPLITUDE_INTEGRATION
default_secondary_roles = ()
comment = '04a - Haven Newsroom - PROD >>> HAVEN_NEWSROOM'
TYPE = SERVICE
email = 'jonathan.manley@haven.com'
RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzTSRQZA9g3PEVIK0RJ6Ktuc0/Xakq4c9Ag8hYy+zg5CAgEqq6FxMHUG1FnNrD45wU1NCIz0vzkGBQ5wF20cB6qG50JUTdSdOl10RvkpWH/Q6KOJrK1MJ/jaYQKksadK2JbLgQ40gRU3b5ObK6cAQXK6eFVYCjNiLEHhZR9NZ40YAwwik8xdEQQXWehU6GWkwxnZKwqU4/lvsIIRVPuXPPUNbBs39q365fabhPcmp1fVCh1zdw5iLhGcZFllq6nFk/n+KpExYtF8txAocqExhlxCZ03aLc/OHQGfC/EKLsLKOSESwoHPPcxZgCxBzxPT8HqXuD+HvzzuYn1IU20a/GQIDAQAB';

-- ALTER USER "haven.newsroom.service.account" SET RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzTSRQZA9g3PEVIK0RJ6Ktuc0/Xakq4c9Ag8hYy+zg5CAgEqq6FxMHUG1FnNrD45wU1NCIz0vzkGBQ5wF20cB6qG50JUTdSdOl10RvkpWH/Q6KOJrK1MJ/jaYQKksadK2JbLgQ40gRU3b5ObK6cAQXK6eFVYCjNiLEHhZR9NZ40YAwwik8xdEQQXWehU6GWkwxnZKwqU4/lvsIIRVPuXPPUNbBs39q365fabhPcmp1fVCh1zdw5iLhGcZFllq6nFk/n+KpExYtF8txAocqExhlxCZ03aLc/OHQGfC/EKLsLKOSESwoHPPcxZgCxBzxPT8HqXuD+HvzzuYn1IU20a/GQIDAQAB';
-- ALTER USER "haven.newsroom.service.account" UNSET PASSWORD;

-- 06a - Haven Cornerstone - PROD >>> HAVEN_CORNERSTONE

CREATE USER haven_cornerstone_service_account
login_name = 'haven.cornerstone.service.account'
default_warehouse = BOURNE_BATCH_DATALOAD_XSMALL
default_namespace = HAVEN_RAW.AMPLITUDE
default_role = HAVEN_AMPLITUDE_INTEGRATION
default_secondary_roles = ()
comment = '06a - Haven Cornerstone - PROD >>> HAVEN_CORNERSTONE'
TYPE = SERVICE
email = 'jonathan.manley@haven.com'
RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApbSKtIROW6s5G3jRuxSjaE8xX6nThKU7tIxMc7Icb+qeWQwjQ2SVTjI8WdeNa++Aux32TATVhjfViHH5wMSkYuq1i+dNfKyNwuUeShmOYfAWZp/cyrEVkO5f8WGBlNRUrWLqcwHTUuE0AtW9BI5XaqEL0lZVH2DzlZRls+w3jROtGfk1iwKzU45V7MGwmMG9hPcqFGj9SNnIRAn4FHK72SZNqM6p4LdmMgoxPtZh//tHQGCKY7vUyMjBZ8U+B8JlQuESJsKFw4dag1itpefwwXLuHpC9LTO7mv4U7oIMHWTu60GZKjrrKqwfNDdGx+iDUGObjhpOEI6W9IVTeMcyAQIDAQAB';

-- ALTER USER "haven.cornerstone.service.account" SET RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApbSKtIROW6s5G3jRuxSjaE8xX6nThKU7tIxMc7Icb+qeWQwjQ2SVTjI8WdeNa++Aux32TATVhjfViHH5wMSkYuq1i+dNfKyNwuUeShmOYfAWZp/cyrEVkO5f8WGBlNRUrWLqcwHTUuE0AtW9BI5XaqEL0lZVH2DzlZRls+w3jROtGfk1iwKzU45V7MGwmMG9hPcqFGj9SNnIRAn4FHK72SZNqM6p4LdmMgoxPtZh//tHQGCKY7vUyMjBZ8U+B8JlQuESJsKFw4dag1itpefwwXLuHpC9LTO7mv4U7oIMHWTu60GZKjrrKqwfNDdGx+iDUGObjhpOEI6W9IVTeMcyAQIDAQAB';
-- ALTER USER "haven.cornerstone.service.account" UNSET PASSWORD;

-- 08a - One Great Team Login - PROD >>> ONE_GREAT_TEAM_LOGIN

CREATE USER haven_one_great_team_service_account
login_name = 'haven.one.great.team.service.account'
default_warehouse = BOURNE_BATCH_DATALOAD_XSMALL
default_namespace = HAVEN_RAW.AMPLITUDE
default_role = HAVEN_AMPLITUDE_INTEGRATION
default_secondary_roles = ()
comment = '08a - One Great Team Login - PROD >>> ONE_GREAT_TEAM_LOGIN'
TYPE = SERVICE
email = 'jonathan.manley@haven.com'
RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx10o8EzCWtQ1Ryo9Sdq5N399H6IdtkoHor1s+T6A8xA7LYpl8B8LfNwsJ8/9rLe0ToxDrm/X9B+QWQL82Gyf3h3Ql+twBCCDcf2PXtyFMb086MU0Li9PQsRxDroksvNx/MbiEZ0/B8uoVIY6+WaaMoZvHSNYVC8zJ2xerqc6wHaoPQuRrpoAl1WeMJglT8hbxTcpuXP9u4p/gkDVP5Y2/x/O+qB+b0/hYt63V+7bOs1GpEM3F+ERdtjK4UAlAd5eMF005HAX4VDzQA1fRedBt99HlIRw6PHAS3622/3fxY6+MdZaV+bRGHdFUWCxB9YiUe0GFcsmc9sp/UpaE8H1lwIDAQAB';

-- ALTER USER "haven.one.great.team.service.account" SET RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx10o8EzCWtQ1Ryo9Sdq5N399H6IdtkoHor1s+T6A8xA7LYpl8B8LfNwsJ8/9rLe0ToxDrm/X9B+QWQL82Gyf3h3Ql+twBCCDcf2PXtyFMb086MU0Li9PQsRxDroksvNx/MbiEZ0/B8uoVIY6+WaaMoZvHSNYVC8zJ2xerqc6wHaoPQuRrpoAl1WeMJglT8hbxTcpuXP9u4p/gkDVP5Y2/x/O+qB+b0/hYt63V+7bOs1GpEM3F+ERdtjK4UAlAd5eMF005HAX4VDzQA1fRedBt99HlIRw6PHAS3622/3fxY6+MdZaV+bRGHdFUWCxB9YiUe0GFcsmc9sp/UpaE8H1lwIDAQAB';
-- ALTER USER "haven.one.great.team.service.account" UNSET PASSWORD;

ALTER USER haven_one_great_team_service_account 
SET RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk3H78OH2VyQMGAvzqgwGzBxm888znIln0LMSP8u8VY6x+0LXdIm3CWNhknnQ6/eluLMWhIkqK3JshyaArWqdtYhmxAolQ3FGHe8flz0ydhkXBrX9cE7p2wp3LIPZ5pIKXy7ojam+7LjnWUtN/919m1yZ71GFNimRZ0XRdTgDKZKf7ZVFP2u7Gy2WZvYM06m4aejg3WSCciOiotqbFL6JU8se3pKl0oejIMRdfpfPxFoagtyGU8YeW5iboh/1MNiXH4nNhgCxQugHdDN/wP7BzwP9tzjbTkiQTlDVZmwYQwnn0HFgc8SZq2+urDVYdB+ipOhrqwVbtlvLtERlFPUDqQIDAQAB',
comment = '08a - One Great Team Login - PROD >>> ONE_GREAT_TEAM_LOGIN';

-- TRVDULB-DQ93660
-- 07a - Haven Service Status - PROD >>> HAVEN_SERVICE_STATUS

CREATE USER haven_service_status_service_account
login_name = 'haven.service.status.service.account'
default_warehouse = BOURNE_BATCH_DATALOAD_XSMALL
default_namespace = HAVEN_RAW.AMPLITUDE
default_role = HAVEN_AMPLITUDE_INTEGRATION
default_secondary_roles = ()
comment = '07a - Haven Service Status - PROD >>> HAVEN_SERVICE_STATUS'
TYPE = SERVICE
email = 'jonathan.manley@haven.com';

ALTER USER haven_service_status_service_account
SET RSA_PUBLIC_KEY = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx10o8EzCWtQ1Ryo9Sdq5N399H6IdtkoHor1s+T6A8xA7LYpl8B8LfNwsJ8/9rLe0ToxDrm/X9B+QWQL82Gyf3h3Ql+twBCCDcf2PXtyFMb086MU0Li9PQsRxDroksvNx/MbiEZ0/B8uoVIY6+WaaMoZvHSNYVC8zJ2xerqc6wHaoPQuRrpoAl1WeMJglT8hbxTcpuXP9u4p/gkDVP5Y2/x/O+qB+b0/hYt63V+7bOs1GpEM3F+ERdtjK4UAlAd5eMF005HAX4VDzQA1fRedBt99HlIRw6PHAS3622/3fxY6+MdZaV+bRGHdFUWCxB9YiUe0GFcsmc9sp/UpaE8H1lwIDAQAB';


-- Save the old key
ALTER USER haven_service_status_service_account SET RSA_PUBLIC_KEY_2='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx10o8EzCWtQ1Ryo9Sdq5N399H6IdtkoHor1s+T6A8xA7LYpl8B8LfNwsJ8/9rLe0ToxDrm/X9B+QWQL82Gyf3h3Ql+twBCCDcf2PXtyFMb086MU0Li9PQsRxDroksvNx/MbiEZ0/B8uoVIY6+WaaMoZvHSNYVC8zJ2xerqc6wHaoPQuRrpoAl1WeMJglT8hbxTcpuXP9u4p/gkDVP5Y2/x/O+qB+b0/hYt63V+7bOs1GpEM3F+ERdtjK4UAlAd5eMF005HAX4VDzQA1fRedBt99HlIRw6PHAS3622/3fxY6+MdZaV+bRGHdFUWCxB9YiUe0GFcsmc9sp/UpaE8H1lwIDAQAB';

-- Update the new key
ALTER USER  haven_service_status_service_account SET RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApCE1t5CAZop+D7nIZcOWHOLWhHH3SVht2SoXUCMUoGLVr+/faCtp0pg53Q0fXKjBZ4B13N+uOW1A1Sp8d+CHjXkgpkYXRw2CAsH+2yX/LmjecI/WzTtFqfDOgenrN6opywe1xMhe3E6vFqHgtLw4XTWClC+xycl46kt74Lzfr0mzErelZ+NJy3hKNcRIeEAAjm89m4qdvV/7fCEdZrckjI9sdSaGuvYUXkxvdEMpxvSrFrhf7wMrduokIODz0V3hqPfXuGqmM+lh6NhjXYlhjPsOKMosn0BOt18OrqS2cyLRN1rcWHBGKntuUaaYNCf8+FT9xtqwhq54G6wKvg/98QIDAQAB';

ALTER USER  haven_service_status_service_account 
SET RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApCE1t5CAZop+D7nIZcOWHOLWhHH3SVht2SoXUCMUoGLVr+/faCtp0pg53Q0fXKjBZ4B13N+uOW1A1Sp8d+CHjXkgpkYXRw2CAsH+2yX/LmjecI/WzTtFqfDOgenrN6opywe1xMhe3E6vFqHgtLw4XTWClC+xycl46kt74Lzfr0mzErelZ+NJy3hKNcRIeEAAjm89m4qdvV/7fCEdZrckjI9sdSaGuvYUXkxvdEMpxvSrFrhf7wMrduokIODz0V3hqPfXuGqmM+lh6NhjXYlhjPsOKMosn0BOt18OrqS2cyLRN1rcWHBGKntuUaaYNCf8+FT9xtqwhq54G6wKvg/98QIDAQAB';



-- ALTER USER "haven.service.status.service.account" UNSET RSA_PUBLIC_KEY_2;

-- check status of users

use ROLE useradmin;

SHOW users LIKE '%amplitude%';

use ROLE securityadmin;

grant role HAVEN_AMPLITUDE_INTEGRATION to USER haven_guests_owners_service_account;
grant role HAVEN_AMPLITUDE_INTEGRATION to USER haven_experience_qr_codes_service_account;
grant role HAVEN_AMPLITUDE_INTEGRATION to USER haven_newsroom_service_account;
grant role HAVEN_AMPLITUDE_INTEGRATION to USER haven_cornerstone_service_account;
grant role HAVEN_AMPLITUDE_INTEGRATION to USER haven_one_great_team_service_account;
grant role HAVEN_AMPLITUDE_INTEGRATION to USER haven_service_status_service_account;
