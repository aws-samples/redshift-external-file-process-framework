--DROP TABLE
DROP TABLE IF EXISTS RDSCNFG.EXT_FILE_CONFIG;

--create table
CREATE TABLE
    RDSCNFG.EXT_FILE_CONFIG (
        ext_file_config_sid int4 NOT NULL,
        ext_interface_cid numeric(30) NOT NULL,
        tgt_schema_name varchar(200) NULL,
        tgt_table_name varchar(200) NULL,
        file_prefix varchar(50) NOT NULL,
        file_format varchar(50) NOT NULL,
        file_type  varchar(50) NOT NULL,
        delimiter varchar(20) NULL,
        header_flag varchar(1) NOT NULL,
        trailer_flag varchar(1) NOT NULL,
        query varchar(65535) NULL,
        split_file_flag varchar(1) NOT NULL,
        split_prefix varchar(50) NULL,
        escape_char varchar(50) NULL,
        trailer_pstn varchar(50) NULL,
        oprtnl_flag varchar(1) NOT NULL DEFAULT 'A',
        created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        modified_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
    );

ALTER TABLE RDSCNFG.EXT_FILE_CONFIG ADD CONSTRAINT XPKETL_FILE_CONFIG PRIMARY KEY (EXT_FILE_CONFIG_SID);

ALTER TABLE RDSCNFG.EXT_FILE_CONFIG ADD CONSTRAINT XFK1_EXT_FILE_CONFIG FOREIGN KEY (EXT_INTERFACE_CID) REFERENCES RDSCNFG.EXT_INTERFACE (EXT_INTERFACE_CID);

--comment on table 
COMMENT ON TABLE RDSCNFG.EXT_FILE_CONFIG IS 'This table stores the interface file configuration information.';

--comment on columns
COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.EXT_FILE_CONFIG_SID IS 'The unique system identifier to identify the interface file configuration.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.EXT_INTERFACE_CID IS 'The unique system identifier to identify the interface file information.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.TGT_SCHEMA_NAME IS 'The name of the Target Schema.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.TGT_TABLE_NAME IS 'The name of the Target Table.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.FILE_PREFIX IS 'The file prefix information.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.FILE_FORMAT IS 'The file format information.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.FILE_TYPE IS 'The file type extension information.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.DELIMITER IS 'The delimiter used in the file.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.HEADER_FLAG IS 'The flag to indicate the header.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.TRAILER_FLAG IS 'The flag to indicate the trailer.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.QUERY IS 'The actual query.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.SPLIT_FILE_FLAG IS 'The flag to indicate the split file.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.SPLIT_PREFIX IS 'The type of the record which is used to split.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.OPRTNL_FLAG IS 'The flag that indicates system status of the record, i.e., '' A '' = Active (currently in use), '' I '' = Inactive (Temporarily made inactive) or '' D '' = Deleted (Record has been marked deleted, on purge move to history tables).';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.CREATED_DATE IS 'Date and time on which record get created. This shall be used on insert only.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.MODIFIED_DATE IS 'Date and time on which the record was modified. This will be used on each update or when the record is marked for soft delete.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.TRAILER_PSTN IS 'The Trailer position.';

COMMENT ON COLUMN RDSCNFG.EXT_FILE_CONFIG.ESCAPE_CHAR IS 'The Escape Character.';
