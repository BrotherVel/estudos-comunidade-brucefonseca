
SELECT [TrackId]
      ,[Name]
--      ,[AlbumId]
--      ,[MediaTypeId]
--      ,[GenreId]
      ,[Composer]
      ,[Milliseconds]
--      ,[Bytes]
--      ,[UnitPrice]
	  ,ROW_NUMBER() OVER(ORDER BY [Milliseconds] ASC) AS 'ROW_NUMBER'
	  ,ROW_NUMBER() OVER(PARTITION BY [Composer] ORDER BY [Milliseconds] ASC) AS 'ROW_NUMBER - PARTITION BY'
  FROM [Chinook].[dbo].[Track]
  WHERE Composer IS NOT NULL
