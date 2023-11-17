--PART 1 - Basics
USE Movies
GO

CREATE PROCEDURE spFilmList
AS
BEGIN
	SELECT FilmName
		,FilmReleaseDate
		,FilmRunTimeMinutes
	FROM tblFilm
	ORDER BY FilmName ASC
END

-----------------------

EXECUTE spFilmList

-----------------------

ALTER PROCEDURE spFilmList
AS
BEGIN
	SELECT FilmName
		,FilmReleaseDate
		,FilmRunTimeMinutes
	FROM tblFilm
	ORDER BY FilmName DESC
END

---------------------------

DROP PROCEDURE spFilmList

---------------------------

--PART 2 - Parameters


CREATE PROCEDURE spFilmCriteria (@MinLength AS INT)
AS
BEGIN
	SELECT FilmName
		,FilmRunTimeMinutes
	FROM tblFilm
	WHERE FilmRunTimeMinutes > @MinLength
	ORDER BY FilmRunTimeMinutes ASC
END

-----
exec spFilmCriteria 150
-----

--multiple parameters
ALTER PROCEDURE [dbo].[spFilmCriteria] (
	@MinLength AS INT
	,@MaxLength AS INT
	)
AS
BEGIN
	SELECT FilmName
		,FilmRunTimeMinutes
	FROM tblFilm
	WHERE FilmRunTimeMinutes >= @MinLength
		AND FilmRunTimeMinutes <= @MaxLength
	ORDER BY FilmRunTimeMinutes ASC
END
------
exec spFilmCriteria 150, 180

--named parameters
EXEC spFilmCriteria @Minlength = 150,@MaxLength = 180

-------------
--text parameters
ALTER PROCEDURE [dbo].[spFilmCriteria] (
	@MinLength AS INT
	,@MaxLength AS INT
	,@Title AS VARCHAR(MAX)
	)
AS
BEGIN
	SELECT FilmName
		,FilmRunTimeMinutes
	FROM tblFilm
	WHERE FilmRunTimeMinutes >= @MinLength
		AND FilmRunTimeMinutes <= @MaxLength
		AND FilmName LIKE '%'+ @Title +'%'
	ORDER BY FilmRunTimeMinutes ASC
END
--
EXEC spFilmCriteria @Minlength = 120,@MaxLength = 180, @Title='star'
------------------
-- optional parameters
ALTER PROCEDURE [dbo].[spFilmCriteria] (
	@MinLength AS INT = NULL
	,@MaxLength AS INT = NULL
	,@Title AS VARCHAR(MAX)
	)
AS
BEGIN
	SELECT FilmName
		,FilmRunTimeMinutes
	FROM tblFilm
	WHERE (
			@MinLength IS NULL
			OR FilmRunTimeMinutes >= @MinLength
			)
		AND (
			@MaxLength IS NULL
			OR FilmRunTimeMinutes <= @MaxLength
			)
		AND FilmName LIKE '%' + @Title + '%'
	ORDER BY FilmRunTimeMinutes ASC
END
--
EXEC spFilmCriteria @Title='star'
------------------------

-- PART 3 - Variables

--declare a variable
DECLARE @MyDate AS DATETIME

--set value of variable
SET @MyDate = '1970-01-01'

--store query result in a variable
DECLARE @NumFilms INT
SET @NumFilms = (SELECT COUNT(*) FROM tblFilm WHERE FilmReleaseDate >= '1970-01-01')

--selecting the value in a variable
6:51 continue































