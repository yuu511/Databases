SELECT count(a) 
FROM mg_customers a, dv_address b 
WHERE a.address_id = b.address_id AND b.district = 'Buenos Aires' AND a.active = 't';