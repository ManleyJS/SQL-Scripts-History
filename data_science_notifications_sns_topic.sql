use ROLE accountadmin;

  
--  snowflake_role_arn = "arn:aws:iam::328265102953:role/DataScienceRoleForSnowflakeNotifications"
--  sns_topic_arn = "arn:aws:sns:eu-west-1:328265102953:data-science-notifications-sns-topic"

CREATE NOTIFICATION INTEGRATION data_science_notifications_sns_topic
  ENABLED = TRUE
  TYPE = QUEUE
  DIRECTION = OUTBOUND
  NOTIFICATION_PROVIDER = AWS_SNS
  AWS_SNS_ROLE_ARN = 'arn:aws:iam::328265102953:role/DataScienceRoleForSnowflakeNotifications'
  AWS_SNS_TOPIC_ARN = 'arn:aws:sns:eu-west-1:328265102953:data-science-notifications-sns-topic';

desc integration data_science_notifications_sns_topic;
  
use ROLE securityadmin;

GRANT USAGE ON integration data_science_notifications_sns_topic TO ROLE haven_rota_scheduling;

-- 18/09/2025

use ROLE accountadmin;

-- Align Alytics DBT production notification

-- snowflake_role_arn = "arn:aws:iam::328265102953:role/AlignAnalyticsRoleForSnowflakeNotifications"
-- sns_topic_arn = "arn:aws:sns:eu-west-1:328265102953:align-analytics-notifications-sns-topic"

CREATE NOTIFICATION INTEGRATION align_alytics_notifications_sns_topic
  ENABLED = TRUE
  TYPE = QUEUE
  DIRECTION = OUTBOUND
  NOTIFICATION_PROVIDER = AWS_SNS
  AWS_SNS_ROLE_ARN = 'arn:aws:iam::328265102953:role/AlignAnalyticsRoleForSnowflakeNotifications'
  AWS_SNS_TOPIC_ARN = 'arn:aws:sns:eu-west-1:328265102953:align-analytics-notifications-sns-topic';

DESC integration align_alytics_notifications_sns_topic;

use ROLE securityadmin;

-- 24/09/2025

use ROLE accountadmin;

-- Align Alytics DBT development notification

-- dev_align_analytics_snowflake_role_arn = "arn:aws:iam::328265102953:role/AlignAnalyticsDEVRoleForSnowflakeNotifications"
-- dev_align_analytics_sns_topic_arn = "arn:aws:sns:eu-west-1:328265102953:dev_align-analytics-notifications-sns-topic"

CREATE NOTIFICATION INTEGRATION align_alytics_dev_notifications_sns_topic
  ENABLED = TRUE
  TYPE = QUEUE
  DIRECTION = OUTBOUND
  NOTIFICATION_PROVIDER = AWS_SNS
  AWS_SNS_ROLE_ARN = 'arn:aws:iam::328265102953:role/AlignAnalyticsDEVRoleForSnowflakeNotifications'
  AWS_SNS_TOPIC_ARN = 'arn:aws:sns:eu-west-1:328265102953:dev_align-analytics-notifications-sns-topic';

DESC integration align_alytics_dev_notifications_sns_topic;

USE ROLE SECURITYADMIN;

GRANT USAGE ON INTEGRATION align_alytics_notifications_sns_topic TO ROLE HAVEN_DBT_TRANSFORM; 
GRANT USAGE ON INTEGRATION align_alytics_dev_notifications_sns_topic TO ROLE HAVEN_DBT_TRANSFORM_ALIGN_ALYTICS_DEV;



--------------------

use ROLE accountadmin;

-- Align Alytics DBT development notification

-- 
-- 

CREATE NOTIFICATION INTEGRATION align_alytics_dev_notifications_sns_topic
  ENABLED = TRUE
  TYPE = QUEUE
  DIRECTION = OUTBOUND
  NOTIFICATION_PROVIDER = AWS_SNS
  AWS_SNS_ROLE_ARN = ''
  AWS_SNS_TOPIC_ARN = '';

DESC integration align_alytics_dev_notifications_sns_topic;
