# The name of this view in Looker is "Dim Employees"
view: dim_employees {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mtla-bigquery-sandbox.google_sheets.dim_employees` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Dept" in Explore.

  dimension: dept {
    type: string
    sql: ${TABLE}.dept ;;
  }

  dimension: employee_id {
    type: number
    sql: ${TABLE}.employee_id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: rate {
    type: number
    sql: ${TABLE}.rate ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_rate {
    type: sum
    sql: ${rate} ;;  }
  measure: average_rate {
    type: average
    sql: ${rate} ;;  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: seniority {
    type: string
    sql: ${TABLE}.seniority ;;
  }

  dimension: weekly_capacity {
    type: number
    sql: ${TABLE}.weekly_capacity ;;
  }
  measure: count {
    type: count
    drill_fields: [last_name, first_name]
  }
}