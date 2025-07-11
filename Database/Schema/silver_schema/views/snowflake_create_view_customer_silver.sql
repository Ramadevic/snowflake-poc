CREATE VIEW silver_schema.customer_view AS
SELECT customer_id, first_name, last_name, email
FROM silver_schema.customer
WHERE created_at > '2020-01-01';
