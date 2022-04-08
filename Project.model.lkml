connection: "manish_connection"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: citibike_trips {}
explore: citibike_stations {}
explore: top_10_start_station {
  join: citibike_trips {
    type: left_outer
    sql_on: ${top_10_start_station.start_station_latitude}=${citibike_trips.start_station_latitude} ;;
    relationship: one_to_many
  }
  join: top_10_end_station {
    type: left_outer
    sql_on: ${top_10_end_station.end_station_latitude}=${citibike_trips.end_station_latitude}  ;;
    relationship: one_to_many
  }
}
