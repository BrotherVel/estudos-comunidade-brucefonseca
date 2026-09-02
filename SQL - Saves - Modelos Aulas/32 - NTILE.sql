SELECT [TrackId]
    ,[Name]
    ,[AlbumId]
--      ,[MediaTypeId]
    ,[Composer]
    ,[Milliseconds]
--    ,[Bytes]
	,[GenreId]
    ,[UnitPrice]
--	,ROW_NUMBER() OVER(ORDER BY [UnitPrice] ASC) AS 'ROW_NUMBER'
--	,RANK() OVER(ORDER BY [UnitPrice]) AS 'RANK'
--	,DENSE_RANK() OVER(ORDER BY [UnitPrice]) AS 'DENSE_RANK'
	,NTILE(50) OVER(ORDER BY [UnitPrice]) AS 'NTILE'
	,NTILE(50) OVER(PARTITION BY [GenreId] ORDER BY [UnitPrice]) AS 'NTILE-PARTITION BY'
FROM [Chinook].[dbo].[Track]
WHERE Composer IS NOT NULL
