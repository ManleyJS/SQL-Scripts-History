use ROLE dba;

use DATABASE haven_base;
use SCHEMA erpx;

show views LIKE '%ledger%';

use ROLE useradmin;

CREATE ROLE _haven_commercial__haven_base__erpx__reader;

use ROLE securityadmin;

GRANT SELECT ON VIEW haven_base.erpx.general_ledger_transactions TO ROLE _haven_commercial__haven_base__erpx__reader;

GRANT ROLE _haven_commercial__haven_base__erpx__reader TO ROLE haven_commercial;