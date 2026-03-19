create or replace procedure test_avro_load()
returns integer
language sql
as
$$
begin

    create or replace file format test_avro_sp_format type = AVRO compression = gzip;
    
    create or replace table test_avro_sp 
        using template (
        select array_agg(object_construct(*)) 
            from table(
                infer_schema(location=>'@testavro/100k.variants.avro.gz', 
                       file_format=>'test_avro_format'
                )
            )
        );
        
    copy into test_avro_sp from @testavro/100k.variants.avro.gz 
        file_format = test_avro_sp_format
        match_by_column_name = case_insensitive;

end;
$$
;

call test_avro_load();

describe table test_avro_sp;

select * from test_avro_sp limit 10;


create or replace procedure haven_store.activities.load_avro_data_file(TABLENAME VARCHAR, STAGENAME VARCHAR, FILENAME VARCHAR)
returns varchar
language javascript
as
$$

    var fileFormatSQL = "create or replace file format test_avro_load_format type = AVRO";
    
    var spStmt = snowflake.createStatement( {sqlText: fileFormatSQL})
    spStmt.execute()

    var tableCreateSQL = "create or replace table " + TABLENAME + "_stage using template ("
    tableCreateSQL += "select array_agg(object_construct(*)) "
    tableCreateSQL += "from table(infer_schema(location=>'@" + STAGENAME + "/" + FILENAME + "', "
    tableCreateSQL += "file_format=>'test_avro_load_format')))";
    
    var spStmt = snowflake.createStatement( {sqlText: tableCreateSQL})
    spStmt.execute()
    
    var tableCopySQL = "copy into " + TABLENAME + "_stage from @" + STAGENAME + "/" + FILENAME;
    tableCopySQL += " file_format = test_avro_load_format"
    tableCopySQL += " match_by_column_name = case_insensitive";
    
    var spStmt = snowflake.createStatement( {sqlText: tableCopySQL})
    var rs = spStmt.execute()

    rs.next()
    return rs.getColumnValue(1) + " : " + rs.getColumnValue(2) + " : " + rs.getColumnValue(3);
    
$$
;

call test_avro_load_params('TEST_AVRO_SP_PARAMS', 'TESTAVRO', '100.variants.avro.gz');

describe table test_avro_sp;

select * from test_avro_sp limit 10;


create table names (v varchar);

create procedure duplicate_name(pv_name varchar)
returns varchar
language sql
as
$$
    begin
        declare
            pv_name varchar;
        begin
            pv_name := 'middle block variable';
            declare
                pv_name varchar;
            begin
                pv_name := 'innermost block variable';
                insert into names (v) values (:PV_NAME);
            end;
            -- Because the innermost and middle blocks have separate variables
            -- named "pv_name", the INSERT below inserts the value
            -- 'middle block variable'.
            insert into names (v) values (:PV_NAME);
        end;
        -- This inserts the value of the input parameter.
        insert into names (v) values (:PV_NAME);
        return 'Completed.';
    end;
$$
;

call duplicate_name('bob');

select * from names;

