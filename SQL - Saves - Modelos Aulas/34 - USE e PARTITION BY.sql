 USE BikeStores

SELECT
	P.CategoryID
	,P.BrandID
	,P.ProductID
	,P.Name
	,COUNT(*) OVER () AS PRODUTOS
	,COUNT(*) OVER (PARTITION BY P.BrandID) AS PRODUTOS_BRAND
	,SUM(P.ListPrice) OVER() AS SOMA_PREÇOS
	,SUM(P.ListPrice) OVER(PARTITION BY P.BrandID) AS SOMA_PREÇOS
FROM Production.Product P
WHERE P.CategoryID = 1
ORDER BY BrandID