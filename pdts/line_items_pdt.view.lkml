view: line_items_pdt {
  derived_table: {
    publish_as_db_view: yes
    sql_trigger_value: SELECT CURRENT_DATE ;;
    indexes: ["id"]
    sql:
    SELECT
      line_items.id as id,
      line_items.product_id as product_id,
      line_items.quantity as quantity,
      SAFE_MULTIPLY(CAST(line_items.quantity AS BIGNUMERIC), CAST(line_items.price AS BIGNUMERIC)) as sale_price,
      0 as cost_of_goods_sold
      FROM test_hw_postgres_to_bq.line_items
    ;;
  }

  dimension: id {
    sql: ${TABLE}.id ;;
    type: number
  }
}
