CREATE OR REPLACE PROCEDURE load_customer_data()
  RETURNS STRING
  LANGUAGE JAVASCRIPT
  EXECUTE AS CALLER
AS
$$
try {
  var sql_command = "COPY INTO @my_stage FROM 's3://mybucket/customer_data.csv' FILE_FORMAT = (TYPE = CSV)";
  var statement1 = snowflake.createStatement({sqlText: sql_command});
  statement1.execute();
  return "Data loaded successfully";
} catch(err) {
  return "Failed to load data: " + err;  
}
$$;
