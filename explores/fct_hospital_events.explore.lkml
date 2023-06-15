include: "/views/refinements/refined_dim_organizations.view.lkml"
include: "/views/refinements/refined_dim_patients.view.lkml"
include: "/views/refinements/refined_fct_hospital_events.view.lkml"
include: "/views/derived/dt_hospital_readmissions.view.lkml"

explore: fct_hospital_events {
  group_label: "3) Demo Datasets"
  label: "Healthcare - Hospital Events"
  view_label: "Hospital Events"

  join: dim_patients {
    view_label: "Patients"
    type: left_outer
    relationship: many_to_one
    sql_on: ${fct_hospital_events.patient_id} = ${dim_patients.patient_id} ;;
  }

  join: dim_organizations {
    view_label: "Organizations"
    type: left_outer
    relationship: many_to_one
    sql_on: ${fct_hospital_events.organization_id} = ${dim_organizations.organization_id} ;;
  }

  join: dt_hospital_readmissions {
    view_label: "Hospital Events"
    type: left_outer
    relationship: many_to_one
    sql_on: ${fct_hospital_events.organization_id} = ${dt_hospital_readmissions.organization_id}  ;;
  }

}
