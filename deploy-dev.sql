run: |
  echo "🔍 Checking connection to Snowflake..."

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
