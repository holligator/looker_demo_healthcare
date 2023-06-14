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

  measure: count {
    label: "Count of Hospital Events"
  }
}
