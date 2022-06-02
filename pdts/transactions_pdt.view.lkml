view: transactions_pdt {
  derived_table: {
    publish_as_db_view: yes
    sql_trigger_value: SELECT CURRENT_DATE ;;
    indexes: ["transaction_id"]
    sql:
      SELECT
      orders.id as transaction_id,
      orders.shopify_customer_id as customer_id,
      orders.order_created_at as transaction_timestamp,
      ARRAY(
        SELECT AS STRUCT
        line_items.title as title,
        line_items.id as id,
        line_items.product_id as product_id,
        line_items.quantity as quantity,
        SAFE_MULTIPLY(CAST(line_items.quantity AS BIGNUMERIC), CAST(line_items.price AS BIGNUMERIC)) as sale_price
        FROM test_hw_postgres_to_bq.line_items WHERE line_items.order_id = orders.id
      ) as line_items,
      1 as store_id
      FROM test_hw_postgres_to_bq.orders
      WHERE orders.shopify_customer_id IS NOT NULL
    ;;
  }

  dimension: id {
    sql: ${TABLE}.transaction_id ;;
    type: number
  }
}

#channel_id
