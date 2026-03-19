use role accountadmin;

show resource monitors;

alter resource monitor BOURNE_ACCOUNT_RESOURCE_MONITOR
set credit_quota = 8000;