CREATE VIEW bronze_schema.customer_view AS
SELECT customer_id, first_name, last_name, email
FROM bronze_schema.customer
WHERE created_at > '2020-01-01';
