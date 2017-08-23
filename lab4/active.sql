SELECT address_id
FROM mg_customers
WHERE mg_customers.active ='t'
IN (SELECT address_id 
	FROM dv_address
	WHERE district='Buenos Aires');