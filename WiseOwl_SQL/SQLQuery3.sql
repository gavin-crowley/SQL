
/*
Created by Gavin
Show a list of films
*/

USE Movies

SELECT TOP 10 WITH TIES
	FilmName AS [Title]
	,FilmReleaseDate AS [Released on]
	,FilmRunTimeMinutes AS [Duration]
	,[FilmOscarWins]
FROM 
	dbo.tblFilm
WHERE
	YEAR(FilmReleaseDate) = 2000
ORDER BY 
	FilmOscarWins ASC