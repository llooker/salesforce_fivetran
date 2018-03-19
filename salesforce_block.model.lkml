connection: "fivetran_looker_blocks_demo"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: salesforce_block_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: salesforce_block_default_datagroup
