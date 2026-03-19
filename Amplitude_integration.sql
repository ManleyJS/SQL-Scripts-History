USE ROLE dba;

SHOW ROLES LIKE '_bourne_batch_dataload_%';

USE ROLE useradmin;

CREATE ROLE haven_amplitude_integration;

create user haven_amplitude_integration
login_name = 'haven.amplitude.integration'
password = 'HavenAmplitude@2023!'
display_name = 'Haven Amplitude Integration'
comment = 'Haven Amplitude Integration credentials'
default_role = haven_batch_dataload
DEFAULT_WAREHOUSE = bourne_batch_dataload_xsmall;

ALTER USER haven_amplitude_integration SET DEFAULT_ROLE = haven_amplitude_integration;
ALTER USER haven_amplitude_integration SET login_name = haven.amplitude.integration; 
ALTER USER haven_amplitude_integration SET default_namespace = haven_raw; 

USE ROLE securityadmin;

GRANT ROLE _BOURNE_BATCH_DATALOAD__WAREHOUSE__USAGE TO ROLE haven_amplitude_integration;
GRANT ROLE _haven_raw__amplitude__creator TO ROLE haven_amplitude_integration;
GRANT ROLE _haven_raw__schema TO ROLE haven_amplitude_integration;
REVOKE ROLE _haven_raw__schema FROM ROLE haven_amplitude_integration;
GRANT ROLE haven_amplitude_integration TO USER haven_amplitude_integration;
GRANT ROLE "haven_amplitude_integration" TO USER "haven.amplitude.integration";

SHOW GRANTS TO USER haven_amplitude_integration;
show GRANTS TO ROLE haven_amplitude_integration;

SHOW ROLES LIKE '_haven_raw%';


USE ROLE useradmin;
CREATE ROLE _haven_raw__usage;
CREATE ROLE _haven_raw__schema;

USE ROLE securityadmin;
GRANT USAGE ON DATABASE haven_raw TO ROLE _haven_raw__usage;
GRANT USAGE ON future SCHEMAS IN DATABASE haven_raw TO ROLE _haven_raw__usage;
GRANT ROLE _haven_raw__usage TO ROLE _haven_raw__schema;
GRANT CREATE SCHEMA ON DATABASE haven_raw TO ROLE _haven_raw__schema;
GRANT SELECT ON future TABLES IN DATABASE haven_raw TO ROLE _haven_raw__usage;
GRANT SELECT ON future VIEWS IN DATABASE haven_raw TO ROLE _haven_raw__usage;
GRANT SELECT ON all VIEWS IN DATABASE haven_raw TO ROLE _haven_raw__usage;

-- 28/01/2025

USE ROLE useradmin;

ALTER USER haven_amplitude_integration
SET rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoC0YiiXBXtSLd94J1COJ
2vg9Du4TLcYXrxIUrrkOT9szi7Vf54AocGuNS/r6ZTiHmKtYNLw7Jnd2P8CA1sZ8
UShamal8+0Xlm6UhJ5UWaxeHP72rGQ5dHbQaWIPZc8NmEdV9SFtxlB5xN5hrXfjL
EtrOgbQfiifyCDhIWziQEP/wAIMiRQY+bzPfsf0FjF6XO1Zv0aLi+d6PqRs+TYUn
0BEb9dMeCn7YvW6KEFx9lyuKI4hrKrOmOqqtmW5yZf3t+GAt2iWIK9Yu6mvLVmic
rrCiwiqGNnuBMRw/7Bx/Ty9DVSeBderaTW3kKMaPWiHLaHKd1ROtkv0ez3/ajRQl
/QIDAQAB';

ALTER USER haven_amplitude_integration SET RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxPyCnhCo1iICtJq4Fx2mkfKuUacEGfi7jbRXysrJE/NA4R5V5bHhJvUBJDiaE9niSL6MdXnK0Er4ER3Ss4rWHBFbN5Db3ScJvs+f1xwGyMxI3l/wHzqokrKnTCrBLemIcuDCRfxxvGQWWe4Yz50zpVGENmEkbhk0sOx77JouEEfnReq9nU1fZqMYYNFIwrf5stJA3e58L9PO+zR8IlFwNjivHPtrUafH8sWagIQ0tpQv48zfcYVY2SBadKFVWcLKZsDORQG5s8BN7XvsoWorCE80QcG67sbZROdYEJ7y5UMVncS6YEqi1EO7QCKEKv9BYyauOaF9bmdVbOsfW3/XlwIDAQAB';

ALTER USER haven_amplitude_integration UNSET PASSWORD;