USE ContosoRetailDW

SELECT DISTINCT
	P.ProductKey as 'todos os produtos'
	,S.ProductKey as'produtos vendidos'
FROM DimProduct AS P
CROSS JOIN FactSales AS S
