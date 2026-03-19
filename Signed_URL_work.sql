use database training;
use schema training;

show stages;

create OR REPLACE stage test_signed_url ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE');

show tables;
show file formats;

select * from customers;

copy into @test_signed_url/client_data/customers.csv.gz
from training.training.customers
file_format = (format_name = 'myformat'), single = true ;

list @test_signed_url;

remove @test_signed_url/client_data/test.csv.gz_0_0_0.csv.gz;

select get_presigned_url(@test_signed_url, 'client_data/customers.csv.gz', 3600) as presigned_url;

copy into @test_signed_url/client_data/test.csv.gz
from (select 'bob', 'ted', 'fred')
file_format = (format_name = 'myformat'), single = true ;

select get_presigned_url(@test_signed_url, 'client_data/test.csv.gz', 3600) as presigned_url;