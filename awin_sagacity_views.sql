USE ROLE dba;

-- deploy in prod
create or replace view haven_base.awin.AWIN_TRANSACTIONS_DATA
( PAYLOAD, FILENAME, LOAD_TS )
AS SELECT PAYLOAD, FILENAME, LOAD_TS
FROM HAVEN_RAW.AWIN.AWIN_TRANSACTIONS_DATA;    

create or replace view haven_base.awin.AWIN_TRANSACTION_QUERIES_DATA 
( PAYLOAD, FILENAME, LOAD_TS )
AS SELECT PAYLOAD, FILENAME, LOAD_TS
FROM HAVEN_RAW.AWIN.AWIN_TRANSACTIONS_QUERIES_DATA;    

--- =============================================
    --
    -- transactions data view
    --
    --- =============================================
create
    or replace view haven_base.awin.awin_transactions as 
    (
        with booking_seware_c as (
            select
                rh.res_id,
                rh.res_status,
                rh.sail_date_from,
                rh.ship_code,
                acc.param_value invoice_total,
                rp.param_value as referral_source,
                rh.agency_id,
                ag.agency_name,
                sh.ship_name
            from
                haven_base.seaware.res_header rh
                join haven_base.seaware.ship sh on sh.ship_code = rh.ship_code
                join haven_base.seaware.agency ag on ag.agency_id = rh.agency_id
                join haven_base.seaware.res_param rp on rp.res_id = rh.res_id
                and rp.param_code = 'REFERRAL_SOURCE'
                join haven_base.seaware.acc_invoice_detail acc on acc.entity_id = rh.res_id
                and entity_type = 'RES'
                and param_name = 'INVOICE_TOTAL'
        ),
        staged_c as (
            select
                aw.$1:id id,
                aw.$1:publisherId publisherId,
                aw.$1:siteName::string siteName,
                aw.$1:saleAmount:amount saleAmount,
                aw.$1:commissionAmount:amount commissionAmount,
                aw.$1:transactionParts [0] :trackedParts [0] :amount trackedParts_amount,
                aw.$1:transactionParts [0] :trackedParts [0] :code::string trackedParts_code,
                trackedParts_code || ':' || trackedParts_amount saleBreakdown,
                aw.$1:transactionParts [0] :trackedParts [0] :currency::string currency,
                aw.$1:orderRef::string orderref,
                aw.$1:transactionDate::string transactionDate,
                aw.load_ts --bk.*
            from
                haven_raw.awin.AWIN_TRANSACTIONS_DATA aw qualify row_number() over(
                    partition by orderref
                    order by
                        load_ts desc
                ) = 1
        )
        select
            s.id,
            s.publisherid,
            s.sitename,
            s.saleamount,
            bk.invoice_total,
            s.commissionamount,
            s.trackedparts_amount,
            s.trackedparts_code,
            s.salebreakdown,
            s.currency,
            bk.invoice_total - s.saleAmount price_difference,
            Case
                when abs(price_difference) > 10 then least(s.saleAmount, bk.invoice_total) *(
                    case
                        when s.trackedParts_code = 'OFF_PEAK' then 0.05
                        else 0.0267
                    end
                )
                else 0
            end CPA,
            Case
                when bk.res_status = 'CX'
                or bk.referral_source <> 'WEB_' then 'Declined'
                when bk.sail_date_from > sysdate() then 'Pending'
                when abs(price_difference) > 10 then 'AMENDED'
                Else 'Accepted'
            end transaction_status,
            s.orderref,
            s.transactiondate,
            bk.res_status,
            bk.sail_date_from arrival_date,
            bk.ship_code,
            bk.referral_source,
            bk.agency_id,
            bk.agency_name,
            bk.ship_name
        from
            staged_c s
            join booking_seware_c bk on bk.res_id = s.orderRef
    );
    --- =============================================
    --
    -- transaction queries view
    --
    --- =============================================
create
    or replace view haven_base.awin.awin_transaction_queries as 
    (
            with booking_seware_c as (
                select
                    rh.res_id,
                    rh.res_status,
                    rh.sail_date_from,
                    rh.ship_code,
                    acc.param_value invoice_total,
                    rp.param_value as referral_source,
                    rh.agency_id,
                    ag.agency_name,
                    sh.ship_name
                from
                    haven_base.seaware.res_header rh
                    join haven_base.seaware.ship sh on sh.ship_code = rh.ship_code
                    join haven_base.seaware.agency ag on ag.agency_id = rh.agency_id
                    join haven_base.seaware.res_param rp on rp.res_id = rh.res_id
                    and rp.param_code = 'REFERRAL_SOURCE'
                    join haven_base.seaware.acc_invoice_detail acc on acc.entity_id = rh.res_id
                    and entity_type = 'RES'
                    and param_name = 'INVOICE_TOTAL'
            ),
            tq as (
                select
                    $1:"ID"::STRING ID,
                    $1:"Publisher ID"::STRING publisher_id,
                    $1:"Publisher Name"::STRING publisher_name,
                    $1:"Enquiry Type"::STRING enquiry_type,
                    $1:"Sale Amount"::STRING sale_amount,
                    $1:"Commission"::STRING commission,
                    to_timestamp($1:"Sale Date"::STRING, 'DD/MM/YYYY HH24:MI') sale_date,
                    $1:"Order Reference"::STRING order_reference,
                    $1:"Description"::STRING description,
                    $1:"Auto-Validation (days)"::STRING auto_validation_in_days,
                    $1:"Status (accepted/declined)"::STRING status,
                    $1:"Decline Reason"::STRING decline_reason,
                    $1:"Duplicate"::STRING duplicate_flag,
                    $1:"Enquiry ID"::STRING enquiry_id,
                    to_timestamp($1:"Upload Date"::STRING, 'DD/MM/YYYY HH24:MI') upload_date,
                    filename,
                    load_ts
                from
                    HAVEN_RAW.AWIN.AWIN_TRANSACTIONS_QUERIES_DATA qualify row_number() over(
                        partition by order_reference
                        order by
                            load_ts desc
                    ) = 1
            )
        select
            *
        from
            tq tq
            left join booking_seware_c s on s.res_id = tq.order_reference
    );
	
create or replace view haven_base.sagacity.SOCIO_ECONOMIC_DATA 
( SOURCE_SYSTEM_NAME, SOURCE_SYSTEM_ID, ADDRESS_LINE1, ADDRESS_LINE2, ADDRESS_LINE3, ADDRESS_LINE4, ADDRESS_LINE5, COUNTRY_CODE, POSTCODE, SOCIO_ECONOMIC_SEGMENT_CODE, FILENAME, LOAD_TS )
AS SELECT SOURCE_SYSTEM_NAME, SOURCE_SYSTEM_ID, ADDRESS_LINE1, ADDRESS_LINE2, ADDRESS_LINE3, ADDRESS_LINE4, ADDRESS_LINE5, COUNTRY_CODE, POSTCODE, SOCIO_ECONOMIC_SEGMENT_CODE, FILENAME, LOAD_TS
FROM HAVEN_RAW.SAGACITY.SOCIO_ECONOMIC_DATA;	