USE ROLE sysadmin;

CREATE WAREHOUSE caravan_portal_replacement_evaluation_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _caravan_portal_replacement_evaluation_xsmall__operator;
create role _caravan_portal_replacement_evaluation_xsmall__usage;

CREATE ROLE caravan_portal_replacement_evaluation;
create ROLE  _caravan_portal_replacement_evaluation__haven_base__plot__reader;

USE ROLE securityadmin;

grant usage, monitor on warehouse caravan_portal_replacement_evaluation_xsmall to role _caravan_portal_replacement_evaluation_xsmall__usage;
grant role _caravan_portal_replacement_evaluation_xsmall__usage to role _caravan_portal_replacement_evaluation_xsmall__operator;
grant operate, modify on warehouse caravan_portal_replacement_evaluation_xsmall to role _caravan_portal_replacement_evaluation_xsmall__operator;

GRANT role _caravan_portal_replacement_evaluation_xsmall__usage TO ROLE caravan_portal_replacement_evaluation;

GRANT ROLE _haven_base__plot__usage TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;

GRANT SELECT ON VIEW HAVEN_BASE.PLOT.JOBS TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.JOB_DETAILS TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader; 
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.JOB_TYPE_CAT_TASKS TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.JOB_TYPE_CATS TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.VANS TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.PITCHES TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.PITCH_STATUSES TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.PARKS TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.AREAS TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.ZONES TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.JOB_REPORTER_ROLES TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.JOB_PROCESS_STATUSES TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.JOB_TEAMS TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;
GRANT SELECT ON VIEW HAVEN_BASE.PLOT.JOB_TECHNICIANS TO ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader;

GRANT ROLE _caravan_portal_replacement_evaluation__haven_base__plot__reader TO ROLE caravan_portal_replacement_evaluation;
GRANT ROLE caravan_portal_replacement_evaluation TO ROLE dba;


USE ROLE caravan_portal_replacement_evaluation;
USE WAREHOUSE caravan_portal_replacement_evaluation_xsmall;


SELECT DISTINCT
     J.JOB_NO                                                   AS JobNumber
    ,J.created_dt                                               AS LogDate
    ,J.created_by                                               AS LoggedBy
    ,J.edit_dt                                                  AS EditDate
    ,J.EDIT_BY                                                  AS EditBy
    ,Ifnull(JC.JOB_TYPE_CAT_DESC,'Non Standard')                AS JobCategory
    ,JD.JOB_DETAIL_TEXT                                         AS JobDescription
    ,PS.PITCH_STATUS_CODE                                       AS PitchStatus
    ,CONCAT(PA.PARK_CODE,A.AREA_CODE,Z.ZONE_CODE,P.PITCH_NO)    AS Pitch
    ,RR.JOB_REPORTER_ROLE_DESCRIPTION                           AS ReportedBy
    ,J.REPORTED_BY_CONTACT_NO                                   AS ReportedNumber
    ,J.REPORTED_BY_NAME                                         AS ReportedName
    ,PSt.JOB_PROCESS_STATUS_DESC                                AS JobStatus
    ,Ifnull(JT.JOB_TEAM_DESC,'Unallocated')                     AS AllocatedTo
    ,Ifnull(JTEC.NAME,'Unallocated')                            AS AssignedTo
    ,JD.JOB_DUE_DATE                                            AS JobDueDate
    ,JD.JOB_DONE_DT                                             AS JobDoneDate
    ,DATEDIFF(day,JD.JOB_DUE_DATE,JD.JOB_DONE_DT)               AS SLADiff
