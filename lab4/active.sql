SELECT address_id
FROM  dv_address
WHERE district = 'Buenos Aires'
AND dv_address.address_id= (SELECT mg_customers.address_id
                   FROM mg_customers
                   WHERE mg_customers.active = 't');