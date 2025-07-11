-- Gold Schema SQL
-- Include table, view, procedure, and stage creation scripts for gold schema

-- Tables
@Database\Schema\gold_schema\tables\snowflake_customer_table_gold.sql;

-- Views
@Database\Schema\gold_schema\views\snowflake_create_view_customer_gold.sql;

-- Stored Procedures
@Database\Schema\gold_schema\stored-procedures\snowflake_create_procedure_gold.sql;

-- Stages
@Database\Schema\gold_schema\stages\snowflake_create_stage_gold.sql;
