CREATE TABLE rdsftorchestration.job_config_sqls (
    schema_name character varying(256) ENCODE lzo,
    table_name character varying(256) ENCODE lzo,
    serial_no integer ENCODE az64,
    sql_command character varying(65535) ENCODE lzo
)
DISTSTYLE AUTO;