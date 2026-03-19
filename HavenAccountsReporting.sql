USE ROLE sysadmin;

CREATE WAREHOUSE haven_accountants_warehouse_xsmall WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 SCALING_POLICY = 'STANDARD';

use role useradmin;

create role _haven_accountants_warehouse_xsmall__warehouse__operator;
create role _haven_accountants_warehouse_xsmall__warehouse__usage;
create role haven_accountants;

--Adam Campbell
--adam.campbell@bourne-leisure.co.uk
create user AdamCampbell
login_name = 'adam.campbell@bourne-leisure.co.uk'
display_name = 'Adam Campbell'
email = 'adam.campbell@bourne-leisure.co.uk'
comment = 'Assistant Accountant'
default_role = haven_accountants
default_warehouse = haven_accountants_warehouse_xsmall;


--Dean Howie
--dean.howie@bourne-leisure.co.uk
create user DeanHowie
login_name = 'dean.howie@bourne-leisure.co.uk'
display_name = 'Dean Howie'
email = 'dean.howie@bourne-leisure.co.uk'
comment = 'Operations Accountant'
default_role = haven_accountants
default_warehouse = haven_accountants_warehouse_xsmall;

--Graham Leonard
--graham.leonard@bourne-leisure.co.uk
create user GrahamLeonard
login_name = 'graham.leonard@bourne-leisure.co.uk'
display_name = 'Graham Leonard'
email = 'graham.leonard@bourne-leisure.co.uk'
comment = 'Designate Head of Operational Accounting'
default_role = haven_accountants
default_warehouse = haven_accountants_warehouse_xsmall;

--Akhil Shah
--akhil.shah@haven.com
create user AkhilShah
login_name = 'akhil.shah@haven.com'
display_name = 'Akhil Shah'
email = 'akhil.shah@haven.com'
comment = 'Trainee Accountant'
default_role = haven_accountants
default_warehouse = haven_accountants_warehouse_xsmall;

--Bob Wisdish
--bob.wisdish@bourne-leisure.co.uk
create user BobWisdish
login_name = 'bob.wisdish@bourne-leisure.co.uk'
display_name = 'Bob Wisdish'
email = 'bob.wisdish@bourne-leisure.co.uk'
comment = 'Head of Operational Accounting - CP Accountant'
default_role = haven_accountants
default_warehouse = haven_accountants_warehouse_xsmall;

USE ROLE accountadmin;

SHOW USERS;
SHOW GRANTS TO ROLE haven_finance;

use role securityadmin;

grant usage, monitor on warehouse haven_accountants_warehouse_xsmall to role _haven_accountants_warehouse_xsmall__warehouse__usage;
GRANT ROLE _haven_accountants_warehouse_xsmall__warehouse__usage TO ROLE _haven_accountants_warehouse_xsmall__warehouse__operator;
grant operate, modify on warehouse haven_accountants_warehouse_xsmall to role _haven_accountants_warehouse_xsmall__warehouse__operator;

GRANT ROLE _haven_accountants_warehouse_xsmall__warehouse__usage TO ROLE haven_accountants;
GRANT ROLE _haven_base__plot__reader TO ROLE haven_accountants;
GRANT ROLE _haven_base__dream__reader TO ROLE haven_accountants;
GRANT ROLE _haven_store__common__reader TO ROLE haven_accountants;

GRANT ROLE haven_accountants TO ROLE dba;

GRANT ROLE haven_accountants TO USER AdamCampbell;
GRANT ROLE haven_accountants TO USER DeanHowie;
GRANT ROLE haven_accountants TO USER GrahamLeonard;
GRANT ROLE haven_accountants TO USER AkhilShah;
GRANT ROLE haven_accountants TO USER bobwisdish;

