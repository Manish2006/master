view: top_10_start_station {
  derived_table: {
    sql: SELECT start_station_latitude,count(*) as total FROM `applied-dialect-337706.covid_insights.citibike_trips`
      WHERE start_station_latitude IS NOT NULL
      group by 1
      order by 2 desc limit 10
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: start_station_latitude {
    type: number
    primary_key: yes
    sql: ${TABLE}.start_station_latitude ;;
  }

  dimension: Location2 {
    type: location
    sql_latitude: ${start_station_latitude} ;;
    sql_longitude: ${citibike_trips.start_station_longitude} ;;
  }

  measure: total_stations{
    type: sum
    sql: ${TABLE}.total ;;
  }


  set: detail {
    fields: [start_station_latitude, total_stations,Location2,citibike_trips.start_station_name]
  }
}
