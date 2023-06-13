# The name of this view in Looker is "Dim Organizations"
view: dim_organizations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datatonic-americas-demos.healthcare_demo.dim_organizations`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Organization Address" in Explore.

  dimension: organization_address {
    type: string
    sql: ${TABLE}.organization_address ;;
  }

  dimension: organization_city {
    type: string
    sql: ${TABLE}.organization_city ;;
  }

  dimension: organization_country {
    type: string
    sql: ${TABLE}.organization_country ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: organization_name {
    type: string
    sql: ${TABLE}.organization_name ;;
  }

  dimension: organization_postal_code {
    type: string
    sql: ${TABLE}.organization_postal_code ;;
  }

  dimension: organization_state {
    type: string
    sql: ${TABLE}.organization_state ;;
  }

  dimension: organization_type {
    type: string
    sql: ${TABLE}.organization_type ;;
  }

  measure: count {
    type: count
    drill_fields: [organization_name]
  }
}
