/*Elijah Cordova 1425119*/
/*Lab 3 script6.sql*/

UPDATE mg_customers
SET active = TRUE
WHERE active IS NULL 
AND last_name LIKE '%B' 
OR last_name LIKE '%C';