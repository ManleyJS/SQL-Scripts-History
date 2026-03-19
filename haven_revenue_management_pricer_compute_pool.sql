use ROLE accountadmin;

CREATE COMPUTE POOL IF NOT EXISTS 
haven_revenue_management_pricer_compute_pool_highmem_small
    MIN_NODES = 1
    MAX_NODES = 1
    INSTANCE_FAMILY = 'HIGHMEM_X64_S'
    AUTO_RESUME = TRUE
	INITIALLY_SUSPENDED = TRUE
	AUTO_SUSPEND_SECS = 60;

use role useradmin;

create role _haven_revenue_management_pricer_compute_pool_highmem_small__operator;
create role _haven_revenue_management_pricer_compute_pool_highmem_small__usage;

use ROLE securityadmin;

grant usage, monitor on compute pool haven_revenue_management_pricer_compute_pool_highmem_small TO ROLE _haven_revenue_management_pricer_compute_pool_highmem_small__usage;
grant operate, modify on compute pool haven_revenue_management_pricer_compute_pool_highmem_small TO ROLE _haven_revenue_management_pricer_compute_pool_highmem_small__operator;
GRANT ROLE _haven_revenue_management_pricer_compute_pool_highmem_small__usage TO ROLE _haven_revenue_management_pricer_compute_pool_highmem_small__operator;

GRANT ROLE 	 TO ROLE HAVEN_REVENUE_MANAGEMENT_PRICER;

use ROLE HAVEN_REVENUE_MANAGEMENT_PRICER;


SHOW warehouses;

SHOW compute pools;

use ROLE dba;

SHOW compute pools;