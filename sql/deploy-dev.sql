EXECUTE IMMEDIATE FROM @snowfalke-poc/branches/main/Database/Schema/Tables/snowflake_customer_table.sql USING (ENV=>'DEV');
ALTER GIT REPOSITORY FETCH;