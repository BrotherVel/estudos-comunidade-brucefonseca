USE ContosoRetailDW

SELECT DISTINCT
	P.ProductKey as 'todos os produtos'
	,P.ProductName
	,S.ProductKey as'produtos vendidos'
FROM DimProduct AS P FULL JOIN FactSales AS S ON S.ProductKey = P.ProductKey
ORDER BY 3