use role haven_etleap_dataload;

use schema haven_raw.coupa_etleap;

desc table "INVOICES_invoice-lines";

select * from "INVOICES_invoice-lines" limit 5;

-- 29/07/2025

select "value", parse_json("value") from "INVOICES_invoice-lines" limit 5;

with invoice_invoice_lines as (
select id as id, parse_json("value") as value from "INVOICES_invoice-lines" limit 500
)
select id, 
value:id as value_id,
value:"line-num" as value_line_num,
value:"created-at" as value_created_at,
value:"account-allocations" as value_account_allocations,
value:"created-by":email as value_created_by_email,
value:"created-by":fullname as value_created_by_fullname,
value:"order-line-commodity":id as value_order_line_commodity_id,
value:"order-line-commodity":name as value_order_line_commodity_name,
value:"order-line-commodity":"parent":name as value_order_line_commodity_parent_name,
value:"order-line-commodity":"parent":"parent":name as value_order_line_commodity_parent_parent_name,
value:"order-line-commodity":"parent":"parent":"parent":name as value_order_line_commodity_parent_parent_parent_name, 
value:description as value_description,   
value:price as value_price,
value:"tax-rate" as value_tax_rate,
value:quantity as value_quantity,      
value:"accounting-total" as value_accounting_total,
value:"tax-amount" as value_tax_amount,
value:"account":"segment-1" as value_account_segment_1,
value:"account":"segment-2" as value_account_segment_2,
value:"account":"segment-3" as value_account_segment_3,
value:"account":"segment-4" as value_account_segment_4,
value:"account":"segment-5" as value_account_segment_5,
value:"account":"segment-6" as value_account_segment_6,
value:status as value_status,
value:"contract-number" as value_contract_number,
value:"item":id as value_item_id,
value:"source-part-num" as value_source_part_num,
value:"po-number" as value_po_number,
value:"updated-at" as last_updated_ts
from invoice_invoice_lines;




with invoice_invoice_lines as (
select id as id, parse_json("value") as value from "INVOICES_invoice-lines"
)
select max(value:"updated-at")
from invoice_invoice_lines
;


select get_ddl('table', '"INVOICES_invoice-lines"');



select "value":id from "INVOICES_invoice-lines" limit 50;

create table INVOICES_invoice_lines (id number, value variant);

truncate table INVOICES_invoice_lines;

insert into INVOICES_invoice_lines select id, cast("value" as variant) from "INVOICES_invoice-lines" order by id limit 1000;

select * from INVOICES_invoice_lines;

select value from INVOICES_invoice_lines limit 50;

drop table INVOICES_invoice_lines;



with invoice_invoice_lines as (
select id as id, parse_json("value") as value from "INVOICES_invoice-lines" limit 500
)
select id, 
value:id as value_id,
value:"line-num" as value_line_num,
value:"created-at" as value_created_at,
value:"account-allocations" as value_account_allocations,
value:"created-by":email as value_created_by_email,
value:"created-by":fullname as value_created_by_fullname,
value:"order-line-commodity":id as value_order_line_commodity_id,
value:"order-line-commodity":name as value_order_line_commodity_name,
value:"order-line-commodity":"parent":name as value_order_line_commodity_parent_name,
value:"order-line-commodity":"parent":"parent":name as value_order_line_commodity_parent_parent_name,
value:"order-line-commodity":"parent":"parent":"parent":name as value_order_line_commodity_parent_parent_parent_name, 
value:description as value_description,   
value:price as value_price,
value:"tax-rate" as value_tax_rate,
value:quantity as value_quantity,      
value:"accounting-total" as value_accounting_total,
value:"tax-amount" as value_tax_amount,
value:"account":"segment-1" as value_account_segment_1,
value:"account":"segment-2" as value_account_segment_2,
value:"account":"segment-3" as value_account_segment_3,
value:"account":"segment-4" as value_account_segment_4,
value:"account":"segment-5" as value_account_segment_5,
value:"account":"segment-6" as value_account_segment_6,
value:status as value_status,
value:"contract-number" as value_contract_number,
value:"item":id as value_item_id,
value:"source-part-num" as value_source_part_num,
value:"po-number" as value_po_number,
value:"updated-at" as last_updated_ts
from invoice_invoice_lines;

with union_lines as (
select id, "value" from "INVOICES_invoice-lines" AT(TIMESTAMP => DATEADD(hours, -4, CURRENT_TIMESTAMP()))
union all
select id, "value" from "INVOICES_invoice-lines" AT(TIMESTAMP => DATEADD(hours, -2, CURRENT_TIMESTAMP()))
)
select id, "value" from union_lines
group by 1,2
having count(*) = 1;

select id, count(*) from "invoice_lines" where value_item_id is not null
group by 1 order by 1;


select * from "INVOICES_invoice-lines"
where id = 4045736;

with changed_invoices as (
select a.id as id, parse_json(a."value") as value
from "INVOICES_invoice-lines" a
inner join INVOICES b
on a.id = b.id
where b."updated-at" > '2025-07-29 12:00:00')
select id, 
value:id as value_id,
value:"line-num" as value_line_num,
value:"created-at" as value_created_at,
value:"account-allocations" as value_account_allocations,
value:"created-by":email as value_created_by_email,
value:"created-by":fullname as value_created_by_fullname,
value:"order-line-commodity":id as value_order_line_commodity_id,
value:"order-line-commodity":name as value_order_line_commodity_name,
value:"order-line-commodity":"parent":name as value_order_line_commodity_parent_name,
value:"order-line-commodity":"parent":"parent":name as value_order_line_commodity_parent_parent_name,
value:"order-line-commodity":"parent":"parent":"parent":name as value_order_line_commodity_parent_parent_parent_name, 
value:description as value_description,   
value:price as value_price,
value:"tax-rate" as value_tax_rate,
value:quantity as value_quantity,      
value:"accounting-total" as value_accounting_total,
value:"tax-amount" as value_tax_amount,
value:"account":"segment-1" as value_account_segment_1,
value:"account":"segment-2" as value_account_segment_2,
value:"account":"segment-3" as value_account_segment_3,
value:"account":"segment-4" as value_account_segment_4,
value:"account":"segment-5" as value_account_segment_5,
value:"account":"segment-6" as value_account_segment_6,
value:status as value_status,
value:"contract-number" as value_contract_number,
value:"item":id as value_item_id,
value:"source-part-num" as value_source_part_num,
value:"po-number" as value_po_number,
value:"updated-at" as last_updated_ts
from changed_invoices;
