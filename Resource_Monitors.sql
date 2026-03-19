use role accountadmin;

alter warehouse BOURNE_CDC_DATALOAD_XSMALL resume if suspended;

show resource monitors;

alter resource monitor HVR_CDC_RESOURCE_MONITOR set credit_quota = 3000;
alter resource monitor BOURNE_ACCOUNT_RESOURCE_MONITOR set credit_quota = 5000;
