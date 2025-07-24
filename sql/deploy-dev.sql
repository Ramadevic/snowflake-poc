-- Set context
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE DEVOPS_WH;
USE DATABASE DEVOPS_DB;
USE SCHEMA COMMON;

--  Log deployment start
SELECT CURRENT_TIMESTAMP() AS deployment_start,
       'DEV' AS environment,
       CURRENT_USER() AS deployed_by;

-- Create Stage
CREATE OR REPLACE STAGE my_stage
  FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY = '"')
  COMMENT = 'Stage for loading customer data';

-- Create Table
CREATE OR REPLACE TABLE customer (
  id INT AUTOINCREMENT START 1 INCREMENT 1,
  first_name STRING NOT NULL,
  last_name STRING NOT NULL,
  email STRING UNIQUE,
  date_of_birth DATE,
  created_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (id)
)
COMMENT = 'Stores customer information';

-- Create View
CREATE OR REPLACE VIEW customer_view AS
  SELECT id, first_name, last_name, email
  FROM customer
  WHERE "active" = TRUE;

-- Create Stored Procedure
CREATE OR REPLACE PROCEDURE load_customer_data()
  RETURNS STRING
  LANGUAGE JAVASCRIPT
  EXECUTE AS CALLER
AS
$$
try {
  var sql_command = "COPY INTO @my_stage FROM 's3://mybucket/customer_data.csv' FILE_FORMAT = (TYPE = CSV)";
  var statement1 = snowflake.createStatement({sqlText: sql_command});
  statement1.execute();
  return "Data loaded successfully";
} catch(err) {
  return "Failed to load data: " + err;  
}
$$;

-- Validate View Creation
SELECT table_name
FROM information_schema.views
WHERE table_schema = current_schema()
LIMIT 5;

--  Log deployment end
SELECT CURRENT_TIMESTAMP() AS deployment_end,
       'DEV' AS environment;
SELECT ' Deployment to DEV complete.' AS status;
