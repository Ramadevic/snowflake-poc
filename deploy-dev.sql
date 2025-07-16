name: Deploy to Snowflake

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Install Snowflake CLI
        uses: snowflakedb/snowflake-cli-action@v1.5
        with:
          cli-version: '3.6.0'  # You can switch to '3.5.0' if needed

      - name: Run SQL using Snowflake CLI with direct connection flags
        run: |
          echo "📡 Connecting to Snowflake..."
          snow sql \
            --account "${{ secrets.SNOWSQL_ACCOUNT }}" \
            --user "${{ secrets.SNOWSQL_USER }}" \
            --password "${{ secrets.SNOWSQL_PWD }}" \
            --role "${{ secrets.SNOWSQL_ROLE }}" \
            --warehouse DEVOPS_WH \
            --database DEVOPS_DB \
            --schema COMMON \
            --filename deploy-dev.sql \
            --debug
