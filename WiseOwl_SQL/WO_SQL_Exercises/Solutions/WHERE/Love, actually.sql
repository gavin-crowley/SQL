

-- show LOVE AND RELATIONSHIPS events
-- in date order
SELECT
	e.EventName,
	e.EventDate
FROM
	tblEvent AS e
WHERE
	e.CategoryID = 11
ORDER BY
	e.EventDate