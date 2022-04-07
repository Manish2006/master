# The name of this view in Looker is "Citibike Stations"
view: citibike_stations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `applied-dialect-337706.covid_insights.citibike_stations`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Capacity" in Explore.

  dimension: capacity {
    type: number
    sql: ${TABLE}.capacity ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_capacity {
    type: sum
    sql: ${capacity} ;;
  }

  measure: average_capacity {
    type: average
    sql: ${capacity} ;;
  }

  dimension: eightd_has_available_keys {
    type: yesno
    sql: ${TABLE}.eightd_has_available_keys ;;
  }

  dimension: eightd_has_key_dispenser {
    type: yesno
    sql: ${TABLE}.eightd_has_key_dispenser ;;
  }

  dimension: is_installed {
    type: yesno
    sql: ${TABLE}.is_installed ;;
  }

  dimension: is_renting {
    type: yesno
    sql: ${TABLE}.is_renting ;;
  }

  dimension: is_returning {
    type: yesno
    sql: ${TABLE}.is_returning ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_reported {
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
    sql: ${TABLE}.last_reported ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: num_bikes_available {
    type: number
    sql: ${TABLE}.num_bikes_available ;;
  }

  dimension: num_bikes_disabled {
    type: number
    sql: ${TABLE}.num_bikes_disabled ;;
  }

  dimension: num_docks_available {
    type: number
    sql: ${TABLE}.num_docks_available ;;
  }

  dimension: num_docks_disabled {
    type: number
    sql: ${TABLE}.num_docks_disabled ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.region_id ;;
  }

  dimension: rental_methods {
    type: string
    sql: ${TABLE}.rental_methods ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.short_name ;;
  }

  dimension: station_id {
    type: number
    sql: ${TABLE}.station_id ;;
  }

  measure: count {
    type: count
    drill_fields: [name, short_name]
  }
}
