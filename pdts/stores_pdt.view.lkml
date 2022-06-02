view: stores_pdt {
  derived_table: {
    publish_as_db_view: yes
    sql_trigger_value: SELECT CURRENT_DATE ;;
    indexes: ["id"]
    sql:
      SELECT 1 AS id, 'Main Store' as name
    ;;
  }

  dimension: id {
    sql: ${TABLE}.id ;;
    type: number
  }
}

#channel_id
