/*Elijah Cordova 1425119*/
/*Lab 3 script5.sql*/

/* view 1 */
CREATE VIEW customer_city AS
SELECT DISTINCT dv_customer.first_name,dv_customer.last_name,city_id
FROM dv_customer, cb_customers, dv_address
WHERE cb_customers.first_name = dv_customer.first_name 
AND cb_customers.last_name = dv_customer.last_name
AND dv_customer.address_id = dv_address.address_id;

/*view 2 */
CREATE VIEW district_stat AS
SELECT district, COUNT(address_id)
FROM dv_address
GROUP BY district
ORDER BY count(*)ASC;

/*view 3*/
CREATE VIEW author_title AS
SELECT first_name, last_name,title
FROM cb_authors, cb_books
WHERE cb_authors.author_id = cb_books.author_id;

SELECT title
FROM cb_books, cb_authors
WHERE cb_authors.author_id = cb_books.author_id
AND cb_authors.first_name = 'Stephen'
AND cb_authors.last_name = 'Fry';