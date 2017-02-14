- dashboard: category_overview
  title: Category Highlights
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
    width: 6
    height: 3

  - name: total_transactions
    type: single_value
    model: liquor
    explore: iowa
    measures: [iowa.count]
    listen:
      category: iowa.category_name
    width: 6
    height: 3

  - name: add_a_unique_name_1487116143
    title: Sales Per Year
    type: looker_column
    model: liquor
    explore: iowa
    dimensions: [iowa.date_year]
    fill_fields: [iowa.date_year]
    measures: [iowa.sum_of_sales]
    sorts: [iowa.date_year desc]
    limit: '1000'
    column_limit: '50'
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: circle
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
      margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
      color: "#000000", value_format: "$#,##0"}]
    width: 6
    height: 3
    listen:
      category: iowa.category_name

  - name: average_order_value
    type: single_value
    model: liquor
    explore: iowa
    measures: [iowa.average_sale]
    width: 6
    height: 3

  - name: sales_over_time
    title: "Monthly Sales Trend"
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
    sorts: [iowa.sum_of_sales desc]
    limit: 10
    width: 6
    height: 4

  - name: connoisseur
    title: "Top Purchasers of This Category"
    type: table
    model: liquor
    explore: iowa
    dimensions: [iowa.store_name, iowa.city]
    measures: [iowa.count, iowa.sum_of_sales]
    listen:
      category: iowa.category_name
    sorts: [iowa.sum_of_sales desc]
    limit: 10
    width: 6
    height: 4

  - name: top_seller
    title: "Top Vendors of This Category"
    type: table
    model: liquor
    explore: iowa
    dimensions: [iowa.vendor_name, iowa.city]
    measures: [iowa.count, iowa.sum_of_sales]
    listen:
      category: iowa.category_name
    sorts: [iowa.sum_of_sales desc]
    limit: 10
    width: 6
    height: 4
