connection: "liquor"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

persist_for: "24 hours"

explore: iowa {

  join: drink_facts {
  type: left_outer
  sql_on: ${iowa.item_id} = ${drink_facts.id} ;;
  relationship: many_to_many
}

  join: brand_facts {
    type: left_outer
    sql_on: ${iowa.item_id} = ${drink_facts.id} ;;
    relationship: many_to_many
  }

  join: store_facts {
    type: left_outer
    sql_on: ${iowa.item_id} = ${drink_facts.id} ;;
    relationship: many_to_many
  }

  join: vendor_facts {
    type: left_outer
    sql_on: ${iowa.item_id} = ${drink_facts.id} ;;
    relationship: many_to_many
  }

}
