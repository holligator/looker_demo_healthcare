include: "/views/raw/dim_patients.view.lkml"

view: +dim_patients {

  dimension: patient_id {
    primary_key: yes
  }

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
      month_name,
      month_num,
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
      month_name,
      month_num,
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
      month_name,
      month_num,
      quarter,
      year
    ]
  }

  dimension: patient_address {
    group_label: "Address Detail"
  }

  dimension_group: patient_birth {
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
  }

  dimension: patient_city {
    group_label: "Address Detail"
  }

  dimension: patient_country {
    group_label: "Address Detail"
  }

  dimension_group: patient_deceased {
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
  }

  dimension: patient_first_name {
  }

  dimension: patient_gender {
  }

  dimension: patient_last_name {
  }

  dimension: patient_postal_code {
    group_label: "Address Detail"
  }

  dimension: patient_state {
    group_label: "Address Detail"
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

  measure: total_conditions_on_first_visit_sum {
    label: "Total Conditions on First Visit"
    type: sum
    sql: ${total_conditions_on_first_visit} ;;
  }

  set: patient_set {
    fields: [
      patient_first_name,
      patient_last_name
    ]
  }
}
