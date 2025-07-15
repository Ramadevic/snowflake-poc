CREATE TABLE IF NOT EXISTS customer (
    customer_id INT AUTOINCREMENT,
    first_name STRING,
    last_name STRING,
    email STRING,
    created_at TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP
);
