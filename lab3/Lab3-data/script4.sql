/*Elijah Cordova 1425119*/
/*Lab 3 script4.sql*/

/* unit Test: illegal deletion*/

/* illegal deletion : address_id foreign key*/
DELETE FROM dv_address
WHERE address_id= 47;

/* illegal deletion : author_id foreign key*/
DELETE FROM cb_authors
WHERE author_id= 1;


/* unit test: illegal insertion */

/*illegal insertion: mg_customers*/
INSERT INTO mg_customers
VALUES (1000020400,'lul','xd','hehexd@db.com',1002000400,t);

/*illegal insertion: cb_books*/
INSERT INTO cb_books
VALUES ('lul',1002000400);