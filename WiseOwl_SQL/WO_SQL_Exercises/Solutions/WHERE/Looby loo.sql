
-- list events to do with Teletubbies or Andy Pandy
SELECT 
	EventName,
	EventDate
FROM
	tblEvent 
WHERE
	-- name of event includes either string of textd
	EventName like '%Teletubbies%' or
	EventName like '%Pandy%'