SELECT DISTINCT
        PK.PARK_CODE ,
        AC.ACCOUNT_NO ,
        S.CSI_NO ,
        V.VAN_STOCK_NO ,
        S.DATE_SOLD ,
        ST.SALE_TYPE_CODE ,
        SS.SALE_STATUS_CODE ,
        S.VALIDATION_DATE ,
        S.COMPLETION_DATE ,
        WEEK_NO.StatYear  ,
        WEEK_NO.StatPeriod  ,
        S.TWIN_YN ,
        S.NEW_VAN_YN ,
        S.PRIVATE_SALE_VALUE ,
        S.PRIVATE_SALE_COMMISSION ,
        S.COMMISSION_PAID_YN ,
        S.COMMISSION_PAID_DATE ,
        VP1.VAN_STOCK_NO  ,
        S.PEX1_BOTTOM_BOOK_VALUE ,
        S.PEX1_DISCOUNT ,
        VP2.VAN_STOCK_NO  ,
        S.PEX2_BOTTOM_BOOK_VALUE ,
        S.PEX2_DISCOUNT ,
        S.GLB_AMOUNT ,
        S.GLB_AMOUNT_NEXT_YEAR ,
        S.RL_AMOUNT ,
        S.GLA_PX_AMOUNT_VAN_1 ,
        S.GLA_PX_AMOUNT_VAN_2 ,
        S.GLA_PX_AMOUNT_VAN_1_NEXT_YEAR ,
        S.GLA_PX_AMOUNT_VAN_2_NEXT_YEAR ,
        S.NEW_GLA_TOTAL ,
        s.NEW_GLA_TOTAL_NEXT_YEAR ,
        S.DUE_ON_ACCOUNT ,
        S.SUBLET_AMOUNT ,
        S.FINANCE_AMOUNT ,
        S.DEPOSIT_AMOUNT ,
        S.VOUCHER_AMOUNT ,
        S.AMOUNT_DUE_LATER_DATE ,
        S.AMOUNT_DUE_LATER ,
        S.PROFIT_CONFIRMED_YN ,
        S.PROFIT_CONFIRMED_DATE ,
        S.SVL_PRICE_SUB_TOTAL ,
        S.SVL_VAT_AMOUNT ,
        S.ORIGINAL_COST ,
        S.VALUE_STANDARD_RATED ,
        S.VALUE_ZERO_RATED ,
        S.GROSS_PRICE_TOTAL ,
        --MRRP.BaseRetailValue  ,
        --mrrp.UsedCurr  ,
        --mrrp.markupPercentage  ,
        vals.VANVALUE  ,
        vals.SUBS  ,
        vals.ADDONS  ,
        vals.SPDISC  ,
        vals.PRODISC  ,
        S.HP_RATE_PERCENTAGE ,
        S.MONTHLY_PAYMENTS ,
        S.YEARS ,
        FC.FIN_COMPANY_CODE ,
        S.FIN_CO_ACCOUNT ,
        S.FIN_DUE_FROM ,
        S.FIN_DUE_TO ,
        SRC.SOURCE_DESC ,
        CSP.CSP_DESC ,
        WM.WM_DESC ,
        S.KEY_HANDOVER_DATE ,
        S.KEY_HANDOVER_BY ,
        PK.PARK_CODE + AR.AREA_CODE + Z.ZONE_CODE + PIT.PITCH_NO  ,
        S.VAN_BBV ,
        S.KEY_HANDOVER_DONE_YN ,
        S.YIELD_TEAM_OVERRIDE_YN ,
        S.YIELD_TEAM_OVERRIDE_BY ,
        V.MAKE ,
        V.MODEL ,
        V.LENGTH ,
        V.WIDTH ,
        V.NO_OF_BED_CODES ,
        V.YEAR_MADE ,
        VP1.MAKE  ,
        VP1.MODEL  ,
        VP1.LENGTH  ,
        VP1.WIDTH  ,
        VP1.NO_OF_BED_CODES  ,
        VP1.YEAR_MADE  ,
        VP2.MAKE  ,
        VP2.MODEL  ,
        VP2.LENGTH  ,
        VP2.WIDTH  ,
        VP2.NO_OF_BED_CODES  ,
        VP2.YEAR_MADE 
