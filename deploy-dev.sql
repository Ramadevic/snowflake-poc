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
          cli-version: '3.5.0'

      - name: Run SQL on Snowflake (Direct Connection)
        env:
          ACCOUNT: ${{ secrets.SNOWSQL_ACCOUNT }}
          USER: ${{ secrets.SNOWSQL_USER }}
          PASSWORD: ${{ secrets.SNOWSQL_PWD }}
          ROLE: ${{ secrets.SNOWSQL_ROLE }}
        run: |
          echo "✅ Running SQL directly without config..."

          snow sql \
            --accountname $ACCOUNT \
            --username $USER \
            --password $PASSWORD \
            --rolename $ROLE \
            --warehousename DEVOPS_WH \
            --dbname DEVOPS_DB \
            --schemaname COMMON \
            --filename deploy-dev.sql \
            --debug