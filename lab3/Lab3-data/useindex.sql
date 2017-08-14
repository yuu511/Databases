/*Elijah Cordova 1425119*/
/*Lab 3 useindex.sql*/

EXPLAIN ANALYZE
SELECT first_name
FROM mg_customers
WHERE first_name= 'John';

/* 
analysis of  query : John :
Type Of scan : Seq Scan 
Runtime: 0.154 ms
                                             QUERY PLAN
-------------------------------------------------------------------------------------------------------
 Seq Scan on mg_customers  (cost=0.00..14.59 rows=1 width=6) (actual time=0.073..0.119 rows=1 loops=1)
   Filter: ((first_name)::text = 'John'::text)
   Rows Removed by Filter: 606
 Total runtime: 0.154 ms
(4 rows)
*/

/* Create Index */
CREATE INDEX firstlast
ON mg_customers (first_name,last_name);

EXPLAIN ANALYZE
SELECT first_name
FROM mg_customers
WHERE first_name= 'John';






