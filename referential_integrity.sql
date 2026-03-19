use database training;

create schema rftest;

use schema rftest;

create or replace table bob (
id integer not null unique,
stringdata varchar(),
constraint bob_pk primary key (id)
);

create or replace table fred (
id integer not null,
bob_id integer not null,
stringdata varchar(),
constraint fred_pk primary key (id),
constraint fred_to_Bob_fk foreign key (bob_id) references bob(id)
);

select get_ddl('schema', 'rftest');


create or replace schema RFTEST;

create or replace TABLE BOB (
	ID NUMBER(38,0) NOT NULL,
	STRINGDATA VARCHAR(16777216),
	constraint BOB_PK primary key (ID)
);
create or replace TABLE FRED (
	ID NUMBER(38,0) NOT NULL,
	BOB_ID NUMBER(38,0) NOT NULL,
	STRINGDATA VARCHAR(16777216),
	constraint FRED_PK primary key (ID),
	constraint FRED_TO_BOB_FK foreign key (BOB_ID) references TRAINING.RFTEST.BOB(ID)
);

SELECT *
  FROM training.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE constraint_schema = 'RFTEST'
  ORDER BY table_name;

select * from information_schema.referential_constraints;


SELECT tc.*, rc.*
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
    JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc ON tc.constraint_name=rc.constraint_name;


with role_details as (show grants to user gregtaylor)
select "name" from role_details;


SHOW GRANTS TO ROLE CARAVAN_SALES_PRICING_APPLICATION;