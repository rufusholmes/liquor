view: drink_facts {
derived_table: {
sql:
  SELECT iowa.item_id AS id
, COUNT(*) AS lifetime_orders
, MIN(NULLIF(iowa.date,0)) AS first_ordered
, MAX(NULLIF(iowa.date,0)) AS last_ordered
--, COUNT(DISTINCT CONCAT(MONTH(NULLIF(iowa.date,0))),YEAR(NULLIF(iowa.date,0))) AS number_of_distinct_months_with_orders
FROM iowa
GROUP BY id ;;
indexes: ["id"]
sql_trigger_value: SELECT CURRENT_DATE ;;
}


dimension: id {
  type: string
  primary_key: yes
}

dimension: lifetime_orders {
  type: number
}

dimension: first_ordered {
  type: date
}

dimension: last_ordered {
  type: date
}

dimension: number_of_distinct_orders {
  type: number
}

}
