# The name of this view in Looker is "Fct Patient Conditions"
view: fct_patient_conditions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datatonic-americas-demos.dbt_cojovero.fct_patient_conditions`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: condition_abatement {
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
    sql: ${TABLE}.condition_abatement_at ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Condition Code" in Explore.

  dimension: condition_code {
    type: string
    sql: ${TABLE}.condition_code ;;
  }

  dimension: condition_id {
    type: string
    sql: ${TABLE}.condition_id ;;
  }

  dimension_group: condition_onset {
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
    sql: ${TABLE}.condition_onset_at ;;
  }

  dimension: condition_type {
    type: string
    sql: ${TABLE}.condition_type ;;
  }

  dimension: patient_address {
    type: string
    sql: ${TABLE}.patient_address ;;
  }

  dimension: patient_age_at_death {
    type: number
    sql: ${TABLE}.patient_age_at_death ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_patient_age_at_death {
    type: sum
    sql: ${patient_age_at_death} ;;
  }

  measure: average_patient_age_at_death {
    type: average
    sql: ${patient_age_at_death} ;;
  }

  dimension_group: patient_birth {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.patient_birth_date ;;
  }

  dimension: patient_city {
    type: string
    sql: ${TABLE}.patient_city ;;
  }

  dimension: patient_conditions_key {
    type: string
    sql: ${TABLE}.patient_conditions_key ;;
  }

  dimension: patient_country {
    type: string
    sql: ${TABLE}.patient_country ;;
  }

  dimension_group: patient_deceased {
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
    sql: ${TABLE}.patient_deceased_at ;;
  }

  dimension: patient_first_name {
    type: string
    sql: ${TABLE}.patient_first_name ;;
  }

  dimension: patient_id {
    type: string
    sql: ${TABLE}.patient_id ;;
  }

  dimension: patient_last_name {
    type: string
    sql: ${TABLE}.patient_last_name ;;
  }

  dimension: patient_name_in_use {
    type: string
    sql: ${TABLE}.patient_name_in_use ;;
  }

  dimension: patient_postal_code {
    type: string
    sql: ${TABLE}.patient_postal_code ;;
  }

  dimension: patient_state {
    type: string
    sql: ${TABLE}.patient_state ;;
  }

  measure: count {
    type: count
    drill_fields: [patient_first_name, patient_last_name]
  }
}
