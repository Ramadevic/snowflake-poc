CREATE OR REPLACE TABLE customer (
  id INT AUTOINCREMENT START 1 INCREMENT 1,
  first_name STRING NOT NULL,
  last_name STRING NOT NULL,
  email STRING UNIQUE,
  date_of_birth DATE,
  created_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (id)
)
COMMENT = 'Stores customer information';
