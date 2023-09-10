include: "/views/raw/media_demo/seed_mapping_project_budget.view.lkml"

view: +seed_mapping_project_budget {

  dimension: project_id {
    primary_key: yes
    hidden: yes
  }

  dimension: budget {
    hidden: yes
  }

  dimension_group: start {
    hidden: yes
  }

  dimension_group: end {
    hidden: yes
  }

  dimension_group: cast_start {
    type: time
    datatype: date
    label: "Project Start"
    timeframes: [
      date,
      week,
      month,
      year
    ]
    sql:  cast(
            concat(
                substr(cast(${start_date} as string), 0, 4),
                '-',
                substr(cast(${start_date} as string), 6, 2),
                '-',
                substr(cast(${start_date} as string), 9, 2)
            ) as date
        )  ;;
  }

  dimension_group: cast_end {
    type: time
    datatype: date
    label: "Project End"
    timeframes: [
      date,
      week,
      month,
      year
    ]
    sql:  cast(
            concat(
                substr(cast(${end_date} as string), 0, 4),
                '-',
                substr(cast(${end_date} as string), 6, 2),
                '-',
                substr(cast(${end_date} as string), 9, 2)
            ) as date
        )  ;;
  }

  dimension: is_project_completed {
    type: yesno
    sql: ${cast_end_date} <= current_date() ;;
  }

  dimension: is_project_active {
    type: yesno
    sql: ${cast_start_date} <= current_date() and ${cast_end_date} >= current_date()  ;;
  }

  dimension_group: project {
    type: duration
    intervals: [
      day,
      week,
      month,
      year
    ]
    sql_start: ${cast_start_date} ;;
    sql_end: ${cast_end_date} ;;
  }

  measure: count {
    hidden: yes
  }

  measure: total_budget {
    type: sum
    sql: ${budget} ;;
    value_format_name: usd
  }

}
