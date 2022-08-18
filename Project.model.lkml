connection: "manish_connection"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: citibike_trips {}
explore: citibike_stations {}
explore: baseball {}
explore: start_and_end_station {}
explore: top_10_start_station {
  view_name: citibike_trips
  join: top_10_start_station {

    type: left_outer
    sql_on: ${top_10_start_station.start_station_latitude}=${citibike_trips.start_station_latitude} ;;
    relationship: many_to_one
  }
  join: top_10_end_station {
    type: left_outer
    sql_on: ${top_10_end_station.end_station_latitude}=${citibike_trips.end_station_latitude}  ;;
    relationship: many_to_one
  }
}
