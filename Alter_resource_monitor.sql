use role accountadmin;
alter resource monitor bourne_account_resource_monitor
set credit_quota = 12000
notify_users = (jonathanmanley, garyranson, donovanransome)
triggers on 80 percent do notify
    on 85 percent do notify
    on 90 percent do notify
    on 95 percent do notify
    on 100 percent do suspend_immediate;
