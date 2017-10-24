view: test_view {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
        1 as user_id
        , date_part('day', '2016-04-20 16:34:30.739902'::timestamp  - '2016-04-05 21:29:29.588342'::timestamp) as login_interval_days
        , date_part('hour', '2016-04-20 16:34:30.739902'::timestamp  - '2016-04-05 21:29:29.588342'::timestamp) as login_interval_hours
        , date_part('minute', '2016-04-20 16:34:30.739902'::timestamp  - '2016-04-05 21:29:29.588342'::timestamp) as login_interval_minutes
        , date_part('second', '2016-04-20 16:34:30.739902'::timestamp  - '2016-04-05 21:29:29.588342'::timestamp) as login_interval_seconds
        , EXTRACT(EPOCH FROM ('2016-04-20 16:34:30.739902'::timestamp - '2016-04-05 21:29:29.588342'::timestamp)) as login_interval ;;
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

  dimension: login_interval_days {
    type: number
    sql: ${TABLE}.login_interval_days  ;;
  }

  dimension: login_interval_hours {
    type: number
    sql: ${TABLE}.login_interval_hours  ;;
  }

  dimension: login_interval_minutes {
    type: number
    sql: ${TABLE}.login_interval_minutes  ;;
  }

  dimension: login_interval_seconds {
    type: number
    sql: ${TABLE}.login_interval_seconds  ;;
  }

  measure: login_interval {
    type: min
    sql: ${TABLE}.login_interval ;;
    html: {{ login_interval_days._rendered_value }} days,  {{ login_interval_hours._rendered_value }} hours, {{ login_interval_minutes._rendered_value }} minutes, {{ login_interval_seconds._rendered_value }} seconds ;;
    value_format_name: decimal_0
  }

}
