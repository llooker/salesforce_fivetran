- dashboard: lead_velocity
  title: Lead Velocity
  layout: newspaper
  elements:
  - title: Lead to Contact Conversion
    name: Lead to Contact Conversion
    model: salesforce_fivetran
    explore: lead
    type: looker_timeline
    fields:
    - lead.name
    - lead.created_date
    - lead.converted_date
    filters:
      lead.converted_month: 12 months
    limit: 500
    query_timezone: America/Los_Angeles
    barColors:
    - red
    - blue
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    series_types: {}
    row: 0
    col: 1
    width: 11
    height: 9
  - title: Avg Conversion Days by Industry
    name: Avg Conversion Days by Industry
    model: salesforce_fivetran
    explore: lead
    type: looker_bar
    fields:
    - lead.industry
    - lead.avg_convert_to_contact
    filters:
      lead.created_month: 12 months
    sorts:
    - lead.avg_convert_to_contact desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    series_types: {}
    colors:
    - "#7FCDAE"
    - "#85D67C"
    - "#CADF79"
    - "#E7AF75"
    - "#EB9474"
    - "#EE7772"
    series_colors: {}
    row: 0
    col: 12
    width: 11
    height: 9
