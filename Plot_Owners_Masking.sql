use role dba;

use database haven_base;
use schema plot;

create masking policy temporary_mask_owner_details as (columnValue string) returns string ->
case 
    when is_role_in_session('DBA') then columnValue
else '########' 
END;

describe view haven_base.plot.owners;

alter view haven_base.plot.owners modify column web_activation_code set masking policy temporary_mask_owner_details;
alter view haven_base.plot.owners modify column web_password set masking policy temporary_mask_owner_details;

alter view haven_base.plot.owners_audit modify column web_activation_code set masking policy temporary_mask_owner_details;
alter view haven_base.plot.owners_audit modify column web_password set masking policy temporary_mask_owner_details;

use role haven_kpmg_analysis;

use role dba;

show grants to role haven_finance;
