include: "/views/raw/media_demo/dim_projects.view.lkml"

view: +dim_projects {

  dimension: project_id {
    primary_key: yes
  }

  dimension: revenue {
    hidden: yes
    sql: cast(${TABLE}.revenue as int64) ;;
  }

  measure: count {
    label: "Count of Projects"
  }

  measure: total_revenue {
    label: "Gross Revenue"
    value_format_name: usd
  }

  measure: target_margin {
    type: number
    sql: ${total_revenue} - ${seed_mapping_project_budget.total_budget} ;;
    value_format_name: usd
  }

  measure: margin_actual {
    type: number
    sql:
      case
        when ${dim_time_entries.project_cost} > 0 then ${total_revenue} - ${dim_time_entries.project_cost}
        else 0
      end ;;
    value_format_name: usd
  }

  measure: average_revenue {
    label: "Average Gross Revenue"
    value_format_name: usd
  }

}
