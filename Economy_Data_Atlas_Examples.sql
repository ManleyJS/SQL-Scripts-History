select * 
  from "KNOEMA_ECONOMY_DATA_ATLAS"."ECONOMY"."DATASETS"
 where "DatasetName" ILIKE 'US Stock%'
    OR "DatasetName" ILIKE 'Exchange%Rates%';
    
select * 
  from KNOEMA_ECONOMY_DATA_ATLAS.ECONOMY.USINDSSP2020
 where "Date" = '2020-02-03'
 limit 1000;    
 


