/*Elijah Cordova 1425119*/
/*Lab 2 script2.sql*/

/*downtown video*/
\copy dv_customer FROM 'dv_customer.data';
\copy dv_address FROM 'dv_address.data';
\copy dv_film FROM 'dv_film.data';

/*citybooks*/
\copy cb_authors FROM 'cb_authors.data';
\copy cb_books FROM 'cb_books.data';
\copy cb_customers FROM 'cb_customers.data';