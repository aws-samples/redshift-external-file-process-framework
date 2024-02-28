--Drop table 
DROP TABLE IF EXISTS rdsftetl.dc_x_pa_flavor_error;

--Table Creation
CREATE TABLE
    rdsftetl.dc_x_pa_flavor_error (
        ndc character varying(11) ENCODE lzo,
        pa_type character varying(2) ENCODE lzo,
        pa_value character varying(1) ENCODE lzo,
        pa_eff_dt character varying(30) ENCODE lzo,
        pa_exp_dt character varying(30) ENCODE lzo,
        load_eff_dt character varying(30) ENCODE lzo,
        load_exp_dt character varying(30) ENCODE lzo,
        file_name character varying(300) ENCODE lzo,
        target_transaction_timestamp timestamp without time zone ENCODE az64
    ) DISTSTYLE AUTO;
