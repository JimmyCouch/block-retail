view: line_items_pdt {
  derived_table: {
    publish_as_db_view: yes
    sql_trigger_value: SELECT CURRENT_DATE ;;
    indexes: ["id"]
    sql:
    SELECT
      line_items.product_id as product_id,
      line_items.quantity as quantity,
      (line_items.quantity * line_items.price) as sale_price
      FROM test_hw_postgres_to_bq.line_items
    ;;
  }

  dimension: id {
    sql: ${TABLE}.id ;;
    type: number
  }
}
