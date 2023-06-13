# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: dim_organizations {
  hidden: yes

  join: dim_organizations__organization_address {
    view_label: "Dim Organizations: Organization Address"
    sql: LEFT JOIN UNNEST(${dim_organizations.organization_address}) as dim_organizations__organization_address ;;
    relationship: one_to_many
  }
}

# The name of this view in Looker is "Dim Organizations"
view: dim_organizations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datatonic-americas-demos.dbt_cojovero.dim_organizations`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: organization_address {
    hidden: yes
    sql: ${TABLE}.organization_address ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Organization City" in Explore.

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

# The name of this view in Looker is "Dim Organizations Organization Address"
view: dim_organizations__organization_address {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Dim Organizations Organization Address" in Explore.

  dimension: dim_organizations__organization_address {
    type: string
    sql: dim_organizations__organization_address ;;
  }
}
