use role haven_etleap_dataload;
use warehouse haven_etleap_dataload_warehouse_xsmall;

use schema haven_raw.coupa_etleap;

show tables like '%invoice%';

alter table "INVOICES" rename to "INVOICES_0701225";
alter table "INVOICES_account-type_primary-contact_purposes" rename to "INVOICES_account-type_primary-contact_purposes_0701225";
alter table "INVOICES_approvals" rename to "INVOICES_approvals_0701225";
alter table "INVOICES_attachments" rename to "INVOICES_attachments_0701225";
alter table "INVOICES_contract_content-groups" rename to "INVOICES_contract_content-groups_0701225";
alter table "INVOICES_contract_contract-clauses" rename to "INVOICES_contract_contract-clauses_0701225";
alter table "INVOICES_contract_contract-parties" rename to "INVOICES_contract_contract-parties_0701225";
alter table "INVOICES_contract_contract-terms" rename to "INVOICES_contract_contract-terms_0701225";
alter table "INVOICES_contract_current-parallel-approvals" rename to "INVOICES_contract_current-parallel-approvals_0701225";
alter table "INVOICES_contract_diversity-categories" rename to "INVOICES_contract_diversity-categories_0701225";
alter table "INVOICES_contract_reason-insight-events" rename to "INVOICES_contract_reason-insight-events_0701225";
alter table "INVOICES_contract_supplier_primary-contact_purposes" rename to "INVOICES_contract_supplier_primary-contact_purposes_0701225";
alter table "INVOICES_contract_taggings" rename to "INVOICES_contract_taggings_0701225";
alter table "INVOICES_contract_tags" rename to "INVOICES_contract_tags_0701225";
alter table "INVOICES_current-integration-history-records" rename to "INVOICES_current-integration-history-records_0701225";
alter table "INVOICES_dispute-reasons" rename to "INVOICES_dispute-reasons_0701225";
alter table "INVOICES_failed-tolerances" rename to "INVOICES_failed-tolerances_0701225";
alter table "INVOICES_invoice-charges" rename to "INVOICES_invoice-charges_0701225";
alter table "INVOICES_invoice-lines" rename to "INVOICES_invoice-lines_0701225";
alter table "INVOICES_invoice-payment-receipts" rename to "INVOICES_invoice-payment-receipts_0701225";
alter table "INVOICES_pay-invoice_payment-term_content-groups" rename to "INVOICES_pay-invoice_payment-term_content-groups_0701225";
alter table "INVOICES_pay-invoice_received-allocations" rename to "INVOICES_pay-invoice_received-allocations_0701225";
alter table "INVOICES_pay-invoice_reconciliation-lines" rename to "INVOICES_pay-invoice_reconciliation-lines_0701225";
alter table "INVOICES_pay-invoice_sent-allocations" rename to "INVOICES_pay-invoice_sent-allocations_0701225";
alter table "INVOICES_payment-agreement-notes" rename to "INVOICES_payment-agreement-notes_0701225";
alter table "INVOICES_payment-term_content-groups" rename to "INVOICES_payment-term_content-groups_0701225";
alter table "INVOICES_payments" rename to "INVOICES_payments_0701225";
alter table "INVOICES_supplier_primary-contact_purposes" rename to "INVOICES_supplier_primary-contact_purposes_0701225";
alter table "INVOICES_taggings" rename to "INVOICES_taggings_0701225";
alter table "INVOICES_tags" rename to "INVOICES_tags_0701225";
alter table "INVOICES_tax-lines" rename to "INVOICES_tax-lines_0701225";
alter table "INVOICES_tcs-tax-lines" rename to "INVOICES_tcs-tax-lines_0701225";
alter table "INVOICES_withholding-tax-lines" rename to "INVOICES_withholding-tax-lines_0701225";

show tables;

