SELECT b.active
FROM mg_customers b
WHERE b.active = TRUE 
AND b.address_id= (SELECT a.address_id
                 FROM  dv_address a
                 WHERE a.district = 'Buenos Aires');