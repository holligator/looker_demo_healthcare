include: "/views/raw/fct_claims.view.lkml"

view: +fct_claims {

  dimension: claim_id {
    primary_key: yes
    group_label: "IDs"
  }

  dimension: billable_period_duration_minutes {
    hidden: yes
  }

  measure: total_billable_period_duration_minutes {
    type: sum
    sql: ${billable_period_duration_minutes} ;;
  }

  measure: average_billable_period_duration_minutes {
    type: average
    sql: ${billable_period_duration_minutes} ;;
  }

  dimension_group: billable_period_ended {
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

  dimension_group: billable_period_started {
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

  dimension: claim_status {
  }

  dimension: claim_total_value {
    hidden: yes
  }

  dimension: condition_id {
    group_label: "IDs"
  }

  dimension: encounter_id {
    group_label: "IDs"
  }

  dimension: medication_request_id {
    group_label: "IDs"
  }

  dimension: organization_id {
    group_label: "IDs"
  }

  dimension: patient_id {
    group_label: "IDs"
  }

  dimension: procedure_id {
    group_label: "IDs"
  }

  dimension: condition_type {
    link: {
      label: "Definition of Condition"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: procedure_code {
    link: {
      label: "Definition of Procedure Code"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  measure: total_claims_value {
    type: sum
    sql: ${claim_total_value} ;;
    value_format_name: usd
  }

  measure: count {
    label: "Count of Claims"
  }
}
