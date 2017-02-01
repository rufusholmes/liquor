view: iowa {
  sql_table_name: public.iowa ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: bottle_cost {
    type: number
    value_format_name: usd
    sql: cast(substring(${TABLE}.bottle_cost FROM '[0-9]+.[0-9]+') as money) ;;
  }

  dimension: bottle_retail {
    type: number
    value_format_name: usd
    sql: cast(substring(${TABLE}.bottle_retail FROM '[0-9]+.[0-9]+') as money) ;;
  }

  dimension: profit {
    type:  number
    value_format_name: usd
    sql: ${bottle_retail} - ${bottle_cost} ;;
  }

  dimension: bottle_volume_ml {
    type: number
    sql: ${TABLE}.bottle_volume_ml ;;
  }

  measure: bottle_volume_list {
    type: list
    list_field: bottle_volume_ml
  }

  dimension: bottles_sold {
    type: string
    sql: ${TABLE}.bottles_sold ;;
  }

  dimension: category_id {
    type: string
    sql: ${TABLE}.category_id ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
    html: {{ linked_value }}
    <a href="/dashboards/4?categoryname={{ value }}" target="_new"</a> ;;
  }

  dimension: category_image {
      sql: ${category_id} ;;
      html: <img src="http://www.acme.com/product_images/{{ value }}.jpg" /> ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: county_id {
    type: string
    sql: ${TABLE}.county_id ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.county_name ;;
  }

  dimension_group: date {
    type: time
    convert_tz: no
    sql: ${TABLE}.date ;;
  }

  dimension_group: today {
    type: time
    convert_tz: no
    sql: CURRENT_DATE ;;
  }

  dimension: same_week_of_year_as_today {
    type: yesno
    sql: ${today_week_of_year} = ${date_week_of_year} ;;
  }

  dimension: item_description {
    type: string
    sql: ${TABLE}.item_description ;;
  }

  dimension: item_id {
    type: string
    sql: ${TABLE}.item_id ;;
  }

  dimension: pack {
    type: string
    sql: ${TABLE}.pack ;;
  }

  dimension: sale_dollars {
    type: number
    sql: CAST(${TABLE}.sale_dollars AS float) ;;
  }

  measure: average_sale {
    type: average
    sql: ${sale_dollars} ;;
    value_format_name: decimal_2
  }

  measure: sum_of_sales {
    type: sum
    sql: ${sale_dollars} ;;
    value_format_name:  usd
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  dimension: store_location {
    type: string
    sql: ${TABLE}.store_location ;;
  }

  dimension: latitude {
    type: number
    sql: REGEXP_EXTRACT(iowa.store_location,"[\\-\\+]?[0-9]*\\.[0-9]+") ;;
    hidden: yes
  }

  dimension: longitude {
    type: number
    sql: REGEXP_EXTRACT(iowa.store_location,"[\\-\\+][0-9]*\\.[0-9]+") ;;
    hidden: yes
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.store_name ;;
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: volume_sold_gallons {
    type: string
    sql: ${TABLE}.volume_sold_gallons ;;
  }

  dimension: volume_sold_liters {
    type: string
    sql: ${TABLE}.volume_sold_liters ;;
  }

  dimension: zip_code {
    type: string
    sql: ${TABLE}.zip_code ;;
  }

  measure: count {
    type: count
    drill_fields: [id, store_name, county_name, category_name, vendor_name]
  }


}
