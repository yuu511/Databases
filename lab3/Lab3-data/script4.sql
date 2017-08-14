/*Elijah Cordova 1425119*/
/*Lab 3 script4.sql*/

/* unit Test: illegal deletion foreign key*/

/* illegal deletion : address_id foreign key*/
DELETE FROM dv_address
WHERE address_id= 47;

/* illegal deletion : author_id foreign key*/
DELETE FROM cb_authors
WHERE author_id= 1;

/* unit test: illegal insertions constraints*/

/*illegal insertion: dv_film*/
INSERT INTO dv_film
VALUES (1,'lul','xd',-12398923,'PG');

/*illegal insertion: mg _customers */
INSERT INTO mg_customers
VALUES (NULL,'lul','xd','hehexd@db.com',NULL);

/*illegal insertion: dv_address*/
INSERT INTO dv_address
VALUES (NULL,'lul','xd','hehexd',NULL,'test','test');


