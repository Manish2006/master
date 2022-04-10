view: top_10_end_station {
  derived_table: {
    sql: SELECT end_station_latitude,count(*) as total1 FROM `applied-dialect-337706.covid_insights.citibike_trips_1`
      WHERE end_station_latitude IS NOT NULL
      group by 1
      order by 2 desc limit 10
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: end_station_latitude {
    type: number
    primary_key: yes
    sql: ${TABLE}.end_station_latitude ;;
  }

  dimension: Location3 {
    type: location
    sql_latitude: ${end_station_latitude} ;;
    sql_longitude: ${citibike_trips.end_station_longitude} ;;
  }

  measure: total_stations1{
    type: sum
    sql: ${TABLE}.total1 ;;
  }


  set: detail {
    fields: [end_station_latitude,total_stations1,Location3,citibike_trips.end_station_name]
}
}
