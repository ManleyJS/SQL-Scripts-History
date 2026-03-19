USE ROLE DBA;

USE SCHEMA HAVEN_STORE_AA_DEV.COMMERCIAL;



CREATE VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.BOOKINGS AS
SELECT PARKCODE, DATE_YYYY_MM_DD, REVENUE, "BOOKINGS.Date", "BOOKINGS.Date_YYYY_MM_DD", "BOOKINGS.ParkCode", "BOOKINGS.Arrival_Date_YYYY_MM_DD", "BOOKINGS.Holiday_Type", "BOOKINGS.Bookings", "BOOKINGS.Revenue", ARRIVAL_DATE_YYYY_MM_DD, HOLIDAY_TYPE, "DATE"
FROM HAVEN_RAW.BIGQUERY.TARGET_BOOKINGS;


create VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.BOOKING_IDS_BY_CHANNEL(
	DATE,
	CHANNEL,
	CHANNEL_LEVEL_2,
	CHANNEL_LEVEL_3,
	HOL_BOOKING_ID,
	REVENUE
) as 
SELECT DATE(BOOKING_ID_BY_CHANNEL_DATE), CHANNEL, CHANNEL_LEVEL_2, CHANNEL_LEVEL_3, HOL_BOOKING_ID, REVENUE
FROM HAVEN_BASE.BIGQUERY.BOOKING_IDS_BY_CHANNEL;

create OR replace VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.food_and_beverage_vouchers
(
    "BOOKING_ID" COMMENT $$$$, 
    "PARK_CODE" COMMENT $$$$, 
    "ARRIVAL_DATE" COMMENT $$$$, 
    "DEPARTURE_DATE" COMMENT $$$$, 
    "BOOKING_DATE" COMMENT $$$$, 
    "BOOKING_STATUS" COMMENT $$$$, 
    "HOLIDAY_YEAR" COMMENT $$$$, 
    "HOLIDAY_WEEK_NUMBER" COMMENT $$$$, 
    "VOUCHER_CODE" COMMENT $$$$, 
    "VOUCHER_VALUE" COMMENT $$$$, 
    "VOUCHER_FACE_VALUE" COMMENT $$$$, 
    "PURCHASE_DATE" COMMENT $$$$, 
    "PURCHASE_YEAR" COMMENT $$$$, 
    "PURCHASE_WEEK_NUMBER" COMMENT $$$$
)
  as (
with 
    c_addons as (
        select 
            aa.amenity_code voucher_code,
            (substr(aa.amenity_code,3,6)::number/100)::decimal(10,2) voucher_face_value
        from
            haven_base.seaware.am_code aa
        where
            aa.amenity_code rlike 'FB [0-9]+' and 
            aa.am_category = 'RMISC'
    ),
    c_vouchers as (
        select 
            ia.*,
            aa.voucher_code,
            aa.voucher_face_value
        from
            haven_base.seaware.res_invoice_item ia
        join
            c_addons aa
            on    aa.voucher_code = ia.invoice_item_subtype3
        where
            ia.invoice_item_subtype2 = 'ADDON' 
    ),
    c_timestamps as (
        select 
            ht.res_id,
            hv.field_value_new voucher_code,
            min(ht.trans_date)::date purchase_date
        from
            haven_base.seaware.res_hist_trans ht
        join
            haven_base.seaware.res_hist_value hv 
            on hv.trans_id = ht.trans_id
        where 
            hv.field_id = 'RES_ADDON_CODE' and
            ht.trans_date >= '2023-05-10T00:00:00'::timestamp and 
            hv.field_value_new in (select voucher_code from c_addons)
        group by
            ht.res_id,
            hv.field_value_new
    )
select
    rh.res_id booking_id,
    rh.ship_code park_code,
    rh.sail_date_from arrival_date,
    rh.sail_date_to departure_date,
    -- res_init_date is a quick and dirty - it should really be derived from the res_hist tables
    rh.res_init_date booking_date,
    rh.res_status booking_status,
    rc.year_number holiday_year,
    rc.week_number holiday_week_number,
    vv.voucher_code,
    vv.amount voucher_value,
    vv.voucher_face_value,
    nvl(ts.purchase_date, rh.res_init_date::date) purchase_date,
    nvl(r2.year_number, rc.year_number) purchase_year,
    nvl(r2.week_number, rc.week_number) purchase_week_number
from
    haven_base.seaware.res_header rh
join    
    c_vouchers vv 
    on   vv.res_id = rh.res_id
left join
    c_timestamps ts
    on ts.res_id = vv.res_id and
        ts.voucher_code = vv.voucher_code
join
    
    haven_store_aa_dev
.common.reporting_day_calendar rc
    on  rc.day_date = rh.sail_date_from
join
    haven_store_aa_dev
.common.reporting_day_calendar r2
    on  r2.day_date = ts.purchase_date
  );

create VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.HITS_HOL_SEARCH_RESULTS (
	DATE,
	PERIOD,
	VALID_SEARCH_RESULT_VIEWS_NO_RESULTS,
	VALID_SEARCH_RESULT_VIEWS,
	DAYS_TO_ARRIVAL,
	ARRIVAL_YEAR_FLAG,
	TOTAL_SEARCH_RESULT_VIEWS,
	PARK_CODE,
	PARK_NAME,
	DURATION,
	ARRIVAL_YEAR,
	PARK_COUNTRY,
	ARRIVAL_DAY_OF_WEEK,
	DURATION_GROUPED,
	VALID_SEARCH_RESULT_VIEWS_W_RESULTS,
	PARK_REGION,
	YEAR_PERIOD,
	WEEKS_TO_ARRIVAL,
	NUM_RESULTS_GROUPED,
	INVALID_SEARCH_RESULT_VIEWS,
	ARRIVAL_MONTH,
	ARRIVAL_DATE,
	HOLIDAY_TYPE
) AS
SELECT DATE(HITS_HOL_SEARCH_DATE), PERIOD, VALID_SEARCH_RESULT_VIEWS_NO_RESULTS, VALID_SEARCH_RESULT_VIEWS, 
DAYS_TO_ARRIVAL, ARRIVAL_YEAR_FLAG, TOTAL_SEARCH_RESULT_VIEWS, PARK_CODE, PARK_NAME, DURATION, 
ARRIVAL_YEAR, PARK_COUNTRY, ARRIVAL_DAY_OF_WEEK, DURATION_GROUPED, 
VALID_SEARCH_RESULT_VIEWS_W_RESULTS, PARK_REGION, YEAR_PERIOD, WEEKS_TO_ARRIVAL, 
NUM_RESULTS_GROUPED, INVALID_SEARCH_RESULT_VIEWS, ARRIVAL_MONTH, ARRIVAL_DATE, HOLIDAY_TYPE
FROM HAVEN_BASE.BIGQUERY.HITS_HOL_SEARCH_RESULTS;


create VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.HOLIDAY_SEARCHES(
	SEARCHES,
	DATE_YYYY_MM_DD,
	ARRIVAL_DATE_YYYY_MM_DD,
	HOLIDAY_TYPE,
	PARKNAME
) as
SELECT SEARCHES, DATE_YYYY_MM_DD, ARRIVAL_DATE_YYYY_MM_DD, HOLIDAY_TYPE, PARKNAME
FROM HAVEN_BASE.BIGQUERY.HOLIDAY_SEARCHES
;

create   VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.owners_summary
  
    
    
