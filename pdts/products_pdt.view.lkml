view: products_pdt {
  derived_table: {
    publish_as_db_view: yes
    sql_trigger_value: SELECT CURRENT_DATE ;;
    indexes: ["id"]
    sql:
    SELECT
      products.id as id,
      "HealthWise" as brand,
      products.product_type as category,
      products.name as name
      FROM test_hw_postgres_to_bq.products
    ;;
  }

  dimension: id {
    sql: ${TABLE}.id ;;
    type: number
  }
}

#channel_id
