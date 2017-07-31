/*Elijah Cordova 1425119*/
/*Lab 2 script4.sql*/

/*Queries*/

/*1.What are the first and last names of all people who are customers of both Downtown Video and
City Books ?*/
SELECT dv_customer.first_name, dv_customer.last_name
FROM dv_customer, cb_customers
WHERE  dv_customer.first_name=cb_customers.first_name AND  dv_customer.last_name = cb_customers.last_name;

/*2.What are phone numbers of all people who are customers of both Downtown Video and
City Books?*/

SELECT dv_customer.phone
FROM dv_customer, cb_customers
WHERE dv_customer.phone = cb_customers.phone;

/*3.What are the first and last names of all customers who live in the district having the
most customers?*/

SELECT first_name, last_name
FROM dv_address, dv_customer
WHERE dv_address.address_id = dv_customer.address_id AND district =
(SELECT district
FROM dv_address
GROUP BY district
ORDER BY count(*) DESC
LIMIT 1);

/*4.What rating is the least commonamong films inthe Downtown Video database, and how
many films have that rating? (Return both the rating and the number offilms in one
result.)*/

SELECT rating,count(a)
FROM dv_film a
GROUP BY rating
ORDER BY count(*) ASC
LIMIT 1;

/*5.What are the first and last names of the top 10 authors when ranked by the number of
books eachhaswritten? (Returnbothauthornameandthenumber ofbooksoftop10
authors, sorted in descending order)*/

SELECT DISTINCT first_name, last_name, count(a)
FROM cb_authors, cb_books a 
WHERE cb_authors.author_id = a.author_id AND
(SELECT b.author_id
FROM cb_books b
GROUP BY  b.author_id
ORDER BY count(*) DESC
LIMIT 10);






