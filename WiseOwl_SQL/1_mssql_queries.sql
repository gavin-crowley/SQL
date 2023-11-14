SELECT FilmName
	,FilmReleaseDate
	,FilmRunTimeMinutes
FROM tblFilm
WHERE month(FilmReleaseDate) = 5
ORDER BY FilmReleaseDate