FROM 
HAVEN_BASE.PLOT.JOBS J
JOIN HAVEN_BASE.PLOT.JOB_DETAILS JD             ON JD.JOB_ID                =   J.JOB_ID
LEFT JOIN HAVEN_BASE.PLOT.JOB_TYPE_CAT_TASKS JCT ON JCT.JOB_TYPE_CAT_TASK_ID    =   JD.JOB_TYPE_CAT_TASK_ID
LEFT JOIN HAVEN_BASE.PLOT.JOB_TYPE_CATS JC           ON JC.JOB_TYPE_CAT_ID       =   JCT.JOB_TYPE_CAT_ID
LEFT JOIN HAVEN_BASE.PLOT.VANS V                ON V.VAN_ID                 =   J.VAN_ID
LEFT JOIN HAVEN_BASE.PLOT.PITCHES P             ON P.VAN_ID                 =   V.VAN_ID
LEFT JOIN HAVEN_BASE.PLOT.PITCH_STATUSES PS     ON PS.PITCH_STATUS_ENUM     =   P.PITCH_STATUS_ENUM
LEFT JOIN HAVEN_BASE.PLOT.PARKS PA              ON PA.PARK_ID               =   V.PARK_ID
LEFT JOIN HAVEN_BASE.PLOT.AREAS A               ON A.AREA_ID                =   P.AREA_ID
LEFT JOIN HAVEN_BASE.PLOT.ZONES Z               ON Z.ZONE_ID                =   P.ZONE_ID
LEFT JOIN HAVEN_BASE.PLOT.JOB_REPORTER_ROLES RR ON RR.JOB_REPORTER_ROLE_ID  =   J.JOB_REPORTER_ROLE_ID
LEFT JOIN HAVEN_BASE.PLOT.JOB_PROCESS_STATUSES PSt  ON PSt.JOB_PROCESS_STATUS_ENUM  =   JD.JOB_PROCESS_STATUS_ENUM
LEFT JOIN HAVEN_BASE.PLOT.JOB_TEAMS JT          ON JT.JOB_TEAM_ENUM         =   JD.ALLOC_JOB_TEAM_ENUM
LEFT JOIN HAVEN_BASE.PLOT.JOB_TECHNICIANS JTEC  ON JTEC.JOB_TECHNICIAN_ID   =   JD.ASSIGNED_TO_TECHNICIAN_ID
WHERE   
    TO_DATE(J.CREATED_DT) > CURRENT_DATE - 370
    AND TO_DATE(J.CREATED_DT) <= CURRENT_DATE
    AND JC.JOB_TYPE_CAT_DESC IS NOT NULL;
    
USE ROLE useradmin;

SHOW USERS LIKE '%domo%';

ALTER USER DOMO_SERVICE_ACCOUNT
SET default_role = caravan_portal_replacement_evaluation,
default_warehouse = caravan_portal_replacement_evaluation_xsmall
default_namespace = haven_base.PLOT;

USE ROLE securityadmin;

REVOKE ROLE haven_commercial FROM USER DOMO_SERVICE_ACCOUNT; 
GRANT ROLE caravan_portal_replacement_evaluation TO USER DOMO_SERVICE_ACCOUNT;

GRANT ROLE caravan_portal_replacement_evaluation TO USER donovanransome;

--03/06/2024

create USER sigma_demo_user
LOGIN_NAME = sigma.demo.user
email = 'jonathan.manley@bourne-leisure.co.uk'
display_name = 'Sigma Demo User'
comment = 'Sigma Demo User Account'
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvIIBHNQwKAFkyB9rZQtc
lA9rt1J6l5qM11BCt9jDB8ReUpBX0vlbjgS7L982SDjCk5CzfQSfwngWQiCM30ZK
V3KTE7pAdvl1Y5yIXWLyFvFCac4n6hmHavkmb6ptjfUKgA3KDR5N/ULYVuT9nYCR
/sJJkpLLDsGNQiMqAG2qUOLgCMqqQkVilNFPy47gpCQzGDbcxI3Lch+RWvHcfPtN
KfSz9/v3pPmPeXlCTBhHl9gQc2mz6ikbPwj3S6lmnvJikjNb2JRn/EU6K7DNpx/j
OpXhgUDRNxhvBIUM7By6gQwnNPKJ7t7w4xtkl+yQs872qs1wosqZAzXz2eRU24co
XwIDAQAB'
default_role = caravan_portal_replacement_evaluation
default_warehouse = caravan_portal_replacement_evaluation_xsmall
default_namespace = haven_base.PLOT
;
--sigma_demo_passphrase

GRANT ROLE caravan_portal_replacement_evaluation TO USER sigma_demo_user;

USE ROLE sysadmin;

SHOW DATABASES;

SHOW ROLES LIKE '%haven_test%';

USE ROLE useradmin;
CREATE ROLE caravan_portal_replacement_evaluation_sigma;

USE ROLE securityadmin;
GRANT ROLE _haven_test__sigma_work__creator TO role caravan_portal_replacement_evaluation_sigma;
GRANT role caravan_portal_replacement_evaluation TO ROLE caravan_portal_replacement_evaluation_sigma;
GRANT ROLE caravan_portal_replacement_evaluation_sigma TO USER sigma_demo_user;

GRANT ROLE caravan_portal_replacement_evaluation_sigma TO ROLE dba;
USE ROLE caravan_portal_replacement_evaluation_sigma;

