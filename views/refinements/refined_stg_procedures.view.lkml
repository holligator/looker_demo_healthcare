view: refined_stg_procedures {

  dimension: condition_id {
  }

  dimension: encounter_id {
  }

  dimension: patient_id {
  }

  dimension: procedure_code {
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
    type: count
    drill_fields: []
  }
}
