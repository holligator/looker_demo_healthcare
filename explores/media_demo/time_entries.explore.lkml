include: "/views/*/*/*.view.lkml"

explore: dim_projects {
  label: "Media Demo - Projects"
  view_label: "Projects"

  join: seed_mapping_project_budget {
    view_label: "Projects"
    relationship: one_to_one
    sql_on: ${dim_projects.project_id} = ${seed_mapping_project_budget.project_id} ;;
  }

  join: seed_mapping_project_employee {
    relationship: many_to_many
    sql_on: ${dim_projects.project_id} = ${seed_mapping_project_employee.project_id}  ;;
  }

  join: dim_employees {
    view_label: "Employees"
    relationship: many_to_one
    sql_on: ${seed_mapping_project_employee.employee_id} = ${dim_employees.employee_id} ;;
  }

  join: dim_time_entries {
    view_label: "Time_Entries"
    relationship: one_to_many
    sql_on: ${seed_mapping_project_budget.project_id} = ${dim_time_entries.project_id} ;;
  }



}
