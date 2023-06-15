include: "/views/raw/fct_patient_conditions.view.lkml"

view: +fct_patient_conditions {

  dimension: patient_conditions_key {
    primary_key: yes
  }

  dimension_group: condition_abatement {
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

  dimension: condition_code {
  }

  dimension: condition_id {
  }

  dimension_group: condition_onset {
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

  dimension: condition_type {
  }

  dimension: patient_address {
    group_label: "Address"
    sql: {% if _user_attributes['ag_has_access_to_pii'] == 'true' %} ${TABLE}.patient_address
    {% else %} 'PII field - access FORBIDDEN!!'
    {% endif %};;
  }

  dimension: patient_age_at_death {
  }

  measure: total_patient_age_at_death {
    type: sum
    sql: ${patient_age_at_death} ;;
  }

  measure: average_patient_age_at_death {
    type: average
    sql: ${patient_age_at_death} ;;
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
    group_label: "Address"
    sql: {% if _user_attributes['ag_has_access_to_pii'] == 'true' %} ${TABLE}.patient_city
    {% else %} 'PII field - access FORBIDDEN!!'
    {% endif %};;
  }

  dimension: patient_country {
    group_label: "Address"
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
    required_access_grants: [ag_has_access_to_pii]
  }

  dimension: patient_id {
  }

  dimension: patient_last_name {
    required_access_grants: [ag_has_access_to_pii]
  }

  dimension: patient_name_in_use {
  }

  dimension: patient_postal_code {
    group_label: "Address"
    sql: {% if _user_attributes['ag_has_access_to_pii'] == 'true' %} ${TABLE}.patient_postal_code
    {% else %} 'PII field - access FORBIDDEN!!'
    {% endif %};;
  }

  dimension: patient_state {
    group_label: "Address"
  }

  measure: count {
    label: "Count of Patient Conditions"
    drill_fields: [patient_first_name, patient_last_name]
  }
}
