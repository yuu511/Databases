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
VALUES (1,'lul','xd',-12,'PG');

/*illegal insertion: mg _customers */
INSERT INTO mg_customers
VALUES (NULL,'lul','xd','hehexd@db.com',NULL);

/*illegal insertion: dv_address*/
INSERT INTO dv_address
VALUES (NULL,'lul','xd','hehexd',NULL,'test','test');

/*
Error dump:

psql:script4.sql:8: ERROR:  update or delete on table "dv_address" violates foreign key constraint "mg_customers_address_id_fkey" on table "mg_customers"
DETAIL:  Key (address_id)=(47) is still referenced from table "mg_customers".

psql:script4.sql:12: ERROR:  update or delete on table "cb_authors" violates foreign key constraint "cb_books_author_id_fkey" on table "cb_books"
DETAIL:  Key (author_id)=(1) is still referenced from table "cb_books".

psql:script4.sql:18: ERROR:  new row for relation "dv_film" violates check constraint "positive_length"
DETAIL:  Failing row contains (1, lul, xd, -12, PG).

psql:script4.sql:22: ERROR:  null value in column "customer_id" violates not-null constraint
DETAIL:  Failing row contains (null, lul, xd, hehexd@db.com, null, t).

psql:script4.sql:26: ERROR:  null value in column "address_id" violates not-null constraint
DETAIL:  Failing row contains (null, lul, xd, hehexd, null, test, test).

 */

 /* Legal Insertions */
-- INSERT INTO dv_film
-- VALUES (1001,'filmtitle1','xd',100,'PG');

-- INSERT INTO dv_address
-- VALUES (2525,'rabu','raidu','otonokizaka',300,'95048','1234');


INSERT INTO mg_customers
VALUES (2525,'nico','yazawa','hehexd@db.com',2525,TRUE);



