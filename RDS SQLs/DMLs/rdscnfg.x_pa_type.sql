INSERT INTO
    rdscnfg.ext_interface (
        ext_interface_cid,
        interface_name,
        interface_desc,
        oprtnl_flag
    )
VALUES
    (527, 'NDC_X_PA_TYPE', 'NDC_X_PA_TYPE', 'A');

INSERT INTO
    rdscnfg.ext_file_config (
        ext_file_config_sid,
        ext_interface_cid,
        tgt_schema_name,
        tgt_table_name,
        file_prefix,
        file_format,
        file_type,
        delimiter,
        header_flag,
        trailer_flag,
        query,
        split_file_flag,
        split_prefix,
        escape_char,
        trailer_pstn,
        oprtnl_flag
    )
VALUES
    (
        4,
        527,
        'rdsftetl',
        'dc_x_pa_flavor',
        '527.',
        'txt',
        'txt',
        '|',
        'N',
        'N',
        'call rdsftorchestration.execute_sql_from_table(''rdsftcore'',''dc_x_pa_flavor'',''2020-01-01 17:49:29'',''2030-01-01 17:49:29'');',
        'N',
        NULL,
        NULL,
        NULL,
        'A'
    );

INSERT INTO
    rdscnfg.ext_file_config_dtl (
        ext_file_config_dtl_sid,
        ext_file_config_sid,
        column_name,
        column_width_fixed,
        column_order_sqnc,
        oprtnl_flag
    )
VALUES
    (63, 4, 'ndc', NULL, 1, 'A');

INSERT INTO
    rdscnfg.ext_file_config_dtl (
        ext_file_config_dtl_sid,
        ext_file_config_sid,
        column_name,
        column_width_fixed,
        column_order_sqnc,
        oprtnl_flag
    )
VALUES
    (64, 4, 'pa_type', NULL, 2, 'A');

INSERT INTO
    rdscnfg.ext_file_config_dtl (
        ext_file_config_dtl_sid,
        ext_file_config_sid,
        column_name,
        column_width_fixed,
        column_order_sqnc,
        oprtnl_flag
    )
VALUES
    (65, 4, 'pa_value', NULL, 3, 'A');

INSERT INTO
    rdscnfg.ext_file_config_dtl (
        ext_file_config_dtl_sid,
        ext_file_config_sid,
        column_name,
        column_width_fixed,
        column_order_sqnc,
        oprtnl_flag
    )
VALUES
    (66, 4, 'pa_eff_dt', NULL, 4, 'A');

INSERT INTO
    rdscnfg.ext_file_config_dtl (
        ext_file_config_dtl_sid,
        ext_file_config_sid,
        column_name,
        column_width_fixed,
        column_order_sqnc,
        oprtnl_flag
    )
VALUES
    (67, 4, 'pa_exp_dt', NULL, 5, 'A');

INSERT INTO
    rdscnfg.ext_file_config_dtl (
        ext_file_config_dtl_sid,
        ext_file_config_sid,
        column_name,
        column_width_fixed,
        column_order_sqnc,
        oprtnl_flag
    )
VALUES
    (68, 4, 'load_eff_dt', NULL, 6, 'A');

INSERT INTO
    rdscnfg.ext_file_config_dtl (
        ext_file_config_dtl_sid,
        ext_file_config_sid,
        column_name,
        column_width_fixed,
        column_order_sqnc,
        oprtnl_flag
    )
VALUES
    (69, 4, 'load_exp_dt', NULL, 7, 'A');
