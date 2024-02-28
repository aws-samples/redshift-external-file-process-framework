--Drop table 
DROP TABLE IF EXISTS rdsftcore.hospital_cost_report;

--Table Creation
CREATE TABLE
    rdsftcore.hospital_cost_report (
        rpt_rec_num numeric(15) NOT NULL ENCODE az64,
        prvdr_ctrl_type_cd character varying(2) ENCODE lzo,
        prvdr_num character varying(6) NOT NULL  ENCODE lzo,
        npi numeric(11) ENCODE az64,
        rpt_stus_cd character varying(10) NOT NULL  ENCODE lzo,
        fy_bgn_dt timestamp without time zone ENCODE az64,
        fy_end_dt timestamp without time zone ENCODE az64,
        proc_dt timestamp without time zone ENCODE az64,
        initl_rpt_sw character varying(10) ENCODE lzo,
        last_rpt_sw character varying(10) ENCODE lzo,
        trnsmtl_num character varying(2) ENCODE lzo,
        fi_num character varying(5) ENCODE lzo,
        adr_vndr_cd character varying(10) ENCODE lzo,
        fi_creat_dt timestamp without time zone ENCODE az64,
        util_cd character varying(10) ENCODE lzo,
        npr_dt timestamp without time zone ENCODE az64,
        spec_ind character varying(10) ENCODE lzo,
        fi_rcpt_dt timestamp without time zone ENCODE az64,
        from_date timestamp without time zone ENCODE az64,
        to_date timestamp without time zone ENCODE az64,
        file_name character varying(300) NOT NULL ENCODE lzo,
        target_processing_timestamp timestamp without time zone ENCODE az64
    ) DISTSTYLE AUTO;