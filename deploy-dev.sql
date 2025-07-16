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
          cli-version: '3.6.0'

      - name: Run SQL using Snowflake CLI with secrets
        env:
          ACCOUNT: ${{ secrets.SNOWSQL_ACCOUNT }}
          USER: ${{ secrets.SNOWSQL_USER }}
          PASSWORD: ${{ secrets.SNOWSQL_PWD }}
          ROLE: ${{ secrets.SNOWSQL_ROLE }}
          REQUESTS_CA_BUNDLE: /etc/ssl/certs/ca-certificates.crt
        run: |
          echo "Connecting with ACCOUNT=$ACCOUNT, USER=$USER, ROLE=$ROLE"
          snow sql \
            -a "$ACCOUNT" \
            -u "$USER" \
            -p "$PASSWORD" \
            -r "$ROLE" \
            -f deploy-dev.sql