FROM    bladeliv.dbo.SALES S
        JOIN bladeliv.dbo.SALES_STATUSES SS ON S.SALE_STATUS_ENUM = SS.SALE_STATUS_ENUM
        JOIN bladeliv.dbo.ACCOUNTS AC ON S.ACCOUNT_ID = AC.ACCOUNT_ID
        JOIN bladeliv.dbo.VANS V ON S.VAN_ID = V.VAN_ID
        --OUTER APPLY plotreprs.dbo.fn_GetVanValuation(v.VAN_ID) AS MRRP
        JOIN bladeliv.dbo.SALES_TYPES ST ON S.SALE_TYPE_ENUM = ST.SALE_TYPE_ENUM
        JOIN bladeliv.dbo.PARKS PK ON S.PARK_ID = PK.PARK_ID
        LEFT JOIN [HO-FINMI-SRV].Statpaq.dbo.Dates_And_Periods WEEK_NO ( NOLOCK ) ON YEAR(WEEK_NO.ActualDate) = YEAR(S.COMPLETION_DATE)
                                                              AND MONTH(WEEK_NO.ActualDate) = MONTH(S.COMPLETION_DATE)
                                                              AND DAY(WEEK_NO.ActualDate) = DAY(S.COMPLETION_DATE)
        LEFT JOIN bladeliv.dbo.CSPS CSP ON CSP.CSP_ID = S.CSP_ID
        LEFT JOIN bladeliv.dbo.FINANCE_COMPANIES FC ON S.FIN_COMPANY_ID = FC.FIN_COMPANY_ID
        LEFT JOIN bladeliv.dbo.VANS VP1 ON VP1.VAN_ID = S.PEX1_VAN_ID
        LEFT JOIN bladeliv.dbo.VANS VP2 ON VP2.VAN_ID = S.PEX2_VAN_ID
        LEFT JOIN bladeliv.dbo.SOURCES SRC ON S.SOURCE_ID = SRC.SOURCE_ID
        LEFT JOIN bladeliv.dbo.WELCOME_MEETERS WM ON WM.WM_ID = S.WELCOME_MEETER_ID
        LEFT JOIN bladeliv.dbo.PITCHES PIT ON S.DESTINATION_PITCH_ID = PIT.PITCH_ID
        LEFT JOIN bladeliv.dbo.ZONES Z ON PIT.ZONE_ID = Z.ZONE_ID
        LEFT JOIN bladeliv.dbo.AREAS AR ON PIT.AREA_ID = AR.AREA_ID
        OUTER APPLY plotreprs.dbo.fn_SalesValuesBreakDown(s.sale_id) AS VALS
WHERE   VALIDATION_DATE IS NOT NULL
        AND CANCELLATION_DATE IS NULL
        AND YEAR(DATE_SOLD) >=2020;
       
       
       
SELECT 1 AS "1 (copy) (copy)_713539091965071367",
  (CASE WHEN ((CASE WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."CANCELLATION_DATE") ELSE "Custom SQL Query"."CANCELLATION_DATE" END) < CURRENT_DATE()) THEN 'OOS' WHEN ("Custom SQL Query"."BOOKING_DATE" IS NULL) THEN 'OOS' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-04-01'::DATE) THEN 'P1' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-04-22'::DATE) THEN 'P2' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-05-27'::DATE) THEN 'P3' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-06-03'::DATE) THEN 'P4' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-07-15'::DATE) THEN 'P5' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-08-26'::DATE) THEN 'P6' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-12-01'::DATE) THEN 'P7' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-03-01'::DATE) THEN 'OOS' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-03-31'::DATE) THEN 'P1' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-04-14'::DATE) THEN 'P2' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-05-26'::DATE) THEN 'P3' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-06-02'::DATE) THEN 'P4' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-07-21'::DATE) THEN 'P5' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-09-01'::DATE) THEN 'P6' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-11-13'::DATE) THEN 'P7' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-02-24'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-03-28'::DATE)) THEN 'P1' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-03-29'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-04-11'::DATE)) THEN 'P2' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-04-12'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-05-23'::DATE)) THEN 'P3' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-05-24'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-05-30'::DATE)) THEN 'P4' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-05-31'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-07-18'::DATE)) THEN 'P5' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-07-19'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-08-29'::DATE)) THEN 'P6' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-08-30'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-11-30'::DATE)) THEN 'P7' ELSE 'OOS' END) AS "Calculation_1246371258256023552",
  SUM((CASE WHEN ("Custom SQL Query"."VERSION" = 'CY') THEN "Custom SQL Query"."WEEKS" ELSE NULL END)) AS "TEMP(Calculation_176766338643054593)(708528374)(0)",
  SUM((CASE WHEN ("Custom SQL Query"."VERSION" = 'Budgets') THEN "Custom SQL Query"."WEEKS" ELSE NULL END)) AS "TEMP(Calculation_176766338643677187)(637943919)(0)"
