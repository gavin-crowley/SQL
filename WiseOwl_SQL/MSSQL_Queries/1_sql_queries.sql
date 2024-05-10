--This is a comment
/*
Created by Wise Owl
Show a list of films
*/
USE Movies
SELECT 
	[FilmName] AS Title
	,FilmReleaseDate [Released on]
	,FilmOscarWins
FROM dbo.tblFilm
