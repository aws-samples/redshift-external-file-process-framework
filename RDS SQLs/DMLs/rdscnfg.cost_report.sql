INSERT INTO
    rdscnfg.ext_interface (
        ext_interface_cid,
        interface_name,
        interface_desc,
        oprtnl_flag
    )
VALUES
    (
        558,
        'HOSPITAL_COST_REPORT',
        'HOSPITAL_COST_REPORT',
        'A'
    );

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
        6,
        558,
        'rdsftetl',
        'hospital_cost_report',
        '558.',
        'gz',
        'gz',
        ',',
        'N',
        'N',
        'call rdsftetl.prc_process_etl_subgroup(''external_file_hospital_cost_report'',''NC'',1);',
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
    (90, 6, 'rpt_rec_num', NULL, 1, 'A');

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
    (91, 6, 'prvdr_ctrl_type_cd', NULL, 2, 'A');

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
    (92, 6, 'prvdr_num', NULL, 3, 'A');

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
    (93, 6, 'npi', NULL, 4, 'A');

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
    (94, 6, 'rpt_stus_cd', NULL, 5, 'A');

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
    (95, 6, 'fy_bgn_dt', NULL, 6, 'A');

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
    (96, 6, 'fy_end_dt', NULL, 7, 'A');

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
    (97, 6, 'proc_dt', NULL, 8, 'A');

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
    (98, 6, 'initl_rpt_sw', NULL, 9, 'A');

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
    (99, 6, 'last_rpt_sw', NULL, 10, 'A');

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
    (100, 6, 'trnsmtl_num', NULL, 11, 'A');

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
    (101, 6, 'fi_num', NULL, 12, 'A');

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
    (102, 6, 'adr_vndr_cd', NULL, 13, 'A');

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
    (103, 6, 'fi_creat_dt', NULL, 14, 'A');

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
    (104, 6, 'util_cd', NULL, 15, 'A');

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
    (105, 6, 'npr_dt', NULL, 16, 'A');

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
    (106, 6, 'spec_ind', NULL, 17, 'A');

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
    (107, 6, 'fi_rcpt_dt', NULL, 18, 'A');

