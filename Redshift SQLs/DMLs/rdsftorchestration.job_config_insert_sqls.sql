INSERT INTO rdsftorchestration.job_config_sqls (
    schema_name
    , table_name
    , serial_no
    , sql_command)
VALUES (
    'rdsftcore'
    , 'dc_x_pa_flavor'
    , 1
    , 'Create temporary table tmp_dc_x_pa_flavor as
select
    ndc,
    pa_type,
    pa_value,
    NULLIF(pa_eff_dt,'''') as pa_eff_dt,
    NULLIF(pa_exp_dt,'''') as pa_exp_dt,
    NULLIF(load_eff_dt,'''') as load_eff_dt,
    NULLIF(load_exp_dt,'''') as load_exp_dt,
    file_name,
    NULLIF(pa_eff_dt,'''') as from_date,
    NULLIF(pa_exp_dt,'''') as to_date
from
    rdsftetl.dc_x_pa_flavor
where
    ndc is not null
    and pa_type in (''C'', ''N'', ''P'', ''A'', ''D'', ''Q'', ''B'', ''I'', ''PB'')
    and pa_value in (0, 1)
    and rdsftetl.fn_chk_date (pa_eff_dt, ''%Y%m%d'') = 0
    and rdsftetl.fn_chk_date (pa_exp_dt, ''%Y%m%d'') = 0
    and rdsftetl.fn_chk_date (load_eff_dt, ''%Y%m%d'') = 0
    and rdsftetl.fn_chk_date (load_exp_dt, ''%Y%m%d'') = 0
    and target_transaction_timestamp >= '' p_etl_from_timestamp ''
    and target_transaction_timestamp <= '' p_etl_to_timestamp '';');
INSERT INTO rdsftorchestration.job_config_sqls (
    schema_name
    , table_name
    , serial_no
    , sql_command)
VALUES (
    'rdsftcore'
    , 'dc_x_pa_flavor'
    , 2
    , 'INSERT INTO
    rdsftetl.dc_x_pa_flavor_error (
        ndc,
        pa_type,
        pa_value,
        pa_eff_dt,
        pa_exp_dt,
        load_eff_dt,
        load_exp_dt,
        file_name,
        target_transaction_timestamp
    )
select
    ndc,
    pa_type,
    pa_value,
    pa_eff_dt,
    pa_exp_dt,
    load_eff_dt,
    load_exp_dt,
    file_name,
    target_transaction_timestamp
from
    rdsftetl.dc_x_pa_flavor
where
    (target_transaction_timestamp >= '' p_etl_from_timestamp ''
    and target_transaction_timestamp <= '' p_etl_to_timestamp '')
    and (ndc is null
    or pa_type not in (''C'', ''N'', ''P'', ''A'', ''D'', ''Q'', ''B'', ''I'', ''PB'')
    or pa_value not in (0, 1)
    or rdsftetl.fn_chk_date (pa_eff_dt, ''%Y%m%d'') = 1
    or rdsftetl.fn_chk_date (pa_exp_dt, ''%Y%m%d'') = 1
    or rdsftetl.fn_chk_date (load_eff_dt, ''%Y%m%d'') = 1
    or rdsftetl.fn_chk_date (load_exp_dt, ''%Y%m%d'') = 1);');
INSERT INTO rdsftorchestration.job_config_sqls (
    schema_name
    , table_name
    , serial_no
    , sql_command)
VALUES (
    'rdsftcore'
    , 'dc_x_pa_flavor'
    , 3
    , 'update rdsftcore.dc_x_pa_flavor
set
    to_date = CURRENT_TIMESTAMP
from
    tmp_dc_x_pa_flavor stage
where
    stage.ndc = rdsftcore.dc_x_pa_flavor.ndc
    and stage.pa_type = rdsftcore.dc_x_pa_flavor.pa_type
    and cast(stage.pa_eff_dt as timestamp) = rdsftcore.dc_x_pa_flavor.pa_eff_dt
    and cast(stage.load_eff_dt as timestamp) = rdsftcore.dc_x_pa_flavor.load_eff_dt;');
INSERT INTO rdsftorchestration.job_config_sqls (
    schema_name
    , table_name
    , serial_no
    , sql_command)
VALUES (
    'rdsftcore'
    , 'dc_x_pa_flavor'
    , 4
    , 'MERGE INTO rdsftcore.dc_x_pa_flavor USING tmp_dc_x_pa_flavor src ON (
    dc_x_pa_flavor.ndc = src.ndc
    and dc_x_pa_flavor.pa_type = src.pa_type
    and dc_x_pa_flavor.pa_eff_dt = cast(src.pa_eff_dt as timestamp)
    and dc_x_pa_flavor.load_eff_dt = cast(src.load_eff_dt as timestamp)
    and dc_x_pa_flavor.to_date = cast(src.to_date as timestamp)
) WHEN MATCHED THEN
UPDATE
SET
    ndc = rdsftcore.dc_x_pa_flavor.ndc WHEN NOT MATCHED THEN INSERT (
        ndc,
        pa_type,
        pa_value,
        pa_eff_dt,
        pa_exp_dt,
        load_eff_dt,
        load_exp_dt,
        from_date,
        to_date,
        file_name,
        target_processing_timestamp
    )
VALUES
    (
        src.ndc,
        src.pa_type,
        src.pa_value,
        cast(src.pa_eff_dt as timestamp),
        cast(src.pa_exp_dt as timestamp),
        cast(src.load_eff_dt as timestamp),
        cast(src.load_exp_dt as timestamp),
        cast(src.from_date as timestamp),
        cast(src.to_date as timestamp),
        src.file_name,
        CURRENT_TIMESTAMP
    );');
INSERT INTO rdsftorchestration.job_config_sqls (
    schema_name
    , table_name
    , serial_no
    , sql_command)
VALUES (
    'rdsftcore'
    , 'hospital_cost_report'
    , 1
    , 'Create temporary table tmp_hospital_cost_report as
select
    rpt_rec_num,
    prvdr_ctrl_type_cd,
    prvdr_num,
    npi,
    rpt_stus_cd,
    NULLIF(fy_bgn_dt,'''') AS fy_bgn_dt,
    NULLIF(fy_end_dt,'''') AS fy_end_dt,
    NULLIF(proc_dt,'''') AS proc_dt,
    initl_rpt_sw,
    last_rpt_sw,
    trnsmtl_num,
    fi_num,
    adr_vndr_cd,
    NULLIF(fi_creat_dt,'''') AS fi_creat_dt,
    util_cd,
    NULLIF(npr_dt,'''') AS npr_dt,
    spec_ind,
    NULLIF(fi_rcpt_dt,'''') AS fi_rcpt_dt,
    file_name,
    target_transaction_timestamp
from
    rdsftetl.hospital_cost_report
where
    target_transaction_timestamp >= '' p_etl_from_timestamp ''
    and target_transaction_timestamp <= '' p_etl_to_timestamp ''
    and prvdr_num is not null
    and rpt_rec_num is not null
    and prvdr_ctrl_type_cd in (''1'', ''2'', ''3'', ''4'', ''5'')
    and rpt_stus_cd in (''1'', ''2'', ''3'', ''4'', ''5'')
    and (
        initl_rpt_sw is null
        or initl_rpt_sw in (''Y'', ''N'')
    )
    and (
        last_rpt_sw is null
        or last_rpt_sw in (''Y'', ''N'')
    )
    and (
        util_cd is null
        or util_cd in (''L'', ''N'', ''F'')
    )
    and (
        adr_vndr_cd is null
        or adr_vndr_cd in (''2'', ''3'', ''4'', ''5'')
    )
    and (
        fy_bgn_dt is null
        or rdsftetl.fn_chk_date (fy_bgn_dt, ''%m/%d/%Y'') = 0
    )
    and (
        fy_end_dt is null
        or rdsftetl.fn_chk_date (fy_end_dt, ''%m/%d/%Y'') = 0
    )
    and (
        proc_dt is null
        or rdsftetl.fn_chk_date (proc_dt, ''%m/%d/%Y'') = 0
    )
    and (
        fi_creat_dt is null
        or rdsftetl.fn_chk_date (fi_creat_dt, ''%m/%d/%Y'') = 0
    )
    and (
        npr_dt is null
        or rdsftetl.fn_chk_date (npr_dt, ''%m/%d/%Y'') = 0
    )
    and (
        fi_rcpt_dt is null
        or rdsftetl.fn_chk_date (fi_rcpt_dt, ''%m/%d/%Y'') = 0
    );');
INSERT INTO rdsftorchestration.job_config_sqls (
    schema_name
    , table_name
    , serial_no
    , sql_command)
VALUES (
    'rdsftcore'
    , 'hospital_cost_report'
    , 2
    , 'INSERT INTO
    rdsftetl.hospital_cost_report_error (
        rpt_rec_num,
        prvdr_ctrl_type_cd,
        prvdr_num,
        npi,
        rpt_stus_cd,
        fy_bgn_dt,
        fy_end_dt,
        proc_dt,
        initl_rpt_sw,
        last_rpt_sw,
        trnsmtl_num,
        fi_num,
        adr_vndr_cd,
        fi_creat_dt,
        util_cd,
        npr_dt,
        spec_ind,
        fi_rcpt_dt,
        file_name,
        target_transaction_timestamp
    )
select
    rpt_rec_num,
    prvdr_ctrl_type_cd,
    prvdr_num,
    npi,
    rpt_stus_cd,
    fy_bgn_dt,
    fy_end_dt,
    proc_dt,
    initl_rpt_sw,
    last_rpt_sw,
    trnsmtl_num,
    fi_num,
    adr_vndr_cd,
    fi_creat_dt,
    util_cd,
    npr_dt,
    spec_ind,
    fi_rcpt_dt,
    file_name,
    target_transaction_timestamp
from
    rdsftetl.hospital_cost_report
where
    (target_transaction_timestamp >= '' p_etl_from_timestamp ''
    and target_transaction_timestamp <= '' p_etl_to_timestamp '')
    and (prvdr_num is null
    or rpt_rec_num is null
    or prvdr_ctrl_type_cd not in (''1'', ''2'', ''3'', ''4'', ''5'')
    or rpt_stus_cd not in (''1'', ''2'', ''3'', ''4'', ''5'')
    or (
        initl_rpt_sw is not null
        and initl_rpt_sw not in (''Y'', ''N'')
    )
    or (
        last_rpt_sw is not null
        and last_rpt_sw not in (''Y'', ''N'')
    )
    or (
        util_cd is not null
        and util_cd not in (''L'', ''N'', ''F'')
    )
    or (
        adr_vndr_cd is not null
        and adr_vndr_cd not in (''2'', ''3'', ''4'', ''5'')
    )
    or (
        fy_bgn_dt is not null
        and rdsftetl.fn_chk_date (fy_bgn_dt, ''%m/%d/%Y'') = 1
    )
    or (
        fy_end_dt is not null
        and rdsftetl.fn_chk_date (fy_end_dt, ''%m/%d/%Y'') = 1
    )
    or (
        proc_dt is not null
        and rdsftetl.fn_chk_date (proc_dt, ''%m/%d/%Y'') = 1
    )
    or (
        fi_creat_dt is not null
        and rdsftetl.fn_chk_date (fi_creat_dt, ''%m/%d/%Y'') = 1
    )
    or (
        npr_dt is not null
        and rdsftetl.fn_chk_date (npr_dt, ''%m/%d/%Y'') = 1
    )
    or (
        fi_rcpt_dt is not null
        and rdsftetl.fn_chk_date (fi_rcpt_dt, ''%m/%d/%Y'') = 1
    ));');
INSERT INTO rdsftorchestration.job_config_sqls (
    schema_name
    , table_name
    , serial_no
    , sql_command)
VALUES (
    'rdsftcore'
    , 'hospital_cost_report'
    , 3
    , 'update rdsftcore.hospital_cost_report
set
    to_date = CURRENT_TIMESTAMP
from
    tmp_hospital_cost_report stage
where
    stage.prvdr_num = rdsftcore.hospital_cost_report.prvdr_num
    and stage.rpt_rec_num = rdsftcore.hospital_cost_report.rpt_rec_num;');
INSERT INTO rdsftorchestration.job_config_sqls (
    schema_name
    , table_name
    , serial_no
    , sql_command)
VALUES (
    'rdsftcore'
    , 'hospital_cost_report'
    , 4
    , 'INSERT INTO
    rdsftcore.hospital_cost_report (
        rpt_rec_num,
        prvdr_ctrl_type_cd,
        prvdr_num,
        npi,
        rpt_stus_cd,
        fy_bgn_dt,
        fy_end_dt,
        proc_dt,
        initl_rpt_sw,
        last_rpt_sw,
        trnsmtl_num,
        fi_num,
        adr_vndr_cd,
        fi_creat_dt,
        util_cd,
        npr_dt,
        spec_ind,
        fi_rcpt_dt,
        from_date,
        to_date,
        file_name,
        target_processing_timestamp
    )
select
    rpt_rec_num,
    prvdr_ctrl_type_cd,
    prvdr_num,
    npi,
    rpt_stus_cd,
    cast(fy_bgn_dt as timestamp),
    cast(fy_end_dt as timestamp),
    cast(proc_dt as timestamp),
    initl_rpt_sw,
    last_rpt_sw,
    trnsmtl_num,
    fi_num,
    adr_vndr_cd,
    cast(fi_creat_dt as timestamp),
    util_cd,
    cast(npr_dt as timestamp),
    spec_ind,
    cast(fi_rcpt_dt as timestamp),
    cast(fy_bgn_dt as timestamp),
    cast(fy_end_dt as timestamp),
    file_name,
    CURRENT_TIMESTAMP
from
    tmp_hospital_cost_report;');
