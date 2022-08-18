# The name of this view in Looker is "Sla"
view: sla {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `applied-dialect-337706.covid_insights.SLA`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Caller" in Explore.

  dimension: caller {
    type: string
    sql: ${TABLE}.Caller ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: closed_by {
    type: string
    sql: ${TABLE}.Closed_by ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.Company ;;
  }

  dimension: configuration_item {
    type: string
    sql: ${TABLE}.Configuration_item ;;
  }

  dimension: contract {
    type: string
    sql: ${TABLE}.Contract ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
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
    sql: ${TABLE}.Created ;;
  }

  dimension_group: created_33 {
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
    sql: ${TABLE}.Created_33 ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.Created_by ;;
  }

  dimension: gcc_engage {
    type: yesno
    sql: ${TABLE}.GCC_Engage ;;
  }

  dimension: gcc_not_required {
    type: yesno
    sql: ${TABLE}.GCC_Not_Required ;;
  }

  dimension: has_breached {
    type: yesno
    sql: ${TABLE}.Has_breached ;;
  }

  dimension: impact {
    type: string
    sql: ${TABLE}.Impact ;;
  }

  dimension: impacted_gocs {
    type: string
    sql: ${TABLE}.Impacted_GOCs ;;
  }

  dimension: impacted_regions {
    type: string
    sql: ${TABLE}.Impacted_Regions ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }

  dimension: made_sla {
    type: yesno
    sql: ${TABLE}.Made_SLA ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}.Number ;;
  }

  measure: Total_tickets {
    type: count_distinct
    sql: ${number} ;;
  }

  dimension_group: opened {
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
    sql: ${TABLE}.Opened ;;
  }

  dimension: opened_by {
    type: string
    sql: ${TABLE}.Opened_by ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.Priority ;;
  }

  dimension: reassignment_count {
    type: number
    sql: ${TABLE}.Reassignment_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_reassignment_count {
    type: sum
    sql: ${reassignment_count} ;;
  }

  measure: average_reassignment_count {
    type: average
    sql: ${reassignment_count} ;;
  }

  dimension: reliability {
    type: yesno
    sql: ${TABLE}.Reliability ;;
  }

  dimension: reliability_type {
    type: string
    sql: ${TABLE}.Reliability_Type ;;
  }

  dimension: reopened {
    type: yesno
    sql: ${TABLE}.Reopened ;;
  }

  dimension: request_root_cause {
    type: yesno
    sql: ${TABLE}.Request_Root_Cause ;;
  }

  dimension: resolution_bucket {
    type: string
    sql: ${TABLE}.Resolution_Bucket ;;
  }

  dimension: resolution_category {
    type: string
    sql: ${TABLE}.Resolution_category ;;
  }

  dimension: resolution_category_new {
    type: string
    sql: case when ${resolution_category}= 'User knowledge or training error' OR
    ${resolution_category}= 'Cancelled by user' OR
    ${resolution_category}= 'Job Failure' OR
    ${resolution_category}= 'Broken/Damaged  (physical)' OR
    ${resolution_category}= 'Data Issue' OR
    ${resolution_category}= 'User Access / Permission' OR
    ${resolution_category}= 'Configuration Error' OR
    ${resolution_category}= 'Connectivity' OR
    ${resolution_category}= 'High Memory Utilization'
    then ${resolution_category}
    else 'No Resolution Code Defined'
    end ;;
  }

  dimension: resolution_method {
    type: string
    sql: ${TABLE}.Resolution_Method ;;
  }

  dimension: resolution_sub_code {
    type: string
    sql: ${TABLE}.Resolution_Sub_Code ;;
  }

  measure: MTTR_Hours {
    type: average
    sql: (DATE_DIFF(${resolved_raw},${created_raw},hour));;
    filters: [stage: "-Cancelled"]
    value_format: "0.##"

  }


  dimension_group: resolved {
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
    sql: ${TABLE}.Resolved ;;
  }

  dimension: resolved_by {
    type: string
    sql: ${TABLE}.Resolved_by ;;
  }

  dimension: resolved_by_group {
    type: string
    sql: ${TABLE}.Resolved_by_group ;;
  }

  dimension: severity {
    type: string
    sql: ${TABLE}.Severity ;;
  }

  dimension: sla {
    type: string
    sql: ${TABLE}.SLA ;;
  }

  dimension: sla_date {
    type: string
    sql: ${TABLE}.SLA_Date ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.Stage ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.Sub_Category ;;
  }

  dimension: task_type {
    type: string
    sql: ${TABLE}.Task_type ;;
  }

  dimension: time_worked {
    type: number
    sql: ${TABLE}.Time_worked ;;
  }

  dimension: urgency {
    type: string
    sql: ${TABLE}.Urgency ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
