use ROLE haven_batch_dataload;

USE WAREHOUSE bourne_batch_dataload_XSMALL;

USE SCHEMA HAVEN_STORE.cOUPA_CUBE;

create  table  inv  (
        inv_date_as_date  date  null,
        inv_created_date_as_date  date  null,
        inv_number varchar(100)  null,
        inv_id  varchar(100)  not  null,
        inv_status  varchar(100)  null,
        inv_supplier  varchar(100)  null,
        inv_commodity  varchar(900)  null,
        inv_createdby  varchar(100)  null,
        inv_line_number  varchar(100)  null,
        inv_item_description  varchar(8000)  not  null,
        inv_qty  decimal(38,  11)  null,
        inv_net  decimal(24,  16)  null,
        inv_tax  decimal(38,  11)  null,
        inv_gross  decimal(38,  11)  null,
        inv_segment  varchar(600)  null,
        inv_status_line  varchar(100)  null,
        inv_supplieritem  varchar(8000)  null,
        inv_source_part_num  varchar(8000)  not  null,
        inv_data_source  varchar(30)  not  null,
        inv_net_due_date_as_date  date  null
);

create  table  inv_commodity  (
        inv_commodity  varchar(900)  not  null,
        inv_commodity_level_1  varchar(900)  null,
        inv_commodity_level_2  varchar(900)  null,
        inv_commodity_level_3  varchar(900)  null,
        inv_commodity_level_4  varchar(900)  null,
        inv_commodity_level_lowest  varchar(900)  null
);

create  table  inv_created_date  (
        inv_created_date_as_date  date  not  null,
        inv_created_date  varchar(8)  not  null,
        inv_created_date_day_of_month_num  varchar(2)  null,
        inv_created_date_week_day_num  varchar(3)  null,
        inv_created_date_week_day_desc  varchar(3)  null,
        inv_created_date_month_num  varchar(2)  null,
        inv_created_date_month_desc  varchar(3)  null,
        inv_created_date_week_num  varchar(2)  null,
        inv_created_date_month_year_desc  varchar(6)  null,
        inv_created_date_month_year_num  varchar(6)  null,
        inv_created_date_year_num  int  null
);

create  table  inv_createdby  (
        inv_createdby_id  varchar(100)  not  null,
        inv_createdby_email  varchar(100)  not  null,
        inv_createdby_fullname  varchar(100)  null
);

create  table  inv_data_source  (
        inv_data_source  varchar(30)  not  null
);

create  table  inv_date  (
        inv_date  varchar(8)  not  null,
        inv_date_as_date  date  not  null,
        inv_date_day_of_month_num  varchar(2)  null,
        inv_date_week_day_num  varchar(3)  null,
        inv_date_week_day_desc  varchar(3)  null,
        inv_date_month_num  varchar(2)  null,
        inv_date_month_desc  varchar(3)  null,
        inv_date_week_num  varchar(2)  null,
        inv_date_month_year_desc  varchar(6)  null,
        inv_date_month_year_num  varchar(6)  null,
        inv_date_year_num  int  null
);

create  table  inv_id  (
        inv_id  varchar(100)  not  null
);

create  table  inv_item_description  (
        inv_item_description  varchar(8000)  not  null

);

create  table  inv_net_due_date  (
        inv_net_due_date  varchar(8)  not  null,
        inv_net_due_date_as_date  date  not  null,
        inv_net_due_date_day_of_month_num  varchar(2)  null,
        inv_net_due_date_week_day_num  varchar(3)  null,
        inv_net_due_date_week_day_desc  varchar(3)  null,
        inv_net_due_date_month_num  varchar(2)  null,
        inv_net_due_date_month_desc  varchar(3)  null,
        inv_net_due_date_week_num  varchar(2)  null,
        inv_net_due_date_month_year_desc  varchar(6)  null,
        inv_net_due_date_month_year_num  varchar(6)  null,
        inv_net_due_date_year_num  int  null
);

create  table  inv_number  (
        inv_number  varchar(100)  not  null
);

create  table  inv_segment  (
        inv_segment  varchar(600)  not  null,
        brand  varchar(13)  not  null,
        site  varchar(2)  null,
        department  varchar(2)  null,
        subdepartment  varchar(3)  null,
        nominal  varchar(5)  null,
        account  varchar(20)  null
);

create  table  inv_source_part_num  (
        inv_source_part_num  varchar(8000)  not  null
);

