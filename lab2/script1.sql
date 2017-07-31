/*Elijah Cordova 1425119*/
/*Lab 2 script1.sql*/

/*DowntownVideoDB*/

/*dv_customer*/
CREATE TABLE dv_customer (
	customer_id INTEGER,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	address_id INTEGER,
	active BOOLEAN
);

/*dv_address*/
CREATE TABLE dv_address (
	address_id INTEGER,
	address varchar(50),
	address2 varchar(50),
	district varchar(50),
	city_id INTEGER,
	postal_code varchar(50),
	phone varchar(50)
);

/*enum type for film*/
CREATE TYPE mpaa_rating AS ENUM (
'G',
'PG',
'PG-13',
'R',
'NC-17'
);

/*dv_film*/
CREATE TABLE dv_film  (
	film_id INTEGER,
	title varchar(50),
	descripition TEXT,
	length SMALLINT,
	rating mpaa_rating
);

/*CityBooks DB*/ 

CREATE TABLE  cb_customers (
	last_name varchar(50),
	first_name varchar(50)
);

CREATE TABLE  cb_books (
	title varchar(50),
	author_id INTEGER
);

CREATE TABLE  cb_authors (
	author_id INTEGER,
    first_name varchar(50),
    last_name varchar(50)
);

/*Merged Tables*/

CREATE TABLE mg_customers (
	customer_id INTEGER,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	address_id INTEGER,
	active BOOLEAN
);


		
