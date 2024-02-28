CREATE OR REPLACE PROCEDURE rdsftorchestration.execute_sql_from_table(table_schema character varying(50), tbl_name_final character varying(50), p_etl_from_timestamp timestamp without time zone, p_etl_to_timestamp timestamp without time zone)
 LANGUAGE plpgsql
AS $$
DECLARE
  sql_command_final VARCHAR(65535);
  sql_row RECORD;
  schema varchar(50);
  tbl_name varchar(250);
  from_window timestamp;
  to_window timestamp;
BEGIN
  schema := table_schema;
  tbl_name := tbl_name_final;
  from_window := p_etl_from_timestamp;
  to_window := p_etl_to_timestamp;
  FOR sql_row IN SELECT REPLACE(REPLACE(sql_command,‘p_etl_from_timestamp’,from_window),‘p_etl_to_timestamp’,to_window) as sql_command FROM rdsftorchestration.job_config_sqls_s2_m1_2_3 where schema_name = schema and table_name = tbl_name order by serial_no asc
  LOOP
    sql_command_final := sql_row.sql_command;
    RAISE NOTICE ‘sql_command_final here is --> %’, sql_command_final;
    EXECUTE sql_command_final;
  END LOOP;
END
$$