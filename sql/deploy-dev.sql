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
CALL deploy_script('create_stage');

-- Deploy Table
CALL deploy_script('create_table');

-- Deploy View
CALL deploy_script('create_view');

-- Deploy Stored Procedure
CALL deploy_script('create_procedure');

-- Add more calls to deploy other scripts as needed

-- Log deployment completion
SELECT CURRENT_TIMESTAMP() AS deployment_end,
       'DEV' AS environment,
       CURRENT_USER() AS deployed_by;