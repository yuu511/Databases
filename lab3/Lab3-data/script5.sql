/*Elijah Cordova 1425119*/
/*Lab 3 script5.sql*/

CREATE VIEW customer_city AS
SELECT DISTINCT dv_customer.first_name,dv_customer.last_name,city_id
FROM dv_customer, cb_customers, dv_address
WHERE cb_customers.first_name = dv_customer.first_name 
AND cb_customers.last_name = dv_customer.last_name
AND dv_customer.address_id = dv_address.address_id;