(
  
    "ACCOUNT_NO" COMMENT $$$$, 
  
    "PARK_CODE" COMMENT $$$$, 
  
    "ACCOUNT_ID" COMMENT $$$$, 
  
    "OWNER_ID" COMMENT $$$$, 
  
    "CSI_NO" COMMENT $$$$, 
  
    "FINANCE_AMOUNT" COMMENT $$$$, 
  
    "CURRENT_FINANCE" COMMENT $$$$, 
  
    "HTB_YN" COMMENT $$$$, 
  
    "HTB_STILL_ACTIVE_YN" COMMENT $$$$, 
  
    "LET_CY" COMMENT $$$$, 
  
    "LET_PY" COMMENT $$$$, 
  
    "LET_NY" COMMENT $$$$, 
  
    "LETTING_INCOME_CY" COMMENT $$$$, 
  
    "LETTING_INCOME_PY" COMMENT $$$$, 
  
    "TOTAL_LETTING_INCOME" COMMENT $$$$, 
  
    "TOTAL_NET_SITE_FEES" COMMENT $$$$, 
  
    "SF_CY_MINUS_THREE" COMMENT $$$$, 
  
    "SF_CY_MINUS_TWO" COMMENT $$$$, 
  
    "SF_CY_MINUS_ONE" COMMENT $$$$, 
  
    "SF_CY" COMMENT $$$$, 
  
    "SF_CY_PLUS_ONE" COMMENT $$$$, 
  
    "CURRENT_VAN_NEW" COMMENT $$$$, 
  
    "PARK_SHORT_DESC" COMMENT $$$$, 
  
    "SALE_ID" COMMENT $$$$, 
  
    "VAN_ID" COMMENT $$$$, 
  
    "JOINING_DT" COMMENT $$$$, 
  
    "VALIDATION_DATE" COMMENT $$$$, 
  
    "COMPLETION_DATE" COMMENT $$$$, 
  
    "NEW_OWNER_CY" COMMENT $$$$, 
  
    "PEX_CY" COMMENT $$$$, 
  
    "HAS_PEX_BEFORE" COMMENT $$$$, 
  
    "YEARS_OF_OWNERSHIP" COMMENT $$$$, 
  
    "OWNERSHIP_AGE_BAND" COMMENT $$$$, 
  
    "YEAR_MADE" COMMENT $$$$, 
  
    "MAKE" COMMENT $$$$, 
  
    "MODEL" COMMENT $$$$, 
  
    "POST_CODE" COMMENT $$$$, 
  
    "POSTAL_AREA" COMMENT $$$$, 
  
    "SALES_VALUE" COMMENT $$$$, 
  
    "LTV" COMMENT $$$$, 
  
    "TOTAL_VANS_HAD" COMMENT $$$$, 
  
    "CURRENT_VANS_OWNED_BY_OWNER" COMMENT $$$$, 
  
    "OWNER_TYPE" COMMENT $$$$, 
  
    "TOTAL_OWNER_SPEND" COMMENT $$$$, 
  
    "TOTAL_OWNER_SPEND_CY" COMMENT $$$$, 
  
    "TOTAL_OWNER_SPEND_CY_MINUS_ONE" COMMENT $$$$, 
  
    "TOTAL_OWNER_SPEND_CY_MINUS_TWO" COMMENT $$$$, 
  
    "TOTAL_OWNER_SPEND_CY_MINUS_MINUS_THREE" COMMENT $$$$
  
)

  copy grants as (
    
------------------------------- accounts, sales, vans and pitches -------------------------------
with
    c_account_details as (
        select
            aa.account_no,
            aa.account_id,
            aa.owner_id,
            iff(aa.owner_id_2 is not null, 'Multiple owner, ', 'Single owner, ') as total_owners_desc,
            aa.joining_dt,
            datediff(month, aa.joining_dt, current_date) months_of_ownership,
            floor(months_of_ownership/12)::int as years_of_ownership,
            aa.latest_sale_id
        from
            haven_base.plot.accounts aa
    ),
    c_sale_details as (
        select
            sale_id,
            account_id,
            csi_no,
            sale_status_enum,
            sale_type_enum,
            finance_amount,
            -- finance duration in months
            iff(nvl(finance_amount,0) > 0, years * 12, 0) as months_on_finance,
            -- months past since date sold (assuming finance started then)
            iff(nvl(finance_amount,0) > 0,
                datediff(month, date_sold, current_date),
            null) as months_pasted_since_finance,
            -- still on finance if months pasted since sold is < finance length
            iff(months_pasted_since_finance <= months_on_finance, 1, 0) as current_finance,
            validation_date,
            completion_date,
            year(date_sold) as year_sold,
            iff(year_sold = year(current_date) and
                sale_type_enum != 8,
                1, 0) as new_owner_cy,
            iff(year_sold = year(current_date)
                and sale_type_enum = 8,
                1, 0) as pex_cy,
            nvl(SVL_PRICE_SUB_TOTAL,0)
                - nvl(SVL_VAT_AMOUNT,0)
                - nvl(PEX1_DISCOUNT,0)
                - nvl(PEX2_DISCOUNT,0)
            AS sales_value,
            posting_master_id,
            row_number() over(partition by account_id order by sale_id desc) as sales_order
        from
            haven_base.plot.sales
        where
            cancellation_date is null and
            sale_status_enum = 3 and
            sale_type_enum != 6 -- offsite
    ),

    c_owner_pitches_and_vans as (
        select
            pk.park_code,
            pk.park_short_desc,
            pk.park_code || ar.area_code || zo.zone_code || pt.pitch_no as pitch_code,
            ps.pitch_status_code,
            va.account_id,
            va.van_id,
            va.make,
            va.model,
            va.year_made,
            va.new_yn as current_van_new
        from
            haven_base.plot.pitches pt
        join
            haven_base.plot.parks pk
            on pk.park_id = pt.park_id
        join
            haven_base.plot.areas ar
            on ar.area_id = pt.area_id
        join
            haven_base.plot.zones zo
            on zo.zone_id = pt.zone_id
        join
            haven_base.plot.pitch_statuses ps
            on ps.pitch_status_enum = pt.pitch_status_enum
        join
            haven_base.plot.vans va
            on va.van_id = pt.van_id
        where
            pitch_status_code in ('OW', 'TO', 'PX', 'PS', 'DF') and
            pk.deleted_yn = 0 and
            pk.park_code not in ('TG')
    ),

    c_base_output as (
        select
            ad.account_no,
            op.park_code,
            ad.account_id,
            ow.owner_id,
            ad.total_owners_desc,
            sd.csi_no,
            sd.finance_amount,
            sd.current_finance,
            op.current_van_new,
            op.park_short_desc,
            sd.sale_id,
            op.van_id,
            ad.joining_dt,
            sd.validation_date,
            sd.completion_date,
            sd.new_owner_cy,
            sd.pex_cy,
            ad.years_of_ownership,
            op.year_made,
            op.make,
            op.model,
            ow.post_code,
            regexp_substr(ow.POST_CODE,'^([a-z]+)[0-9]',1,1,'i', 1) as postal_area,
            sd.sales_value,
            posting_master_id
        from
            c_account_details ad
        join
            haven_base.plot.owners ow
            on ow.owner_id = ad.owner_id
        join
            c_owner_pitches_and_vans op
            on op.account_id = ad.account_id
        left join
            c_sale_details sd
            on sd.account_id = ad.account_id and
               sd.sales_order = 1 -- latest sale
        where
            (-- completed sale
                (sd.sale_status_enum = 3)
            or-- account is in pex status
                (op.pitch_status_code = 'px')
            or-- account does not have a sale
                (ad.latest_sale_id is null)
        )
    ),
    ------------------------------- vans currently owned by owner -------------------------------
    c_current_van_count_by_owner as (
        select
            owner_id,
            count(*) as current_vans_owned_by_owner,
            iff(current_vans_owned_by_owner = 1, 'one van', 'multiple vans') as miltiple_van_owner_desc
        from c_base_output
        group by owner_id
    ),
    ------------------------------- postings for site fees and sales -------------------------------
    c_postings as (
        select
            pd.account_1,
            pm.posting_master_id,
            pm.year_id,
            account_2,
            nvl(debit_amount, 0) - nvl(credit_amount, 0) as trans_total,
            pm.posting_type_enum,
            pd.nominal_code_enum
        from
            haven_base.plot.posting_detail pd
        join
            haven_base.plot.posting_master pm
            on pm.posting_master_id = pd.posting_master_id
        where
            posting_type_enum in (4, 5, 8) -- sales invoice, site fees, rent reduction
    ),
    ------------------------------- help to buy -------------------------------
    c_help_to_buy_final_year as (
        select
        posting_master_id,
        max(account_2) as final_htb_year
        from
        c_postings
        where
        nominal_code_enum = 75
        and
        account_2 rlike '^0-9{4}'
        group by
        posting_master_id
    ),
    ------------------------------- site fees -------------------------------
    c_site_fees_and_rent_reduct_stg as (
        select
            account_1,
            year_id,
            sum(
                    iff(posting_type_enum = 5, trans_total, 0)
            ) as site_fees,
            sum(
                    iff(posting_type_enum = 8, trans_total, 0)
            ) as rent_reduction,
            site_fees + rent_reduction as net_site_fees
        from c_postings cp
        where nominal_code_enum = 15 and
              posting_type_enum in (5,8)
        group by
            account_1,
            year_id
    ),

    c_lifetime_site_fees as (
        select
            account_1,
            sum(site_fees) as total_site_fees,
            sum(rent_reduction) as total_rent_reduction,
            sum(net_site_fees) as total_net_site_fees
        from
            c_site_fees_and_rent_reduct_stg
        group by
            account_1
    ),

    c_years as (
        select year_id,
               year_value
        from haven_base.plot.park_years py
        where year_value between year(current_date) -3 and year(current_date) +1
    ),

    c_site_fees_by_year as (
        select
            account_1,
            year_value,
            site_fees,
            rent_reduction,
            net_site_fees
        from
            c_site_fees_and_rent_reduct_stg sf
        join
            c_years sfy
            on sfy.year_id = sf.year_id
    ),

    c_net_site_fees_pivot (account_1, sf_cy_minus_three, sf_cy_minus_two,
                sf_cy_minus_one, sf_cy, sf_cy_plus_one) as (
        select *
    from (
        select account_1, net_site_fees, year_value
        from c_site_fees_by_year
        )
        pivot (sum(net_site_fees) for year_value in (
            (year(current_date)-3),
            (year(current_date)-2),
            (year(current_date)-1),
            (year(current_date)),
            (year(current_date)+1)
            )
        )
    ),
    ------------------------------- total vans ever owned/bought by account -------------------------------
    c_total_vans_bought_by_account as (
        select
            sd.account_id,
            count(*) as total_vans_had,
            sum(sd.sales_value) as ltv
        from
            c_sale_details sd
        where
            sale_status_enum = 3
        group by
            sd.account_id
    ),
    ------------------------------- letting income -------------------------------
    c_letting_income as (
    select
        account_id,
        sum(
            iff(year(arrival_dt) = year(current_date),
                loi.due_to_owner_amount,
                0)
        )as letting_income_cy,
        sum(
            iff(year(arrival_dt) = year(current_date) - 1,
                loi.due_to_owner_amount,
                0)
        )as letting_income_py,
        sum(loi.due_to_owner_amount) as total_letting_income
    from
        haven_base.plot.letting_owners_income loi
    group by
        account_id
    ),
    ------------------------------- total historical part exchange sales -------------------------------
    c_numer_of_historical_pex_sales as (
        select
            account_id,
            count(*) as total_pex_sales
        from c_sale_details sd
        where
            sd.sale_type_enum = 8 -- pex only
        group by
            account_id
    ),
     ------------------------------- letting info -------------------------------
    c_letting_recors_that_were_let as (
        select
            lp.letting_record_id
        from
            haven_base.plot.letting_records lr
        join
            haven_base.plot.letting_periods lp
            on lp.letting_record_id = lr.letting_record_id
        where
            lr.linked_to_cancelled_sale_yn = 0 and
            lp.start_date <= nvl(lr.effective_end_dt, '9999-12-31') and
            lr.account_id is not null -- owner record only
    ),

    c_letting_accounts_by_year as (
        select
            account_id,
            max(iff(year_value = year(current_date) -1,1,0)) as letting_py,
            max(iff(year_value = year(current_date),1,0)) as letting_cy,
            max(iff(year_value = year(current_date) +1,1,0)) as letting_ny
        from
            haven_base.plot.letting_records lr
        join
            c_years cy
            on cy.year_id = lr.year_id
        where
            cy.year_value in(year(current_date) -1, year(current_date), year(current_date) +1) and
            exists(
                select
                    letting_record_id
                from
                    c_letting_recors_that_were_let lrl
                where
                    lrl.letting_record_id = lr.letting_record_id
        )
        group by
            account_id
    ),

    trans_total_by_card_no as (
        SELECT
            sum(gross) as gross,
            cardno,
            year(transdatetime) as trans_year
        FROM
            haven_base.zbsdata_retail.rpt_Bourne_CardTransactions BCT -- Tmp_Bourne_CardTransactions BCT
        group by
            cardno,
            trans_year
    ),

    c_owner_spend_by_year_and_account as (
        select
            sum(
                iff(trans_year = year(current_date), gross,0)
            ) as total_owner_spend_cy,
            sum(
                iff(trans_year = year(current_date) -1, gross,0)
            ) as total_owner_spend_cy_minus_one,
            sum(
                iff(trans_year = year(current_date) -2, gross,0)
            ) as total_owner_spend_cy_minus_two,
            sum(
                iff(trans_year = year(current_date) -3, gross,0)
            ) as total_owner_spend_cy_minus_minus_three,
            sum(gross) as total_owner_spend,
            cd.plotaccount
        from
            trans_total_by_card_no tt
        join
            haven_base.zbsdata_retail.Rpt_Bourne_CardDetail cd
            on cd.cardno = tt.cardno
        group by
            plotaccount
    )
select
    bo.account_no,
    bo.park_code,
    bo.account_id,
    bo.owner_id,
    bo.csi_no,
    nvl(bo.finance_amount,0) as finance_amount,
    nvl(bo.current_finance, false) as current_finance,
    iff(htb.final_htb_year is not null, true, false) as htb_yn,
    iff(htb.final_htb_year >= year(current_date), true, false) as htb_still_active_yn,
    nvl(lp.letting_cy,false) as let_cy,
    nvl(lp.letting_py,false) as let_py,
    nvl(lp.letting_ny,false)as let_ny,
    nvl(li.letting_income_cy,0) as letting_income_cy,
    nvl(li.letting_income_py,0) as letting_income_py,
    nvl(li.total_letting_income,0) as total_letting_income,
    nvl(lsf.total_net_site_fees,0) as total_net_site_fees,
    nvl(sf.sf_cy_minus_three,0) as sf_cy_minus_three,
    nvl(sf.sf_cy_minus_two,0) as sf_cy_minus_two,
    nvl(sf.sf_cy_minus_one,0) as sf_cy_minus_one,
    nvl(sf.sf_cy,0) as sf_cy,
    nvl(sf.sf_cy_plus_one,0) as sf_cy_plus_one,
    bo.current_van_new,
    bo.park_short_desc,
    bo.sale_id,
    bo.van_id,
    bo.joining_dt,
    bo.validation_date,
    bo.completion_date,
    nvl(bo.new_owner_cy, false) as new_owner_cy,
    nvl(bo.pex_cy, false) as pex_cy,
    iff(nvl(ps.total_pex_sales,0) > 0, 1, 0) as has_pex_before,
    bo.years_of_ownership,
    case
        when bo.years_of_ownership is null  then 'unknown'
        when bo.years_of_ownership <= 0  then 'less than a year'
        when bo.years_of_ownership <= 1  then '1 year'
        when bo.years_of_ownership <= 2  then '2 years'
        when bo.years_of_ownership <= 3  then '3 years'
        when bo.years_of_ownership <= 4  then '4 years'
        when bo.years_of_ownership <= 9  then '5-9 years'
        else '10+ years'
    end as ownership_age_band,
    bo.year_made,
    bo.make,
    bo.model,
    bo.post_code,
    bo.postal_area,
    bo.sales_value,
    nvl(tv.ltv,0) as ltv,
    nvl(tv.total_vans_had,0) as total_vans_had,
    nvl(vbo.current_vans_owned_by_owner,0) as current_vans_owned_by_owner,
    bo.total_owners_desc || vbo.miltiple_van_owner_desc as owner_type,
    nvl(os.total_owner_spend,0) as total_owner_spend,
    nvl(os.total_owner_spend_cy,0) as total_owner_spend_cy,
    nvl(os.total_owner_spend_cy_minus_one,0) as total_owner_spend_cy_minus_one,
    nvl(os.total_owner_spend_cy_minus_two,0) as total_owner_spend_cy_minus_two,
    nvl(os.total_owner_spend_cy_minus_minus_three,0) as total_owner_spend_cy_minus_minus_three
from
    c_base_output bo
left join
    c_help_to_buy_final_year htb
    on htb.posting_master_id = bo.posting_master_id
left join
    c_letting_accounts_by_year lp
    on lp.account_id = bo.account_id
left join
    c_letting_income li
    on li.account_id = bo.account_id
left join
    c_lifetime_site_fees lsf
    on lsf.account_1 = bo.account_no
left join
    c_net_site_fees_pivot sf
    on sf.account_1 = bo.account_no
left join
    c_current_van_count_by_owner vbo
    on vbo.owner_id = bo.owner_id
left join
    c_total_vans_bought_by_account tv
    on tv.account_id = bo.account_id
left join
    c_numer_of_historical_pex_sales ps
    on ps.account_id = bo.account_id
left join
    c_owner_spend_by_year_and_account os
    on os.plotaccount = bo.ACCOUNT_NO
  );
  
create VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.PRICER_INPUT_PRICE_HISTORY as
select 
    aa.park park_code,
    aa.grade,
    aa.product,
    aa.subproduct,
    aa.break_date,
    aa.duration,
    aa.current_price,
    aa.target_price,
    dateadd(dd, 1, aa.extract_datetime) process_datetime
from
    HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.INPUT_PRICE_HISTORY aa
   
;

create VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.PRICER_MINMAX as
select 
    *
from
   HAVEN_PIPELINE.PX0006_BLUEYONDER_PRICER.PRICER__MINMAX_PRICE
   
;

create VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.SEARCHES_AND_BOOKINGS_SUMMARY(
	DATE,
	SEARCHES,
	ARRIVAL_PERIOD,
	PARK_CODE,
	BOOKINGS,
	ARRIVAL_DATE,
	HOLIDAY_TYPE
) as
SELECT DATE(SEARCHES_AND_BOOKINGS_DATE), SEARCHES, ARRIVAL_PERIOD, PARK_CODE, BOOKINGS, DATE(ARRIVAL_DATE), HOLIDAY_TYPE
FROM HAVEN_BASE.BIGQUERY.SEARCHES_AND_BOOKINGS_SUMMARY;

create VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.SESSIONS_BY_DATE(
	SESSION_DATE,
	FULLVISITORID,
	VISITID,
	VISITNUMBER,
	VISITSTARTTIME,
	PAGEVIEWS,
	TIMEONSITE,
	BOUNCES,
	SESSION_TRANSACTIONS,
	TOTALTRANSACTIONREVENUE,
	NEWVISITS,
	ISTRUEDIRECT,
	REFERRALPATH,
	SESSION_SOURCE,
	MEDIUM,
	CAMPAIGN,
	KEYWORD,
	LANDING_PAGE,
	DEVICECATEGORY,
	BROWSER,
	BROWSERSIZE,
	BROWSERVERSION,
	OPERATINGSYSTEM,
	OPERATINGSYSTEMVERSION,
	COUNTRY,
	LATITUDE,
	LONGITUDE,
	OWNERSHIP_FLAG,
	TOURING_FLAG,
	TRANSACTIONAL_FLAG,
	SEARCH_FLAG_HOLS,
	SEARCH_FLAG_OWNERSHIP,
	SEARCH_FLAG_TOURING,
	HOME_DETAILS_FLAG_OWNERSHIP
) as
SELECT "DATE" AS session_date, FULLVISITORID, VISITID, VISITNUMBER, VISITSTARTTIME, PAGEVIEWS, TIMEONSITE, BOUNCES, "TRANSACTIONS" AS session_transactions, TOTALTRANSACTIONREVENUE, NEWVISITS, ISTRUEDIRECT, REFERRALPATH, "SOURCE" AS session_source, MEDIUM, CAMPAIGN, KEYWORD, LANDING_PAGE, DEVICECATEGORY, BROWSER, BROWSERSIZE, BROWSERVERSION, OPERATINGSYSTEM, OPERATINGSYSTEMVERSION, COUNTRY, LATITUDE, LONGITUDE, OWNERSHIP_FLAG, TOURING_FLAG, TRANSACTIONAL_FLAG, SEARCH_FLAG_HOLS, SEARCH_FLAG_OWNERSHIP, SEARCH_FLAG_TOURING, HOME_DETAILS_FLAG_OWNERSHIP
FROM HAVEN_base.BIGQUERY.HAV001_TABLES01_SESSIONS_BY_DATE;

