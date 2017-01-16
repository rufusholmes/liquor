connection: "liquor"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: iowa {

  join: drink_facts {
  type: left_outer
  sql_on: ${iowa.item_id} = ${drink_facts.id} ;;
  relationship: many_to_many
}
}
