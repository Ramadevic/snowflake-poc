CREATE OR REPLACE PROCEDURE bronze_schema.sample_proc()
RETURNS STRING
LANGUAGE SQL
EXECUTE AS CALLER
AS
.\create_snowflake_repo.ps1
BEGIN
    RETURN 'Procedure Completed';
END;
.\create_snowflake_repo.ps1;
