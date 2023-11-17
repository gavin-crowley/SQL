
-- February 2005 events
SELECT
	e.EventName AS 'What',
	e.EventDate AS 'When'
FROM
	tblEvent AS e
WHERE
	e.EventDate between '20050201' and '20050228'