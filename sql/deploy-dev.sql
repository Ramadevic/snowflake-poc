-- Set context for development environment
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE DEVOPS_WH;
USE DATABASE DEVOPS_DB;
USE SCHEMA COMMON;

-- Log deployment start
SELECT CURRENT_TIMESTAMP() AS deployment_start,
       'DEV' AS environment,
       CURRENT_USER() AS deployed_by;

-- Deploy Stage
CALL COMMON.DEPLOY_STAGES;

-- Deploy Table
CALL COMMON.DEPLOY_TABLES;

-- Deploy View
CALL COMMON.DEPLOY_VIEWS;

-- Deploy Stored Procedure
CALL COMMON.DEPLOY_STORED-PROCEDURES;

-- Add more calls to deploy other scripts as needed

-- Log deployment completion
SELECT CURRENT_TIMESTAMP() AS deployment_end,
       'DEV' AS environment,
       CURRENT_USER() AS deployed_by;