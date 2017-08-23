SELECT address_id
FROM mg_customers
WHERE active = 't'
AND 
IN (SELECT address_id 
	FROM dv_address
	WHERE district='Buenos Aires');