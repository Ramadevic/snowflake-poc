CREATE OR REPLACE PROCEDURE COMMON.DEPLOY_STAGES()
RETURNS STRING
LANGUAGE SQL
AS
$$
    BEGIN
        CREATE OR REPLACE STAGE my_stage
        FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY = '"')
        COMMENT = 'Stage for loading customer data';
    END;
$$;

CREATE OR REPLACE PROCEDURE COMMON.DEPLOY_TABLES()
RETURNS STRING
LANGUAGE SQL
AS
$$
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

    RETURN 'TABLE created';
$$;

CREATE OR REPLACE PROCEDURE COMMON.DEPLOY_STORED_PROCEDURES()
RETURNS STRING
LANGUAGE SQL
AS
$$
    CREATE OR REPLACE PROCEDURE load_customer_data()
    RETURNS STRING
    LANGUAGE JAVASCRIPT
    EXECUTE AS CALLER
    AS
    $$
        try {
            var sql_command = "COPY INTO @my_stage FROM 's3://mybucket/customer_data.csv' FILE_FORMAT = (TYPE = CSV)";
            var statement1 = snowflake.createStatement({ sqlText: sql_command });
            statement1.execute();
            return "Data loaded successfully";
        } catch (err) {
            return "failed to load data: " + err;
        }
    $$;

    RETURN 'PROCEDURE created';
$$;