create  table  inv_status  (
        inv_status  varchar(100)  not  null
);

create  table  inv_supplier  (
        inv_supplier  varchar(100)  not  null,
        inv_supplier_number  varchar(100)  null,
        inv_supplier_name  varchar(100)  null
);

create  table  inv_supplieritem_live  (
        inv_supplieritem  varchar(8000)  not  null,
        inv_supplieritem_price  varchar()  null,
        inv_supplieritem_manufacturer  varchar()  not  null,
        inv_supplieritem_text  varchar(49)  null,
        inv_supplieritem_itemid  varchar(8000)  null
);

create  table  po  (
        po_date_as_date  date  null,
        po_number  varchar(100)  null,
        po_status  varchar(100)  null,
        po_supplier  varchar(100)  null,
        po_supplieritem  varchar(207)  not  null,
        po_commodity  varchar(900)  null,
        po_createdby  varchar(100)  null,
        po_line_number  varchar(100)  null,
        po_item_description  varchar(8000)  not  null,
        po_line_item_id  varchar(100)  null,
        po_source_part_num  varchar(8000)  not  null,
        po_qty  decimal(38,  11)  null,
        po_qty_rec  decimal(38,  11)  null,
        po_total  decimal(24,  16)  null,
        po_segment  varchar(600)  null,
        po_status_line  varchar(100)  null,
        po_req_requested_by_fullname  varchar(100)  null,
        po_nominal  varchar(400)  null,
        po_statsum  varchar(12)  not  null,
        po_receipted  decimal(38,  6)  null,
        po_unreceipted  decimal(38,  6)  null
);

create  table  po_commodity  (
        po_commodity  varchar(900)  not  null,
        po_commodity_level_1  varchar(900)  null,
        po_commodity_level_2  varchar(900)  null,
        po_commodity_level_3  varchar(900)  null,
        po_commodity_level_4  varchar(900)  null,
        po_commodity_level_lowest  varchar(900)  null
);

create  table  po_createdby  (
        po_createdby_id  varchar(100)  not  null,
        po_createdby_email  varchar(100)  not  null,
        po_createdby_fullname  varchar(100)  null
);

create  table  po_date  (
        po_date_as_date  date  not  null,
        po_date  varchar(8)  not  null,
        po_date_day_of_month_num  varchar(2)  null,
        po_date_week_day_num  varchar(3)  null,
        po_date_week_day_desc  varchar(3)  null,
        po_date_month_num  varchar(2)  null,
        po_date_month_desc  varchar(3)  null,
        po_date_week_num  varchar(2)  null,
        po_date_month_year_desc  varchar(6)  null,
        po_date_month_year_num  varchar(6)  null,
        po_date_year_num  int  null
);

create  table  po_item_description  (
        po_item_description  varchar(8000)  not  null
);

create  table  po_nominal  (
        po_nominal  varchar(400)  not  null
);

create  table  po_number  (
        po_number  varchar(100)  not  null
);

create  table  po_req_created_by_fullname  (
        po_req_created_by_fullname  varchar(100)  not  null
);

create  table  po_req_requested_by_fullname  (
        po_req_requested_by_fullname  varchar(100)  not  null
);

create  table  po_segment  (
        po_segment  varchar(600)  not  null,
        brand  varchar(100)  null,
        site  varchar(100)  null,
        department  varchar(100)  null,
        subdepartment  varchar(100)  null,
        nominal  varchar(100)  null,
        account  varchar(100)  null
);

create  table  po_source_part_num  (
        po_source_part_num  varchar(8000)  not  null
);

create  table  po_statsum  (
        statsum  varchar(20)  not  null,
        statsum_title  varchar(80)  not  null
);

create  table  po_status  (
        po_status  varchar(100)  not  null
);

create  table  po_status_line  (
        po_status_line  varchar(100)  not  null
);

create  table  po_supplier  (
        po_supplier  varchar(100)  not  null,
        po_supplier_number  varchar(100)  null,
        po_supplier_name  varchar(100)  null
);

create  table  po_supplieritem_live  (
        po_supplieritem  varchar(207)  not  null,
        po_supplieritem_price  varchar()  null,
        po_supplieritem_manufacturer  varchar()  not  null,
        po_supplieritem_text  varchar(49)  null,
        po_supplieritem_itemid  varchar(207)  null
);

SHOW TABLES;