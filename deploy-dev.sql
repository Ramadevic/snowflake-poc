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
          cli-version: '3.6.0' # Can downgrade to '3.5.0' if issues persist

      - name: Create temporary SnowSQL config and deploy
        env:
          ACCOUNT: ${{ secrets.SNOWSQL_ACCOUNT }}
          USER: ${{ secrets.SNOWSQL_USER }}
          PASSWORD: ${{ secrets.SNOWSQL_PWD }}
          ROLE: ${{ secrets.SNOWSQL_ROLE }}
        run: |
          echo "🔧 Building SnowSQL config..."

          mkdir -p ~/.snowsql

          cat <<EOF > ~/.snowsql/config
          [connections.temp]
          accountname = $ACCOUNT
          username = $USER
          password = $PASSWORD
          rolename = $ROLE
          warehousename = DEVOPS_WH
          dbname = DEVOPS_DB
          schemaname = COMMON
          EOF

          echo "✅ Config created. Running SQL file..."

          snow sql \
            -c temp \
            --filename deploy-dev.sql \
            --debug
