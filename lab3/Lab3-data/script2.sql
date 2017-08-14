/*Elijah Cordova 1425119*/
/*Lab 3 script2.sql*/

ALTER TABLE mg_customers
ADD FOREIGN KEY (address_id) REFERENCES dv_address(address_id);

ALTER TABLE cb_books
ADD FOREIGN KEY (author_id) REFERENCES cb_authors(author_id);