FROM (
  WITH ACTUALS AS (
  select
  a.*, 
  --b.nett_billing_value/duration as pre_cancellation_spend, 
  case when season = 2022 and booking_status_category = 'CANCELLED' and cancellation_date >= dateadd(day,-364,sysdate()::date) 
      then nett_billing_value/duration else prorated_nett_billing_value end as spend,
  case when season = 2022 and booking_status_category = 'CANCELLED' and cancellation_date >= dateadd(day,-364,sysdate()::date) 
  then 'FIRM' else booking_status_category end as status 
  from HAVEN_STORE.TROOPER2.PRORATED_BOOKING_REVENUE a 
  left join HAVEN_STORE.TROOPER2.BOOKING_FINANCIALS_PRE_CANCELLATION b on a.booking_id = b.booking_id
  where season in (2022, 2023, 2024)
  )
  
  SELECT
      'CY' AS VERSION,
      A.FIRM_DATE AS BOOKING_DATE, 
      A.STAY_DATE AS ARRIVAL_DATE, 
      A.BOOKING_ID AS BOOKING_ID,
      A.CANCELLATION_DATE,
      A.DURATION, 
      A.PARK_CODE, 
      A.PARK_REGION, 
      A.PAID_GRADE, 
      A.PRODUCT, 
      A.SUB_PRODUCT, 
      A.SOURCE, 
      SUBSTR(A.SEASON, 2, 3) AS SEASON, 
      A.PITCH_CODE,
      //C.MARKETING_CHANNEL,
      case when A.PARK_CODE = 'SN' then 'SKEGNESS' else b.park_name end as PARKNAME,
      B.LATITUDE,
      B.LONGITUDE,
      SUM(SPEND) AS TARIFF,
      SUM(WEEK_RATIO) AS WEEKS,
      SUM(A.ADULTS) AS ADULTS, 
      SUM(A.CHILDREN) AS CHILDREN, 
      SUM(A.INFANTS) AS INFANTS
  
  FROM
   
      ACTUALS A
  
  LEFT JOIN
      (SELECT DISTINCT PARK_NAME, PARK_CODE, LONGITUDE, LATITUDE FROM HAVEN_COMMERCIAL.HB_DEV.PARK_LOCATIONS) B
  
  ON
      A.PARK_CODE = B.PARK_CODE
  
  
  WHERE 
      
      A.SEASON = 2024
      AND A.FIRM_DATE != CURRENT_DATE()
  
  GROUP BY
      1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17
  
      
  
  UNION ALL
  
  SELECT
      'PY' AS VERSION,
      A.FIRM_DATE AS BOOKING_DATE, 
      A.STAY_DATE AS ARRIVAL_DATE, 
      A.BOOKING_ID AS BOOKING_ID,
      A.CANCELLATION_DATE,
      A.DURATION, 
      A.PARK_CODE, 
      A.PARK_REGION, 
      A.PAID_GRADE, 
      A.PRODUCT, 
      A.SUB_PRODUCT, 
      A.SOURCE, 
      SUBSTR(A.SEASON, 2, 3) AS SEASON, 
      A.PITCH_CODE,
      case when A.PARK_CODE = 'SN' then 'SKEGNESS' else b.park_name end as PARKNAME,
      B.LATITUDE,
      B.LONGITUDE,
      SUM(SPEND) AS TARIFF,
      SUM(WEEK_RATIO) AS WEEKS,
      SUM(A.ADULTS) AS ADULTS, 
      SUM(A.CHILDREN) AS CHILDREN, 
      SUM(A.INFANTS) AS INFANTS
  
  FROM
   
      ACTUALS A
  
  LEFT JOIN
      (SELECT DISTINCT PARK_NAME, PARK_CODE, LONGITUDE, LATITUDE FROM HAVEN_COMMERCIAL.HB_DEV.PARK_LOCATIONS) B
  
  ON
      A.PARK_CODE = B.PARK_CODE
      
  
  WHERE 
      
      A.SEASON = 2023
  
  GROUP BY
      1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17
  
  
  UNION ALL
  
  
  SELECT 
      'Budgets' AS VERSION,
      BOOKING_DATE, 
      BREAK_DATE AS ARRIVAL_DATE, 
      0 AS BOOKING_ID,
      NULL AS CANCELLATION_DATE,
      NULL AS DURATION, 
      PARK_CODE, 
      REGION AS PARK_REGION, 
      NULL AS PAID_GRADE, 
      CASE WHEN PRODUCT = 'Self Catered' THEN 'SELF CATERED' 
      WHEN PRODUCT = 'Touring' THEN 'TOURING' END AS PRODUCT, 
      NULL AS SUB_PRODUCT, 
      SOURCE, 
      SEASON, 
      NULL AS PITCH_CODE,
      PARKNAME,
      LATITUDE,
      LONGITUDE,
      SUM(BILLINGS) AS TARIFF,
      SUM(WEEKS) AS WEEKS,
      NULL AS ADULTS, 
      NULL AS CHILDREN, 
      NULL AS INFANTS
      
  FROM
   
  HAVEN_COMMERCIAL.HB_DEV.COMMERCIAL_BUDGETS_COMBINED
  
  WHERE 
      PRIORSEASON = FALSE
  AND 
      BOOKINGNUMBER = 'Budgets'
  AND 
      SEASON = 24
  
  GROUP BY 
  1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17
) "Custom SQL Query"
WHERE ((NOT ((CASE WHEN ((CASE WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."CANCELLATION_DATE") ELSE "Custom SQL Query"."CANCELLATION_DATE" END) < CURRENT_DATE()) THEN 'OOS' WHEN ("Custom SQL Query"."BOOKING_DATE" IS NULL) THEN 'OOS' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-04-01'::DATE) THEN 'P1' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-04-22'::DATE) THEN 'P2' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-05-27'::DATE) THEN 'P3' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-06-03'::DATE) THEN 'P4' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-07-15'::DATE) THEN 'P5' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-08-26'::DATE) THEN 'P6' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2022-12-01'::DATE) THEN 'P7' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-03-01'::DATE) THEN 'OOS' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-03-31'::DATE) THEN 'P1' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-04-14'::DATE) THEN 'P2' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-05-26'::DATE) THEN 'P3' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-06-02'::DATE) THEN 'P4' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-07-21'::DATE) THEN 'P5' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-09-01'::DATE) THEN 'P6' WHEN ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) < '2023-11-13'::DATE) THEN 'P7' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-02-24'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-03-28'::DATE)) THEN 'P1' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-03-29'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-04-11'::DATE)) THEN 'P2' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-04-12'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-05-23'::DATE)) THEN 'P3' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-05-24'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-05-30'::DATE)) THEN 'P4' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-05-31'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-07-18'::DATE)) THEN 'P5' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-07-19'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-08-29'::DATE)) THEN 'P6' WHEN (((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) >= '2024-08-30'::DATE) AND ((CASE WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-03-31'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-06'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-07'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-04-13'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-04-28'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-04'::DATE)) THEN DATEADD('DAY',371,"Custom SQL Query"."ARRIVAL_DATE") WHEN (("Custom SQL Query"."SEASON" = 23) AND ("Custom SQL Query"."ARRIVAL_DATE" >= '2023-05-05'::DATE) AND ("Custom SQL Query"."ARRIVAL_DATE" <= '2023-05-11'::DATE)) THEN DATEADD('DAY',357,"Custom SQL Query"."ARRIVAL_DATE") WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."ARRIVAL_DATE") ELSE "Custom SQL Query"."ARRIVAL_DATE" END) <= '2024-11-30'::DATE)) THEN 'P7' ELSE 'OOS' END) IN ('OOS'))) AND (DATEDIFF('DAY',(CASE WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."BOOKING_DATE") ELSE "Custom SQL Query"."BOOKING_DATE" END),DATEADD('DAY',-1 * 1,CURRENT_DATE())) >= 0) AND (DATEDIFF('DAY',(CASE WHEN ("Custom SQL Query"."VERSION" = 'PY') THEN DATEADD('DAY',364,"Custom SQL Query"."BOOKING_DATE") ELSE "Custom SQL Query"."BOOKING_DATE" END),CURRENT_DATE()) < 8))
GROUP BY 2



