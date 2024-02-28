--Drop table 
DROP TABLE IF EXISTS rdsftetl.hospital_cost_report_error;

--Table Creation
CREATE TABLE
    rdsftetl.hospital_cost_report_error (
        rpt_rec_num numeric(15) ENCODE az64,
        prvdr_ctrl_type_cd character varying(2) ENCODE lzo,
        prvdr_num character varying(6) ENCODE lzo,
        npi numeric(11) ENCODE az64,
        rpt_stus_cd character varying(10) ENCODE lzo,
        fy_bgn_dt character varying(30) ENCODE lzo,
        fy_end_dt character varying(30) ENCODE lzo,
        proc_dt character varying(30) ENCODE lzo,
        initl_rpt_sw character varying(10) ENCODE lzo,
        last_rpt_sw character varying(10) ENCODE lzo,
        trnsmtl_num character varying(2) ENCODE lzo,
        fi_num character varying(5) ENCODE lzo,
        adr_vndr_cd character varying(10) ENCODE lzo,
        fi_creat_dt character varying(30) ENCODE lzo,
        util_cd character varying(10) ENCODE lzo,
        npr_dt character varying(30) ENCODE lzo,
        spec_ind character varying(10) ENCODE lzo,
        fi_rcpt_dt character varying(30) ENCODE lzo,
        file_name character varying(300) ENCODE lzo,
        target_transaction_timestamp timestamp without time zone ENCODE az64
    ) DISTSTYLE AUTO;