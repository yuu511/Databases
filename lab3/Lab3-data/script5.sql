/*Elijah Cordova 1425119*/
/*Lab 3 script5.sql*/
-- CREATE VIEW customer_city AS
SELECT first_name,last_name,city_id
FROM mg_customers, dv_address
WHERE mg_customers.address_id = dv_address.address_id;