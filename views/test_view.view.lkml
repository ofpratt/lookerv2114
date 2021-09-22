view: test_view {
  derived_table: {
    sql:
      SELECT CONCAT('abc','abc','abc') AS value_1
      UNION ALL
      SELECT CONCAT('xyz',  CHAR(UNICODE('\u2744')),'xyz')
      UNION ALL
      SELECT CONCAT('xyz',  CHAR(UNICODE('\u0019')),'xyz') -- incorrectly escaped character
     ;;
  }

  dimension: value_1 {
    type: string
    sql: ${TABLE}.value_1 ;;
  }

  measure: cnt {
    type: count
  }
}
