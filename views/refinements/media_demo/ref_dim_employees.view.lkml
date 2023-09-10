include: "/views/raw/media_demo/dim_employees.view.lkml"

view: +dim_employees {

  dimension: dept {
    label: "Department"
  }

  dimension: employee_id {
    primary_key: yes
  }

  measure: total_rate {
    hidden: yes
  }

  measure: average_rate {
    value_format_name: decimal_2
  }

  measure: count {
    label: "Count of Employees"
  }
}
