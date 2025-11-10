
USE pubs

-- a)
SELECT * FROM authors

-- b)

SELECT au_lname, au_fname, phone FROM authors

-- c)
SELECT au_lname, au_fname, phone FROM authors
	ORDER BY au_lname, au_fname

-- d)
SELECT au_lname AS first_name, au_fname AS last_name, phone AS telephone FROM authors
	ORDER BY au_lname, au_fname

-- e)
SELECT au_lname AS first_name, au_fname AS last_name, phone AS telephone FROM authors
	WHERE "state" = 'CA' AND "au_lname" != 'Ringer'
		ORDER BY au_lname, au_fname

-- f)
SELECT * FROM publishers
	WHERE pub_name LIKE '%Bo%'

-- g)
SELECT DISTINCT pub_name FROM publishers as p JOIN titles as t ON p.pub_id = t.pub_id
	WHERE "type" = 'Business'

-- h)
SELECT DISTINCT pub_name, Count(t.title_id) AS titles_sold FROM publishers as p 
	JOIN titles as t ON p.pub_id = t.pub_id
		GROUP BY pub_name

-- i)
SELECT DISTINCT pub_name, SUM(t.ytd_sales) AS titlesold, title FROM publishers as p 
	JOIN titles as t ON p.pub_id = t.pub_id
		WHERE t.ytd_sales IS NOT NULL 
			GROUP BY pub_name, title;

-- j)
SELECT DISTINCT title FROM titles as t
	JOIN sales as s ON s.title_id = t.title_id
	JOIN stores as st ON st.stor_id = s.stor_id
		Where st.stor_name = 'Bookbeat'

-- k)
SELECT au_lname, au_fname FROM authors AS a
	JOIN titleauthor AS ta ON a.au_id = ta.au_id
	JOIN titles AS t ON ta.title_id = t.title_id
	GROUP BY au_lname, au_fname
		HAVING COUNT(t.type) > 1;

-- l)
SELECT "type", pub_id, AVG(price) AS AVGPrice, SUM(ytd_sales) AS Sales FROM titles
    WHERE price IS NOT NULL 
        AND ytd_sales IS NOT NULL
    GROUP BY "type", pub_id;

-- m)
SELECT "type" FROM titles AS t
    WHERE t.price IS NOT NULL 
        AND ytd_sales IS NOT NULL
    GROUP BY t."type"
	HAVING MAX(t.advance) > 1.5 * AVG(t.price);

-- n)
SELECT t.title, a.au_lname, a.au_fname ,
       (t.ytd_sales * t.price) AS Revenue
FROM titles AS t
JOIN titleauthor AS ta ON t.title_id = ta.title_id
JOIN authors AS a ON ta.au_id = a.au_id;

-- o)

SELECT t.title, 
       t.ytd_sales, 
   
	 
       (t.ytd_sales * t.price) AS TotalRevenue,
       -- falta a dos autores e publisher
FROM titles AS t;
