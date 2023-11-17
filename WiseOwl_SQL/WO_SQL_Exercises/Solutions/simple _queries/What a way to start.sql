
-- list out all of the events in date order
SELECT
	e.EventName,
	e.EventDate
FROM
	tblEvent AS e
ORDER BY
	e.EventDate DESC