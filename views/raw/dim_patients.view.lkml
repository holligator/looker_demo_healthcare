# The name of this view in Looker is "Dim Patients"
view: dim_patients {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datatonic-americas-demos.healthcare_demo.dim_patients`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  dimension: age_when_deceased {
    type: number
    sql: ${TABLE}.age_when_deceased ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: first_condition {
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
    sql: ${TABLE}.first_condition_date ;;
  }

  dimension_group: first_encounter {
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
    sql: ${TABLE}.first_encounter_date ;;
  }

  dimension: first_visit_condition_text {
    type: string
    sql: ${TABLE}.first_visit_condition_text ;;
  }

  dimension_group: last_encounter {
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
    sql: ${TABLE}.last_encounter_date ;;
  }

  dimension: patient_address {
    type: string
    sql: ${TABLE}.patient_address ;;
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

  dimension: patient_gender {
    type: string
    sql: ${TABLE}.patient_gender ;;
  }

  dimension: patient_id {
    type: string
    sql: ${TABLE}.patient_id ;;
  }

  dimension: patient_last_name {
    type: string
    sql: ${TABLE}.patient_last_name ;;
  }

  dimension: patient_postal_code {
    type: string
    sql: ${TABLE}.patient_postal_code ;;
  }

  dimension: patient_state {
    type: string
    sql: ${TABLE}.patient_state ;;
  }

  dimension: total_conditions_on_first_visit {
    type: number
    sql: ${TABLE}.total_conditions_on_first_visit ;;
  }

  dimension: total_count_of_unique_conditions {
    type: number
    sql: ${TABLE}.total_count_of_unique_conditions ;;
  }

  dimension: total_encounters {
    type: number
    sql: ${TABLE}.total_encounters ;;
  }

  measure: count {
    type: count
    drill_fields: [patient_first_name, patient_last_name]
  }
}