SELECT [NOMINAL]
      ,[ACCOUNT]
      ,[XLEDGER]
      ,[XACCOUNT]
      ,[DOCDATE]
      ,[YEARCODE]
      ,[PERIOD]
      ,[VALUE]
      ,[DESCRIPTION]
      ,[DOCTYPE]
      ,[DOCNUM]
        FROM [dailybldliv].[SQSDBA].[D_DETAILS]
  where YEARCODE = 2023
  and (NOMINAL like '%yrlc' );
  
USE ROLE haven_accountants;
USE WAREHOUSE haven_accountants_warehouse_xsmall;  
SELECT DISTINCT
        PK.PARK_CODE ,
        AC.ACCOUNT_NO ,
        S.CSI_NO ,
        V.VAN_STOCK_NO ,
        S.DATE_SOLD ,
        ST.SALE_TYPE_CODE ,
        SS.SALE_STATUS_CODE ,
        S.VALIDATION_DATE ,
        S.COMPLETION_DATE ,
        WEEK_NO.StatYear  ,
        WEEK_NO.StatPeriod  ,
        S.TWIN_YN ,
        S.NEW_VAN_YN ,
        S.PRIVATE_SALE_VALUE ,
        S.PRIVATE_SALE_COMMISSION ,
        S.COMMISSION_PAID_YN ,
        S.COMMISSION_PAID_DATE ,
        VP1.VAN_STOCK_NO  ,
        S.PEX1_BOTTOM_BOOK_VALUE ,
        S.PEX1_DISCOUNT ,
        VP2.VAN_STOCK_NO  ,
        S.PEX2_BOTTOM_BOOK_VALUE ,
        S.PEX2_DISCOUNT ,
        S.GLB_AMOUNT ,
        S.GLB_AMOUNT_NEXT_YEAR ,
        S.RL_AMOUNT ,
        S.GLA_PX_AMOUNT_VAN_1 ,
        S.GLA_PX_AMOUNT_VAN_2 ,
        S.GLA_PX_AMOUNT_VAN_1_NEXT_YEAR ,
        S.GLA_PX_AMOUNT_VAN_2_NEXT_YEAR ,
        S.NEW_GLA_TOTAL ,
        s.NEW_GLA_TOTAL_NEXT_YEAR ,
        S.DUE_ON_ACCOUNT ,
        S.SUBLET_AMOUNT ,
        S.FINANCE_AMOUNT ,
        S.DEPOSIT_AMOUNT ,
        S.VOUCHER_AMOUNT ,
        S.AMOUNT_DUE_LATER_DATE ,
        S.AMOUNT_DUE_LATER ,
        S.PROFIT_CONFIRMED_YN ,
        S.PROFIT_CONFIRMED_DATE ,
        S.SVL_PRICE_SUB_TOTAL ,
        S.SVL_VAT_AMOUNT ,
        S.ORIGINAL_COST ,
        S.VALUE_STANDARD_RATED ,
        S.VALUE_ZERO_RATED ,
        S.GROSS_PRICE_TOTAL ,
        --MRRP.BaseRetailValue  ,
        --mrrp.UsedCurr  ,
        --mrrp.markupPercentage  ,
