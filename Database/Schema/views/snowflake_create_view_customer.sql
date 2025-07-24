CREATE OR REPLACE VIEW customer_view AS
  SELECT id, first_name, last_name, email
  FROM customer
  WHERE active = TRUE;
