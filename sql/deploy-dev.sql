EXECUTE IMMEDIATE FROM @snowflake-poc/branches/main/Database/Schema/Tables/snowflake_customer_table.sql USING (ENV=>'DEV');
ALTER GIT REPOSITORY FETCH;