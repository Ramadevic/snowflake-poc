CREATE OR REPLACE STAGE "snowflake-poc"
  FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY = '"')
  COMMENT = 'Stage for loading customer data';
