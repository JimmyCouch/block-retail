view: transactions_pdt {
  derived_table: {
    publish_as_db_view: yes
    sql_trigger_value: SELECT CURRENT_DATE ;;
    indexes: ["transaction_id"]
    sql:
    SELECT
      orders.id as transaction_id,
      orders.shopify_customer_id as customer_id,
      orders.order_created_at as transaction_timestamp
      FROM test_hw_postgres_to_bq.orders
    ;;
  }

  dimension: id {
    sql: ${TABLE}.transaction_id ;;
    type: number
  }
}

#channel_id
