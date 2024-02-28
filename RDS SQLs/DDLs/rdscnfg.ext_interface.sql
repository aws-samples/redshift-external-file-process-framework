--DROP TABLE
DROP TABLE IF EXISTS RDSCNFG.EXT_INTERFACE;

--create table
CREATE TABLE
    RDSCNFG.EXT_INTERFACE (
        ext_interface_cid numeric(30) NOT NULL,
        interface_name varchar(200) NOT NULL,
        interface_desc varchar(4000) NULL,
        oprtnl_flag varchar(1) NOT NULL DEFAULT 'A',
        created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        modified_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
    );

ALTER TABLE RDSCNFG.EXT_INTERFACE ADD CONSTRAINT XPKETL_INTERFACE PRIMARY KEY (EXT_INTERFACE_CID);

--comment on table 
COMMENT ON TABLE RDSCNFG.EXT_INTERFACE IS 'This table stores the interface file information.';

--comment on columns
COMMENT ON COLUMN RDSCNFG.EXT_INTERFACE.EXT_INTERFACE_CID IS 'The unique system identifier to identify the interface file information.';

COMMENT ON COLUMN RDSCNFG.EXT_INTERFACE.INTERFACE_NAME IS 'The name of the Interface.';

COMMENT ON COLUMN RDSCNFG.EXT_INTERFACE.INTERFACE_DESC IS 'The description of the Interface.';

COMMENT ON COLUMN RDSCNFG.EXT_INTERFACE.OPRTNL_FLAG IS 'The flag that indicates system status of the record, i.e., '' A '' = Active (currently in use), '' I '' = Inactive (Temporarily made inactive) or '' D '' = Deleted (Record has been marked deleted, on purge move to history tables).';

COMMENT ON COLUMN RDSCNFG.EXT_INTERFACE.CREATED_DATE IS 'Date and time on which record get created. This shall be used on insert only.';

COMMENT ON COLUMN RDSCNFG.EXT_INTERFACE.MODIFIED_DATE IS 'Date and time on which the record was modified. This will be used on each update or when the record is marked for soft delete.';