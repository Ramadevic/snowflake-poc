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

      - name: Run SQL using Snowflake CLI with full connection flags
        env:
          ACCOUNT: ${{ secrets.SNOWSQL_ACCOUNT }}
          USER: ${{ secrets.SNOWSQL_USER }}
          PASSWORD: ${{ secrets.SNOWSQL_PWD }}
          ROLE: ${{ secrets.SNOWSQL_ROLE }}
          REQUESTS_CA_BUNDLE: /etc/ssl/certs/ca-certificates.crt
        run: |
          echo "🔧 Using ACCOUNT=$ACCOUNT, USER=$USER, ROLE=$ROLE"
          
          snow sql \
            --temporary-connection \
            --config-file /dev/null \  # Prevent default config fallback
            --account "$ACCOUNT" \
            --user "$USER" \
            --password "$PASSWORD" \
            --role "$ROLE" \
            --warehouse DEVOPS_WH \
            --database DEVOPS_DB \
            --schema COMMON \
            --filename deploy-dev.sql \
            --debug

