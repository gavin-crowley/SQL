SELECT CountryName
	,CASE 
		WHEN ContinentID = 1
			OR ContinentID = 3
			THEN 'Eurasia'
		WHEN ContinentID = 5
			OR ContinentID = 6
			THEN 'Americas'
		WHEN ContinentID = 2
			OR ContinentID = 4
			THEN 'Somewhere hot'
		WHEN ContinentID = 7
			THEN 'Somewhere cold'
		ELSE 'Somewhere else'
		END AS [CountryLocation]
FROM tblCountry
ORDER BY CountryLocation DESC

-- Calculations #5 next