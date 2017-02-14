view: store_facts {
derived_table: {
  sql: SELECT iowa.item_id as id, MIN(iowa.date) AS first_ordered, MAX(iowa.date) AS last_ordered
      FROM iowa
      GROUP BY item_id ;;
  indexes: ["id"]
  sql_trigger_value: SELECT CURRENT_DATE ;;
}


measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: id {
  type: string
  sql: ${TABLE}.id ;;
  primary_key: yes
}

dimension: first_ordered {
  type: date
  sql: ${TABLE}.first_ordered ;;
}

dimension: last_ordered {
  type: date
  sql: ${TABLE}.last_ordered ;;
}

set: detail {
  fields: [id, first_ordered, last_ordered]
}
}
