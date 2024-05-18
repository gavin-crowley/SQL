--PART 1

--This is a comment
/*
Created by Wise Owl
Show a list of films
*/
--USE Movies
--SELECT 
--	[FilmName] AS Title
--	,FilmReleaseDate [Released on]
--	,FilmOscarWins
--FROM dbo.tblFilm


--PART 2
--USE Movies

SELECT [FilmName] AS Title
	,FilmReleaseDate [Released on]
	,FilmRunTimeMinutes/60 AS [Hours]
	,FilmRunTimeMinutes%60 AS [Minutes]
FROM dbo.tblFilm
ORDER BY FilmOscarWins DESC


