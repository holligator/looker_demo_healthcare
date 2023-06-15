include: "/views/raw/fct_hospital_events.view.lkml"

view: +fct_hospital_events {

  dimension: hospital_event_sk {
    primary_key: yes
  }

  dimension: condition_id {
    group_label: "IDs"
  }

  dimension: encounter_duration_minutes {
    hidden: yes
  }

  measure: total_encounter_duration_minutes {
    type: sum
    sql: ${encounter_duration_minutes} ;;
  }

  measure: average_encounter_duration_minutes {
    type: average
    sql: ${encounter_duration_minutes} ;;
  }

  dimension_group: encounter_ended {
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

  dimension: encounter_id {
    group_label: "IDs"
  }

  dimension_group: encounter_started {
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

  dimension_group: of_hospital_encounter {
    group_label: "Duration of Encounter"
    type: duration
    sql_start: ${encounter_started_date} ;;
    sql_end: ${encounter_ended_date} ;;
    intervals: [
      minute,
      hour,
      day,
      week,
      month
    ]
  }

  dimension: organization_id {
    group_label: "IDs"
  }

  dimension: patient_id {
    group_label: "IDs"
  }

  dimension: procedure_code {
  }

  dimension: procedure_duration_minutes {
  }

  dimension_group: procedure_ended {
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

  dimension: procedure_id {
    group_label: "IDs"
  }

  dimension_group: procedure_started {
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

  dimension: has_been_14_days_since_last_procedure {
    hidden: yes
    type: yesno
    sql: date_diff(${dim_patients.patient_deceased_date}, ${procedure_ended_date}, day) <= 14 ;;
  }

  measure: count_of_patients_who_died_14_days_after_procedure {
    description: "The number of patients who died 14 days after after a procedure had taken place."
    type: count
    filters: [has_been_14_days_since_last_procedure: "Yes"]
  }

  measure: count_of_encounters {
    description: "The count of encounters/hospilizations."
    type: count_distinct
    label: "Count of Encounters"
    sql: ${encounter_id} ;;
  }

  measure: count_of_procedures {
    description: "The count of procedures."
    type: count_distinct
    label: "Count of Procedures"
    sql: ${procedure_id} ;;
  }

  measure: count_of_patients_who_had_procedures {
    hidden: yes
    type: count_distinct
    label: "Count of patients with procedures"
    sql: ${patient_id} ;;
  }

  measure: mortality_rate {
    description: "The percentage of patients who die as a result of a specific condition or treatment."
    type: number
    label: "Mortality Rate (%)"
    sql: ${count_of_patients_who_died_14_days_after_procedure} / NULLIF(${count_of_patients_who_had_procedures}, 0) ;;
    value_format_name: percent_1
  }

  measure: success_rate {
    description: "The percentage of success for each procedure."
    type: number
    label: "Success Rate (%)"
    sql: 1 - (${count_of_patients_who_died_14_days_after_procedure} / NULLIF(${count_of_procedures}, 0)) ;;
    value_format_name: percent_1
  }

  measure: count {
    hidden: yes
    label: "Count of Hospital Events"
  }

  measure: average_length_of_stay {
    label: "Average Length of Stay (Days)"
    type: average
    sql: ${encounter_duration_minutes} / 1440 ;;
    value_format_name: decimal_2
  }
}
