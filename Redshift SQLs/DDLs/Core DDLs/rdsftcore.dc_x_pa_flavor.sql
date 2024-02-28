--Drop table 
DROP TABLE IF EXISTS rdsftcore.dc_x_pa_flavor;

--Table Creation
CREATE TABLE
    rdsftcore.dc_x_pa_flavor (
        ndc character varying(11) NOT NULL ENCODE lzo,
        pa_type character varying(2) NOT NULL ENCODE lzo,
        pa_value character varying(1) NOT NULL ENCODE lzo,
        pa_eff_dt timestamp without time zone NOT NULL ENCODE az64,
        pa_exp_dt timestamp without time zone NOT NULL ENCODE az64,
        load_eff_dt timestamp without time zone NOT NULL ENCODE az64,
        load_exp_dt timestamp without time zone NOT NULL ENCODE az64,
        from_date timestamp without time zone NOT NULL ENCODE az64,
        to_date timestamp without time zone NOT NULL ENCODE az64,       
        file_name character varying(300) NOT NULL ENCODE lzo,
        target_processing_timestamp timestamp without time zone ENCODE az64
    ) DISTSTYLE AUTO;
