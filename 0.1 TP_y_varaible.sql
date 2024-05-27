create  table scratch.riders.TP_y_variable as
with base as
(
select 
CAST(EXTRACT(HOUR FROM START_OF_PERIOD_LOCAL) AS INT) as hour_of_day
,DATE_TRUNC(month, Date (START_OF_PERIOD_LOCAL)) AS order_month 
,upper(zone_code) as zone_code
,lower(city_name) as city_name
,coalesce(sum(ORDERS_ASAP),0)as orders_ASAP
,coalesce(sum(ORDERS_DELIVERED),0)as orders_delievered
,COALESCE(SUM(RIDER_HOURS_WORKED ), 0) AS rider_hours_worked
,sum(coalesce(RIDERS_AVAILABLE_IN_HOUR,0)) as riders_available 
,sum(coalesce(RET_MINS_SUM,0))as RET_total
,NULLIFZERO(sum(RET_MINS_SUM) / NULLIFZERO(sum(ORDERS_ASAP))) as RET_AVG
,NULLIFZERO(sum(ORDERS_ASAP))/NULLIFZERO(sum(RIDERS_AVAILABLE_IN_HOUR)) as TP_1
, sum(TOTAL_ORDER_TIME_PHYSICAL_ZONE_HOURS)as TOTAL_ORDER_TIME_PHYSICAL_ZONE_HOURS
,sum(TOTAL_TIME_PHYSICAL_ZONE_HOURS)as TOTAL_TIME_PHYSICAL_ZONE_HOURS
,NULLIFZERO(sum(RIDER_HOURS_ON_ORDERS_DHW_SUM))/ NULLIFZERO(sum(RIDER_HOURS_WORKED)) as Utilisation_rate_1
,NULLIFZERO(sum(TOTAL_ORDER_TIME_PHYSICAL_ZONE_HOURS))/NULLIFZERO(sum(TOTAL_TIME_PHYSICAL_ZONE_HOURS )) as UR_zone_corrected
from
PRODUCTION.AGGREGATE.AGG_ZONE_DELIVERY_METRICS_HOURLY
where
date (start_of_period_local) between   '2023-03-01' and '2024-04-30'
and CNT_ERAT >0 -- use this filter to get only active zone
group by 1,2,3,4
)
,TP_calc as
(
select 
*
,coalesce(UR_zone_corrected*(60/ RET_avg),TP_1)  as TP_zone_corrected
from base 

)
select a.*,b.TP_zone_corrected 
from 
scratch.riders.TP_master_table as a
left join 
TP_calc as b
 on lower(a.zone_code)=lower(b.zone_code)
 and lower(a.city_name)=lower(b.city_name)
 and a.order_month=b.order_month
 and a.hour_of_day=b.hour_of_day;
 



    

