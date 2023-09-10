include: "/views/raw/media_demo/seed_mapping_project_employee.view.lkml"

view: +seed_mapping_project_employee {

  dimension: employee_id {
    hidden: yes
  }

  dimension: project_id {
    hidden: yes
  }

  dimension: employee_project_sk {
    hidden: yes
    primary_key: yes
    sql: ${employee_id}||'-'||${project_id} ;;
  }

  measure: count {
    hidden: yes
  }

}
