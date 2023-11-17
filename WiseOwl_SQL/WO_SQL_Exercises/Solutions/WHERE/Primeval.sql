
-- anomalies?
SELECT
	e.EventName AS What,
	e.EventDetails AS Details,
	e.EventDate AS 'When'
FROM
	tblEvent AS e
WHERE
	-- show all events not in transport category (14)
	-- but which include the word train
	e.CategoryID <> 14 and
	(e.EventDetails like '%train%')


-- events in the "Space" category which don't mention
-- space anywhere
SELECT
	e.EventName AS What,
	e.EventDetails AS Details,
	e.EventDate AS 'When'
FROM
	tblEvent AS e
WHERE
	e.CountryID = 13 and 
	e.EventDetails not like '%space%' and
	e.EventName not like '%space%'


-- war and conflict or death and disaster events
-- which don't mention war or death
SELECT
	e.EventName,
	e.EventDetails
FROM
	tblEvent AS e
WHERE	
	e.CategoryID in (5,6) and 
	e.EventDetails not like '%death%' and 
	e.EventDetails not like '%war%'