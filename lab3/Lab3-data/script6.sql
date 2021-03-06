/*Elijah Cordova 1425119*/
/*Lab 3 script6.sql*/

/*1. update*/
UPDATE mg_customers
SET active = TRUE
WHERE active IS NULL 
AND (last_name LIKE 'B%' OR last_name LIKE 'C%');

/*2. insert*/
INSERT INTO dv_address
VALUES (700,'Koshland','Way',NULL,654,'95064',NULL);

/*using address_id created above*/
INSERT INTO mg_customers
VALUES (DEFAULT,'John','Smith',NULL,700,NULL);

/*3. List title of each film whose length exceeds the average length of all films */
SELECT a.title
FROM dv_film a
WHERE length > (SELECT AVG(b.length)
	             FROM dv_film b);

/*4. Max/ MIN / AVG length of FILMS*/
SELECT MAX(length),MIN(length),AVG(length),rating
FROM dv_film
GROUP BY rating;

/*5.Delete all books Written by Nevil Shute */
DELETE FROM cb_books
WHERE author_id= (SELECT b.author_id 
	              FROM cb_authors b
	              WHERE b.first_name='Nevil'
	              AND b.last_name='Shute');





