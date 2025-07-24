-- Session context
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE DEVOPS_WH;
USE DATABASE DEVOPS_DB;
USE SCHEMA COMMON;

-- 1. Log deployment start with audit info
SELECT CURRENT_TIMESTAMP() AS deployment_start
      , 'DEV'                 AS environment
      , CURRENT_USER()        AS deployed_by;

-- 2. Enable safe DDL behavior (optional)
ALTER SESSION SET DDL_OUTPUT = 'TRUE';

-- 3. Modular script execution
!RUN stages/snowflake_create_stage.sql;
!RUN tables/snowflake_customer_table.sql;
!RUN views/snowflake_create_view_customer.sql;
!RUN stored-procedures/snowflake_create_procedure.sql;

-- 4. Validate important objects exist
SELECT object_type, object_name
FROM information_schema.views
WHERE table_schema = current_schema();

-- 5. Finalize deployment with timestamp & success check
SELECT CURRENT_TIMESTAMP() AS deployment_end, 'DEV' AS environment;
SELECT '✅ Deployment to DEV complete.' AS status;
