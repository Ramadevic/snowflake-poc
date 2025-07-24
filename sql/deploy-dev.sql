USE ROLE ACCOUNTADMIN;
USE WAREHOUSE DEVOPS_WH;
USE DATABASE DEVOPS_DB;
USE SCHEMA COMMON;

-- Optionally record start time
SELECT CURRENT_TIMESTAMP() AS deployment_start, 'DEV' AS environment;

-- ===========================================
-- 🔄 2. Execute modular SQL object scripts
-- ===========================================

-- 2.1 Create external stages (if any)
!RUN stages/snowflake_create_stage.sql;

-- 2.2 Create or update tables
!RUN tables/snowflake_customer_table.sql;

-- 2.3 Create or update views
!RUN views/snowflake_create_view_customer.sql;

-- 2.4 Create or update stored procedures
!RUN stored-procedures/snowflake_create_procedure.sql;

-- ===========================================
-- ✅ 3. Finalize deployment
-- ===========================================

-- Record completion
SELECT CURRENT_TIMESTAMP() AS deployment_end, 'DEV' AS environment;
SELECT '✅ Deployment to DEV complete.' AS status;
