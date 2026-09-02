
USE ContosoRetailDW

SELECT TOP (100)
	D.DateKey
	,S.SalesAmount
	,P.ProductName
	,SC.ProductSubcategoryName
	,C.ProductCategoryName
FROM FactSales AS S 
INNER JOIN DimProduct AS P ON P.ProductKey = S.ProductKey 
INNER JOIN DimProductSubcategory AS SC ON SC.ProductSubcategoryKey = P.ProductSubcategoryKey
INNER JOIN DimProductCategory AS C ON C.ProductCategoryKey = SC.ProductCategoryKey 
INNER JOIN DimDate AS D ON D.Datekey = S.DateKey
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
SELECT TOP (100)
	C.ProductCategoryName
	,SUM(S.SalesAmount)
FROM FactSales AS S 
INNER JOIN DimProduct AS P ON P.ProductKey = S.ProductKey 
INNER JOIN DimProductSubcategory AS SC ON SC.ProductSubcategoryKey = P.ProductSubcategoryKey
INNER JOIN DimProductCategory AS C ON C.ProductCategoryKey = SC.ProductCategoryKey
GROUP BY C.ProductCategoryName
ORDER BY C.ProductCategoryName desc
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
SELECT TOP (100)
	FS.Saleskey
	,DS.StoreKey
	,DP.ProductKey
	,DG.GeographyKey
	,DP.ProductName
	,FS.SalesAmount
	,DG.ContinentName
FROM FactSales AS FS 
INNER JOIN DimStore AS DS ON FS.StoreKey = DS.StoreKey
INNER JOIN DimGeography AS DG ON DS.GeographyKey = DG.GeographyKey
INNER JOIN DimProduct AS DP ON DP.ProductKey = FS.ProductKey 
WHERE DG.ContinentName = 'North America'
ORDER BY SalesAmount Desc