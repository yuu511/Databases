SELECT active
FROM mg_customers 
WHERE active = TRUE 
AND address_id= (SELECT a.address_id
                   FROM  dv_address a
                    WHERE a.district = 'Buenos Aires');