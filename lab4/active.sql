SELECT address_id
FROM dv_address
WHERE  address_id = (SELECT address_id
                     FROM mg_customers
                     WHERE active ='t');