--        vals.VANVALUE  ,
--        vals.SUBS  ,
--        vals.ADDONS  ,
--        vals.SPDISC  ,
--        vals.PRODISC  ,
        S.HP_RATE_PERCENTAGE ,
        S.MONTHLY_PAYMENTS ,
        S.YEARS ,
        FC.FIN_COMPANY_CODE ,
        S.FIN_CO_ACCOUNT ,
        S.FIN_DUE_FROM ,
        S.FIN_DUE_TO ,
        SRC.SOURCE_DESC ,
        CSP.CSP_DESC ,
        WM.WM_DESC ,
        S.KEY_HANDOVER_DATE ,
        S.KEY_HANDOVER_BY ,
        PK.PARK_CODE + AR.AREA_CODE + Z.ZONE_CODE + PIT.PITCH_NO  ,
        S.VAN_BBV ,
        S.KEY_HANDOVER_DONE_YN ,
        S.YIELD_TEAM_OVERRIDE_YN ,
        S.YIELD_TEAM_OVERRIDE_BY ,
        V.MAKE ,
        V.MODEL ,
        V.LENGTH ,
        V.WIDTH ,
        V.NO_OF_BED_CODES ,
        V.YEAR_MADE ,
        VP1.MAKE  ,
        VP1.MODEL  ,
        VP1.LENGTH  ,
        VP1.WIDTH  ,
        VP1.NO_OF_BED_CODES  ,
        VP1.YEAR_MADE  ,
        VP2.MAKE  ,
        VP2.MODEL  ,
        VP2.LENGTH  ,
        VP2.WIDTH  ,
        VP2.NO_OF_BED_CODES  ,
        VP2.YEAR_MADE 
