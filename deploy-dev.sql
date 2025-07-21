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

      - name: Configure SnowSQL and Run SQL
        env:
          ACCOUNT: ${{ secrets.SNOWSQL_ACCOUNT }}
          USER: ${{ secrets.SNOWSQL_USER }}
          PASSWORD: ${{ secrets.SNOWSQL_PWD }}
          ROLE: ${{ secrets.SNOWSQL_ROLE }}
        run: |
          echo "🔧 Creating SnowSQL config..."
          mkdir -p ~/.snowsql

          cat <<EOF > ~/.snowsql/config
[connections.default]
accountname = $ACCOUNT
username = $USER
password = $PASSWORD
rolename = $ROLE
warehousename = DEVOPS_WH
dbname = DEVOPS_DB
schemaname = COMMON
EOF

          echo "✅ Config created. Running SQL script..."
          snow sql --filename deploy-dev.sql --debug