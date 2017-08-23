SELECT phone
FROM dv_address
WHERE address_id = (SELECT address_id
                    FROM mg_customers
                    WHERE first_name= 'John' AND last_name = 'Smith');