DROP VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.SPG_TROOPER_OLIVIA ;
create VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.SPG_TROOPER_OLIVIA as
with 
    c$discount as (
        SELECT
            b.RES_ID,
            SUM(b.AMOUNT) AS Partner_Discount
        FROM 
            haven_base.seaware.Res_Invoice_Item b
        WHERE 
            b.Price_program IN ('EMB OFFER','EXTRA DISCOUNT','EMB SPECIAL','SPECIAL PROMO','SPECIAL OFFER','MOTABILITY','AA PROMOTION','TA STAFF OFFER','CHARITY OFFER','BRINC OFFER','FHA OFFER','FF OFFER',
                          'AA #20 EXTRA','EMB BF OFFER 1','RACMOTOR OFFER','FF #20 DISCOUNT','EMB #20 EXTRA','EMB BF OFFER 2','EMB JLP OFFER','EMB #59 OFFER','EMB £59 OFFER','TA 2019 OFFER','FLASH SALE',
                          'JL OFFER','HOSEASON #25','BREAKFREE #20','FF £20 DISCOUNT','SSAFA OFFER')  and
            b.res_id not in (select rp.res_id from haven_base.seaware.res_param rp where rp.param_code = 'REFERRAL_SOURCE')
        GROUP BY
            b.res_id
    ),
    c$agency as (
        select
            a.*,
            case when a.Agency_ID = 5 then 'DIRECT' else a.Agency_ID::text end v$key
        from
            haven_base.seaware.Agency a
    ),
    c$result as (
        SELECT 
            t.*, 
            dd.partner_discount, 
            aa.agency_name
        FROM 
            haven_store.trooper.spg_Trawler_publish t
        LEFT JOIN 
            c$discount dd
            on
                dd.res_id = t.BookingNumber
        LEFT JOIN 
            c$agency aa
            on
                aa.v$key = t.BkSource
    )
