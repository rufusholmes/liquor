- dashboard: category_overview
  title: Category Overview
  layout: tile
  tile_size: 100

  filters:

  - name: category
    title: "Category"
    type: string_filter
    model: liquor
    explore: iowa
    field: ${iowa.category_name}
    default_value: '%VODKA%'

  elements:

  - name: total_sales
    type: single_value
    model: liquor
    explore: iowa
    measures: [iowa.sum_of_sales]
    listen:
      category: iowa.category_name
    width: 4
    height: 2

  - name: total_transactions
    type: single_value
    model: liquor
    explore: iowa
    measures: [iowa.count]
    listen:
      category: iowa.category_name
    width: 4
    height: 2

  - name: average_order_value
    type: single_value
    model: liquor
    explore: iowa
    measures: [iowa.average_sale]

    width: 4
    height: 2

  - name: sales_over_time
    title: "Annual Sales"
    type: looker_line
    model: liquor
    explore: iowa
    dimensions: [iowa.date_month_name]
    fill_fields: [iowa.date_month_name]
    measures: [iowa.sum_of_sales]
    listen:
      category: iowa.category_name
    sorts: [iowa.date_month_name]
    column_limit: '50'
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}

    model: liquor
    explore: iowa
    dimensions: [iowa.date_month_name]
    measures: [iowa.sum_of_sales, iowa.average_sale]
    listen:
      category: iowa.category_name
    limit: 500
    width: 12
    height: 3
    legend_align:
    stacking:
    x_axis_label:
    x_axis_datetime: yes
    x_axis_datetime_label:
    x_axis_label_rotation:
    y_axis_orientation: [left,right]
    colors: [purple, gold]
    y_axis_combined:
    y_axis_labels: ["Total Sale Amount","Average Selling Price"]
    y_axis_min:
    y_axis_max:
    hide_points: yes
    hide_legend: yes




  - name: sales_by_brand
    title: "Sales by Brand"
    type: table
    model: liquor
    explore: iowa
    dimensions: [iowa.item_description]
    measures: [iowa.count, iowa.sum_of_sales]
    listen:
      category: iowa.category_name
    sorts: [iowa.count desc]
    limit: 500
    width: 6
    height: 4

  - name: connoisseur
    title: "Top Purchasers of "
    type: table
    model: liquor
    explore: iowa
    dimensions: [iowa.store_name, iowa.city]
    measures: [iowa.count, iowa.sum_of_sales]
    listen:
      category: iowa.category_name
    sorts: [iowa.count desc]
    limit: 15
    width: 6
