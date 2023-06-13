# The name of this view in Looker is "Stg Patients"
view: stg_patients {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datatonic-americas-demos.dbt_cojovero.stg_patients`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Patient Address" in Explore.

  dimension: patient_address {
    type: string
    sql: ${TABLE}.patient_address ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
    drill_fields: [patient_last_name, patient_first_name]
  }
}