alter table "PURCHASE_ORDERS_LINES" rename to "PURCHASE_ORDERS_LINES_0701225";
alter table "PURCHASE_ORDERS_LINES_account-allocations" rename to "PURCHASE_ORDERS_LINES_account-allocations_0701225";
alter table "PURCHASE_ORDERS_LINES_account_account-type_primary-contact_purposes" rename to "PURCHASE_ORDERS_LINES_account_account-type_primary-contact_purposes_0701225";
alter table "PURCHASE_ORDERS_LINES_asset-tags" rename to "PURCHASE_ORDERS_LINES_asset-tags_0701225";
alter table "PURCHASE_ORDERS_LINES_attachments" rename to "PURCHASE_ORDERS_LINES_attachments_0701225";
alter table "PURCHASE_ORDERS_LINES_contract_content-groups" rename to "PURCHASE_ORDERS_LINES_contract_content-groups_0701225";
alter table "PURCHASE_ORDERS_LINES_contract_contract-clauses" rename to "PURCHASE_ORDERS_LINES_contract_contract-clauses_0701225";
alter table "PURCHASE_ORDERS_LINES_contract_contract-parties" rename to "PURCHASE_ORDERS_LINES_contract_contract-parties_0701225";
alter table "PURCHASE_ORDERS_LINES_contract_contract-terms" rename to "PURCHASE_ORDERS_LINES_contract_contract-terms_0701225";
alter table "PURCHASE_ORDERS_LINES_contract_current-parallel-approvals" rename to "PURCHASE_ORDERS_LINES_contract_current-parallel-approvals_0701225";
alter table "PURCHASE_ORDERS_LINES_contract_diversity-categories" rename to "PURCHASE_ORDERS_LINES_contract_diversity-categories_0701225";
alter table "PURCHASE_ORDERS_LINES_contract_reason-insight-events" rename to "PURCHASE_ORDERS_LINES_contract_reason-insight-events_0701225";
alter table "PURCHASE_ORDERS_LINES_contract_supplier_primary-contact_purposes" rename to "PURCHASE_ORDERS_LINES_contract_supplier_primary-contact_purposes_0701225";
alter table "PURCHASE_ORDERS_LINES_contract_taggings" rename to "PURCHASE_ORDERS_LINES_contract_taggings_0701225";
alter table "PURCHASE_ORDERS_LINES_contract_tags" rename to "PURCHASE_ORDERS_LINES_contract_tags_0701225";
alter table "PURCHASE_ORDERS_LINES_milestones" rename to "PURCHASE_ORDERS_LINES_milestones_0701225";
alter table "PURCHASE_ORDERS_LINES_recurring-rules" rename to "PURCHASE_ORDERS_LINES_recurring-rules_0701225";
alter table "PURCHASE_ORDERS_LINES_supplier_primary-contact_purposes" rename to "PURCHASE_ORDERS_LINES_supplier_primary-contact_purposes_0701225";

-- 08/01/2025

