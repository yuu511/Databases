UPDATE mg_customers
SET active = TRUE
WHERE address_id IS NULL 
AND (last_name LIKE '%B' OR last_name LIKE '%C');