
-- show the first 3 categories in alphabetical order
SELECT TOP 3
	c.CategoryID,
	c.CategoryName
FROM
	tblCategory AS c
ORDER BY
	c.CategoryName DESC