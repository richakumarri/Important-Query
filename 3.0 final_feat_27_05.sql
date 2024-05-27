create  table scratch.riders.TP_final_df_27_05 as
select
base.*
,lst_21_days.*exclude (zone_code, city_name, order_month)
,lst_14_days.*exclude (zone_code, city_name, order_month)
,lst_7_days.*exclude (zone_code, city_name, order_month)
,lst_5_days.*exclude (zone_code, city_name, order_month)
,lst_3_days.*exclude (zone_code, city_name, order_month)
,lst_30_days.*exclude (zone_code, city_name, order_month)
,lst_90_days.*exclude (zone_code, city_name, order_month)
,lst_180_days.*exclude (zone_code, city_name, order_month)
,lst_21_same_hr.*exclude (zone_code, city_name, order_month,DELIVERED_HOUR)
,lst_14_same_hr.*exclude (zone_code, city_name, order_month,DELIVERED_HOUR)
,lst_7_same_hr.*exclude (zone_code, city_name, order_month,DELIVERED_HOUR)
,lst_5_same_hr.*exclude (zone_code, city_name, order_month,DELIVERED_HOUR)
,lst_3_same_hr.*exclude (zone_code, city_name, order_month,DELIVERED_HOUR)
,lst_30_same_hr.*exclude (zone_code, city_name, order_month,DELIVERED_HOUR)
,lst_90_same_hr.*exclude (zone_code, city_name, order_month,DELIVERED_HOUR)
,lst_180_same_hr.*exclude (zone_code, city_name, order_month,DELIVERED_HOUR)

from scratch.riders.TP_y_variable  as base

left join
scratch.riders.last_21_dys_metrics as lst_21_days 
on base.ZONE_CODE    =lst_21_days.ZONE_CODE
and base.CITY_NAME   =lst_21_days.CITY_NAME
and base.ORDER_MONTH =lst_21_days.ORDER_MONTH

left join
scratch.riders.last_14_dys_metrics as lst_14_days
on  base.ZONE_CODE   =lst_14_days.ZONE_CODE
and base.CITY_NAME   =lst_14_days.CITY_NAME
and base.ORDER_MONTH =lst_14_days.ORDER_MONTH

left join
scratch.riders.last_7_dys_metrics as lst_7_days
on  base.ZONE_CODE   =lst_7_days.ZONE_CODE
and base.CITY_NAME   =lst_7_days.CITY_NAME
and base.ORDER_MONTH =lst_7_days.ORDER_MONTH

left join
scratch.riders.last_5_dys_metrics as lst_5_days
on  base.ZONE_CODE   =lst_5_days.ZONE_CODE
and base.CITY_NAME   =lst_5_days.CITY_NAME
and base.ORDER_MONTH =lst_5_days.ORDER_MONTH

left join
scratch.riders.last_3_dys_metrics as lst_3_days
on  base.ZONE_CODE   =lst_3_days.ZONE_CODE
and base.CITY_NAME   =lst_3_days.CITY_NAME
and base.ORDER_MONTH =lst_3_days.ORDER_MONTH

left join
scratch.riders.last_30_dys_metrics as lst_30_days
on  base.ZONE_CODE   =lst_30_days.ZONE_CODE
and base.CITY_NAME   =lst_30_days.CITY_NAME
and base.ORDER_MONTH =lst_30_days.ORDER_MONTH


left join
scratch.riders.last_90_dys_metrics as lst_90_days
on  base.ZONE_CODE   =lst_90_days.ZONE_CODE
and base.CITY_NAME   =lst_90_days.CITY_NAME
and base.ORDER_MONTH =lst_90_days.ORDER_MONTH

left join
scratch.riders.last_180_dys_metrics as lst_180_days
on  base.ZONE_CODE   =lst_180_days.ZONE_CODE
and base.CITY_NAME   =lst_180_days.CITY_NAME
and base.ORDER_MONTH =lst_180_days.ORDER_MONTH

left join
scratch.riders.last_21_dys_same_hr_same_hour as lst_21_same_hr
on  base.ZONE_CODE   =lst_21_same_hr.ZONE_CODE
and base.CITY_NAME   =lst_21_same_hr.CITY_NAME
and base.ORDER_MONTH =lst_21_same_hr.ORDER_MONTH
and base.hour_of_Day =lst_21_same_hr.DELIVERED_HOUR

left join
scratch.riders.last_14_dys_same_hr_same_hour as lst_14_same_hr
on  base.ZONE_CODE   =lst_14_same_hr.ZONE_CODE
and base.CITY_NAME   =lst_14_same_hr.CITY_NAME
and base.ORDER_MONTH =lst_14_same_hr.ORDER_MONTH
and base.hour_of_Day =lst_14_same_hr.DELIVERED_HOUR

left join
scratch.riders.last_7_dys_same_hr_same_hour as lst_7_same_hr
on  base.ZONE_CODE   =lst_7_same_hr.ZONE_CODE
and base.CITY_NAME   =lst_7_same_hr.CITY_NAME
and base.ORDER_MONTH =lst_7_same_hr.ORDER_MONTH
and base.hour_of_Day =lst_7_same_hr.DELIVERED_HOUR


left join
scratch.riders.last_5_dys_same_hr_same_hour as lst_5_same_hr
on  base.ZONE_CODE   =lst_5_same_hr.ZONE_CODE
and base.CITY_NAME   =lst_5_same_hr.CITY_NAME
and base.ORDER_MONTH =lst_5_same_hr.ORDER_MONTH
and base.hour_of_Day =lst_5_same_hr.DELIVERED_HOUR

left join
scratch.riders.last_3_dys_same_hr_same_hour as lst_3_same_hr
on  base.ZONE_CODE   =lst_3_same_hr.ZONE_CODE
and base.CITY_NAME   =lst_3_same_hr.CITY_NAME
and base.ORDER_MONTH =lst_3_same_hr.ORDER_MONTH
and base.hour_of_Day =lst_3_same_hr.DELIVERED_HOUR

left join
scratch.riders.last_30_dys_same_hr_same_hour as lst_30_same_hr
on  base.ZONE_CODE   =lst_30_same_hr.ZONE_CODE
and base.CITY_NAME   =lst_30_same_hr.CITY_NAME
and base.ORDER_MONTH =lst_30_same_hr.ORDER_MONTH
and base.hour_of_Day =lst_30_same_hr.DELIVERED_HOUR

left join
scratch.riders.last_90_dys_same_hr_same_hour as lst_90_same_hr
on  base.ZONE_CODE   =lst_90_same_hr.ZONE_CODE
and base.CITY_NAME   =lst_90_same_hr.CITY_NAME
and base.ORDER_MONTH =lst_90_same_hr.ORDER_MONTH
and base.hour_of_Day =lst_90_same_hr.DELIVERED_HOUR

left join
scratch.riders.last_180_dys_same_hr_same_hour as lst_180_same_hr
on  base.ZONE_CODE   =lst_180_same_hr.ZONE_CODE
and base.CITY_NAME   =lst_180_same_hr.CITY_NAME
and base.ORDER_MONTH =lst_180_same_hr.ORDER_MONTH
and base.hour_of_Day =lst_180_same_hr.DELIVERED_HOUR
