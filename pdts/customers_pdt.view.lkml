view: customers_pdt {
  derived_table: {
    publish_as_db_view: yes
    sql_trigger_value: SELECT CURRENT_DATE ;;
    sql: SELECT
      customers.id as id,
      customers.address_line1 as address,
      customers.address_country as country,
      customers.shopify_created_at as registered
      FROM test_hw_postgres_to_bq.customers
    ;;
  }

  dimension: id {
    sql: ${TABLE}.id ;;
    type: number
  }
}
