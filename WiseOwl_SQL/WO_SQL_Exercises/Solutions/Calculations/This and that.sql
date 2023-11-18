
-- a note for the future - this would be better done using a CTE
SELECT
	e.EventName,
	e.EventDate,

	-- work out where THIS and THAT appear
	CHARINDEX('this',e.EventDetails,1) AS thisPosition,
	CHARINDEX('that',e.EventDetails,1) AS thatPosition,

	-- show difference
	CHARINDEX('that',e.EventDetails,1) - CHARINDEX('this',e.EventDetails,1) AS Offset

FROM
	tblEvent AS e
WHERE
	CHARINDEX('this',e.EventDetails,1) > 0 and
	CHARINDEX('that',e.EventDetails,1) > 0 and
	(
		CHARINDEX('that',e.EventDetails,1) - CHARINDEX('this',e.EventDetails,1) > 0
	)
