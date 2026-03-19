use ROLE haven_etleap_dataload;

use SCHEMA haven_raw.dig_arrivals_etleap;

SHOW tables;

--CARAVAN
--arrival
--anpr
--anpr_device
--transportation


create table CARAVAN_clone_29012026 clone CARAVAN;
create table arrival_clone_29012026 clone  arrival;
create table anpr_clone_29012026 clone  anpr;
create table anpr_device_clone_29012026 clone  anpr_device;
create table transportation_clone_29012026 clone  transportation;



