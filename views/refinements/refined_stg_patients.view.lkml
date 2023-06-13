include: "/views/raw/stg_patients.view.lkml"

view: +stg_patients {

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

  dimension: patient_name_in_use {
  }

  dimension: patient_postal_code {
  }

  dimension: patient_state {
  }

  measure: count {
    hidden: yes
  }

  set: patients_set {
    fields: [
      patient_address,
      patient_last_name,
      patient_first_name
    ]
  }
}



