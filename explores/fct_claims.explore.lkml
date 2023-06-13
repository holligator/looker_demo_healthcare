include: "/views/refinements/refined_dim_organizations.view.lkml"
include: "/views/refinements/refined_dim_patients.view.lkml"
include: "/views/refinements/refined_fct_claims.view.lkml"

explore: fct_claims {
  group_label: "3) Demo Datasets"
  label: "Healthcare - Claims"
  view_label: "Claims"

  join: dim_patients {
    view_label: "Patients"
    type: left_outer
    relationship: many_to_one
    sql_on: ${fct_claims.patient_id} = ${dim_patients.patient_id} ;;
  }

  join: dim_organizations {
    view_label: "Organizations"
    type: left_outer
    relationship: many_to_one
    sql_on: ${fct_claims.organization_id} = ${dim_organizations.organization_id} ;;
  }
}
