
USE ContosoRetailDW
-- Podemos cáucular a media desta foma
SELECT AVG(UnitPrice)
FROM DimProduct
-- Mas podemos utilizer essa média como parâmetro com uma SUBQUERY desta forma:
SELECT ProductKey
	,UnitPrice
FROM DimProduct
WHERE UnitPrice <= (SELECT AVG(UnitPrice) FROM DimProduct)
ORDER BY UnitPrice Desc