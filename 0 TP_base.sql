create  or replace table scratch.riders.TP_master_table as 
 
with base as
(
select 
 distinct 
 zone_code
 ,city_name
 ,CAST(EXTRACT(HOUR FROM START_OF_PERIOD_LOCAL) AS INT) as hour_of_day
from 
PRODUCTION.AGGREGATE.AGG_ZONE_DELIVERY_METRICS_HOURLY
where
date (start_of_period_local) between   current_date-30 and current_date
and is_within_zone_hours =true
and CNT_ERAT >0  
)
, base_2 as(
 select 
 CAST(EXTRACT(HOUR FROM START_OF_PERIOD_LOCAL) AS INT) as hour_of_day
,DATE_TRUNC(month, Date (START_OF_PERIOD_LOCAL)) AS order_month
 from 
 PRODUCTION.AGGREGATE.AGG_ZONE_DELIVERY_METRICS_HOURLY
where
date (start_of_period_local) between   '2023-03-01' and '2024-04-30'
and CNT_ERAT >0 
)
,distinct_month as(
select distinct order_month from base_2
)
select * from base 
left join 
distinct_month 
 on 1=1;
