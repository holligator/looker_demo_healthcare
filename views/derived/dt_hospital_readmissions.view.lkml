view: dt_hospital_readmissions {
  derived_table: {
    sql: WITH patient_encounters AS (
                                      SELECT
                                             patient_id,
                                             organization_id,
                                             encounter_started_at AS admission_date,
                                             LAG(encounter_started_at) OVER (PARTITION BY patient_id ORDER BY encounter_started_at) AS previous_admission_date,
                                             CASE
                                              WHEN LAG(encounter_started_at) OVER (PARTITION BY patient_id ORDER BY encounter_started_at) IS NULL THEN NULL
                                              ELSE TIMESTAMP_DIFF(encounter_started_at, LAG(encounter_started_at) OVER (PARTITION BY patient_id ORDER BY encounter_started_at), DAY)
                                              END AS days_between_visits
                                       FROM `datatonic-americas-demos.healthcare_demo.stg_encounters`
                                    )

              , readmitted_patients AS (
                                        SELECT
                                                *,
                                                CASE WHEN days_between_visits < {% parameter admission_timeframe %} THEN 'Yes' ELSE 'No' END readmitted_patient
                                        FROM patient_encounters
                                        ORDER BY patient_id,
                                                 admission_date
                                        )

              SELECT
                    organization_id,
                    COUNT(patient_id) AS total_admitted,
                    SUM(CASE WHEN readmitted_patient = 'Yes' THEN 1 ELSE 0 END) AS total_readmitted
              FROM readmitted_patients
              GROUP BY 1
        ;;
    }

    parameter: admission_timeframe {
      default_value: "30"
      description: "This field indicates the number of days specified as the readmission timeframe"
      type: number
    }

    dimension: organization_id {
      primary_key: yes
      type: string
      sql: ${TABLE}.organization_id ;;
    }

    dimension: total_admitted {
      type: number
      sql: ${TABLE}.total_admitted ;;
    }

    measure: total_admitted_sum {
      type: sum
      sql: ${total_admitted} ;;
    }

    dimension: total_readmitted {
      type: number
      sql: ${TABLE}.total_readmitted ;;
    }

  measure: total_readmitted_sum {
    type: sum
    sql: ${total_readmitted} ;;
  }

    measure: readmission_rate {
      label: "Hospital Re-admission Rate (%)"
      type: number
      sql: ${total_readmitted_sum} / NULLIF(${total_admitted_sum}, 0) ;;
      value_format_name: percent_2
    }

    set: readmission_detail {
      fields: [
        readmission_rate,
        total_admitted,
        total_readmitted
        ]
    }
  }
