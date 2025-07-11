-- Silver Schema SQL
-- Include table, view, procedure, and stage creation scripts for silver schema

-- Tables
@Database\Schema\silver_schema\tables\snowflake_customer_table_silver.sql;

-- Views
@Database\Schema\silver_schema\views\snowflake_create_view_customer_silver.sql;

-- Stored Procedures
@Database\Schema\silver_schema\stored-procedures\snowflake_create_procedure_silver.sql;

-- Stages
@Database\Schema\silver_schema\stages\snowflake_create_stage_silver.sql;
