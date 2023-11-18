SELECT
	c.CountryName, 

	-- show continent for each country
	CASE 
		WHEN c.ContinentID = 3 THEN 'Europe'
		WHEN c.ContinentID in (5,6) THEN 'Americas'
		WHEN c.ContinentID in (2,4) THEN 'Somewhere hot'
		WHEN c.ContinentID = 7 THEN 'Somewhere cold'
		WHEN c.ContinentID = 1 THEN 'Asia'
		ELSE 'Somewhere else'
	END AS CountryLocation

FROM
	tblCountry AS c
ORDER BY 
	CountryLocation DESC