select *
from c$result a
where budgets = 0
;

create VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.TRANSACTIONS_BY_DATE (
	TRANS_DATE,
	FULLVISITORID,
	VISITID,
	VISITSTARTTIME,
	HIT_TIME,
	TRANSACTIONID,
	TRANSACTIONREVENUE,
	HOL_BOOKING_ID,
	TIMESTAMP_RAW,
	BUSINESS_AREA,
	FRIENDLY_PAGE_NAME,
	PARK_NAME,
	PARK_CODE,
	HOLIDAY_PACKAGE,
	DURATION,
	ARRIVAL_DATE,
	GUEST_NEW_REPEAT,
	GUESTS_ADULTS,
	GUESTS_CHILDREN,
	GUESTS_INFANTS,
	GUESTS_DOGS,
	GUESTS_TOTAL,
	GUEST_TYPE,
	ACT_CATEGORY,
	ACT_NAME,
	ACT_DATE,
	ACT_TIME
) as
SELECT DATE(TRANSACTION_DATE), FULLVISITORID, VISITID, VISITSTARTTIME, HIT_TIME, TRANSACTIONID, TRANSACTIONREVENUE, HOL_BOOKING_ID, TIMESTAMP_RAW, BUSINESS_AREA, FRIENDLY_PAGE_NAME, PARK_NAME, PARK_CODE, HOLIDAY_PACKAGE, DURATION, ARRIVAL_DATE, GUEST_NEW_REPEAT, GUESTS_ADULTS, GUESTS_CHILDREN, GUESTS_INFANTS, GUESTS_DOGS, 
GUESTS_TOTAL, GUEST_TYPE, ACT_CATEGORY, ACT_NAME, ACT_DATE, ACT_TIME
FROM HAVEN_BASE.BIGQUERY.TRANSACTIONS_BY_DATE;

create VIEW HAVEN_STORE_AA_DEV.COMMERCIAL.WEEKLY_SUMMARY(
	PARKCODE,
	SEARCHES,
	ARRIVAL_WEEK,
	BOOKINGS,
	HOLIDAY_TYPE,
	BOOK_WEEK
) as
SELECT PARKCODE, SEARCHES, ARRIVAL_WEEK, BOOKINGS, HOLIDAY_TYPE, BOOK_WEEK
FROM HAVEN_BASE.BIGQUERY.WEEKLY_SUMMARY;