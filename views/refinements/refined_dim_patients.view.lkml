include: "/views/raw/dim_patients.view.lkml"

view: +dim_patients {

  dimension: age {
  }

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  dimension: age_when_deceased {
  }

  dimension_group: first_condition {
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
  }

  dimension_group: first_encounter {
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
  }

  dimension: first_visit_condition_type {
  }

  dimension_group: last_encounter {
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
  }

  dimension: patient_address {
  }

  dimension_group: patient_birth {
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
  }

  dimension: patient_city {
  }

  dimension: patient_country {
  }

  dimension_group: patient_deceased {
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
  }

  dimension: patient_first_name {
  }

  dimension: patient_gender {
  }

  dimension: patient_id {
  }

  dimension: patient_last_name {
  }

  dimension: patient_postal_code {
  }

  dimension: patient_state {
  }

  dimension: total_conditions_on_first_visit {
  }

  dimension: total_count_of_unique_conditions {
  }

  dimension: total_encounters {
  }

  measure: count {
    label: "Count of Patients"
    drill_fields: [patient_set*]
  }

  set: patient_set {
    fields: [
      patient_first_name,
      patient_last_name
    ]
  }
}
