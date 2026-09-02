SELECT [TrackId]
      ,[Name]
      ,[AlbumId]
--      ,[MediaTypeId]
--      ,[GenreId]
      ,[Composer]
      ,[Milliseconds]
--      ,[Bytes]
      ,[UnitPrice]
	  ,ROW_NUMBER() OVER(ORDER BY [UnitPrice] ASC) AS 'ROW_NUMBER'
	  ,RANK() OVER(ORDER BY [UnitPrice]) AS 'RANK'
	  ,DENSE_RANK() OVER(ORDER BY [UnitPrice]) AS 'DENSE_RANK'
  FROM [Chinook].[dbo].[Track]
  WHERE Composer IS NOT NULL
