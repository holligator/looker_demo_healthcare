include: "/views/raw/dim_organizations.view.lkml"

view: +dim_organizations {

  dimension: organization_address {
  }

  dimension: organization_city {
  }

  dimension: organization_country {
  }

  dimension: organization_id {
  }

  dimension: organization_name {
  }

  dimension: organization_postal_code {
  }

  dimension: organization_state {
  }

  dimension: organization_type {
  }

  measure: count {
    label: "Count of Organizations"
  }
}
