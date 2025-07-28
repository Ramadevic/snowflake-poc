-- ===============================
-- DEPLOY_STAGES Procedure
-- ===============================
CREATE OR REPLACE PROCEDURE COMMON.DEPLOY_STAGES()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
    CREATE OR REPLACE STAGE my_stage
        FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY = '"')
        COMMENT = 'Stage for loading customer data';

    RETURN 'Stage created successfully';
END;
$$;

-- ===============================
-- DEPLOY_TABLES Procedure
-- ===============================
CREATE OR REPLACE PROCEDURE COMMON.DEPLOY_TABLES()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
    CREATE OR REPLACE TABLE customer (
        id INT AUTOINCREMENT START 1 INCREMENT 1,
        first_name STRING NOT NULL,
        last_name STRING NOT NULL,
        email STRING UNIQUE,
        date_of_birth DATE,
        created_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
        active BOOLEAN DEFAULT TRUE,
        PRIMARY KEY (id)
    );

    RETURN 'Table created successfully';
END;
$$;

-- ===============================
-- DEPLOY_STORED_PROCEDURES Procedure
-- =================