FROM    haven_base.plot.SALES S
        JOIN haven_base.plot.SALES_STATUSES SS ON S.SALE_STATUS_ENUM = SS.SALE_STATUS_ENUM
        JOIN haven_base.plot.ACCOUNTS AC ON S.ACCOUNT_ID = AC.ACCOUNT_ID
        JOIN haven_base.plot.VANS V ON S.VAN_ID = V.VAN_ID
        --OUTER APPLY plotreprs.dbo.fn_GetVanValuation(v.VAN_ID) AS MRRP
        JOIN haven_base.plot.SALES_TYPES ST ON S.SALE_TYPE_ENUM = ST.SALE_TYPE_ENUM
        JOIN haven_base.plot.PARKS PK ON S.PARK_ID = PK.PARK_ID
        LEFT JOIN haven_store.common.Dates_And_Periods WEEK_NO ON YEAR(WEEK_NO.ActualDate) = YEAR(S.COMPLETION_DATE)
                                                              AND MONTH(WEEK_NO.ActualDate) = MONTH(S.COMPLETION_DATE)
                                                              AND DAY(WEEK_NO.ActualDate) = DAY(S.COMPLETION_DATE)
        LEFT JOIN haven_base.plot.CSPS CSP ON CSP.CSP_ID = S.CSP_ID
        LEFT JOIN haven_base.plot.FINANCE_COMPANIES FC ON S.FIN_COMPANY_ID = FC.FIN_COMPANY_ID
        LEFT JOIN haven_base.plot.VANS VP1 ON VP1.VAN_ID = S.PEX1_VAN_ID
        LEFT JOIN haven_base.plot.VANS VP2 ON VP2.VAN_ID = S.PEX2_VAN_ID
        LEFT JOIN haven_base.plot.SOURCES SRC ON S.SOURCE_ID = SRC.SOURCE_ID
        LEFT JOIN haven_base.plot.WELCOME_MEETERS WM ON WM.WM_ID = S.WELCOME_MEETER_ID
        LEFT JOIN haven_base.plot.PITCHES PIT ON S.DESTINATION_PITCH_ID = PIT.PITCH_ID
        LEFT JOIN haven_base.plot.ZONES Z ON PIT.ZONE_ID = Z.ZONE_ID
        LEFT JOIN haven_base.plot.AREAS AR ON PIT.AREA_ID = AR.AREA_ID
--        OUTER APPLY plotreprs.dbo.fn_SalesValuesBreakDown(s.sale_id) AS VALS
WHERE   VALIDATION_DATE IS NOT NULL
        AND CANCELLATION_DATE IS NULL
        AND YEAR(DATE_SOLD) >=2020

         
-- 28/08/2024
        
USE ROLE useradmin;

-- Ross Eavis
-- ross.eavis@bourne-leisure.co.uk
-- Assistant Accountant

create user RossEavis
login_name = 'ross.eavis@bourne-leisure.co.uk'
display_name = 'Ross Eavis'
email = 'ross.eavis@bourne-leisure.co.uk'
comment = 'Assistant Accountant'
default_role = haven_accountants
default_warehouse = haven_accountants_warehouse_xsmall;

use role securityadmin;

GRANT ROLE haven_accountants TO USER RossEavis;


-- 28/08/2024
        
USE ROLE useradmin;

--
--
--

create user 
login_name = ''
display_name = ''
email = ''
comment = ''
default_role = haven_accountants
default_warehouse = haven_accountants_warehouse_xsmall;

use role securityadmin;

GRANT ROLE haven_accountants TO USER ;
