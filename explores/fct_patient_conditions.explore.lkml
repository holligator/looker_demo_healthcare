include: "/views/refinements/refined_dim_organizations.view.lkml"
include: "/views/refinements/refined_dim_patients.view.lkml"
include: "/views/refinements/refined_fct_patient_conditions.view.lkml"

explore: fct_patient_conditions {
  group_label: "3) Demo Datasets"
  label: "Healthcare - Patient Conditions"
  view_label: "Patient Conditions"

  join: dim_patients {
    view_label: "Patients"
    type: left_outer
    relationship: many_to_one
    sql_on: ${fct_patient_conditions.patient_id} = ${dim_patients.patient_id} ;;
  }
}
