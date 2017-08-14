/*Elijah Cordova 1425119*/
/*Lab 3 script5.sql*/
-- CREATE VIEW customer_city AS
SELECT first_name,last_name,city_id
FROM mg_customers, dv_address, dv_customer
WHERE mg_customers.first_name = dv_customer.first_name 
AND mg_customers.last_name = dv_customer.last_name;
