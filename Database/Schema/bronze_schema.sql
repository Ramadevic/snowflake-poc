-- Bronze Schema SQL
-- Include table, view, procedure, and stage creation scripts for bronze schema

-- Tables
@Database\Schema\bronze_schema\tables\snowflake_customer_table_bronze.sql;

-- Views
@Database\Schema\bronze_schema\views\snowflake_create_view_customer_bronze.sql;

-- Stored Procedures
@Database\Schema\bronze_schema\stored-procedures\snowflake_create_procedure_bronze.sql;

-- Stages
@Database\Schema\bronze_schema\stages\snowflake_create_stage_bronze.sql;
