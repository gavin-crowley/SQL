

-- show the first 5 events
SELECT TOP 5
	e.EventName AS 'What',
	e.EventDetails AS 'Details'
FROM
	tblEvent AS e
ORDER BY
	e.EventDate ASC