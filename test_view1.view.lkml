view: test_view1 {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
        1 as user_id
        , '2016-04-05 21:29:29.588342'::timestamp as created_at
        , '2016-04-20 16:34:30.739902'::timestamp as first_login_app ;;
 }

  # Define your dimensions and measures here, like this:
  dimension: user_id {
    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: html_string {
    type: string
    sql: "https://www.xxx.com/" || ${user_id} ;;
    html: <a href = "{{ value }}" > {{ value }} </a> ;;
  }

  dimension: created_at {}

  dimension: first_login_app {}

  dimension: login_interval_days {
    type: number
    sql: date_part('day', ${TABLE}.first_login_app - ${TABLE}.created_at)  ;;
  }

  dimension: login_interval_hours {
    type: number
    sql: DATE_PART('hour', ${TABLE}.first_login_app - ${TABLE}.created_at) ;;
  }

  dimension: login_interval_minutes {
    type: number
    sql: DATE_PART('minute', ${TABLE}.first_login_app - ${TABLE}.created_at) ;;
  }

  dimension: login_interval_seconds {
    type: number
    sql: DATE_PART('second', ${TABLE}.first_login_app - ${TABLE}.created_at) ;;
  }

  measure: login_interval {
    type: number
    sql: ${login_interval_days} ;;
    html: {{rendered_value}} days,  {{ login_interval_hours._rendered_value }} hours, {{ login_interval_minutes._rendered_value }} minutes ;;
    required_fields: [first_login_app, created_at]
    value_format_name: decimal_0
}

}
