# The name of this view in Looker is "Citibike Trips"
view: citibike_trips {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `applied-dialect-337706.covid_insights.citibike_trips`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Bikeid" in Explore.

  dimension: bikeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bikeid ;;
  }

  measure: total_bikes {
    type: count_distinct
    sql: ${bikeid} ;;
  }

  dimension: birth_year {
    type: number
    sql: ${TABLE}.birth_year ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_birth_year {
    type: sum
    sql: ${birth_year} ;;
  }

  measure: average_birth_year {
    type: average
    sql: ${birth_year} ;;
  }

  dimension: customer_plan {
    type: string
    sql: ${TABLE}.customer_plan ;;
  }

  dimension: end_station_id {
    type: number
    sql: ${TABLE}.end_station_id ;;
  }

  dimension: end_station_latitude {
    type: number
    sql: ${TABLE}.end_station_latitude ;;
  }

  dimension: end_station_longitude {
    type: number
    sql: ${TABLE}.end_station_longitude ;;
  }

  dimension: end_station_name {
    type: string
    sql: ${TABLE}.end_station_name ;;
  }


  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: start_station_id {
    type: number
    sql: ${TABLE}.start_station_id ;;
  }

  dimension: start_station_latitude {
    type: number
    sql: ${TABLE}.start_station_latitude ;;
  }

  dimension: location1 {
    type: location
    sql_latitude: ${start_station_latitude} ;;
    sql_longitude: ${start_station_longitude} ;;

  }

  measure: total_station {
    type: count_distinct
    sql: ${start_station_name} ;;
  }


  dimension: start_station_longitude {
    type: number
    sql: ${TABLE}.start_station_longitude ;;
  }

  dimension: start_station_name {
    type: string
    sql: ${TABLE}.start_station_name ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: starttime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.starttime ;;
  }

  dimension_group: stoptime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.stoptime ;;
  }

  dimension: tripduration {
    type: number
    sql: ${TABLE}.tripduration ;;
  }

  measure: avg_tripduration {
    type: average
    sql: ${tripduration} ;;
    value_format: "0.##"
  }

  dimension: usertype {
    type: string
    sql: ${TABLE}.usertype ;;
    hidden: yes
  }

  dimension: new_usertype {
    type: string
    sql: case
    when usertype='' then 'unknown'
    else ${usertype}
    end;;
  }

  measure: count {
    type: count
    drill_fields: [start_station_name, end_station_name]
  }
}
