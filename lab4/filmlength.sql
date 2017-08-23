SELECT a.title
FROM dv_film a
WHERE length >= (SELECT MIN(b.length)
	             FROM dv_film b)
AND length <= (SELECT MAX(c.length)
	             FROM dv_film c);