# The name of this view in Looker is "Fct Claims"
view: fct_claims {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datatonic-americas-demos.healthcare_demo.fct_claims`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Billable Period Duration Minutes" in Explore.

  dimension: billable_period_duration_minutes {
    type: number
    sql: ${TABLE}.billable_period_duration_minutes ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_billable_period_duration_minutes {
    type: sum
    sql: ${billable_period_duration_minutes} ;;
  }

  measure: average_billable_period_duration_minutes {
    type: average
    sql: ${billable_period_duration_minutes} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: billable_period_ended {
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
    sql: ${TABLE}.billable_period_ended_at ;;
  }

  dimension_group: billable_period_started {
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
    sql: ${TABLE}.billable_period_started_at ;;
  }

  dimension: claim_id {
    type: string
    sql: ${TABLE}.claim_id ;;
  }

  dimension: claim_status {
    type: string
    sql: ${TABLE}.claim_status ;;
  }

  dimension: claim_total_value {
    type: number
    sql: ${TABLE}.claim_total_value ;;
  }

  dimension: condition_id {
    type: string
    sql: ${TABLE}.condition_id ;;
  }

  dimension: condition_type {
    type: string
    sql: ${TABLE}.condition_type ;;
  }

  dimension: encounter_id {
    type: string
    sql: ${TABLE}.encounter_id ;;
  }

  dimension: medication_request_id {
    type: string
    sql: ${TABLE}.medication_request_id ;;
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

  dimension: procedure_id {
    type: string
    sql: ${TABLE}.procedure_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
