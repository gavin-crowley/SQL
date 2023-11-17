
SELECT
	e.EventName,
	e.EventDetails,
	e.EventDate
FROM
	tblEvent AS e
WHERE
	
	(
		-- one of the island countries
		e.CountryID IN (8,22,30,35)

		-- or contains word water (three different permutations of this)
		or e.EventDetails like '% water %'
		or e.EventDetails like 'water %' 
		or e.EventDetails like '% water' 

		-- or is in Natural World category
		or e.CategoryID = 4
	) 

	---- but must be since 1970
	and e.EventDate >= '19700101'