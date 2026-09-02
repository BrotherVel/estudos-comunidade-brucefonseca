
USE ContosoRetailDW

SELECT
	S.Productkey
	,SUM(S.SalesQuantity) AS 'QTD TOTAL'
FROM FactSales S
WHERE S.DateKey >= '2009-01-01'
GROUP BY S.ProductKey
HAVING SUM(S.SalesQuantity) BETWEEN 1500 AND 1600
ORDER BY [QTD TOTAL] desc

