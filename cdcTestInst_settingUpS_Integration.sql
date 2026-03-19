CREATE EXTENSION aws_s3 CASCADE;

SELECT * FROM pg_extension;
 
SELECT aws_commons.create_s3_uri(
   'aws-blg-staging-raw-s3',
   'export',
   'eu-west-1'
) AS s3_export_uri;


--SELECT * from aws_s3.query_export_to_s3('SELECT * FROM department',:'s3_export_uri');

--SELECT * from aws_s3.query_export_to_s3('SELECT * FROM department', 's3://aws-blg-staging-raw-s3');

SELECT * from aws_s3.query_export_to_s3('SELECT * FROM work.agentname', aws_commons.create_s3_uri(
   'aws-blg-staging-raw-s3',
   'cdcwork/work/agentname',
   'eu-west-1'
));

select * from information_schema.tables limit 100;



SELECT locationid, "Name", costrate, availability, modifieddate
FROM "Location";
