use schema bourne_work.public;

show stages;

list @testavro;

select * from testavrofile order by data_item desc ;
select distinct(data_item:annotation.chromosome::string) as annotation from testavrofile;

create file format test_avro_format type = AVRO compression = gzip;

select * from table(infer_schema(location=>'@testavro/10k.variants.avro.gz', file_format=>'test_avro_format'));

create or replace table test_avro 
    using template (
      select array_agg(object_construct(*)) 
        from table(
          infer_schema(location=>'@testavro/10k.variants.avro.gz', 
                       file_format=>'test_avro_format'
                      )
        )
    );

copy into test_avro from @testavro/10k.variants.avro.gz 
file_format = test_avro_format
match_by_column_name = case_insensitive;

copy into test_avro from @testavro/100k.variants.avro.gz 
file_format = test_avro_format
match_by_column_name = case_insensitive;

describe table test_avro;    

select * from test_avro limit 10;

--https://www.snowflake.com/blog/schema-detection-public-preview/
--https://docs.snowflake.com/en/sql-reference/functions/infer_schema.html
--https://docs.snowflake.com/en/sql-reference/sql/create-table.html
--https://docs.snowflake.com/en/user-guide/semistructured-considerations.html
--https://community.pyramidanalytics.com/t/y7mtqd/tableau-an-incomplete-choice-for-microsoft-analysis-services
--https://docs.snowflake.com/en/sql-reference/sql/list.html
--https://docs.snowflake.com/en/user-guide/data-load-gcs.html
--https://www.stitchdata.com/docs/integrations/saas/google-analytics#custom-metrics-dimensions