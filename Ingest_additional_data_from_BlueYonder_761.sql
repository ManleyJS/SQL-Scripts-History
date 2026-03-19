use ROLE dba;

use SCHEMA haven_pipeline.blueyonder;

show stages;

ls @BLUEYONDER_INTEGRATION_STAGE/pricing_reports;


use schema haven_raw.blueyonder;

show stages;

ls @haven_raw.blueyonder.BLUEYONDER_INTEGRATION_STAGE/pricing_reports/BREAK_OVERRIDE;

ls @haven_raw.blueyonder.BLUEYONDER_INTEGRATION_STAGE/pricing_reports/pricing_reports/GRADE_EXPANSION;


SELECT get_ddl('view', 'HAVEN_BASE.BLUEYONDER.PRICE_OVERRIDE_REPORT');



HAVEN_BASE.BLUEYONDER.PRICE_OVERRIDE_REPORT to  HAVEN_BASE.BLUEYONDER.PRICE_BREAKPRICECHG_REPORT