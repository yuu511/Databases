SELECT a.address_id
FROM  dv_address a
WHERE a.district = 'Buenos Aires'
AND a.address_id= (SELECT b.address_id
      FROM mg_customers b);