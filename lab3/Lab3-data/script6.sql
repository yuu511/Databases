/*Elijah Cordova 1425119*/
/*Lab 3 script6.sql*/

/*1. update*/
UPDATE mg_customers
SET active = TRUE
WHERE active IS NULL 
AND last_name LIKE '%B' 
OR last_name LIKE '%C';

/*2. insert*/
-- INSERT INTO dv_address
-- VALUES (700,'Koshland','Way','otonokizaka',654,'95064','1234');

/*using address_id created above*/
-- INSERT INTO mg_customers
-- VALUES (2526,'John','Smith','nigonigo@db.com',700,TRUE);

/*3. List title of each film whose length exceeds the average length of all films */
SELECT title, AVG(length)
FROM dv_film
GROUP BY length
HAVING length > AVG(length);

