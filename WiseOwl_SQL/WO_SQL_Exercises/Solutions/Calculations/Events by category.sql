-- show the events with their category
SELECT

	-- concatenate event and its category number
	e.EventName + 
		' (category ' + 
		CAST(e.CategoryID AS varchar(100)) +
		')' AS 'Event (category)',

	e.EventDate
FROM
	tblEvent AS e
WHERE
	-- show only in the Ukraine
	e.CountryID = 1