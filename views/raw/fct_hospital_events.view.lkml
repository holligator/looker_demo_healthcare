# The name of this view in Looker is "Fct Hospital Events"
view: fct_hospital_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datatonic-americas-demos.healthcare_demo.fct_hospital_events`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Condition ID" in Explore.

  dimension: condition_id {
    type: string
    sql: ${TABLE}.condition_id ;;
  }

  dimension: encounter_duration_minutes {
    type: number
    sql: ${TABLE}.encounter_duration_minutes ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_encounter_duration_minutes {
    type: sum
    sql: ${encounter_duration_minutes} ;;
  }

  measure: average_encounter_duration_minutes {
    type: average
    sql: ${encounter_duration_minutes} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: encounter_ended {
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
    sql: ${TABLE}.encounter_ended_at ;;
  }

  dimension: encounter_id {
    type: string
    sql: ${TABLE}.encounter_id ;;
  }

  dimension_group: encounter_started {
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
    sql: ${TABLE}.encounter_started_at ;;
  }

  dimension: hospital_event_sk {
    type: string
    sql: ${TABLE}.hospital_event_sk ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: patient_id {
    type: string
    sql: ${TABLE}.patient_id ;;
  }

  dimension: procedure_code {
    type: string
    sql: ${TABLE}.procedure_code ;;
  }

  dimension: procedure_duration_minutes {
    type: number
    sql: ${TABLE}.procedure_duration_minutes ;;
  }

  dimension_group: procedure_ended {
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
    sql: ${TABLE}.procedure_ended_at ;;
  }

  dimension: procedure_id {
    type: string
    sql: ${TABLE}.procedure_id ;;
  }

  dimension_group: procedure_started {
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
    sql: ${TABLE}.procedure_started_at ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
