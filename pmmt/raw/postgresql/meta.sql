BEGIN;

CREATE SCHEMA version_meta;

CREATE TABLE version_meta.history(
    version INT NOT NULL,
	update_date TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE OR REPLACE PROCEDURE version_meta.sp_update_db_version(new_version INT)
LANGUAGE plpgsql
AS $$

BEGIN

    INSERT INTO version_meta.history VALUES (new_version);
END; $$;



COMMIT;
