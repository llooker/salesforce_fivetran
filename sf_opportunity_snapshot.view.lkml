view: sf_opportunity_snapshot {
  derived_table: {
    sql: with dates as (
      --Generate 5 years of dates. Thanks Lloyd! https://discourse.looker.com/t/generating-a-numbers-table-in-mysql-and-redshift/482/5
          SELECT date
          FROM UNNEST(GENERATE_DATE_ARRAY(DATE_SUB(CURRENT_DATE, INTERVAL 5 YEAR), CURRENT_DATE)) date
      ),

       snapshot_window as (
            select opportunity_history.*
                  , coalesce(lead(EXTRACT(date FROM created_date),1) over(partition by opportunity_id order by created_date), current_date) as stage_end
                    from `fivetran-fivetran-fivetran-loo.salesforce.opportunity_history` AS opportunity_history
      )


      select dates.date as observation_date
           , snapshot_window.*
            from snapshot_window
            left join dates as dates
            on dates.date >= EXTRACT(date FROM snapshot_window.created_date)
            and dates.date <= snapshot_window.stage_end
            where dates.date <= current_date
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: observation_date {
    type: date
    sql: ${TABLE}.observation_date ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension_group: close_date {
    type: time
    sql: ${TABLE}.close_date ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: expected_revenue {
    type: number
    sql: ${TABLE}.expected_revenue ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: stage_end {
    type: date
    sql: ${TABLE}.stage_end ;;
  }

  set: detail {
    fields: [
      observation_date,
      id,
      _fivetran_synced_time,
      amount,
      close_date_time,
      created_by_id,
      created_date_time,
      expected_revenue,
      forecast_category,
      is_deleted,
      opportunity_id,
      probability,
      stage_name,
      system_modstamp_time,
      stage_end
    ]
  }
}
