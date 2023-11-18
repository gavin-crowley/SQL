-- show the shortest events
SELECT
	EventName,
	LEN(EventName) AS 'Length of name'
FROM
	tblEvent
ORDER BY
	'Length of Name' ASC