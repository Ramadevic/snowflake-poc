USE ROLE ACCOUNTADMIN;
USE WAREHOUSE DEVOPS_WH;
USE DATABASE DEVOPS_DB;
USE SCHEMA COMMON;

-- Log deployment start
SELECT CURRENT_TIMESTAMP() AS deployment_start,
       'DEV' AS environment,
       CURRENT_USER() AS deployed_by;

-- Run modular scripts
!RUN stages/snowflake_create_stage.sql;
!RUN tables/snowflake_customer_table.sql;
!RUN views/snowflake_create_view_customer.sql;
!RUN stored-procedures/snowflake_create_procedure.sql;

-- Validate view creation
SELECT table_name
FROM information_schema.views
WHERE table_schema = current_schema()
LIMIT 5;

-- Log deployment end
SELECT CURRENT_TIMESTAMP() AS deployment_end,
       'DEV' AS environment;
SELECT 'Deployment to DEV complete.' AS status;
