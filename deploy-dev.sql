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

      - name: Run SQL using Snowflake CLI with temporary connection
        env:
          ACCOUNT: ${{ secrets.SNOWSQL_ACCOUNT }}          
          USER: ${{ secrets.SNOWSQL_USER }}                
          PASSWORD: ${{ secrets.SNOWSQL_PWD }}              
          REQUESTS_CA_BUNDLE: /etc/ssl/certs/ca-certificates.crt
        run: |
          snow sql -f deploy-dev.sql

                     
