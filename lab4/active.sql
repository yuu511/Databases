SELECT b.active
FROM dv_customer b
WHERE b.active = TRUE 
AND b.address_id= (SELECT a.address_id
                 FROM  dv_address a
                 WHERE district = 'Buenos Aires');