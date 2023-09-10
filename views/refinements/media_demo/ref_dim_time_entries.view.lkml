include: "/views/raw/media_demo/dim_time_entries.view.lkml"

view: +dim_time_entries {

  dimension: time_entry_id {
    primary_key: yes
  }

  measure: count {
    label: "Count of Time Entries"
  }

  measure: project_cost {
    type: number
    sql: ${total_duration} * ${dim_employees.average_rate} ;;
    value_format_name: usd
  }


}
