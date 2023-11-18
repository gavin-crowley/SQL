USE WorldEvents
GO

-- list out continents with substitute summary where necessary
SELECT
	c.ContinentName,

	-- summary without any change
	c.Summary,

	-- using ISNULL
	IsNull(c.Summary,'No summary') AS 'Using ISNULL',

	-- using COALESCE
	COALESCE(c.Summary,'No summary') AS 'Using COALESCE',

	-- using CASE 
	CASE
		WHEN c.Summary is null THEN 'No summary'
		ELSE c.Summary
	END AS 'Using CASE'

FROM
	tblContinent as c