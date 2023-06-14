# The name of this view in Looker is "Stg Procedures"
view: stg_procedures {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datatonic-americas-demos.healthcare_demo.stg_procedures`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Condition ID" in Explore.

  dimension: condition_id {
    type: string
    sql: ${TABLE}.condition_id ;;
  }

  dimension: encounter_id {
    type: string
    sql: ${TABLE}.encounter_id ;;
  }

  dimension: patient_id {
    type: string
    sql: ${TABLE}.patient_id ;;
  }

  dimension: procedure_code {
    type: string
    sql: ${TABLE}.procedure_code ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: procedure_ended {
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
    sql: ${TABLE}.procedure_ended_at ;;
  }

  dimension: procedure_id {
    type: string
    sql: ${TABLE}.procedure_id ;;
  }

  dimension_group: procedure_started {
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
    sql: ${TABLE}.procedure_started_at ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
