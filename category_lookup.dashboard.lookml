- dashboard: category_lookup            # Initializes a new dashboard
  title: "Category Lookup"              # Display title of Dashboard, in this case title is redundant becase they are the same
  layout: tile
  tile_size: 100
  auto_run: false

# 'tile' layout will render the dashboard elements in the order they are defined in the LookML file.
# The width of the dashboard is dynamic and based on the width of the browser.
# The dashboard elements will dynamically position themselves based on the dynamic width of the browser.
# This may be optimal for general-purpose dashboards or dashboards that are meant to be used on devices with varying browser widths.

 # three filters are available in this model
  filters:

  - name: category
    title: "Category Name"
    type: string_filter
    explore: products
    field: ${products.category_name}
    default_value: Jeans

  - name: department
    title: "Department"
    type: string_filter
    explore: products
    field: ${products.department_name}

  - name: date
    title: "Date"
    type: date_filter
    default_value: Last 90 Days

  elements:

  - name: total_orders
    type: single_value
    model: ecommerce
    explore: order_items
    measures: [orders.count]
    listen:
      category: products.category_name
      date: orders.created_date
      department: products.department_name
    width: 4
    height: 2

  - name: total_customers
    type: single_value
    model: ecommerce
    explore: order_items
    measures: [users.count]
    listen:
      date: orders.created_date
      category: products.category_name
      department: products.department_name
    width: 4
    height: 2

  - name: average_order_value
    type: single_value
    model: ecommerce
    explore: order_items
    measures: [order_items.average_sale_price]
    listen:
      date: orders.created_date
      category: products.category_name
      department: products.department_name
    width: 4
    height: 2

  - name: comparison
    title: "All Categories Comparison"
    type: table
    model: ecommerce
    explore: order_items
    dimensions: [products.category_name]
    measures: [order_items.average_sale_price, users.count, orders.count]
    listen:
      date: orders.created_date
      department: products.department_name
    sorts: [order_items.average_sale_price desc]
    width: 6
    height: 4
    limit: 50

  - name: sales_by_day
    title: "Sales by Date"
    type: looker_line
    model: ecommerce
    explore: order_items
    dimensions: [orders.created_date]
    measures: [order_items.average_sale_price, order_items.total_sale_price]
    listen:
      date: orders.created_date
      category: products.category_name
      department: products.department_name
    sorts: [orders.created_date]
    width: 6
    height: 4
    legend_align:
    stacking:
    x_axis_label:
    x_axis_datetime: yes
    x_axis_datetime_label:
    x_axis_label_rotation:
    y_axis_orientation: [left,right]
    y_axis_combined:
    y_axis_labels: ["Average Selling Price ($)","Total Sale Amount ($)"]
    y_axis_min:
    y_axis_max:
    hide_points: yes

  - name: demographic
    title: "Age Demographic"
    type: looker_column
    model: ecommerce
    explore: order_items
    dimensions: [users.age_tier]
    measures: [order_items.average_sale_price, order_items.count]
    listen:
      date: orders.created_date
      category: products.category_name
      department: products.department_name
    sorts: [users.age_tier]
    limit: 500
    width: 6
    height: 4
    legend_align:
    stacking:
    x_axis_label: "Age Tier"
    x_axis_datetime:
    x_axis_datetime_label:
    x_axis_label_rotation:
    y_axis_orientation: [left,right]
    y_axis_combined:
    y_axis_labels: ["Average Selling Price ($)","# orders"]
    y_axis_min:
    y_axis_max:

  - name: top_brands_within_category
    title: "Top Brands"
    type: table
    model: ecommerce
    explore: order_items
    dimensions: [products.brand_name]
    measures: [order_items.count, order_items.item_gross_margin_percentage, order_items.total_sale_price]
    listen:
      date: orders.created_date
      category: products.category_name
      department: products.department_name
    sorts: [order_items.total_sale_price desc]
    limit: 25
    width: 6
    height: 4
