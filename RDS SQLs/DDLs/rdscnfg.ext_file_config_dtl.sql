--DROP TABLE
DROP TABLE IF EXISTS RDSCNFG.EXT_FILE_CONFIG_DTL;

--create table
CREATE TABLE
    RDSCNFG.EXT_FILE_CONFIG_DTL (
        ext_file_config_dtl_sid int4 NOT NULL,
        ext_file_config_sid int4 NOT NULL,
        column_name varchar(200) NOT NULL,
        column_width_fixed numeric(20) NULL,
        column_order_sqnc numeric(5, 2) NOT NULL,
        oprtnl_flag varchar(1) NOT NULL DEFAULT 'A',
        created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        modified_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
    );

ALTER TABLE RDSCNFG.EXT_FILE_CONFIG_DTL ADD CONSTRAINT XPKETL_FILE_CONFIG_DTL PRIMARY KEY (EXT_FILE_CONFIG_DTL_SID);

ALTER TABLE RDSCNFG.EXT_FILE_CONFIG_DTL ADD CONSTRAINT XFK1_EXT_FILE_CONFIG_DTL FOREIGN KEY (EXT_FILE_CONFIG_SID) REFERENCES RDSCNFG.EXT_FILE_CONFIG (EXT_FILE_CONFIG_SID);

--comment on table 
COMMENT ON TABLE RDSCNFG.EXT_FILE_CONFIG_DTL IS 'This table stores the interface file configuration detail.';

--comment on columns
COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG_DTL.EXT_FILE_CONFIG_DTL_SID IS 'The unique system identifier to identify the interface file configuration detail.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG_DTL.EXT_FILE_CONFIG_SID IS 'The unique system identifier to identify the interface file configuration.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG_DTL.COLUMN_NAME IS 'The name of the column.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG_DTL.COLUMN_WIDTH_FIXED IS 'The fixed column width.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG_DTL.COLUMN_ORDER_SQNC IS 'Sequence of column';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG_DTL.OPRTNL_FLAG IS 'The flag that indicates system status of the record, i.e., '' A '' = Active (currently in use), '' I '' = Inactive (Temporarily made inactive) or '' D '' = Deleted (Record has been marked deleted, on purge move to history tables).';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG_DTL.CREATED_DATE IS 'Date and time on which record get created. This shall be used on insert only.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG_DTL.MODIFIED_DATE IS 'Date and time on which the record was modified. This will be used on each update or when the record is marked for soft delete.';