alter table "PURCHASE_ORDERS_LINES" rename to "PURCHASE_ORDERS_LINES_0801225";
alter table "PURCHASE_ORDERS_LINES_account-allocations" rename to "PURCHASE_ORDERS_LINES_account-allocations_0801225";
alter table "PURCHASE_ORDERS_LINES_account_account-type_primary-contact_purposes" rename to "PURCHASE_ORDERS_LINES_account_account-type_primary-contact_purposes_0801225";
alter table "PURCHASE_ORDERS_LINES_asset-tags" rename to "PURCHASE_ORDERS_LINES_asset-tags_0801225";
alter table "PURCHASE_ORDERS_LINES_attachments" rename to "PURCHASE_ORDERS_LINES_attachments_0801225";
alter table "PURCHASE_ORDERS_LINES_contract_content-groups" rename to "PURCHASE_ORDERS_LINES_contract_content-groups_0801225";
alter table "PURCHASE_ORDERS_LINES_contract_contract-clauses" rename to "PURCHASE_ORDERS_LINES_contract_contract-clauses_0801225";
alter table "PURCHASE_ORDERS_LINES_contract_contract-parties" rename to "PURCHASE_ORDERS_LINES_contract_contract-parties_0801225";
alter table "PURCHASE_ORDERS_LINES_contract_contract-terms" rename to "PURCHASE_ORDERS_LINES_contract_contract-terms_0801225";
alter table "PURCHASE_ORDERS_LINES_contract_current-parallel-approvals" rename to "PURCHASE_ORDERS_LINES_contract_current-parallel-approvals_0801225";
alter table "PURCHASE_ORDERS_LINES_contract_diversity-categories" rename to "PURCHASE_ORDERS_LINES_contract_diversity-categories_0801225";
alter table "PURCHASE_ORDERS_LINES_contract_reason-insight-events" rename to "PURCHASE_ORDERS_LINES_contract_reason-insight-events_0801225";
alter table "PURCHASE_ORDERS_LINES_contract_supplier_primary-contact_purposes" rename to "PURCHASE_ORDERS_LINES_contract_supplier_primary-contact_purposes_0801225";
alter table "PURCHASE_ORDERS_LINES_contract_taggings" rename to "PURCHASE_ORDERS_LINES_contract_taggings_0801225";
alter table "PURCHASE_ORDERS_LINES_contract_tags" rename to "PURCHASE_ORDERS_LINES_contract_tags_0801225";
alter table "PURCHASE_ORDERS_LINES_milestones" rename to "PURCHASE_ORDERS_LINES_milestones_0801225";
alter table "PURCHASE_ORDERS_LINES_recurring-rules" rename to "PURCHASE_ORDERS_LINES_recurring-rules_0801225";
alter table "PURCHASE_ORDERS_LINES_supplier_primary-contact_purposes" rename to "PURCHASE_ORDERS_LINES_supplier_primary-contact_purposes_0801225";

-- 13/01/2025

alter table "INVOICES" rename to "INVOICES_13012025";
alter table "INVOICES_account-type_primary-contact_purposes" rename to "INVOICES_account-type_primary-contact_purposes_13012025";
alter table "INVOICES_approvals" rename to "INVOICES_approvals_13012025";
alter table "INVOICES_attachments" rename to "INVOICES_attachments_13012025";
alter table "INVOICES_contract_content-groups" rename to "INVOICES_contract_content-groups_13012025";
alter table "INVOICES_contract_contract-clauses" rename to "INVOICES_contract_contract-clauses_13012025";
alter table "INVOICES_contract_contract-parties" rename to "INVOICES_contract_contract-parties_13012025";
alter table "INVOICES_contract_contract-terms" rename to "INVOICES_contract_contract-terms_13012025";
alter table "INVOICES_contract_current-parallel-approvals" rename to "INVOICES_contract_current-parallel-approvals_13012025";
alter table "INVOICES_contract_diversity-categories" rename to "INVOICES_contract_diversity-categories_13012025";
alter table "INVOICES_contract_reason-insight-events" rename to "INVOICES_contract_reason-insight-events_13012025";
--alter table "INVOICES_contract_supplier_primary-contact_purposes" rename to "INVOICES_contract_supplier_primary-contact_purposes_13012025";
alter table "INVOICES_contract_taggings" rename to "INVOICES_contract_taggings_13012025";
alter table "INVOICES_contract_tags" rename to "INVOICES_contract_tags_13012025";
alter table "INVOICES_current-integration-history-records" rename to "INVOICES_current-integration-history-records_13012025";
alter table "INVOICES_dispute-reasons" rename to "INVOICES_dispute-reasons_13012025";
alter table "INVOICES_failed-tolerances" rename to "INVOICES_failed-tolerances_13012025";
alter table "INVOICES_invoice-charges" rename to "INVOICES_invoice-charges_13012025";
alter table "INVOICES_invoice-lines" rename to "INVOICES_invoice-lines_13012025";
alter table "INVOICES_invoice-payment-receipts" rename to "INVOICES_invoice-payment-receipts_13012025";
alter table "INVOICES_pay-invoice_payment-term_content-groups" rename to "INVOICES_pay-invoice_payment-term_content-groups_13012025";
alter table "INVOICES_pay-invoice_received-allocations" rename to "INVOICES_pay-invoice_received-allocations_13012025";
alter table "INVOICES_pay-invoice_reconciliation-lines" rename to "INVOICES_pay-invoice_reconciliation-lines_13012025";
alter table "INVOICES_pay-invoice_sent-allocations" rename to "INVOICES_pay-invoice_sent-allocations_13012025";
alter table "INVOICES_payment-agreement-notes" rename to "INVOICES_payment-agreement-notes_13012025";
alter table "INVOICES_payment-term_content-groups" rename to "INVOICES_payment-term_content-groups_13012025";
alter table "INVOICES_payments" rename to "INVOICES_payments_13012025";
alter table "INVOICES_supplier_primary-contact_purposes" rename to "INVOICES_supplier_primary-contact_purposes_13012025";
alter table "INVOICES_taggings" rename to "INVOICES_taggings_13012025";
alter table "INVOICES_tags" rename to "INVOICES_tags_13012025";
alter table "INVOICES_tax-lines" rename to "INVOICES_tax-lines_13012025";
alter table "INVOICES_tcs-tax-lines" rename to "INVOICES_tcs-tax-lines_13012025";
alter table "INVOICES_withholding-tax-lines" rename to "INVOICES_withholding-tax-lines_13012025";


