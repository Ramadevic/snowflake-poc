EXECUTE IMMEDIATE FROM @snowflake-poc/branches/main/Database/Schema/tables/snowflake_customer_table.sql USING (ENV=>'DEV');
ALTER GIT REPOSITORY snowflake-poc FETCH;
