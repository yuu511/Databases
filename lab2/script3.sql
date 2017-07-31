/*Elijah Cordova 1425119*/
/*Lab 2 script3.sql*/

/*downtown video -> merged table*/

INSERT INTO mg_customers (customer_id, first_name, last_name, email, address_id, active)
SELECT dv_customer.customer_id, dv_customer.first_name, dv_customer.last_name, dv_customer.email, dv_customer.address_id, dv_customer.active
FROM dv_customer;

CREATE SEQUENCE mg_customers_seq 
START 600;

ALTER TABLE mg_customers
ALTER COLUMN customer_id
SET DEFAULT NEXTVAL('mg_customers_seq');

/*citybooks insert (exclude duplicate names)*/
INSERT INTO mg_customers (first_name, last_name)
SELECT cb_customers.first_name, cb_customers.last_name
FROM cb_customers
EXCEPT
SELECT cb_customers.first_name, cb_customers.last_name
FROM dv_customer, cb_customers
WHERE dv_customer.first_name=cb_customers.first_name AND  dv_customer.last_name = cb_customers.last_name;