alter table "PURCHASE_ORDERS_LINES" rename to "PURCHASE_ORDERS_LINES_13012025";
alter table "PURCHASE_ORDERS_LINES_account-allocations" rename to "PURCHASE_ORDERS_LINES_account-allocations_13012025";
alter table "PURCHASE_ORDERS_LINES_account_account-type_primary-contact_purposes" rename to "PURCHASE_ORDERS_LINES_account_account-type_primary-contact_purposes_13012025";
alter table "PURCHASE_ORDERS_LINES_asset-tags" rename to "PURCHASE_ORDERS_LINES_asset-tags_13012025";
alter table "PURCHASE_ORDERS_LINES_attachments" rename to "PURCHASE_ORDERS_LINES_attachments_13012025";
alter table "PURCHASE_ORDERS_LINES_contract_content-groups" rename to "PURCHASE_ORDERS_LINES_contract_content-groups_13012025";
alter table "PURCHASE_ORDERS_LINES_contract_contract-clauses" rename to "PURCHASE_ORDERS_LINES_contract_contract-clauses_13012025";
alter table "PURCHASE_ORDERS_LINES_contract_contract-parties" rename to "PURCHASE_ORDERS_LINES_contract_contract-parties_13012025";
alter table "PURCHASE_ORDERS_LINES_contract_contract-terms" rename to "PURCHASE_ORDERS_LINES_contract_contract-terms_13012025";
alter table "PURCHASE_ORDERS_LINES_contract_current-parallel-approvals" rename to "PURCHASE_ORDERS_LINES_contract_current-parallel-approvals_13012025";
alter table "PURCHASE_ORDERS_LINES_contract_diversity-categories" rename to "PURCHASE_ORDERS_LINES_contract_diversity-categories_13012025";
alter table "PURCHASE_ORDERS_LINES_contract_reason-insight-events" rename to "PURCHASE_ORDERS_LINES_contract_reason-insight-events_13012025";
alter table "PURCHASE_ORDERS_LINES_contract_supplier_primary-contact_purposes" rename to "PURCHASE_ORDERS_LINES_contract_supplier_primary-contact_purposes_13012025";
alter table "PURCHASE_ORDERS_LINES_contract_taggings" rename to "PURCHASE_ORDERS_LINES_contract_taggings_13012025";
alter table "PURCHASE_ORDERS_LINES_contract_tags" rename to "PURCHASE_ORDERS_LINES_contract_tags_13012025";
alter table "PURCHASE_ORDERS_LINES_milestones" rename to "PURCHASE_ORDERS_LINES_milestones_13012025";
alter table "PURCHASE_ORDERS_LINES_recurring-rules" rename to "PURCHASE_ORDERS_LINES_recurring-rules_13012025";
alter table "PURCHASE_ORDERS_LINES_supplier_primary-contact_purposes" rename to "PURCHASE_ORDERS_LINES_supplier_primary-contact_purposes_13012025";






