view: stlm_spfc_amt2 {
  sql_table_name: t_stlm_spfc_amt2 ;;

  dimension: pk {
    type: string
    sql: concat(${stlm_no},${stlm_ymd} ;;
    primary_key: yes
  }



  dimension: stlm_no {
    type: string
    sql: ${TABLE}.stlm_no ;;
  }

  dimension: stlm_ymd {
    type: string
    sql: ${TABLE}.stlm_ymd ;;
  }

  filter: date_filter {
    type: date
  }

  filter: date_filters {
    type: date
    convert_tz: no
    sql:( coalesce( ${stlm_ymd} >= replace(cast({% date_start date_filter %} as string) ,'-',''), TRUE) )  ;;
    # sql: ( coalesce( ${stlm_ymd} >= from_timestamp({% date_start date_filter %}, 'yyyyMMdd'), TRUE) )
    #   AND ( coalesce( ${stlm_ymd} <= from_timestamp({% date_end date_filter %}, 'yyyyMMdd'), TRUE) );;
  }
}
