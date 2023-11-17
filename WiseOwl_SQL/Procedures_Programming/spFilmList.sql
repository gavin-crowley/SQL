USE Movies
GO

ALTER PROCEDURE spFilmList
AS
BEGIN
	SELECT FilmName
		,FilmReleaseDate
		,FilmRunTimeMinutes
	FROM tblFilm
	ORDER BY FilmName DESC
END
